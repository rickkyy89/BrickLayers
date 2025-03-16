# Bricklayers
Interlocking Layers Post-Processing Script for PrusaSlicer, OrcaSlicer, and BambuStudio

## Install Python or Pypy
To use the script, you need **Python** or **PyPy** (faster) installed:
[Download Python](https://www.python.org/downloads/)
[Download PyPy](https://pypy.org/download.html)

---

## Setup in your Slicer
Edit the **"Post processing scripts"** section in your slicer.

**Make sure to update the path** to match:
- Your **Python installation** folder.
- The folder where **you saved `bricklayers.py`**.

### 🖥️ **Windows Example**
```%USERPROFILE%\AppData\Local\Programs\Python\Python313\python.exe C:\3DPrinting\Scripts\bricklayers.py -startAtLayer 3 -extrusionMultiplier 1.05 -enabled 1;```

### 🍏 **Mac Example (Using PyPy)**
```/usr/local/bin/pypy3 /Volumes/3DPrinting/Scripts/bricklayers.py -startAtLayer 3 -extrusionMultiplier 1.05 -enabled 1;```

---

## Features
**Automatically detects Layer Height and Retraction settings**.

**Detailed instructions in the next hours. Thanks for your patience.**

---

## Video about this script:
[![Brick Layers for everybody](https://img.youtube.com/vi/qqJOa46OTTs/maxresdefault.jpg)](https://www.youtube.com/watch?v=qqJOa46OTTs)
