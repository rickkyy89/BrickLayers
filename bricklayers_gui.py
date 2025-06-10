import tkinter as tk
from tkinter import ttk, filedialog, messagebox
import subprocess
import sys
import os
import threading

class BrickLayersGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("BrickLayers GUI Launcher")
        self.root.geometry("600x650")

        # --- Variabili per i parametri ---
        self.input_file = tk.StringVar()
        self.output_file = tk.StringVar()
        self.multiplier_outer = tk.DoubleVar(value=1.0)
        self.multiplier_inner = tk.DoubleVar(value=1.1)
        self.multiplier_infill = tk.DoubleVar(value=1.0)
        self.multiplier_default = tk.DoubleVar(value=1.0)
        self.start_at_layer = tk.IntVar(value=3)
        self.ignore_layers = tk.StringVar(value="") # Es: "1 2 10"
        self.ignore_layers_from_to = tk.StringVar(value="") # Es: "15 20 50 55"
        self.enabled = tk.BooleanVar(value=True)
        self.no_header = tk.BooleanVar(value=False)
        self.no_logging = tk.BooleanVar(value=False)
        self.status_text = tk.StringVar(value="Pronto per elaborare.")
        
        # Percorso dello script principale
        self.script_path = os.path.join(os.path.dirname(__file__), "bricklayers.py")

        # Creazione dei widget
        self.create_widgets()

    def create_widgets(self):
        main_frame = ttk.Frame(self.root, padding="10")
        main_frame.pack(fill=tk.BOTH, expand=True)

        # --- Sezione File ---
        file_frame = ttk.LabelFrame(main_frame, text="File Selection", padding="10")
        file_frame.pack(fill=tk.X, expand=True, pady=5)

        ttk.Label(file_frame, text="Input G-code File:").grid(row=0, column=0, sticky=tk.W, pady=2)
        ttk.Entry(file_frame, textvariable=self.input_file, width=60).grid(row=0, column=1, sticky=tk.EW)
        ttk.Button(file_frame, text="Browse...", command=self.browse_input).grid(row=0, column=2, padx=5)

        ttk.Label(file_frame, text="Output G-code File:").grid(row=1, column=0, sticky=tk.W, pady=2)
        ttk.Entry(file_frame, textvariable=self.output_file, width=60).grid(row=1, column=1, sticky=tk.EW)
        ttk.Button(file_frame, text="Browse...", command=self.browse_output).grid(row=1, column=2, padx=5)
        
        file_frame.columnconfigure(1, weight=1)

        # --- Sezione Parametri ---
        options_frame = ttk.LabelFrame(main_frame, text="Parameters", padding="10")
        options_frame.pack(fill=tk.X, expand=True, pady=5)
        
        # Colonna 0
        ttk.Label(options_frame, text="Multiplier Outer:").grid(row=0, column=0, sticky=tk.W, pady=2)
        ttk.Entry(options_frame, textvariable=self.multiplier_outer, width=10).grid(row=0, column=1, sticky=tk.W)

        ttk.Label(options_frame, text="Multiplier Inner:").grid(row=1, column=0, sticky=tk.W, pady=2)
        ttk.Entry(options_frame, textvariable=self.multiplier_inner, width=10).grid(row=1, column=1, sticky=tk.W)

        ttk.Label(options_frame, text="Start At Layer:").grid(row=2, column=0, sticky=tk.W, pady=2)
        ttk.Entry(options_frame, textvariable=self.start_at_layer, width=10).grid(row=2, column=1, sticky=tk.W)
        
        # Colonna 2
        ttk.Label(options_frame, text="Multiplier Infill:").grid(row=0, column=2, sticky=tk.W, padx=(20, 0), pady=2)
        ttk.Entry(options_frame, textvariable=self.multiplier_infill, width=10).grid(row=0, column=3, sticky=tk.W)

        ttk.Label(options_frame, text="Multiplier Default:").grid(row=1, column=2, sticky=tk.W, padx=(20, 0), pady=2)
        ttk.Entry(options_frame, textvariable=self.multiplier_default, width=10).grid(row=1, column=3, sticky=tk.W)

        # --- Sezione Layer da ignorare ---
        ignore_frame = ttk.LabelFrame(main_frame, text="Ignore Layers (space separated)", padding="10")
        ignore_frame.pack(fill=tk.X, expand=True, pady=5)
        
        ttk.Label(ignore_frame, text="Single Layers:").grid(row=0, column=0, sticky=tk.W, pady=2)
        ttk.Entry(ignore_frame, textvariable=self.ignore_layers, width=40).grid(row=0, column=1, sticky=tk.EW)
        
        ttk.Label(ignore_frame, text="Layer Ranges (start end ...):").grid(row=1, column=0, sticky=tk.W, pady=2)
        ttk.Entry(ignore_frame, textvariable=self.ignore_layers_from_to, width=40).grid(row=1, column=1, sticky=tk.EW)
        
        ignore_frame.columnconfigure(1, weight=1)

        # --- Sezione Opzioni Boolean ---
        bool_frame = ttk.LabelFrame(main_frame, text="Flags", padding="10")
        bool_frame.pack(fill=tk.X, expand=True, pady=5)

        ttk.Checkbutton(bool_frame, text="Enabled", variable=self.enabled).pack(side=tk.LEFT, padx=10)
        ttk.Checkbutton(bool_frame, text="No Header", variable=self.no_header).pack(side=tk.LEFT, padx=10)
        ttk.Checkbutton(bool_frame, text="No Logging", variable=self.no_logging).pack(side=tk.LEFT, padx=10)

        # --- Sezione Esecuzione ---
        exec_frame = ttk.Frame(main_frame, padding="10")
        exec_frame.pack(fill=tk.X, expand=True, pady=10)

        self.run_button = ttk.Button(exec_frame, text="Process G-code", command=self.run_processing_thread)
        self.run_button.pack(pady=10)
        
        status_label = ttk.Label(main_frame, textvariable=self.status_text, relief=tk.SUNKEN, anchor=tk.W)
        status_label.pack(side=tk.BOTTOM, fill=tk.X, ipady=5)

    def browse_input(self):
        filename = filedialog.askopenfilename(
            title="Select Input G-code File",
            filetypes=[("G-code Files", "*.gcode"), ("All Files", "*.*")]
        )
        if filename:
            self.input_file.set(filename)
            # Suggerisci un nome per l'output
            base, ext = os.path.splitext(filename)
            self.output_file.set(f"{base}_brick{ext}")
            self.status_text.set(f"Selected: {os.path.basename(filename)}")

    def browse_output(self):
        filename = filedialog.asksaveasfilename(
            title="Select Output G-code File",
            filetypes=[("G-code Files", "*.gcode"), ("All Files", "*.*")],
            defaultextension=".gcode"
        )
        if filename:
            self.output_file.set(filename)
            
    def run_processing_thread(self):
        # Esegui l'elaborazione in un thread separato per non bloccare la GUI
        processing_thread = threading.Thread(target=self.run_script, daemon=True)
        processing_thread.start()

    def run_script(self):
        input_path = self.input_file.get()
        output_path = self.output_file.get()

        if not os.path.exists(self.script_path):
            messagebox.showerror("Error", f"Script 'bricklayers.py' not found in the same directory!")
            return

        if not input_path or not output_path:
            messagebox.showerror("Error", "Please select both input and output files.")
            return

        # Costruisci il comando da lanciare
        command = [
            sys.executable,  # Usa l'interprete Python corrente
            self.script_path,
            input_path,
            "-outputFile",
            output_path
        ]
        
        # Aggiungi i parametri numerici e di testo
        command.extend(["-multiplierOuter", str(self.multiplier_outer.get())])
        command.extend(["-multiplierInner", str(self.multiplier_inner.get())])
        command.extend(["-multiplierInfill", str(self.multiplier_infill.get())])
        command.extend(["-multiplierDefault", str(self.multiplier_default.get())])
        command.extend(["-startAtLayer", str(self.start_at_layer.get())])

        if self.ignore_layers.get().strip():
            command.append("-ignoreLayers")
            command.extend(self.ignore_layers.get().strip().split())
            
        if self.ignore_layers_from_to.get().strip():
            command.append("-ignoreLayersFromTo")
            command.extend(self.ignore_layers_from_to.get().strip().split())
        
        # Aggiungi le flag booleane se attive
        command.extend(["-enabled", "1" if self.enabled.get() else "0"])
        if self.no_header.get():
            command.append("-noHeader")
        if self.no_logging.get():
            command.append("-noLogging")
            
        self.status_text.set("Processing... Please wait.")
        self.run_button.config(state=tk.DISABLED)

        try:
            # Esegui lo script come un processo separato e nascondi la finestra della console
            si = subprocess.STARTUPINFO()
            si.dwFlags |= subprocess.STARTF_USESHOWWINDOW
            
            process = subprocess.run(
                command,
                capture_output=True,
                text=True,
                check=True, # Lancia un'eccezione se il return code è diverso da 0
                startupinfo=si
            )
            
            self.status_text.set(f"Success! File saved to: {os.path.basename(output_path)}")
            messagebox.showinfo("Success", f"Processing complete!\n\nOutput saved to:\n{output_path}")

        except FileNotFoundError:
            self.status_text.set("Error: Python or script not found.")
            messagebox.showerror("Error", f"Could not find Python or the script.\nCommand: {' '.join(command)}")
        except subprocess.CalledProcessError as e:
            error_message = f"An error occurred during processing (Error code: {e.returncode}).\n\nError details:\n{e.stderr}"
            self.status_text.set(f"Error! (code: {e.returncode})")
            messagebox.showerror("Processing Error", error_message)
        finally:
            self.run_button.config(state=tk.NORMAL)


if __name__ == "__main__":
    root = tk.Tk()
    app = BrickLayersGUI(root)
    root.mainloop()