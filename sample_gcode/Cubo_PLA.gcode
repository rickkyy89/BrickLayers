; HEADER_BLOCK_START
; BambuStudio 02.01.00.59
; model printing time: 15m 55s; total estimated time: 23m 27s
; total layer number: 128
; total filament length [mm] : 3204.13
; total filament volume [cm^3] : 7706.85
; total filament weight [g] : 9.63
; filament_density: 1.25
; filament_diameter: 1.75
; max_z_height: 25.60
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
; apply_scarf_seam_on_circles = 1
; auxiliary_fan = 1
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0
; change_filament_gcode = M620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\n{if long_retraction_when_cut && retraction_distance_when_cut > 2}\nG1 E-[retraction_distance_when_cut] F200\nM400\n{endif}\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\n\n{if next_extruder < 255}\nM400\n{if long_retraction_when_cut && retraction_distance_when_cut > 2}\nG1 E{retraction_distance_when_cut - 2} F200\nG1 E2 F20\nM400\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == "PETG"}\nM109 S260\n{elsif filament_type[next_extruder] == "PVA"}\nM109 S210\n{else}\nM109 S[nozzle_temperature_range_high]\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_fan_the_first_x_layers = 1
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL X1C"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50
; different_settings_to_system = wall_loops;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_long_retraction_when_cut = 1
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 0
; enable_support = 0
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 33
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 34
; extruder_clearance_max_radius = 68
; extruder_colour = #018001
; extruder_offset = 0x2
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 100
; fan_max_speed = 100
; fan_min_speed = 100
; filament_adhesiveness_category = 100
; filament_change_length = 10
; filament_colour = #000000
; filament_cost = 22.99
; filament_density = 1.25
; filament_diameter = 1.75
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.98
; filament_flush_temp = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFL03
; filament_is_support = 0
; filament_map = 1
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 16
; filament_minimal_purge_on_wipe_tower = 15
; filament_notes = 
; filament_pre_cooling_temperature = 0
; filament_prime_volume = 45
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_volumetric_speed = -1
; filament_scarf_gap = 15%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "eSUN PLA+ @BBL X1C"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA
; filament_vendor = eSUN
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 0
; has_scarf_joint_seam = 1
; head_wrap_detect_zone = 
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; host_type = octoprint
; hot_plate_temp = 55
; hot_plate_temp_initial_layer = 55
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0
; machine_end_gcode = ;===== date: 20240402 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM141 S0 ; turn off chamber \nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of "timelapse_record_flag"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\nM960 S5 P0 ; turn off logo lamp\n\n
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,200
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_start_gcode = ;===== machine: X1E =========================\n;===== date: 20250305 =====================\n;===== turn on the HB fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\n;===== reset machine status =================\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;==== if Chamber Cooling is necessary ====\n\n{if (filament_type[initial_no_support_extruder]=="PLA") || (filament_type[initial_no_support_extruder]=="PETG") || (filament_type[initial_no_support_extruder]=="TPU") || (filament_type[initial_no_support_extruder]=="PVA") || (filament_type[initial_no_support_extruder]=="PLA-CF") || (filament_type[initial_no_support_extruder]=="PETG-CF")}\nM1002 gcode_claim_action : 29\nG28\nG90\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nG1 Z75\nM140 S0 ; stop heatbed from heating\nM106 P2 S255 ; open auxiliary fan for cooling\nM106 P3 S255 ; open chamber fan for cooling\nM191 S0 ; wait for chamber temp\nM106 P3 S0 ; reset chamber fan cmd\nM106 P2 S0; reset auxiliary fan cmd\n{endif}\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action : 2\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n{if scan_first_layer}\n;=========register first layer scan=====\nM977 S1 P60\n{endif}\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_no_support_extruder]=="PLA"}\n    {if (bed_temperature[initial_no_support_extruder] >50)||(bed_temperature_initial_layer[initial_no_support_extruder] >50)}\n    M106 P3 S255\n    {elsif (bed_temperature[initial_no_support_extruder] >45)||(bed_temperature_initial_layer[initial_no_support_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n    M142 P1 R35 S40\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_no_support_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_no_support_extruder]A\nM620.1 E F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60} T{nozzle_temperature_range_high[initial_no_support_extruder]}\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S290 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n\n;===== set chamber temperature ==========\n{if (overall_chamber_temperature >= 40)}\nM106 P2 S255 ; open big fan to help heating\nM141 S[overall_chamber_temperature] ; Let Chamber begin to heat\n{endif}\n\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X128 Y128\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n;===== check scanner clarity ===========================\nG1 X128 Y128 F24000\nG28 Z P0\nM972 S5 P0\nG1 X230 Y15 F24000\n;===== check scanner clarity end =======================\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_no_support_extruder]=="PLA"}\n    {if (bed_temperature[initial_no_support_extruder] >50)||(bed_temperature_initial_layer[initial_no_support_extruder] >50)}\n    M106 P3 S255\n    {elsif (bed_temperature[initial_no_support_extruder] >45)||(bed_temperature_initial_layer[initial_no_support_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n    M142 P1 R35 S40\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== mech mode fast check============================\n\n{if scan_first_layer}\n;start heatbed  scan====================================\nM976 S2 P1\nG90\nG1 X128 Y128 F20000\nM976 S3 P2  ;register void printing detection\n{endif}\n\n;===== noozle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature[initial_no_support_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X231 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n\n;===== draw extrinsic para cali paint =================\nM1002 judge_flag extrude_cali_flag\nM622 J1\n\n    M1002 gcode_claim_action : 8\n\n    T1000\n\n    G0 F1200.0 X231 Y15   Z0.2 E0.741\n    G0 F1200.0 X226 Y15   Z0.2 E0.275\n    G0 F1200.0 X226 Y8    Z0.2 E0.384\n    G0 F1200.0 X216 Y8    Z0.2 E0.549\n    G0 F1200.0 X216 Y1.5  Z0.2 E0.357\n\n    G0 X48.0 E12.0 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X48.0 Y14 E0.92 F1200.0\n    G0 X35.0 Y6.0 E1.03 F1200.0\n\n    ;=========== extruder cali extrusion ==================\n    T1000\n    M83\n    {if default_acceleration > 0}\n        {if outer_wall_acceleration > 0}\n            M204 S[outer_wall_acceleration]\n        {else}\n            M204 S[default_acceleration]\n        {endif}\n    {endif}\n    G0 X35.000 Y6.000 Z0.300 F30000 E0\n    G1 F1500.000 E0.800\n    M106 S0 ; turn off fan\n    G0 X185.000 E9.35441 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G0 X187 Z0\n    G1 F1500.000 E-0.800\n    G0 Z1\n    G0 X180 Z0.3 F18000\n\n    M900 L1000.0 M1.0\n    M900 K0.040\n    G0 X45.000 F30000\n    G0 Y8.000 F30000\n    G1 F1500.000 E0.800\n    G1 X65.000 E1.24726 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X70.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X75.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X80.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X85.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X90.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X95.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X100.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X105.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X110.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X115.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X120.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X125.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X130.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X135.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X140.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X145.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X150.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X155.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X160.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X165.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X170.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X175.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X180.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 F1500.000 E-0.800\n    G1 X183 Z0.15 F30000\n    G1 X185\n    G1 Z1.0\n    G0 Y6.000 F30000 ; move y to clear pos\n    G1 Z0.3\n    M400\n\n    G0 X45.000 F30000\n    M900 K0.020\n    G0 X45.000 F30000\n    G0 Y10.000 F30000\n    G1 F1500.000 E0.800\n    G1 X65.000 E1.24726 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X70.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X75.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X80.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X85.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X90.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X95.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X100.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X105.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X110.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X115.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X120.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X125.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X130.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X135.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X140.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X145.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X150.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X155.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X160.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X165.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X170.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X175.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X180.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 F1500.000 E-0.800\n    G1 X183 Z0.15 F30000\n    G1 X185\n    G1 Z1.0\n    G0 Y6.000 F30000 ; move y to clear pos\n    G1 Z0.3\n    M400\n\n    G0 X45.000 F30000\n    M900 K0.000\n    G0 X45.000 F30000\n    G0 Y12.000 F30000\n    G1 F1500.000 E0.800\n    G1 X65.000 E1.24726 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X70.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X75.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X80.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X85.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X90.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X95.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X100.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X105.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X110.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X115.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X120.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X125.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X130.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X135.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X140.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X145.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X150.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X155.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X160.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X165.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X170.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X175.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X180.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 F1500.000 E-0.800\n    G1 X183 Z0.15 F30000\n    G1 X185\n    G1 Z1.0\n    G0 Y6.000 F30000 ; move y to clear pos\n    G1 Z0.3\n\n    G0 X45.000 F30000 ; move to start point\n\nM623 ; end of "draw extrinsic para cali paint"\n\n\nM1002 judge_flag extrude_cali_flag\nM622 J0\n    G0 X231 Y1.5 F30000\n    G0 X18 E14.3 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM623\n\nM104 S140\n\n\n;=========== laser and rgb calibration ===========\nM400\nM18 E\nM500 R\n\nM973 S3 P14\n\nG1 X120 Y1.0 Z0.3 F18000.0;Move to first extrude line pos\nT1100\nG1 X235.0 Y1.0 Z0.3 F18000.0;Move to first extrude line pos\nM400 P100\nM960 S1 P1\nM400 P100\nM973 S6 P0; use auto exposure for horizontal laser by xcam\nM960 S0 P0\n\nG1 X240.0 Y6.0 Z0.3 F18000.0;Move to vertical extrude line pos\nM960 S2 P1\nM400 P100\nM973 S6 P1; use auto exposure for vertical laser by xcam\nM960 S0 P0\n\n;=========== handeye calibration ======================\nM1002 judge_flag extrude_cali_flag\nM622 J1\n\n    M973 S3 P1 ; camera start stream\n    M400 P500\n    M973 S1\n    G0 F6000 X228.500 Y4.500 Z0.000\n    M960 S0 P1\n    M973 S1\n    M400 P800\n    M971 S6 P0\n    M973 S2 P0\n    M400 P500\n    G0 Z0.000 F12000\n    M960 S0 P0\n    M960 S1 P1\n    G0 X221.00 Y4.50\n    M400 P200\n    M971 S5 P1\n    M973 S2 P1\n    M400 P500\n    M960 S0 P0\n    M960 S2 P1\n    G0 X228.5 Y11.0\n    M400 P200\n    M971 S5 P3\n    G0 Z0.500 F12000\n    M960 S0 P0\n    M960 S2 P1\n    G0 X228.5 Y11.0\n    M400 P200\n    M971 S5 P4\n    M973 S2 P0\n    M400 P500\n    M960 S0 P0\n    M960 S1 P1\n    G0 X221.00 Y4.50\n    M400 P500\n    M971 S5 P2\n    M963 S1\n    M400 P1500\n    M964\n    T1100\n    G0 F6000 X228.500 Y4.500 Z0.000\n    M960 S0 P1\n    M973 S1\n    M400 P800\n    M971 S6 P0\n    M973 S2 P0\n    M400 P500\n    G0 Z0.000 F12000\n    M960 S0 P0\n    M960 S1 P1\n    G0 X221.00 Y4.50\n    M400 P200\n    M971 S5 P1\n    M973 S2 P1\n    M400 P500\n    M960 S0 P0\n    M960 S2 P1\n    G0 X228.5 Y11.0\n    M400 P200\n    M971 S5 P3\n    G0 Z0.500 F12000\n    M960 S0 P0\n    M960 S2 P1\n    G0 X228.5 Y11.0\n    M400 P200\n    M971 S5 P4\n    M973 S2 P0\n    M400 P500\n    M960 S0 P0\n    M960 S1 P1\n    G0 X221.00 Y4.50\n    M400 P500\n    M971 S5 P2\n    M963 S1\n    M400 P1500\n    M964\n    T1100\n    G1 Z3 F3000\n\n    M400\n    M500 ; save cali data\n\n    M104 S{nozzle_temperature[initial_no_support_extruder]} ; rise nozzle temp now ,to reduce temp waiting time.\n\n    T1100\n    M400 P400\n    M960 S0 P0\n    G0 F30000.000 Y10.000 X65.000 Z0.000\n    M400 P400\n    M960 S1 P1\n    M400 P50\n\n    M969 S1 N3 A2000\n    G0 F360.000 X181.000 Z0.000\n    M980.3 A70.000 B{outer_wall_volumetric_speed/(1.75*1.75/4*3.14)*60/4} C5.000 D{outer_wall_volumetric_speed/(1.75*1.75/4*3.14)*60} E5.000 F175.000 H1.000 I0.000 J0.020 K0.040\n    M400 P100\n    G0 F20000\n    G0 Z1 ; rise nozzle up\n    T1000 ; change to nozzle space\n    G0 X45.000 Y4.000 F30000 ; move to test line pos\n    M969 S0 ; turn off scanning\n    M960 S0 P0\n\n\n    G1 Z2 F20000\n    T1000\n    G0 X45.000 Y4.000 F30000 E0\n    M109 S{nozzle_temperature[initial_no_support_extruder]}\n    G0 Z0.3\n    G1 F1500.000 E3.600\n    G1 X65.000 E1.24726 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X70.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X75.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X80.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X85.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X90.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X95.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X100.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X105.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X110.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X115.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X120.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X125.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X130.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X135.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n\n    ; see if extrude cali success, if not ,use default value\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M400\n        M900 K0.02 M{outer_wall_volumetric_speed/(1.75*1.75/4*3.14)*0.02}\n    M623\n\n    G1 X140.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X145.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X150.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X155.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X160.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X165.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X170.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X175.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X180.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X185.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X190.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X195.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X200.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X205.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X210.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X215.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X220.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X225.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    M973 S4\n\nM623\n\n;===== wait chamber temperature reaching the reference value =======\n{if (overall_chamber_temperature >= 40)}\nM104 S140\nM191 S[overall_chamber_temperature] ; wait for chamber temp\nM106 P2 S0 ; reset chamber fan cmd\nM109 S{nozzle_temperature[initial_no_support_extruder]}\n{endif}\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM973 S4 ; turn off scanner\nM400 ; wait all motion done before implement the emprical L parameters\n;M900 L500.0 ; Empirical parameters\nM109 S[nozzle_temperature_initial_layer]\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n;===== purge line to wipe the nozzle ============================\nG1 E{-retraction_length[initial_no_support_extruder]} F1800\nG1 X18.0 Y2.5 Z0.8 F18000.0;Move to start position\nG1 E{retraction_length[initial_no_support_extruder]} F1800\nM109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nG1 Z0.2\nG0 X239 E15 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\nG0 Y12 E0.7 F{outer_wall_volumetric_speed/(0.3*0.5)/4* 60}\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 28
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; nozzle_diameter = 0.4
; nozzle_height = 4.2
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
; nozzle_type = hardened_steel
; nozzle_volume = 107
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; print_compatible_printers = "Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL X1C
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab X1E
; printer_notes = 
; printer_settings_id = Bambu Lab X1E 0.4 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = 2
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 1
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_inner_walls = 1
; seam_slope_steps = 10
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 6
; slow_down_min_speed = 20
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 150
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45
; supertack_plate_temp_initial_layer = 45
; support_air_filtration = 1
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 1
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45
; template_custom_gcode = 
; textured_plate_temp = 55
; textured_plate_temp_initial_layer = 55
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;========Date 20250206========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\nM1004 S5 P1  ; external shutter\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C10 O0\nG92 E0\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; SKIPPABLE_END
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; travel_acceleration = 10000
; travel_jerk = 9
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = 0
; upward_compatible_machine = "Bambu Lab P1S 0.4 nozzle";"Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = classic
; wall_loops = 5
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 164.343
; wipe_tower_y = 164.343
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R23
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: X1E =========================
;===== date: 20250305 =====================
;===== turn on the HB fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
;===== reset machine status =================
G91
M17 Z0.4 ; lower the z-motor current
G380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed
G380 S2 Z-25 F300 ;
G1 Z5 F300;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem
G29.1 Z0 ; clear z-trim value first
M204 S10000 ; init ACC set to 10m/s^2

;==== if Chamber Cooling is necessary ====


M1002 gcode_claim_action : 29
G28
G90
G1 X60 F12000
G1 Y245
G1 Y265 F3000
G1 Z75
M140 S0 ; stop heatbed from heating
M106 P2 S255 ; open auxiliary fan for cooling
M106 P3 S255 ; open chamber fan for cooling
M191 S0 ; wait for chamber temp
M106 P3 S0 ; reset chamber fan cmd
M106 P2 S0; reset auxiliary fan cmd


;===== heatbed preheat ====================
M1002 gcode_claim_action : 2
M140 S55 ;set bed temp
M190 S55 ;wait for bed temp


;=========register first layer scan=====
M977 S1 P60


;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S255
    ;Prevent PLA from jamming
    M142 P1 R35 S40

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S220 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on
G1 X60 F12000
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A
M620.1 E F399.119 T240

M412 S1 ; ===turn on filament runout detection===

M109 S290 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
G1 E50 F200
M400
M104 S220
G92 E0
M73 P3 R22
G1 E50 F200
M400
M106 P1 S255
G92 E0
M73 P21 R18
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

M73 P22 R18
G1 X70 F9000
M73 P23 R17
G1 X76 F15000
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0

;===== set chamber temperature ==========


;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S200
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
G1 X100 F5000
M73 P24 R17
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
G1 Z10
G1 F30000
G1 X128 Y128
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================

;===== check scanner clarity ===========================
G1 X128 Y128 F24000
G28 Z P0
M972 S5 P0
G1 X230 Y15 F24000
;===== check scanner clarity end =======================

;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X115.2 Y115.2 I25.6 J25.6
    M400
    M500 ; save cali data

M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623
;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression

;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S255
    ;Prevent PLA from jamming
    M142 P1 R35 S40

M106 P2 S100 ; turn on big fan ,to cool down toolhead

M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
M73 P25 R17
G1 F30000
G1 X230 Y15
G28 X ; re-home XY
;===== mech mode fast check============================


;start heatbed  scan====================================
M976 S2 P1
G90
G1 X128 Y128 F20000
M976 S3 P2  ;register void printing detection


;===== noozle load line ===============================
M975 S1
G90
M83
T1000
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S220
G1 Z0.2
G0 E2 F300
G0 X240 E15 F6033.27
G0 Y11 E0.700 F1508.32
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X231 E0.700 F6033.27
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.04 ; for Textured PEI Plate


;===== draw extrinsic para cali paint =================
M1002 judge_flag extrude_cali_flag
M622 J1

    M1002 gcode_claim_action : 8

    T1000

    G0 F1200.0 X231 Y15   Z0.2 E0.741
    G0 F1200.0 X226 Y15   Z0.2 E0.275
    G0 F1200.0 X226 Y8    Z0.2 E0.384
    G0 F1200.0 X216 Y8    Z0.2 E0.549
    G0 F1200.0 X216 Y1.5  Z0.2 E0.357

    G0 X48.0 E12.0 F6033.27
    G0 X48.0 Y14 E0.92 F1200.0
    G0 X35.0 Y6.0 E1.03 F1200.0

    ;=========== extruder cali extrusion ==================
    T1000
    M83
    
        
            M204 S5000
        
    
    G0 X35.000 Y6.000 Z0.300 F30000 E0
    G1 F1500.000 E0.800
    M106 S0 ; turn off fan
    G0 X185.000 E9.35441 F6033.27
    G0 X187 Z0
    G1 F1500.000 E-0.800
    G0 Z1
    G0 X180 Z0.3 F18000

    M900 L1000.0 M1.0
    M900 K0.040
    G0 X45.000 F30000
    G0 Y8.000 F30000
    G1 F1500.000 E0.800
    G1 X65.000 E1.24726 F1508.32
    G1 X70.000 E0.31181 F1508.32
    G1 X75.000 E0.31181 F6033.27
    G1 X80.000 E0.31181 F1508.32
    G1 X85.000 E0.31181 F6033.27
    G1 X90.000 E0.31181 F1508.32
    G1 X95.000 E0.31181 F6033.27
    G1 X100.000 E0.31181 F1508.32
    G1 X105.000 E0.31181 F6033.27
    G1 X110.000 E0.31181 F1508.32
    G1 X115.000 E0.31181 F6033.27
M73 P26 R17
    G1 X120.000 E0.31181 F1508.32
    G1 X125.000 E0.31181 F6033.27
    G1 X130.000 E0.31181 F1508.32
    G1 X135.000 E0.31181 F6033.27
    G1 X140.000 E0.31181 F1508.32
    G1 X145.000 E0.31181 F6033.27
    G1 X150.000 E0.31181 F1508.32
    G1 X155.000 E0.31181 F6033.27
    G1 X160.000 E0.31181 F1508.32
    G1 X165.000 E0.31181 F6033.27
    G1 X170.000 E0.31181 F1508.32
    G1 X175.000 E0.31181 F6033.27
    G1 X180.000 E0.31181 F6033.27
    G1 F1500.000 E-0.800
    G1 X183 Z0.15 F30000
    G1 X185
    G1 Z1.0
    G0 Y6.000 F30000 ; move y to clear pos
    G1 Z0.3
    M400

    G0 X45.000 F30000
    M900 K0.020
    G0 X45.000 F30000
    G0 Y10.000 F30000
    G1 F1500.000 E0.800
    G1 X65.000 E1.24726 F1508.32
    G1 X70.000 E0.31181 F1508.32
    G1 X75.000 E0.31181 F6033.27
    G1 X80.000 E0.31181 F1508.32
    G1 X85.000 E0.31181 F6033.27
    G1 X90.000 E0.31181 F1508.32
    G1 X95.000 E0.31181 F6033.27
    G1 X100.000 E0.31181 F1508.32
M73 P27 R17
    G1 X105.000 E0.31181 F6033.27
    G1 X110.000 E0.31181 F1508.32
    G1 X115.000 E0.31181 F6033.27
    G1 X120.000 E0.31181 F1508.32
    G1 X125.000 E0.31181 F6033.27
    G1 X130.000 E0.31181 F1508.32
    G1 X135.000 E0.31181 F6033.27
    G1 X140.000 E0.31181 F1508.32
    G1 X145.000 E0.31181 F6033.27
    G1 X150.000 E0.31181 F1508.32
    G1 X155.000 E0.31181 F6033.27
    G1 X160.000 E0.31181 F1508.32
    G1 X165.000 E0.31181 F6033.27
    G1 X170.000 E0.31181 F1508.32
    G1 X175.000 E0.31181 F6033.27
    G1 X180.000 E0.31181 F6033.27
    G1 F1500.000 E-0.800
M73 P27 R16
    G1 X183 Z0.15 F30000
    G1 X185
    G1 Z1.0
    G0 Y6.000 F30000 ; move y to clear pos
    G1 Z0.3
    M400

    G0 X45.000 F30000
    M900 K0.000
    G0 X45.000 F30000
    G0 Y12.000 F30000
    G1 F1500.000 E0.800
    G1 X65.000 E1.24726 F1508.32
    G1 X70.000 E0.31181 F1508.32
    G1 X75.000 E0.31181 F6033.27
    G1 X80.000 E0.31181 F1508.32
    G1 X85.000 E0.31181 F6033.27
    G1 X90.000 E0.31181 F1508.32
    G1 X95.000 E0.31181 F6033.27
    G1 X100.000 E0.31181 F1508.32
    G1 X105.000 E0.31181 F6033.27
M73 P28 R16
    G1 X110.000 E0.31181 F1508.32
    G1 X115.000 E0.31181 F6033.27
    G1 X120.000 E0.31181 F1508.32
    G1 X125.000 E0.31181 F6033.27
    G1 X130.000 E0.31181 F1508.32
    G1 X135.000 E0.31181 F6033.27
    G1 X140.000 E0.31181 F1508.32
    G1 X145.000 E0.31181 F6033.27
    G1 X150.000 E0.31181 F1508.32
    G1 X155.000 E0.31181 F6033.27
    G1 X160.000 E0.31181 F1508.32
    G1 X165.000 E0.31181 F6033.27
    G1 X170.000 E0.31181 F1508.32
    G1 X175.000 E0.31181 F6033.27
    G1 X180.000 E0.31181 F6033.27
    G1 F1500.000 E-0.800
    G1 X183 Z0.15 F30000
    G1 X185
    G1 Z1.0
    G0 Y6.000 F30000 ; move y to clear pos
    G1 Z0.3

    G0 X45.000 F30000 ; move to start point

M623 ; end of "draw extrinsic para cali paint"


M1002 judge_flag extrude_cali_flag
M622 J0
    G0 X231 Y1.5 F30000
    G0 X18 E14.3 F6033.27
M623

M104 S140


;=========== laser and rgb calibration ===========
M400
M18 E
M500 R

M973 S3 P14

G1 X120 Y1.0 Z0.3 F18000.0;Move to first extrude line pos
T1100
G1 X235.0 Y1.0 Z0.3 F18000.0;Move to first extrude line pos
M400 P100
M960 S1 P1
M400 P100
M973 S6 P0; use auto exposure for horizontal laser by xcam
M960 S0 P0

G1 X240.0 Y6.0 Z0.3 F18000.0;Move to vertical extrude line pos
M960 S2 P1
M400 P100
M973 S6 P1; use auto exposure for vertical laser by xcam
M960 S0 P0

;=========== handeye calibration ======================
M1002 judge_flag extrude_cali_flag
M622 J1

    M973 S3 P1 ; camera start stream
    M400 P500
    M973 S1
    G0 F6000 X228.500 Y4.500 Z0.000
    M960 S0 P1
    M973 S1
    M400 P800
    M971 S6 P0
    M973 S2 P0
    M400 P500
    G0 Z0.000 F12000
    M960 S0 P0
    M960 S1 P1
    G0 X221.00 Y4.50
    M400 P200
    M971 S5 P1
    M973 S2 P1
    M400 P500
    M960 S0 P0
    M960 S2 P1
    G0 X228.5 Y11.0
    M400 P200
    M971 S5 P3
    G0 Z0.500 F12000
    M960 S0 P0
    M960 S2 P1
    G0 X228.5 Y11.0
    M400 P200
    M971 S5 P4
    M973 S2 P0
    M400 P500
    M960 S0 P0
    M960 S1 P1
    G0 X221.00 Y4.50
    M400 P500
    M971 S5 P2
    M963 S1
    M400 P1500
    M964
    T1100
    G0 F6000 X228.500 Y4.500 Z0.000
    M960 S0 P1
    M973 S1
    M400 P800
    M971 S6 P0
    M973 S2 P0
    M400 P500
    G0 Z0.000 F12000
    M960 S0 P0
    M960 S1 P1
    G0 X221.00 Y4.50
    M400 P200
    M971 S5 P1
    M973 S2 P1
    M400 P500
    M960 S0 P0
    M960 S2 P1
    G0 X228.5 Y11.0
    M400 P200
    M971 S5 P3
    G0 Z0.500 F12000
    M960 S0 P0
    M960 S2 P1
    G0 X228.5 Y11.0
    M400 P200
    M971 S5 P4
    M973 S2 P0
    M400 P500
    M960 S0 P0
    M960 S1 P1
    G0 X221.00 Y4.50
    M400 P500
    M971 S5 P2
    M963 S1
    M400 P1500
    M964
    T1100
    G1 Z3 F3000

    M400
    M500 ; save cali data

    M104 S220 ; rise nozzle temp now ,to reduce temp waiting time.

    T1100
    M400 P400
    M960 S0 P0
    G0 F30000.000 Y10.000 X65.000 Z0.000
    M400 P400
    M960 S1 P1
    M400 P50

    M969 S1 N3 A2000
    G0 F360.000 X181.000 Z0.000
    M980.3 A70.000 B94.1106 C5.000 D376.442 E5.000 F175.000 H1.000 I0.000 J0.020 K0.040
    M400 P100
    G0 F20000
    G0 Z1 ; rise nozzle up
    T1000 ; change to nozzle space
    G0 X45.000 Y4.000 F30000 ; move to test line pos
    M969 S0 ; turn off scanning
    M960 S0 P0


    G1 Z2 F20000
    T1000
    G0 X45.000 Y4.000 F30000 E0
    M109 S220
    G0 Z0.3
    G1 F1500.000 E3.600
    G1 X65.000 E1.24726 F1508.32
    G1 X70.000 E0.31181 F1508.32
    G1 X75.000 E0.31181 F6033.27
    G1 X80.000 E0.31181 F1508.32
    G1 X85.000 E0.31181 F6033.27
    G1 X90.000 E0.31181 F1508.32
    G1 X95.000 E0.31181 F6033.27
    G1 X100.000 E0.31181 F1508.32
    G1 X105.000 E0.31181 F6033.27
    G1 X110.000 E0.31181 F1508.32
    G1 X115.000 E0.31181 F6033.27
    G1 X120.000 E0.31181 F1508.32
    G1 X125.000 E0.31181 F6033.27
    G1 X130.000 E0.31181 F1508.32
    G1 X135.000 E0.31181 F6033.27

    ; see if extrude cali success, if not ,use default value
    M1002 judge_last_extrude_cali_success
    M622 J0
        M400
        M900 K0.02 M0.125481
    M623

    G1 X140.000 E0.31181 F1508.32
    G1 X145.000 E0.31181 F6033.27
    G1 X150.000 E0.31181 F1508.32
    G1 X155.000 E0.31181 F6033.27
    G1 X160.000 E0.31181 F1508.32
    G1 X165.000 E0.31181 F6033.27
    G1 X170.000 E0.31181 F1508.32
    G1 X175.000 E0.31181 F6033.27
    G1 X180.000 E0.31181 F1508.32
    G1 X185.000 E0.31181 F6033.27
    G1 X190.000 E0.31181 F1508.32
    G1 X195.000 E0.31181 F6033.27
    G1 X200.000 E0.31181 F1508.32
    G1 X205.000 E0.31181 F6033.27
    G1 X210.000 E0.31181 F1508.32
    G1 X215.000 E0.31181 F6033.27
    G1 X220.000 E0.31181 F1508.32
    G1 X225.000 E0.31181 F6033.27
    M973 S4

M623

;===== wait chamber temperature reaching the reference value =======


;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M973 S4 ; turn off scanner
M400 ; wait all motion done before implement the emprical L parameters
;M900 L500.0 ; Empirical parameters
M109 S220
M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000
;===== purge line to wipe the nozzle ============================
G1 E-0.8 F1800
G1 X18.0 Y2.5 Z0.8 F18000.0;Move to start position
G1 E0.8 F1800
M109 S220
G1 Z0.2
G0 X239 E15 F6033.27
G0 Y12 E0.7 F1508.32
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S150


;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/128
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S6000
G1 Z.4 F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.572 Y136.572
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X117.428 Y136.572 E.78751
G1 X117.428 Y115.428 E.78751
G1 X138.572 Y115.428 E.78751
G1 X138.572 Y136.512 E.78528
M204 S6000
G1 X139.029 Y137.029 F30000
G1 F3000
M204 S500
G1 X116.971 Y137.029 E.82156
G1 X116.971 Y114.971 E.82156
G1 X139.029 Y114.971 E.82156
G1 X139.029 Y136.969 E.81933
M204 S6000
G1 X139.486 Y137.486 F30000
G1 F3000
M204 S500
G1 X116.514 Y137.486 E.85561
G1 X116.514 Y114.514 E.85561
G1 X139.486 Y114.514 E.85561
G1 X139.486 Y137.426 E.85338
M204 S6000
G1 X139.943 Y137.943 F30000
G1 F3000
M204 S500
G1 X116.057 Y137.943 E.88966
G1 X116.057 Y114.057 E.88966
G1 X139.943 Y114.057 E.88966
G1 X139.943 Y137.883 E.88742
M204 S6000
G1 X140.4 Y138.4 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X115.6 Y138.4 E.92371
G1 X115.6 Y113.6 E.92371
G1 X140.4 Y113.6 E.92371
G1 X140.4 Y138.34 E.92147
; WIPE_START
G1 X138.4 Y138.345 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
M73 P29 R16
G1 X138.084 Y130.719 Z.6 F30000
G1 X137.458 Y115.611 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50305
G1 F6300
M204 S500
G1 X138.183 Y116.336 E.03843
G1 X138.183 Y116.987 E.0244
G1 X137.013 Y115.817 E.06203
G1 X136.363 Y115.817 E.0244
G1 X138.183 Y117.637 E.09653
G1 X138.183 Y118.288 E.0244
G1 X135.712 Y115.817 E.13104
G1 X135.061 Y115.817 E.0244
G1 X138.183 Y118.939 E.16554
G1 X138.183 Y119.589 E.0244
G1 X134.411 Y115.817 E.20005
G1 X133.76 Y115.817 E.0244
G1 X138.183 Y120.24 E.23455
G1 X138.183 Y120.891 E.0244
M73 P30 R16
G1 X133.109 Y115.817 E.26906
M73 P31 R16
G1 X132.458 Y115.817 E.0244
G1 X138.183 Y121.542 E.30356
G1 X138.183 Y122.192 E.0244
G1 X131.808 Y115.817 E.33807
G1 X131.157 Y115.817 E.0244
G1 X138.183 Y122.843 E.37257
G1 X138.183 Y123.494 E.0244
G1 X130.506 Y115.817 E.40708
G1 X129.855 Y115.817 E.0244
G1 X138.183 Y124.145 E.44158
G1 X138.183 Y124.795 E.0244
G1 X129.205 Y115.817 E.47609
G1 X128.554 Y115.817 E.0244
G1 X138.183 Y125.446 E.51059
G1 X138.183 Y126.097 E.0244
G1 X127.903 Y115.817 E.5451
G1 X127.253 Y115.817 E.0244
G1 X138.183 Y126.747 E.5796
G1 X138.183 Y127.398 E.0244
G1 X126.602 Y115.817 E.61411
G1 X125.951 Y115.817 E.0244
G1 X138.183 Y128.049 E.64861
G1 X138.183 Y128.7 E.0244
G1 X125.3 Y115.817 E.68312
G1 X124.65 Y115.817 E.0244
G1 X138.183 Y129.35 E.71762
G1 X138.183 Y130.001 E.0244
G1 X123.999 Y115.817 E.75213
G1 X123.348 Y115.817 E.0244
G1 X138.183 Y130.652 E.78663
G1 X138.183 Y131.302 E.0244
G1 X122.698 Y115.817 E.82114
G1 X122.047 Y115.817 E.0244
G1 X138.183 Y131.953 E.85564
G1 X138.183 Y132.604 E.0244
G1 X121.396 Y115.817 E.89015
G1 X120.745 Y115.817 E.0244
G1 X138.183 Y133.255 E.92465
G1 X138.183 Y133.905 E.0244
G1 X120.095 Y115.817 E.95916
M73 P31 R15
G1 X119.444 Y115.817 E.0244
G1 X138.183 Y134.556 E.99366
G1 X138.183 Y135.207 E.0244
G1 X118.793 Y115.817 E1.02817
G1 X118.142 Y115.817 E.0244
M73 P32 R15
G1 X138.183 Y135.858 E1.06267
G1 X138.183 Y136.183 E.01221
G1 X137.858 Y136.183 E.01219
G1 X117.817 Y116.142 E1.06271
G1 X117.817 Y116.793 E.0244
G1 X137.207 Y136.183 E1.0282
G1 X136.557 Y136.183 E.0244
G1 X117.817 Y117.443 E.9937
G1 X117.817 Y118.094 E.0244
G1 X135.906 Y136.183 E.95919
G1 X135.255 Y136.183 E.0244
G1 X117.817 Y118.745 E.92469
G1 X117.817 Y119.395 E.0244
G1 X134.605 Y136.183 E.89018
G1 X133.954 Y136.183 E.0244
G1 X117.817 Y120.046 E.85568
G1 X117.817 Y120.697 E.0244
G1 X133.303 Y136.183 E.82117
G1 X132.652 Y136.183 E.0244
G1 X117.817 Y121.348 E.78667
G1 X117.817 Y121.998 E.0244
G1 X132.002 Y136.183 E.75216
G1 X131.351 Y136.183 E.0244
G1 X117.817 Y122.649 E.71766
G1 X117.817 Y123.3 E.0244
G1 X130.7 Y136.183 E.68315
G1 X130.05 Y136.183 E.0244
G1 X117.817 Y123.95 E.64865
G1 X117.817 Y124.601 E.0244
G1 X129.399 Y136.183 E.61414
G1 X128.748 Y136.183 E.0244
G1 X117.817 Y125.252 E.57964
G1 X117.817 Y125.903 E.0244
G1 X128.097 Y136.183 E.54513
G1 X127.447 Y136.183 E.0244
G1 X117.817 Y126.553 E.51063
G1 X117.817 Y127.204 E.0244
G1 X126.796 Y136.183 E.47612
G1 X126.145 Y136.183 E.0244
G1 X117.817 Y127.855 E.44162
G1 X117.817 Y128.506 E.0244
G1 X125.494 Y136.183 E.40711
G1 X124.844 Y136.183 E.0244
G1 X117.817 Y129.156 E.37261
G1 X117.817 Y129.807 E.0244
G1 X124.193 Y136.183 E.3381
G1 X123.542 Y136.183 E.0244
G1 X117.817 Y130.458 E.3036
G1 X117.817 Y131.108 E.0244
G1 X122.892 Y136.183 E.26909
G1 X122.241 Y136.183 E.0244
G1 X117.817 Y131.759 E.23459
G1 X117.817 Y132.41 E.0244
G1 X121.59 Y136.183 E.20008
G1 X120.939 Y136.183 E.0244
G1 X117.817 Y133.061 E.16558
G1 X117.817 Y133.711 E.0244
G1 X120.289 Y136.183 E.13107
G1 X119.638 Y136.183 E.0244
M73 P33 R15
G1 X117.817 Y134.362 E.09657
G1 X117.817 Y135.013 E.0244
G1 X118.987 Y136.183 E.06206
G1 X118.337 Y136.183 E.0244
G1 X117.611 Y135.458 E.03847
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X118.337 Y136.183 E-.38984
G1 X118.987 Y136.183 E-.24728
G1 X118.759 Y135.955 E-.12288
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/128
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S255
M106 P2 S178
; open powerlost recovery
M1003 S1
M976 S1 P1 ; scan model before printing 2nd layer
M400 P100
G1 E.8
G1 E-.8
M204 S10000
G17
G3 Z.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11791.304
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F11791.304
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F11791.304
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F11791.304
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.048 Y136.813 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42116
G1 F12690.355
G1 X138.643 Y136.218 E.02594
G1 X138.643 Y135.683 E.01649
G1 X137.683 Y136.643 E.04186
G1 X137.148 Y136.643 E.01649
G1 X138.643 Y135.148 E.06517
G1 X138.643 Y134.613 E.01649
G1 X136.613 Y136.643 E.08849
G1 X136.078 Y136.643 E.01649
G1 X138.643 Y134.078 E.11181
G1 X138.643 Y133.544 E.01649
G1 X135.544 Y136.643 E.13512
G1 X135.009 Y136.643 E.01649
G1 X138.643 Y133.009 E.15844
G1 X138.643 Y132.474 E.01649
G1 X134.474 Y136.643 E.18175
G1 X133.939 Y136.643 E.01649
G1 X138.643 Y131.939 E.20507
G1 X138.643 Y131.404 E.01649
G1 X133.404 Y136.643 E.22839
G1 X132.869 Y136.643 E.01649
G1 X138.643 Y130.869 E.2517
G1 X138.643 Y130.334 E.01649
M73 P34 R15
G1 X132.334 Y136.643 E.27502
G1 X131.799 Y136.643 E.01649
G1 X138.643 Y129.799 E.29833
G1 X138.643 Y129.264 E.01649
G1 X131.264 Y136.643 E.32165
G1 X130.729 Y136.643 E.01649
G1 X138.643 Y128.729 E.34497
G1 X138.643 Y128.194 E.01649
G1 X130.194 Y136.643 E.36828
G1 X129.659 Y136.643 E.01649
G1 X138.643 Y127.659 E.3916
G1 X138.643 Y127.125 E.01649
G1 X129.125 Y136.643 E.41491
G1 X128.59 Y136.643 E.01649
G1 X138.643 Y126.59 E.43823
G1 X138.643 Y126.055 E.01649
G1 X128.055 Y136.643 E.46155
G1 X127.52 Y136.643 E.01649
G1 X138.643 Y125.52 E.48486
G1 X138.643 Y124.985 E.01649
G1 X126.985 Y136.643 E.50818
G1 X126.45 Y136.643 E.01649
G1 X138.643 Y124.45 E.53149
G1 X138.643 Y123.915 E.01649
G1 X125.915 Y136.643 E.55481
G1 X125.38 Y136.643 E.01649
G1 X138.643 Y123.38 E.57813
G1 X138.643 Y122.845 E.01649
G1 X124.845 Y136.643 E.60144
G1 X124.31 Y136.643 E.01649
G1 X138.643 Y122.31 E.62476
G1 X138.643 Y121.775 E.01649
G1 X123.775 Y136.643 E.64808
G1 X123.241 Y136.643 E.01649
G1 X138.643 Y121.241 E.67139
G1 X138.643 Y120.706 E.01649
G1 X122.706 Y136.643 E.69471
G1 X122.171 Y136.643 E.01649
G1 X138.643 Y120.171 E.71802
G1 X138.643 Y119.636 E.01649
G1 X121.636 Y136.643 E.74134
G1 X121.101 Y136.643 E.01649
G1 X138.643 Y119.101 E.76466
G1 X138.643 Y118.566 E.01649
G1 X120.566 Y136.643 E.78797
G1 X120.031 Y136.643 E.01649
G1 X138.643 Y118.031 E.81129
G1 X138.643 Y117.496 E.01649
G1 X119.496 Y136.643 E.8346
G1 X118.961 Y136.643 E.01649
G1 X138.643 Y116.961 E.85792
G1 X138.643 Y116.426 E.01649
G1 X118.426 Y136.643 E.88124
G1 X117.891 Y136.643 E.01649
G1 X138.643 Y115.891 E.90455
G1 X138.643 Y115.357 E.01649
G1 X117.357 Y136.643 E.92787
G1 X117.357 Y136.109 E.01649
G1 X138.109 Y115.357 E.90455
G1 X137.574 Y115.357 E.01649
G1 X117.357 Y135.574 E.88123
G1 X117.357 Y135.039 E.01649
G1 X137.039 Y115.357 E.85792
G1 X136.504 Y115.357 E.01649
G1 X117.357 Y134.504 E.8346
G1 X117.357 Y133.969 E.01649
G1 X135.969 Y115.357 E.81129
G1 X135.434 Y115.357 E.01649
G1 X117.357 Y133.434 E.78797
G1 X117.357 Y132.899 E.01649
G1 X134.899 Y115.357 E.76465
G1 X134.364 Y115.357 E.01649
G1 X117.357 Y132.364 E.74134
G1 X117.357 Y131.829 E.01649
G1 X133.829 Y115.357 E.71802
G1 X133.294 Y115.357 E.01649
G1 X117.357 Y131.294 E.69471
G1 X117.357 Y130.759 E.01649
G1 X132.759 Y115.357 E.67139
G1 X132.225 Y115.357 E.01649
G1 X117.357 Y130.225 E.64807
G1 X117.357 Y129.69 E.01649
G1 X131.69 Y115.357 E.62476
G1 X131.155 Y115.357 E.01649
G1 X117.357 Y129.155 E.60144
G1 X117.357 Y128.62 E.01649
G1 X130.62 Y115.357 E.57813
G1 X130.085 Y115.357 E.01649
G1 X117.357 Y128.085 E.55481
G1 X117.357 Y127.55 E.01649
G1 X129.55 Y115.357 E.53149
G1 X129.015 Y115.357 E.01649
G1 X117.357 Y127.015 E.50818
G1 X117.357 Y126.48 E.01649
G1 X128.48 Y115.357 E.48486
G1 X127.945 Y115.357 E.01649
G1 X117.357 Y125.945 E.46155
G1 X117.357 Y125.41 E.01649
G1 X127.41 Y115.357 E.43823
G1 X126.875 Y115.357 E.01649
G1 X117.357 Y124.875 E.41491
G1 X117.357 Y124.34 E.01649
G1 X126.34 Y115.357 E.3916
G1 X125.806 Y115.357 E.01649
G1 X117.357 Y123.806 E.36828
G1 X117.357 Y123.271 E.01649
G1 X125.271 Y115.357 E.34497
G1 X124.736 Y115.357 E.01649
G1 X117.357 Y122.736 E.32165
G1 X117.357 Y122.201 E.01649
G1 X124.201 Y115.357 E.29833
G1 X123.666 Y115.357 E.01649
G1 X117.357 Y121.666 E.27502
G1 X117.357 Y121.131 E.01649
G1 X123.131 Y115.357 E.2517
G1 X122.596 Y115.357 E.01649
G1 X117.357 Y120.596 E.22838
G1 X117.357 Y120.061 E.01649
G1 X122.061 Y115.357 E.20507
G1 X121.526 Y115.357 E.01649
G1 X117.357 Y119.526 E.18175
G1 X117.357 Y118.991 E.01649
G1 X120.991 Y115.357 E.15844
G1 X120.456 Y115.357 E.01649
G1 X117.357 Y118.456 E.13512
G1 X117.357 Y117.922 E.01649
G1 X119.922 Y115.357 E.1118
G1 X119.387 Y115.357 E.01649
G1 X117.357 Y117.387 E.08849
G1 X117.357 Y116.852 E.01649
G1 X118.852 Y115.357 E.06517
G1 X118.317 Y115.357 E.01649
G1 X117.357 Y116.317 E.04186
G1 X117.357 Y115.782 E.01649
G1 X117.952 Y115.187 E.02594
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12690.355
G1 X117.357 Y115.782 E-.31977
G1 X117.357 Y116.317 E-.20327
G1 X117.797 Y115.876 E-.23696
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/128
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11791.304
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F11791.304
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F11791.304
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F11791.304
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.665 Y130.903 Z1 F30000
G1 X138.813 Y115.952 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42116
G1 F12690.355
G1 X138.218 Y115.357 E.02594
G1 X137.683 Y115.357 E.01649
G1 X138.643 Y116.317 E.04186
G1 X138.643 Y116.852 E.01649
G1 X137.148 Y115.357 E.06517
G1 X136.613 Y115.357 E.01649
G1 X138.643 Y117.387 E.08849
M73 P35 R15
G1 X138.643 Y117.922 E.01649
G1 X136.078 Y115.357 E.11181
G1 X135.544 Y115.357 E.01649
G1 X138.643 Y118.456 E.13512
G1 X138.643 Y118.991 E.01649
G1 X135.009 Y115.357 E.15844
G1 X134.474 Y115.357 E.01649
G1 X138.643 Y119.526 E.18175
G1 X138.643 Y120.061 E.01649
G1 X133.939 Y115.357 E.20507
G1 X133.404 Y115.357 E.01649
G1 X138.643 Y120.596 E.22839
G1 X138.643 Y121.131 E.01649
G1 X132.869 Y115.357 E.2517
G1 X132.334 Y115.357 E.01649
G1 X138.643 Y121.666 E.27502
G1 X138.643 Y122.201 E.01649
G1 X131.799 Y115.357 E.29833
G1 X131.264 Y115.357 E.01649
G1 X138.643 Y122.736 E.32165
G1 X138.643 Y123.271 E.01649
G1 X130.729 Y115.357 E.34497
G1 X130.194 Y115.357 E.01649
G1 X138.643 Y123.806 E.36828
G1 X138.643 Y124.341 E.01649
G1 X129.659 Y115.357 E.3916
G1 X129.125 Y115.357 E.01649
G1 X138.643 Y124.875 E.41491
G1 X138.643 Y125.41 E.01649
G1 X128.59 Y115.357 E.43823
G1 X128.055 Y115.357 E.01649
G1 X138.643 Y125.945 E.46155
G1 X138.643 Y126.48 E.01649
G1 X127.52 Y115.357 E.48486
G1 X126.985 Y115.357 E.01649
G1 X138.643 Y127.015 E.50818
G1 X138.643 Y127.55 E.01649
G1 X126.45 Y115.357 E.53149
G1 X125.915 Y115.357 E.01649
G1 X138.643 Y128.085 E.55481
G1 X138.643 Y128.62 E.01649
G1 X125.38 Y115.357 E.57813
G1 X124.845 Y115.357 E.01649
G1 X138.643 Y129.155 E.60144
G1 X138.643 Y129.69 E.01649
G1 X124.31 Y115.357 E.62476
G1 X123.775 Y115.357 E.01649
G1 X138.643 Y130.225 E.64808
G1 X138.643 Y130.759 E.01649
G1 X123.241 Y115.357 E.67139
G1 X122.706 Y115.357 E.01649
G1 X138.643 Y131.294 E.69471
G1 X138.643 Y131.829 E.01649
G1 X122.171 Y115.357 E.71802
G1 X121.636 Y115.357 E.01649
G1 X138.643 Y132.364 E.74134
G1 X138.643 Y132.899 E.01649
G1 X121.101 Y115.357 E.76466
G1 X120.566 Y115.357 E.01649
G1 X138.643 Y133.434 E.78797
G1 X138.643 Y133.969 E.01649
G1 X120.031 Y115.357 E.81129
G1 X119.496 Y115.357 E.01649
G1 X138.643 Y134.504 E.8346
G1 X138.643 Y135.039 E.01649
G1 X118.961 Y115.357 E.85792
G1 X118.426 Y115.357 E.01649
G1 X138.643 Y135.574 E.88124
G1 X138.643 Y136.109 E.01649
G1 X117.891 Y115.357 E.90455
G1 X117.357 Y115.357 E.01649
G1 X138.643 Y136.643 E.92787
G1 X138.109 Y136.643 E.01649
G1 X117.357 Y115.891 E.90455
G1 X117.357 Y116.426 E.01649
G1 X137.574 Y136.643 E.88123
G1 X137.039 Y136.643 E.01649
G1 X117.357 Y116.961 E.85792
G1 X117.357 Y117.496 E.01649
G1 X136.504 Y136.643 E.8346
G1 X135.969 Y136.643 E.01649
G1 X117.357 Y118.031 E.81129
G1 X117.357 Y118.566 E.01649
G1 X135.434 Y136.643 E.78797
G1 X134.899 Y136.643 E.01649
G1 X117.357 Y119.101 E.76465
G1 X117.357 Y119.636 E.01649
G1 X134.364 Y136.643 E.74134
G1 X133.829 Y136.643 E.01649
G1 X117.357 Y120.171 E.71802
G1 X117.357 Y120.706 E.01649
G1 X133.294 Y136.643 E.69471
G1 X132.759 Y136.643 E.01649
G1 X117.357 Y121.241 E.67139
G1 X117.357 Y121.775 E.01649
G1 X132.225 Y136.643 E.64807
G1 X131.69 Y136.643 E.01649
G1 X117.357 Y122.31 E.62476
G1 X117.357 Y122.845 E.01649
G1 X131.155 Y136.643 E.60144
G1 X130.62 Y136.643 E.01649
G1 X117.357 Y123.38 E.57813
G1 X117.357 Y123.915 E.01649
G1 X130.085 Y136.643 E.55481
G1 X129.55 Y136.643 E.01649
G1 X117.357 Y124.45 E.53149
G1 X117.357 Y124.985 E.01649
G1 X129.015 Y136.643 E.50818
G1 X128.48 Y136.643 E.01649
G1 X117.357 Y125.52 E.48486
G1 X117.357 Y126.055 E.01649
G1 X127.945 Y136.643 E.46155
G1 X127.41 Y136.643 E.01649
G1 X117.357 Y126.59 E.43823
G1 X117.357 Y127.125 E.01649
G1 X126.875 Y136.643 E.41491
G1 X126.34 Y136.643 E.01649
G1 X117.357 Y127.66 E.3916
G1 X117.357 Y128.194 E.01649
G1 X125.806 Y136.643 E.36828
G1 X125.271 Y136.643 E.01649
G1 X117.357 Y128.729 E.34497
G1 X117.357 Y129.264 E.01649
G1 X124.736 Y136.643 E.32165
G1 X124.201 Y136.643 E.01649
G1 X117.357 Y129.799 E.29833
G1 X117.357 Y130.334 E.01649
G1 X123.666 Y136.643 E.27502
G1 X123.131 Y136.643 E.01649
G1 X117.357 Y130.869 E.2517
G1 X117.357 Y131.404 E.01649
G1 X122.596 Y136.643 E.22838
G1 X122.061 Y136.643 E.01649
G1 X117.357 Y131.939 E.20507
G1 X117.357 Y132.474 E.01649
G1 X121.526 Y136.643 E.18175
G1 X120.991 Y136.643 E.01649
G1 X117.357 Y133.009 E.15844
G1 X117.357 Y133.544 E.01649
G1 X120.456 Y136.643 E.13512
G1 X119.922 Y136.643 E.01649
G1 X117.357 Y134.078 E.1118
G1 X117.357 Y134.613 E.01649
G1 X119.387 Y136.643 E.08849
G1 X118.852 Y136.643 E.01649
G1 X117.357 Y135.148 E.06517
G1 X117.357 Y135.683 E.01649
G1 X118.317 Y136.643 E.04186
G1 X117.782 Y136.643 E.01649
G1 X117.187 Y136.048 E.02594
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12690.355
G1 X117.782 Y136.643 E-.31977
G1 X118.317 Y136.643 E-.20327
G1 X117.876 Y136.203 E-.23696
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/128
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
G17
G3 Z1 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6988
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6988
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6988
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6988
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6988
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z1.2 F30000
G1 X117.372 Y135 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6988
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/128
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
G17
G3 Z1.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
M73 P36 R15
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
M73 P36 R14
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/128
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
G17
G3 Z1.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z1.6 F30000
G1 X117.372 Y135 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/128
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
G17
G3 Z1.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
M73 P37 R14
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/128
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
G17
G3 Z1.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z2 F30000
G1 X117.372 Y135 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/128
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
G17
G3 Z2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
M73 P38 R14
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/128
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
G17
G3 Z2.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z2.4 F30000
G1 X117.372 Y135 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/128
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
G17
G3 Z2.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
M73 P39 R14
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/128
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
G17
G3 Z2.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z2.8 F30000
G1 X117.372 Y135 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/128
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
G17
G3 Z2.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
M73 P40 R14
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/128
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
G17
G3 Z3 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z3.2 F30000
G1 X117.372 Y135 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
M73 P40 R13
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/128
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
G17
G3 Z3.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/128
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
G17
G3 Z3.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
M73 P41 R13
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z3.6 F30000
G1 X117.372 Y135 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/128
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
G17
G3 Z3.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/128
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
G17
G3 Z3.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
M73 P42 R13
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z4 F30000
G1 X117.372 Y135 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/128
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
G17
G3 Z4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/128
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
G17
G3 Z4.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
M73 P43 R13
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z4.4 F30000
G1 X117.372 Y135 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/128
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
G17
G3 Z4.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/128
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
G17
G3 Z4.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
M73 P44 R13
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z4.8 F30000
G1 X117.372 Y135 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/128
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
G17
G3 Z4.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z5 F30000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
M73 P44 R12
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/128
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
G17
G3 Z5 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
M73 P45 R12
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z5.2 F30000
G1 X117.372 Y135 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/128
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
G17
G3 Z5.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/128
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
G17
G3 Z5.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z5.6 F30000
G1 X117.372 Y135 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
M73 P46 R12
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/128
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
G17
G3 Z5.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z5.8 F30000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/128
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
G17
G3 Z5.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z6 F30000
G1 X117.372 Y135 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
M73 P47 R12
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/128
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
G17
G3 Z6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/128
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
G17
G3 Z6.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z6.4 F30000
G1 X117.372 Y135 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
M73 P48 R12
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/128
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
G17
G3 Z6.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z6.6 F30000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/128
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
G17
G3 Z6.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z6.8 F30000
G1 X117.372 Y135 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
M73 P48 R11
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
M73 P49 R11
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/128
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
G17
G3 Z6.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/128
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
G17
G3 Z7 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z7.2 F30000
G1 X117.372 Y135 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P50 R11
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/128
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
G17
G3 Z7.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/128
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
G17
G3 Z7.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z7.6 F30000
G1 X117.372 Y135 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/128
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
G17
G3 Z7.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
M73 P51 R11
G1 X138.977 Y136.977
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z7.8 F30000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/128
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
G17
G3 Z7.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z8 F30000
G1 X117.372 Y135 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/128
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
G17
G3 Z8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
M73 P52 R11
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z8.2 F30000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/128
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
G17
G3 Z8.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z8.4 F30000
G1 X117.372 Y135 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/128
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
G17
G3 Z8.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
M73 P53 R11
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z8.6 F30000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
M73 P53 R10
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/128
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
G17
G3 Z8.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z8.8 F30000
G1 X117.372 Y135 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/128
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
G17
G3 Z8.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
M73 P54 R10
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z9 F30000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/128
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
G17
G3 Z9 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z9.2 F30000
G1 X117.372 Y135 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/128
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
G17
G3 Z9.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
M73 P55 R10
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z9.4 F30000
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/128
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
G17
G3 Z9.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z9.6 F30000
G1 X117.372 Y135 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/128
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
G17
G3 Z9.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z9.8 F30000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
M73 P56 R10
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/128
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
G17
G3 Z9.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z10 F30000
G1 X117.372 Y135 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/128
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
G17
G3 Z10 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z10.2 F30000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
M73 P57 R10
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/128
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
G17
G3 Z10.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
M73 P57 R9
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z10.4 F30000
G1 X117.372 Y135 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/128
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
G17
G3 Z10.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z10.6 F30000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
M73 P58 R9
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/128
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
G17
G3 Z10.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z10.8 F30000
G1 X117.372 Y135 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/128
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
G17
G3 Z10.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z11 F30000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
M73 P59 R9
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/128
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
G17
G3 Z11 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z11.2 F30000
G1 X117.372 Y135 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/128
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
G17
G3 Z11.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z11.4 F30000
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P60 R9
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/128
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
G17
G3 Z11.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z11.6 F30000
G1 X117.372 Y135 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/128
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
G17
G3 Z11.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z11.8 F30000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
M73 P61 R9
G1 E-.04 F1800
; layer num/total_layer_count: 58/128
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
G17
G3 Z11.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z12 F30000
G1 X117.372 Y135 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/128
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
G17
G3 Z12 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
M73 P61 R8
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z12.2 F30000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/128
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
G17
G3 Z12.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z12
M73 P62 R8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z12.4 F30000
G1 X117.372 Y135 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/128
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
G17
G3 Z12.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z12.6 F30000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/128
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
G17
G3 Z12.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
M73 P63 R8
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z12.8 F30000
G1 X117.372 Y135 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/128
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
G17
G3 Z12.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z13 F30000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/128
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
G17
G3 Z13 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
M73 P64 R8
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z13.2 F30000
G1 X117.372 Y135 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/128
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
G17
G3 Z13.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z13.4 F30000
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/128
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
G17
G3 Z13.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P65 R8
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z13.6 F30000
G1 X117.372 Y135 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/128
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
G17
G3 Z13.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z13.8 F30000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/128
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
G17
G3 Z13.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
M73 P65 R7
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z14 F30000
G1 X117.372 Y135 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
M73 P66 R7
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/128
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
G17
G3 Z14 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z14.2 F30000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/128
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
G17
G3 Z14.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z14.4 F30000
G1 X117.372 Y135 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
M73 P67 R7
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/128
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
G17
G3 Z14.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z14.6 F30000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/128
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
G17
G3 Z14.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z14.8 F30000
G1 X117.372 Y135 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
M73 P68 R7
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/128
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
G17
G3 Z14.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z15 F30000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/128
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
G17
G3 Z15 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z15.2 F30000
G1 X117.372 Y135 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
M73 P69 R7
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/128
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
G17
G3 Z15.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/128
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
G17
G3 Z15.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z15.6 F30000
G1 X117.372 Y135 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
M73 P70 R7
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/128
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
G17
G3 Z15.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
M73 P70 R6
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z15.8 F30000
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/128
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
G17
G3 Z15.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z16 F30000
G1 X117.372 Y135 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
M73 P71 R6
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/128
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
G17
G3 Z16 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z16.2 F30000
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/128
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
G17
G3 Z16.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z16.4 F30000
G1 X117.372 Y135 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/128
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
G17
G3 Z16.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z16.2
M73 P72 R6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z16.6 F30000
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/128
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
G17
G3 Z16.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z16.8 F30000
G1 X117.372 Y135 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/128
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
G17
G3 Z16.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
M73 P73 R6
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z17 F30000
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/128
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change
G17
G3 Z17 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z17.2 F30000
G1 X117.372 Y135 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/128
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change
G17
G3 Z17.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
M73 P74 R6
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z17.4 F30000
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/128
; update layer progress
M73 L86
M991 S0 P85 ;notify layer change
G17
G3 Z17.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
M73 P74 R5
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z17.6 F30000
G1 X117.372 Y135 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/128
; update layer progress
M73 L87
M991 S0 P86 ;notify layer change
G17
G3 Z17.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
M73 P75 R5
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z17.8 F30000
G1 Z17.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/128
; update layer progress
M73 L88
M991 S0 P87 ;notify layer change
G17
G3 Z17.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z18 F30000
G1 X117.372 Y135 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 89/128
; update layer progress
M73 L89
M991 S0 P88 ;notify layer change
G17
G3 Z18 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z18.2 F30000
M73 P76 R5
G1 Z17.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 90/128
; update layer progress
M73 L90
M991 S0 P89 ;notify layer change
G17
G3 Z18.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z18.4 F30000
G1 X117.372 Y135 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 91/128
; update layer progress
M73 L91
M991 S0 P90 ;notify layer change
G17
G3 Z18.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z18.6 F30000
G1 Z18.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
M73 P77 R5
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 92/128
; update layer progress
M73 L92
M991 S0 P91 ;notify layer change
G17
G3 Z18.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z18.8 F30000
G1 X117.372 Y135 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 93/128
; update layer progress
M73 L93
M991 S0 P92 ;notify layer change
G17
G3 Z18.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z19 F30000
G1 Z18.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
M73 P78 R5
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 94/128
; update layer progress
M73 L94
M991 S0 P93 ;notify layer change
G17
G3 Z19 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z19.2 F30000
G1 X117.372 Y135 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 95/128
; update layer progress
M73 L95
M991 S0 P94 ;notify layer change
G17
G3 Z19.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
M73 P78 R4
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z19.4 F30000
G1 Z19
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
M73 P79 R4
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 96/128
; update layer progress
M73 L96
M991 S0 P95 ;notify layer change
G17
G3 Z19.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z19.6 F30000
G1 X117.372 Y135 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 97/128
; update layer progress
M73 L97
M991 S0 P96 ;notify layer change
G17
G3 Z19.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z19.8 F30000
G1 Z19.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
M73 P80 R4
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 98/128
; update layer progress
M73 L98
M991 S0 P97 ;notify layer change
G17
G3 Z19.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z20 F30000
G1 X117.372 Y135 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 99/128
; update layer progress
M73 L99
M991 S0 P98 ;notify layer change
G17
G3 Z20 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z20.2 F30000
G1 Z19.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
M73 P81 R4
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 100/128
; update layer progress
M73 L100
M991 S0 P99 ;notify layer change
G17
G3 Z20.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z20.4 F30000
G1 X117.372 Y135 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 101/128
; update layer progress
M73 L101
M991 S0 P100 ;notify layer change
G17
G3 Z20.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z20.6 F30000
G1 Z20.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 102/128
; update layer progress
M73 L102
M991 S0 P101 ;notify layer change
G17
G3 Z20.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
M73 P82 R4
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z20.8 F30000
G1 X117.372 Y135 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 103/128
; update layer progress
M73 L103
M991 S0 P102 ;notify layer change
G17
G3 Z20.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z21 F30000
G1 Z20.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 104/128
; update layer progress
M73 L104
M991 S0 P103 ;notify layer change
G17
G3 Z21 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
M73 P82 R3
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
M73 P83 R3
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z21.2 F30000
G1 X117.372 Y135 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 105/128
; update layer progress
M73 L105
M991 S0 P104 ;notify layer change
G17
G3 Z21.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z21
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z21.4 F30000
G1 Z21
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 106/128
; update layer progress
M73 L106
M991 S0 P105 ;notify layer change
G17
G3 Z21.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
M73 P84 R3
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z21.6 F30000
G1 X117.372 Y135 Z21.6
G1 Z21.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 107/128
; update layer progress
M73 L107
M991 S0 P106 ;notify layer change
G17
G3 Z21.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z21.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z21.8 F30000
G1 Z21.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 108/128
; update layer progress
M73 L108
M991 S0 P107 ;notify layer change
G17
G3 Z21.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z21.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
M73 P85 R3
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z22 F30000
G1 X117.372 Y135 Z22
G1 Z21.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 109/128
; update layer progress
M73 L109
M991 S0 P108 ;notify layer change
G17
G3 Z22 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z21.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z22.2 F30000
G1 Z21.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 110/128
; update layer progress
M73 L110
M991 S0 P109 ;notify layer change
G17
G3 Z22.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z22
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
M73 P86 R3
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z22.4 F30000
G1 X117.372 Y135 Z22.4
G1 Z22
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 111/128
; update layer progress
M73 L111
M991 S0 P110 ;notify layer change
G17
G3 Z22.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z22.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z22.6 F30000
G1 Z22.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 112/128
; update layer progress
M73 L112
M991 S0 P111 ;notify layer change
G17
G3 Z22.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z22.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z22.8 F30000
G1 X117.372 Y135 Z22.8
G1 Z22.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
M73 P87 R3
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 113/128
; update layer progress
M73 L113
M991 S0 P112 ;notify layer change
G17
G3 Z22.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
M73 P87 R2
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z23 F30000
G1 Z22.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 114/128
; update layer progress
M73 L114
M991 S0 P113 ;notify layer change
G17
G3 Z23 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z22.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z23.2 F30000
G1 X117.372 Y135 Z23.2
G1 Z22.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
M73 P88 R2
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 115/128
; update layer progress
M73 L115
M991 S0 P114 ;notify layer change
G17
G3 Z23.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z23
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z23.4 F30000
G1 Z23
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 116/128
; update layer progress
M73 L116
M991 S0 P115 ;notify layer change
G17
G3 Z23.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z23.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z23.6 F30000
G1 X117.372 Y135 Z23.6
G1 Z23.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
M73 P89 R2
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 117/128
; update layer progress
M73 L117
M991 S0 P116 ;notify layer change
G17
G3 Z23.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z23.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z23.8 F30000
G1 Z23.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 118/128
; update layer progress
M73 L118
M991 S0 P117 ;notify layer change
G17
G3 Z23.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z23.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z24 F30000
G1 X117.372 Y135 Z24
G1 Z23.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
M73 P90 R2
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 119/128
; update layer progress
M73 L119
M991 S0 P118 ;notify layer change
G17
G3 Z24 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z23.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z24.2 F30000
G1 Z23.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 120/128
; update layer progress
M73 L120
M991 S0 P119 ;notify layer change
G17
G3 Z24.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z24.4 F30000
G1 X117.372 Y135 Z24.4
G1 Z24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
M73 P91 R2
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 121/128
; update layer progress
M73 L121
M991 S0 P120 ;notify layer change
G17
G3 Z24.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z24.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6896
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6896
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6896
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6896
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6896
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137 Y136.628 Z24.6 F30000
G1 Z24.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6896
G1 X138.628 Y136.628 E.05401
G1 X117.372 Y115.372 E.99721
G1 X123.277 Y115.372 E.19588
G1 X117.372 Y121.277 E.27702
G1 X117.372 Y123.047 E.05874
G1 X130.953 Y136.628 E.63711
G1 X132.723 Y136.628 E.05874
G1 X138.628 Y130.723 E.27702
G1 X138.628 Y128.953 E.05874
G1 X125.047 Y115.372 E.63711
G1 X130.953 Y115.372 E.19588
G1 X117.372 Y128.953 E.63711
G1 X117.372 Y130.723 E.05874
G1 X123.277 Y136.628 E.27702
G1 X125.047 Y136.628 E.05874
G1 X138.628 Y123.047 E.63711
G1 X138.628 Y121.277 E.05874
G1 X132.723 Y115.372 E.27702
G1 X138.628 Y115.372 E.19588
G1 X117.372 Y136.628 E.99721
G1 X117.372 Y135 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F11791.304
G1 X117.372 Y136.628 E-.61876
G1 X117.634 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 122/128
; update layer progress
M73 L122
M991 S0 P121 ;notify layer change
G17
G3 Z24.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
M73 P91 R1
G1 X138.977 Y136.977
G1 Z24.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6990
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F6990
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F6990
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F6990
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6990
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.061 Y137.281 Z24.8 F30000
G1 X117.372 Y135 Z24.8
G1 Z24.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6990
G1 X117.372 Y136.628 E.05401
G1 X138.628 Y115.372 E.99721
G1 X132.723 Y115.372 E.19588
G1 X138.628 Y121.277 E.27702
G1 X138.628 Y123.047 E.05874
G1 X125.047 Y136.628 E.63711
G1 X123.277 Y136.628 E.05874
G1 X117.372 Y130.723 E.27702
G1 X117.372 Y128.953 E.05874
G1 X130.953 Y115.372 E.63711
G1 X125.047 Y115.372 E.19588
G1 X138.628 Y128.953 E.63711
G1 X138.628 Y130.723 E.05874
G1 X132.723 Y136.628 E.27702
G1 X130.953 Y136.628 E.05874
G1 X117.372 Y123.047 E.63711
G1 X117.372 Y121.277 E.05874
G1 X123.277 Y115.372 E.27702
G1 X117.372 Y115.372 E.19588
G1 X138.628 Y136.628 E.99721
G1 X137 Y136.628 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F11791.304
G1 X138.628 Y136.628 E-.61876
G1 X138.366 Y136.366 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 123/128
; update layer progress
M73 L123
M991 S0 P122 ;notify layer change
G17
G3 Z24.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
M73 P92 R1
G1 X138.977 Y136.977
G1 Z24.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9785
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F9785
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F9785
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F9785
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9785
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
G1 F12000
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.623 Y136.251 Z25 F30000
G1 Z24.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9785
G1 X138.251 Y136.251 E.05401
G1 X117.749 Y115.749 E.96182
G1 X122.899 Y115.749 E.17086
G1 X117.749 Y120.899 E.24163
G1 X117.749 Y123.425 E.08377
G1 X130.575 Y136.251 E.60172
G1 X133.101 Y136.251 E.08377
G1 X138.251 Y131.101 E.24163
G1 X138.251 Y128.575 E.08377
G1 X125.425 Y115.749 E.60172
G1 X127.053 Y115.749 E.05401
G1 X138.251 Y117.377 F30000
G1 F9785
G1 X138.251 Y115.749 E.05401
G1 X117.749 Y136.251 E.96182
G1 X117.749 Y131.101 E.17086
G1 X122.899 Y136.251 E.24163
G1 X125.425 Y136.251 E.08377
G1 X138.251 Y123.425 E.60172
G1 X138.251 Y120.899 E.08377
G1 X133.101 Y115.749 E.24163
G1 X130.575 Y115.749 E.08377
G1 X117.749 Y128.575 E.60172
G1 X117.749 Y126.947 E.05401
G1 X138.611 Y115.389 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.46885
G1 F3000;_EXTRUDE_SET_SPEED
G1 X138.627 Y115.467 E.00277
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.452599
;_EXTRUDE_SET_SPEED
G1 X138.644 Y115.545 E.00266
G1 X138.644 Y136.455 E.69804
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.43648
;_EXTRUDE_SET_SPEED
G1 X138.611 Y136.611 E.00512
G1 X138.455 Y136.644 E.00512
; Slow Down End
; Slow Down Start
;_EXTRUDE_SET_SPEED
G1 X128 Y136.644 E.33529
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.467881
;_EXTRUDE_SET_SPEED
G1 X117.545 Y136.644 E.36204
G1 X117.389 Y136.611 E.00553
G1 X117.356 Y136.455 E.00553
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.43648
;_EXTRUDE_SET_SPEED
G1 X117.356 Y126 E.33529
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.467881
;_EXTRUDE_SET_SPEED
G1 X117.356 Y115.545 E.36204
G1 X117.389 Y115.389 E.00553
G1 X117.545 Y115.356 E.00553
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.436485
;_EXTRUDE_SET_SPEED
G1 X128 Y115.356 E.33529
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.468703
;_EXTRUDE_SET_SPEED
G1 X138.455 Y115.356 E.36274
G1 X138.552 Y115.377 E.00346
; Slow Down End
; CHANGE_LAYER
; Z_HEIGHT: 24.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F3000
G1 X138.455 Y115.356 E-.03786
G1 X136.554 Y115.356 E-.72214
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 124/128
; update layer progress
M73 L124
M991 S0 P123 ;notify layer change
G17
G3 Z25 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z24.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11791.304
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F11791.304
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F11791.304
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F11791.304
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.899 Y136.809 Z25.2 F30000
G1 Z24.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40055
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X138.607 Y136.101 E.05143
G1 X138.607 Y135.464 E.03271
G1 X137.464 Y136.607 E.08299
G1 X136.827 Y136.607 E.03271
G1 X138.607 Y134.827 E.12925
G1 X138.607 Y134.19 E.03271
G1 X136.19 Y136.607 E.17552
G1 X135.552 Y136.607 E.03271
G1 X138.607 Y133.552 E.22178
G1 X138.607 Y132.915 E.03271
G1 X134.915 Y136.607 E.26804
G1 X134.278 Y136.607 E.03271
G1 X138.607 Y132.278 E.31431
G1 X138.607 Y131.641 E.03271
G1 X133.641 Y136.607 E.36057
G1 X133.004 Y136.607 E.03271
G1 X138.607 Y131.004 E.40683
G1 X138.607 Y130.367 E.03271
G1 X132.367 Y136.607 E.4531
G1 X131.729 Y136.607 E.03271
G1 X138.607 Y129.729 E.49936
G1 X138.607 Y129.092 E.03271
G1 X131.092 Y136.607 E.54562
G1 X130.455 Y136.607 E.03271
G1 X138.607 Y128.455 E.59189
G1 X138.607 Y127.818 E.03271
G1 X129.818 Y136.607 E.63815
G1 X129.181 Y136.607 E.03271
G1 X138.607 Y127.181 E.68441
G1 X138.607 Y126.544 E.03271
G1 X128.544 Y136.607 E.73068
G1 X127.906 Y136.607 E.03271
M73 P93 R1
G1 X138.607 Y125.906 E.77694
G1 X138.607 Y125.269 E.03271
G1 X127.269 Y136.607 E.8232
G1 X126.632 Y136.607 E.03271
G1 X138.607 Y124.632 E.86947
G1 X138.607 Y123.995 E.03271
G1 X125.995 Y136.607 E.91573
G1 X125.358 Y136.607 E.03271
G1 X138.607 Y123.358 E.96199
G1 X138.607 Y122.721 E.03271
G1 X124.721 Y136.607 E1.00826
G1 X124.083 Y136.607 E.03271
G1 X138.607 Y122.083 E1.05452
G1 X138.607 Y121.446 E.03271
G1 X123.446 Y136.607 E1.10078
G1 X122.809 Y136.607 E.03271
G1 X138.607 Y120.809 E1.14705
G1 X138.607 Y120.172 E.03271
G1 X122.172 Y136.607 E1.19331
G1 X121.535 Y136.607 E.03271
G1 X138.607 Y119.535 E1.23957
G1 X138.607 Y118.897 E.03271
G1 X120.897 Y136.607 E1.28583
G1 X120.26 Y136.607 E.03271
G1 X138.607 Y118.26 E1.3321
G1 X138.607 Y117.623 E.03271
G1 X119.623 Y136.607 E1.37836
G1 X118.986 Y136.607 E.03271
G1 X138.607 Y116.986 E1.42462
G1 X138.607 Y116.349 E.03271
G1 X118.349 Y136.607 E1.47089
G1 X117.712 Y136.607 E.03271
G1 X138.607 Y115.712 E1.51715
G1 X138.607 Y115.393 E.01636
G1 X138.288 Y115.393 E.01636
G1 X117.393 Y136.288 E1.51715
G1 X117.393 Y135.651 E.03271
G1 X137.651 Y115.393 E1.47089
G1 X137.014 Y115.393 E.03271
G1 X117.393 Y135.014 E1.42463
G1 X117.393 Y134.377 E.03271
G1 X136.377 Y115.393 E1.37836
G1 X135.74 Y115.393 E.03271
G1 X117.393 Y133.74 E1.3321
G1 X117.393 Y133.103 E.03271
G1 X135.103 Y115.393 E1.28584
G1 X134.465 Y115.393 E.03271
G1 X117.393 Y132.465 E1.23957
G1 X117.393 Y131.828 E.03271
G1 X133.828 Y115.393 E1.19331
G1 X133.191 Y115.393 E.03271
G1 X117.393 Y131.191 E1.14705
G1 X117.393 Y130.554 E.03271
G1 X132.554 Y115.393 E1.10078
G1 X131.917 Y115.393 E.03271
G1 X117.393 Y129.917 E1.05452
G1 X117.393 Y129.28 E.03271
G1 X131.28 Y115.393 E1.00826
G1 X130.642 Y115.393 E.03271
G1 X117.393 Y128.642 E.962
G1 X117.393 Y128.005 E.03271
G1 X130.005 Y115.393 E.91573
G1 X129.368 Y115.393 E.03271
G1 X117.393 Y127.368 E.86947
G1 X117.393 Y126.731 E.03271
G1 X128.731 Y115.393 E.8232
G1 X128.094 Y115.393 E.03271
G1 X117.393 Y126.094 E.77694
G1 X117.393 Y125.456 E.03271
G1 X127.456 Y115.393 E.73068
G1 X126.819 Y115.393 E.03271
G1 X117.393 Y124.819 E.68442
G1 X117.393 Y124.182 E.03271
G1 X126.182 Y115.393 E.63815
G1 X125.545 Y115.393 E.03271
G1 X117.393 Y123.545 E.59189
G1 X117.393 Y122.908 E.03271
G1 X124.908 Y115.393 E.54563
G1 X124.271 Y115.393 E.03271
G1 X117.393 Y122.271 E.49936
G1 X117.393 Y121.633 E.03271
G1 X123.633 Y115.393 E.4531
G1 X122.996 Y115.393 E.03271
G1 X117.393 Y120.996 E.40684
G1 X117.393 Y120.359 E.03271
G1 X122.359 Y115.393 E.36057
G1 X121.722 Y115.393 E.03271
G1 X117.393 Y119.722 E.31431
G1 X117.393 Y119.085 E.03271
G1 X121.085 Y115.393 E.26805
G1 X120.448 Y115.393 E.03271
G1 X117.393 Y118.448 E.22178
G1 X117.393 Y117.81 E.03271
G1 X119.81 Y115.393 E.17552
G1 X119.173 Y115.393 E.03271
G1 X117.393 Y117.173 E.12926
G1 X117.393 Y116.536 E.03271
G1 X118.536 Y115.393 E.08299
G1 X117.899 Y115.393 E.03271
G1 X117.19 Y116.101 E.05143
; CHANGE_LAYER
; Z_HEIGHT: 25
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F3000
G1 X117.899 Y115.393 E-.38068
G1 X118.536 Y115.393 E-.24212
G1 X118.281 Y115.648 E-.1372
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 125/128
; update layer progress
M73 L125
M991 S0 P124 ;notify layer change
G17
G3 Z25.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z25
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11791.304
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F11791.304
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F11791.304
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F11791.304
G1 X115.802 Y138.198 E.80926
M73 P94 R1
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.665 Y130.903 Z25.4 F30000
G1 X138.813 Y115.952 Z25.4
G1 Z25
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42116
G1 F12690.355
G1 X138.218 Y115.357 E.02594
G1 X137.683 Y115.357 E.01649
G1 X138.643 Y116.317 E.04186
G1 X138.643 Y116.852 E.01649
G1 X137.148 Y115.357 E.06517
G1 X136.613 Y115.357 E.01649
G1 X138.643 Y117.387 E.08849
G1 X138.643 Y117.922 E.01649
G1 X136.078 Y115.357 E.11181
G1 X135.544 Y115.357 E.01649
G1 X138.643 Y118.456 E.13512
G1 X138.643 Y118.991 E.01649
G1 X135.009 Y115.357 E.15844
G1 X134.474 Y115.357 E.01649
G1 X138.643 Y119.526 E.18175
G1 X138.643 Y120.061 E.01649
G1 X133.939 Y115.357 E.20507
G1 X133.404 Y115.357 E.01649
G1 X138.643 Y120.596 E.22839
G1 X138.643 Y121.131 E.01649
G1 X132.869 Y115.357 E.2517
G1 X132.334 Y115.357 E.01649
G1 X138.643 Y121.666 E.27502
G1 X138.643 Y122.201 E.01649
G1 X131.799 Y115.357 E.29833
G1 X131.264 Y115.357 E.01649
G1 X138.643 Y122.736 E.32165
G1 X138.643 Y123.271 E.01649
G1 X130.729 Y115.357 E.34497
G1 X130.194 Y115.357 E.01649
G1 X138.643 Y123.806 E.36828
G1 X138.643 Y124.341 E.01649
G1 X129.659 Y115.357 E.3916
G1 X129.125 Y115.357 E.01649
G1 X138.643 Y124.875 E.41491
G1 X138.643 Y125.41 E.01649
G1 X128.59 Y115.357 E.43823
G1 X128.055 Y115.357 E.01649
G1 X138.643 Y125.945 E.46155
G1 X138.643 Y126.48 E.01649
G1 X127.52 Y115.357 E.48486
G1 X126.985 Y115.357 E.01649
G1 X138.643 Y127.015 E.50818
G1 X138.643 Y127.55 E.01649
G1 X126.45 Y115.357 E.53149
G1 X125.915 Y115.357 E.01649
G1 X138.643 Y128.085 E.55481
G1 X138.643 Y128.62 E.01649
G1 X125.38 Y115.357 E.57813
G1 X124.845 Y115.357 E.01649
G1 X138.643 Y129.155 E.60144
G1 X138.643 Y129.69 E.01649
G1 X124.31 Y115.357 E.62476
G1 X123.775 Y115.357 E.01649
G1 X138.643 Y130.225 E.64808
G1 X138.643 Y130.759 E.01649
G1 X123.241 Y115.357 E.67139
G1 X122.706 Y115.357 E.01649
G1 X138.643 Y131.294 E.69471
G1 X138.643 Y131.829 E.01649
G1 X122.171 Y115.357 E.71802
G1 X121.636 Y115.357 E.01649
G1 X138.643 Y132.364 E.74134
G1 X138.643 Y132.899 E.01649
G1 X121.101 Y115.357 E.76466
G1 X120.566 Y115.357 E.01649
G1 X138.643 Y133.434 E.78797
G1 X138.643 Y133.969 E.01649
G1 X120.031 Y115.357 E.81129
G1 X119.496 Y115.357 E.01649
G1 X138.643 Y134.504 E.8346
G1 X138.643 Y135.039 E.01649
G1 X118.961 Y115.357 E.85792
G1 X118.426 Y115.357 E.01649
G1 X138.643 Y135.574 E.88124
G1 X138.643 Y136.109 E.01649
M73 P95 R1
G1 X117.891 Y115.357 E.90455
G1 X117.357 Y115.357 E.01649
G1 X138.643 Y136.643 E.92787
G1 X138.109 Y136.643 E.01649
G1 X117.357 Y115.891 E.90455
G1 X117.357 Y116.426 E.01649
G1 X137.574 Y136.643 E.88123
G1 X137.039 Y136.643 E.01649
G1 X117.357 Y116.961 E.85792
G1 X117.357 Y117.496 E.01649
G1 X136.504 Y136.643 E.8346
G1 X135.969 Y136.643 E.01649
G1 X117.357 Y118.031 E.81129
G1 X117.357 Y118.566 E.01649
G1 X135.434 Y136.643 E.78797
G1 X134.899 Y136.643 E.01649
G1 X117.357 Y119.101 E.76465
G1 X117.357 Y119.636 E.01649
G1 X134.364 Y136.643 E.74134
G1 X133.829 Y136.643 E.01649
G1 X117.357 Y120.171 E.71802
G1 X117.357 Y120.706 E.01649
G1 X133.294 Y136.643 E.69471
G1 X132.759 Y136.643 E.01649
G1 X117.357 Y121.241 E.67139
G1 X117.357 Y121.775 E.01649
G1 X132.225 Y136.643 E.64807
G1 X131.69 Y136.643 E.01649
G1 X117.357 Y122.31 E.62476
G1 X117.357 Y122.845 E.01649
G1 X131.155 Y136.643 E.60144
G1 X130.62 Y136.643 E.01649
G1 X117.357 Y123.38 E.57813
G1 X117.357 Y123.915 E.01649
G1 X130.085 Y136.643 E.55481
G1 X129.55 Y136.643 E.01649
G1 X117.357 Y124.45 E.53149
G1 X117.357 Y124.985 E.01649
G1 X129.015 Y136.643 E.50818
G1 X128.48 Y136.643 E.01649
G1 X117.357 Y125.52 E.48486
G1 X117.357 Y126.055 E.01649
G1 X127.945 Y136.643 E.46155
G1 X127.41 Y136.643 E.01649
G1 X117.357 Y126.59 E.43823
G1 X117.357 Y127.125 E.01649
G1 X126.875 Y136.643 E.41491
G1 X126.34 Y136.643 E.01649
G1 X117.357 Y127.66 E.3916
G1 X117.357 Y128.194 E.01649
G1 X125.806 Y136.643 E.36828
G1 X125.271 Y136.643 E.01649
G1 X117.357 Y128.729 E.34497
G1 X117.357 Y129.264 E.01649
G1 X124.736 Y136.643 E.32165
G1 X124.201 Y136.643 E.01649
G1 X117.357 Y129.799 E.29833
G1 X117.357 Y130.334 E.01649
G1 X123.666 Y136.643 E.27502
G1 X123.131 Y136.643 E.01649
G1 X117.357 Y130.869 E.2517
G1 X117.357 Y131.404 E.01649
G1 X122.596 Y136.643 E.22838
G1 X122.061 Y136.643 E.01649
G1 X117.357 Y131.939 E.20507
G1 X117.357 Y132.474 E.01649
G1 X121.526 Y136.643 E.18175
G1 X120.991 Y136.643 E.01649
G1 X117.357 Y133.009 E.15844
G1 X117.357 Y133.544 E.01649
G1 X120.456 Y136.643 E.13512
G1 X119.922 Y136.643 E.01649
G1 X117.357 Y134.078 E.1118
G1 X117.357 Y134.613 E.01649
G1 X119.387 Y136.643 E.08849
G1 X118.852 Y136.643 E.01649
G1 X117.357 Y135.148 E.06517
G1 X117.357 Y135.683 E.01649
G1 X118.317 Y136.643 E.04186
G1 X117.782 Y136.643 E.01649
G1 X117.187 Y136.048 E.02594
; CHANGE_LAYER
; Z_HEIGHT: 25.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F12690.355
G1 X117.782 Y136.643 E-.31977
G1 X118.317 Y136.643 E-.20327
G1 X117.876 Y136.203 E-.23696
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 126/128
; update layer progress
M73 L126
M991 S0 P125 ;notify layer change
G17
G3 Z25.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z25.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11791.304
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F11791.304
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F11791.304
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F11791.304
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.048 Y136.813 Z25.6 F30000
G1 Z25.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42116
G1 F12690.355
G1 X138.643 Y136.218 E.02594
G1 X138.643 Y135.683 E.01649
G1 X137.683 Y136.643 E.04186
G1 X137.148 Y136.643 E.01649
G1 X138.643 Y135.148 E.06517
G1 X138.643 Y134.613 E.01649
G1 X136.613 Y136.643 E.08849
G1 X136.078 Y136.643 E.01649
G1 X138.643 Y134.078 E.11181
G1 X138.643 Y133.544 E.01649
G1 X135.544 Y136.643 E.13512
G1 X135.009 Y136.643 E.01649
G1 X138.643 Y133.009 E.15844
G1 X138.643 Y132.474 E.01649
G1 X134.474 Y136.643 E.18175
G1 X133.939 Y136.643 E.01649
G1 X138.643 Y131.939 E.20507
G1 X138.643 Y131.404 E.01649
G1 X133.404 Y136.643 E.22839
G1 X132.869 Y136.643 E.01649
G1 X138.643 Y130.869 E.2517
G1 X138.643 Y130.334 E.01649
G1 X132.334 Y136.643 E.27502
G1 X131.799 Y136.643 E.01649
G1 X138.643 Y129.799 E.29833
G1 X138.643 Y129.264 E.01649
G1 X131.264 Y136.643 E.32165
G1 X130.729 Y136.643 E.01649
G1 X138.643 Y128.729 E.34497
G1 X138.643 Y128.194 E.01649
G1 X130.194 Y136.643 E.36828
G1 X129.659 Y136.643 E.01649
G1 X138.643 Y127.659 E.3916
G1 X138.643 Y127.125 E.01649
G1 X129.125 Y136.643 E.41491
G1 X128.59 Y136.643 E.01649
G1 X138.643 Y126.59 E.43823
G1 X138.643 Y126.055 E.01649
G1 X128.055 Y136.643 E.46155
G1 X127.52 Y136.643 E.01649
G1 X138.643 Y125.52 E.48486
G1 X138.643 Y124.985 E.01649
G1 X126.985 Y136.643 E.50818
G1 X126.45 Y136.643 E.01649
G1 X138.643 Y124.45 E.53149
G1 X138.643 Y123.915 E.01649
G1 X125.915 Y136.643 E.55481
G1 X125.38 Y136.643 E.01649
G1 X138.643 Y123.38 E.57813
G1 X138.643 Y122.845 E.01649
G1 X124.845 Y136.643 E.60144
G1 X124.31 Y136.643 E.01649
G1 X138.643 Y122.31 E.62476
G1 X138.643 Y121.775 E.01649
G1 X123.775 Y136.643 E.64808
G1 X123.241 Y136.643 E.01649
G1 X138.643 Y121.241 E.67139
G1 X138.643 Y120.706 E.01649
G1 X122.706 Y136.643 E.69471
G1 X122.171 Y136.643 E.01649
G1 X138.643 Y120.171 E.71802
G1 X138.643 Y119.636 E.01649
G1 X121.636 Y136.643 E.74134
G1 X121.101 Y136.643 E.01649
G1 X138.643 Y119.101 E.76466
G1 X138.643 Y118.566 E.01649
G1 X120.566 Y136.643 E.78797
G1 X120.031 Y136.643 E.01649
G1 X138.643 Y118.031 E.81129
G1 X138.643 Y117.496 E.01649
G1 X119.496 Y136.643 E.8346
M73 P95 R0
G1 X118.961 Y136.643 E.01649
G1 X138.643 Y116.961 E.85792
G1 X138.643 Y116.426 E.01649
G1 X118.426 Y136.643 E.88124
G1 X117.891 Y136.643 E.01649
G1 X138.643 Y115.891 E.90455
G1 X138.643 Y115.357 E.01649
G1 X117.357 Y136.643 E.92787
G1 X117.357 Y136.109 E.01649
G1 X138.109 Y115.357 E.90455
G1 X137.574 Y115.357 E.01649
G1 X117.357 Y135.574 E.88123
G1 X117.357 Y135.039 E.01649
G1 X137.039 Y115.357 E.85792
G1 X136.504 Y115.357 E.01649
G1 X117.357 Y134.504 E.8346
G1 X117.357 Y133.969 E.01649
G1 X135.969 Y115.357 E.81129
G1 X135.434 Y115.357 E.01649
G1 X117.357 Y133.434 E.78797
G1 X117.357 Y132.899 E.01649
G1 X134.899 Y115.357 E.76465
G1 X134.364 Y115.357 E.01649
G1 X117.357 Y132.364 E.74134
G1 X117.357 Y131.829 E.01649
G1 X133.829 Y115.357 E.71802
G1 X133.294 Y115.357 E.01649
G1 X117.357 Y131.294 E.69471
G1 X117.357 Y130.759 E.01649
G1 X132.759 Y115.357 E.67139
G1 X132.225 Y115.357 E.01649
G1 X117.357 Y130.225 E.64807
G1 X117.357 Y129.69 E.01649
G1 X131.69 Y115.357 E.62476
G1 X131.155 Y115.357 E.01649
G1 X117.357 Y129.155 E.60144
G1 X117.357 Y128.62 E.01649
G1 X130.62 Y115.357 E.57813
G1 X130.085 Y115.357 E.01649
G1 X117.357 Y128.085 E.55481
G1 X117.357 Y127.55 E.01649
G1 X129.55 Y115.357 E.53149
G1 X129.015 Y115.357 E.01649
G1 X117.357 Y127.015 E.50818
G1 X117.357 Y126.48 E.01649
G1 X128.48 Y115.357 E.48486
G1 X127.945 Y115.357 E.01649
G1 X117.357 Y125.945 E.46155
G1 X117.357 Y125.41 E.01649
G1 X127.41 Y115.357 E.43823
M73 P96 R0
G1 X126.875 Y115.357 E.01649
G1 X117.357 Y124.875 E.41491
G1 X117.357 Y124.34 E.01649
G1 X126.34 Y115.357 E.3916
G1 X125.806 Y115.357 E.01649
G1 X117.357 Y123.806 E.36828
G1 X117.357 Y123.271 E.01649
G1 X125.271 Y115.357 E.34497
G1 X124.736 Y115.357 E.01649
G1 X117.357 Y122.736 E.32165
G1 X117.357 Y122.201 E.01649
G1 X124.201 Y115.357 E.29833
G1 X123.666 Y115.357 E.01649
G1 X117.357 Y121.666 E.27502
G1 X117.357 Y121.131 E.01649
G1 X123.131 Y115.357 E.2517
G1 X122.596 Y115.357 E.01649
G1 X117.357 Y120.596 E.22838
G1 X117.357 Y120.061 E.01649
G1 X122.061 Y115.357 E.20507
G1 X121.526 Y115.357 E.01649
G1 X117.357 Y119.526 E.18175
G1 X117.357 Y118.991 E.01649
G1 X120.991 Y115.357 E.15844
G1 X120.456 Y115.357 E.01649
G1 X117.357 Y118.456 E.13512
G1 X117.357 Y117.922 E.01649
G1 X119.922 Y115.357 E.1118
G1 X119.387 Y115.357 E.01649
G1 X117.357 Y117.387 E.08849
G1 X117.357 Y116.852 E.01649
G1 X118.852 Y115.357 E.06517
G1 X118.317 Y115.357 E.01649
G1 X117.357 Y116.317 E.04186
G1 X117.357 Y115.782 E.01649
G1 X117.952 Y115.187 E.02594
; CHANGE_LAYER
; Z_HEIGHT: 25.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F12690.355
G1 X117.357 Y115.782 E-.31977
G1 X117.357 Y116.317 E-.20327
G1 X117.797 Y115.876 E-.23696
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 127/128
; update layer progress
M73 L127
M991 S0 P126 ;notify layer change
G17
G3 Z25.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X138.977 Y136.977
G1 Z25.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11791.304
G1 X117.023 Y136.977 E.72824
G1 X117.023 Y115.023 E.72824
G1 X138.977 Y115.023 E.72824
G1 X138.977 Y136.917 E.72625
G1 X139.384 Y137.384 F30000
G1 F11791.304
G1 X116.616 Y137.384 E.75524
G1 X116.616 Y114.616 E.75524
G1 X139.384 Y114.616 E.75524
G1 X139.384 Y137.324 E.75325
G1 X139.791 Y137.791 F30000
G1 F11791.304
G1 X116.209 Y137.791 E.78225
G1 X116.209 Y114.209 E.78225
G1 X139.791 Y114.209 E.78225
G1 X139.791 Y137.731 E.78026
G1 X140.198 Y138.198 F30000
G1 F11791.304
G1 X115.802 Y138.198 E.80926
G1 X115.802 Y113.802 E.80926
G1 X140.198 Y113.802 E.80926
G1 X140.198 Y138.138 E.80727
G1 X140.59 Y138.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X115.41 Y138.59 E.77371
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
; WIPE_START
M204 S10000
G1 X138.59 Y138.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.665 Y130.903 Z25.8 F30000
G1 X138.813 Y115.952 Z25.8
G1 Z25.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42116
G1 F12690.355
G1 X138.218 Y115.357 E.02594
G1 X137.683 Y115.357 E.01649
G1 X138.643 Y116.317 E.04186
G1 X138.643 Y116.852 E.01649
G1 X137.148 Y115.357 E.06517
G1 X136.613 Y115.357 E.01649
G1 X138.643 Y117.387 E.08849
G1 X138.643 Y117.922 E.01649
G1 X136.078 Y115.357 E.11181
G1 X135.544 Y115.357 E.01649
G1 X138.643 Y118.456 E.13512
G1 X138.643 Y118.991 E.01649
G1 X135.009 Y115.357 E.15844
G1 X134.474 Y115.357 E.01649
G1 X138.643 Y119.526 E.18175
G1 X138.643 Y120.061 E.01649
G1 X133.939 Y115.357 E.20507
G1 X133.404 Y115.357 E.01649
G1 X138.643 Y120.596 E.22839
G1 X138.643 Y121.131 E.01649
G1 X132.869 Y115.357 E.2517
G1 X132.334 Y115.357 E.01649
G1 X138.643 Y121.666 E.27502
G1 X138.643 Y122.201 E.01649
G1 X131.799 Y115.357 E.29833
G1 X131.264 Y115.357 E.01649
G1 X138.643 Y122.736 E.32165
G1 X138.643 Y123.271 E.01649
G1 X130.729 Y115.357 E.34497
G1 X130.194 Y115.357 E.01649
G1 X138.643 Y123.806 E.36828
G1 X138.643 Y124.341 E.01649
G1 X129.659 Y115.357 E.3916
G1 X129.125 Y115.357 E.01649
G1 X138.643 Y124.875 E.41491
G1 X138.643 Y125.41 E.01649
G1 X128.59 Y115.357 E.43823
G1 X128.055 Y115.357 E.01649
G1 X138.643 Y125.945 E.46155
G1 X138.643 Y126.48 E.01649
G1 X127.52 Y115.357 E.48486
G1 X126.985 Y115.357 E.01649
G1 X138.643 Y127.015 E.50818
G1 X138.643 Y127.55 E.01649
G1 X126.45 Y115.357 E.53149
G1 X125.915 Y115.357 E.01649
G1 X138.643 Y128.085 E.55481
G1 X138.643 Y128.62 E.01649
G1 X125.38 Y115.357 E.57813
G1 X124.845 Y115.357 E.01649
G1 X138.643 Y129.155 E.60144
G1 X138.643 Y129.69 E.01649
G1 X124.31 Y115.357 E.62476
G1 X123.775 Y115.357 E.01649
G1 X138.643 Y130.225 E.64808
G1 X138.643 Y130.759 E.01649
G1 X123.241 Y115.357 E.67139
G1 X122.706 Y115.357 E.01649
G1 X138.643 Y131.294 E.69471
G1 X138.643 Y131.829 E.01649
G1 X122.171 Y115.357 E.71802
G1 X121.636 Y115.357 E.01649
G1 X138.643 Y132.364 E.74134
G1 X138.643 Y132.899 E.01649
G1 X121.101 Y115.357 E.76466
G1 X120.566 Y115.357 E.01649
G1 X138.643 Y133.434 E.78797
G1 X138.643 Y133.969 E.01649
G1 X120.031 Y115.357 E.81129
G1 X119.496 Y115.357 E.01649
G1 X138.643 Y134.504 E.8346
G1 X138.643 Y135.039 E.01649
G1 X118.961 Y115.357 E.85792
G1 X118.426 Y115.357 E.01649
G1 X138.643 Y135.574 E.88124
G1 X138.643 Y136.109 E.01649
G1 X117.891 Y115.357 E.90455
G1 X117.357 Y115.357 E.01649
G1 X138.643 Y136.643 E.92787
G1 X138.109 Y136.643 E.01649
G1 X117.357 Y115.891 E.90455
G1 X117.357 Y116.426 E.01649
G1 X137.574 Y136.643 E.88123
G1 X137.039 Y136.643 E.01649
G1 X117.357 Y116.961 E.85792
G1 X117.357 Y117.496 E.01649
G1 X136.504 Y136.643 E.8346
G1 X135.969 Y136.643 E.01649
G1 X117.357 Y118.031 E.81129
G1 X117.357 Y118.566 E.01649
G1 X135.434 Y136.643 E.78797
G1 X134.899 Y136.643 E.01649
G1 X117.357 Y119.101 E.76465
G1 X117.357 Y119.636 E.01649
G1 X134.364 Y136.643 E.74134
G1 X133.829 Y136.643 E.01649
G1 X117.357 Y120.171 E.71802
G1 X117.357 Y120.706 E.01649
G1 X133.294 Y136.643 E.69471
G1 X132.759 Y136.643 E.01649
G1 X117.357 Y121.241 E.67139
G1 X117.357 Y121.775 E.01649
G1 X132.225 Y136.643 E.64807
G1 X131.69 Y136.643 E.01649
G1 X117.357 Y122.31 E.62476
G1 X117.357 Y122.845 E.01649
G1 X131.155 Y136.643 E.60144
G1 X130.62 Y136.643 E.01649
G1 X117.357 Y123.38 E.57813
G1 X117.357 Y123.915 E.01649
G1 X130.085 Y136.643 E.55481
G1 X129.55 Y136.643 E.01649
G1 X117.357 Y124.45 E.53149
G1 X117.357 Y124.985 E.01649
G1 X129.015 Y136.643 E.50818
G1 X128.48 Y136.643 E.01649
G1 X117.357 Y125.52 E.48486
G1 X117.357 Y126.055 E.01649
G1 X127.945 Y136.643 E.46155
G1 X127.41 Y136.643 E.01649
G1 X117.357 Y126.59 E.43823
G1 X117.357 Y127.125 E.01649
G1 X126.875 Y136.643 E.41491
G1 X126.34 Y136.643 E.01649
G1 X117.357 Y127.66 E.3916
G1 X117.357 Y128.194 E.01649
G1 X125.806 Y136.643 E.36828
G1 X125.271 Y136.643 E.01649
G1 X117.357 Y128.729 E.34497
G1 X117.357 Y129.264 E.01649
G1 X124.736 Y136.643 E.32165
G1 X124.201 Y136.643 E.01649
G1 X117.357 Y129.799 E.29833
G1 X117.357 Y130.334 E.01649
G1 X123.666 Y136.643 E.27502
G1 X123.131 Y136.643 E.01649
G1 X117.357 Y130.869 E.2517
G1 X117.357 Y131.404 E.01649
G1 X122.596 Y136.643 E.22838
G1 X122.061 Y136.643 E.01649
G1 X117.357 Y131.939 E.20507
G1 X117.357 Y132.474 E.01649
G1 X121.526 Y136.643 E.18175
G1 X120.991 Y136.643 E.01649
G1 X117.357 Y133.009 E.15844
G1 X117.357 Y133.544 E.01649
G1 X120.456 Y136.643 E.13512
G1 X119.922 Y136.643 E.01649
G1 X117.357 Y134.078 E.1118
G1 X117.357 Y134.613 E.01649
G1 X119.387 Y136.643 E.08849
G1 X118.852 Y136.643 E.01649
G1 X117.357 Y135.148 E.06517
G1 X117.357 Y135.683 E.01649
G1 X118.317 Y136.643 E.04186
G1 X117.782 Y136.643 E.01649
G1 X117.187 Y136.048 E.02594
; CHANGE_LAYER
; Z_HEIGHT: 25.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F12690.355
G1 X117.782 Y136.643 E-.31977
G1 X118.317 Y136.643 E-.20327
G1 X117.876 Y136.203 E-.23696
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 128/128
; update layer progress
M73 L128
M991 S0 P127 ;notify layer change
G17
G3 Z25.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 117
G1 X140.59 Y138.59
G1 Z25.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X115.41 Y138.59 E.77371
M73 P97 R0
G1 X115.41 Y113.41 E.77371
G1 X140.59 Y113.41 E.77371
G1 X140.59 Y138.53 E.77187
M204 S10000
G1 X140.383 Y137.881 F30000
; FEATURE: Top surface
G1 F12000
M204 S2000
G1 X139.881 Y138.383 E.02182
G1 X139.347 Y138.383
G1 X140.383 Y137.347 E.04499
G1 X140.383 Y136.814
G1 X138.814 Y138.383 E.06816
G1 X138.281 Y138.383
G1 X140.383 Y136.281 E.09134
G1 X140.383 Y135.747
G1 X137.747 Y138.383 E.11451
G1 X137.214 Y138.383
G1 X140.383 Y135.214 E.13768
G1 X140.383 Y134.681
G1 X136.681 Y138.383 E.16085
G1 X136.148 Y138.383
G1 X140.383 Y134.148 E.18403
G1 X140.383 Y133.614
G1 X135.614 Y138.383 E.2072
G1 X135.081 Y138.383
G1 X140.383 Y133.081 E.23037
G1 X140.383 Y132.548
G1 X134.548 Y138.383 E.25355
G1 X134.015 Y138.383
G1 X140.383 Y132.015 E.27672
G1 X140.383 Y131.481
G1 X133.481 Y138.383 E.29989
G1 X132.948 Y138.383
G1 X140.383 Y130.948 E.32306
G1 X140.383 Y130.415
G1 X132.415 Y138.383 E.34624
G1 X131.882 Y138.383
G1 X140.383 Y129.882 E.36941
G1 X140.383 Y129.348
G1 X131.348 Y138.383 E.39258
G1 X130.815 Y138.383
G1 X140.383 Y128.815 E.41575
G1 X140.383 Y128.282
G1 X130.282 Y138.383 E.43893
G1 X129.749 Y138.383
G1 X140.383 Y127.749 E.4621
G1 X140.383 Y127.215
G1 X129.215 Y138.383 E.48527
G1 X128.682 Y138.383
G1 X140.383 Y126.682 E.50844
G1 X140.383 Y126.149
G1 X128.149 Y138.383 E.53162
G1 X127.616 Y138.383
G1 X140.383 Y125.616 E.55479
G1 X140.383 Y125.082
G1 X127.082 Y138.383 E.57796
G1 X126.549 Y138.383
G1 X140.383 Y124.549 E.60113
G1 X140.383 Y124.016
G1 X126.016 Y138.383 E.62431
G1 X125.483 Y138.383
G1 X140.383 Y123.483 E.64748
G1 X140.383 Y122.949
G1 X124.949 Y138.383 E.67065
G1 X124.416 Y138.383
G1 X140.383 Y122.416 E.69382
G1 X140.383 Y121.883
G1 X123.883 Y138.383 E.717
G1 X123.35 Y138.383
G1 X140.383 Y121.35 E.74017
G1 X140.383 Y120.816
G1 X122.816 Y138.383 E.76334
G1 X122.283 Y138.383
G1 X140.383 Y120.283 E.78652
G1 X140.383 Y119.75
G1 X121.75 Y138.383 E.80969
G1 X121.217 Y138.383
G1 X140.383 Y119.217 E.83286
G1 X140.383 Y118.683
G1 X120.683 Y138.383 E.85603
G1 X120.15 Y138.383
G1 X140.383 Y118.15 E.87921
G1 X140.383 Y117.617
G1 X119.617 Y138.383 E.90238
G1 X119.083 Y138.383
G1 X140.383 Y117.083 E.92555
G1 X140.383 Y116.55
G1 X118.55 Y138.383 E.94872
G1 X118.017 Y138.383
G1 X140.383 Y116.017 E.9719
G1 X140.383 Y115.484
G1 X117.484 Y138.383 E.99507
G1 X116.95 Y138.383
G1 X140.383 Y114.95 E1.01824
G1 X140.383 Y114.417
G1 X116.417 Y138.383 E1.04141
G1 X115.884 Y138.383
G1 X140.383 Y113.884 E1.06459
G1 X140.116 Y113.617
G1 X115.617 Y138.116 E1.06458
G1 X115.617 Y137.583
G1 X139.583 Y113.617 E1.04141
G1 X139.049 Y113.617
G1 X115.617 Y137.049 E1.01824
G1 X115.617 Y136.516
G1 X138.516 Y113.617 E.99506
G1 X137.983 Y113.617
G1 X115.617 Y135.983 E.97189
G1 X115.617 Y135.45
G1 X137.45 Y113.617 E.94872
G1 X136.916 Y113.617
G1 X115.617 Y134.916 E.92555
G1 X115.617 Y134.383
G1 X136.383 Y113.617 E.90237
G1 X135.85 Y113.617
G1 X115.617 Y133.85 E.8792
G1 X115.617 Y133.317
G1 X135.317 Y113.617 E.85603
G1 X134.783 Y113.617
G1 X115.617 Y132.783 E.83286
G1 X115.617 Y132.25
G1 X134.25 Y113.617 E.80968
G1 X133.717 Y113.617
G1 X115.617 Y131.717 E.78651
G1 X115.617 Y131.184
G1 X133.184 Y113.617 E.76334
G1 X132.65 Y113.617
G1 X115.617 Y130.65 E.74016
G1 X115.617 Y130.117
G1 X132.117 Y113.617 E.71699
G1 X131.584 Y113.617
G1 X115.617 Y129.584 E.69382
G1 X115.617 Y129.051
G1 X131.051 Y113.617 E.67065
G1 X130.517 Y113.617
G1 X115.617 Y128.517 E.64747
G1 X115.617 Y127.984
G1 X129.984 Y113.617 E.6243
G1 X129.451 Y113.617
G1 X115.617 Y127.451 E.60113
G1 X115.617 Y126.918
G1 X128.918 Y113.617 E.57796
G1 X128.384 Y113.617
G1 X115.617 Y126.384 E.55478
G1 X115.617 Y125.851
G1 X127.851 Y113.617 E.53161
G1 X127.318 Y113.617
G1 X115.617 Y125.318 E.50844
G1 X115.617 Y124.784
G1 X126.784 Y113.617 E.48527
G1 X126.251 Y113.617
G1 X115.617 Y124.251 E.46209
G1 X115.617 Y123.718
G1 X125.718 Y113.617 E.43892
G1 X125.185 Y113.617
G1 X115.617 Y123.185 E.41575
G1 X115.617 Y122.651
G1 X124.651 Y113.617 E.39258
G1 X124.118 Y113.617
G1 X115.617 Y122.118 E.3694
G1 X115.617 Y121.585
G1 X123.585 Y113.617 E.34623
G1 X123.052 Y113.617
G1 X115.617 Y121.052 E.32306
G1 X115.617 Y120.518
G1 X122.518 Y113.617 E.29988
G1 X121.985 Y113.617
G1 X115.617 Y119.985 E.27671
G1 X115.617 Y119.452
G1 X121.452 Y113.617 E.25354
G1 X120.919 Y113.617
G1 X115.617 Y118.919 E.23037
M73 P98 R0
G1 X115.617 Y118.385
G1 X120.385 Y113.617 E.20719
G1 X119.852 Y113.617
G1 X115.617 Y117.852 E.18402
G1 X115.617 Y117.319
G1 X119.319 Y113.617 E.16085
G1 X118.786 Y113.617
G1 X115.617 Y116.786 E.13768
G1 X115.617 Y116.252
G1 X118.252 Y113.617 E.1145
G1 X117.719 Y113.617
G1 X115.617 Y115.719 E.09133
G1 X115.617 Y115.186
G1 X117.186 Y113.617 E.06816
G1 X116.653 Y113.617
G1 X115.617 Y114.653 E.04499
G1 X115.617 Y114.119
G1 X116.119 Y113.617 E.02181
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F12000
M204 S10000
G1 X115.617 Y114.119 E-.26976
G1 X115.617 Y114.653 E-.20264
G1 X116.153 Y114.117 E-.2876
; WIPE_END
G1 E-.04 F1800
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20240402 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z26.1 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M141 S0 ; turn off chamber 
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z125.6 F600
    G1 Z123.6

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M960 S5 P0 ; turn off logo lamp

M73 P100 R0
; EXECUTABLE_BLOCK_END

