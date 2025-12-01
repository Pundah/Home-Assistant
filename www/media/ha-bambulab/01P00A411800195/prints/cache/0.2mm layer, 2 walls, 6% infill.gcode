; HEADER_BLOCK_START
; BambuStudio 02.04.00.70
; model printing time: 42m 3s; total estimated time: 49m 17s
; total layer number: 75
; total filament length [mm] : 8302.27
; total filament volume [cm^3] : 19969.30
; total filament weight [g] : 25.36
; filament_density: 1.27
; filament_diameter: 1.75
; max_z_height: 15.00
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 0
; apply_scarf_seam_on_circles = 1
; apply_top_surface_compensation = 0
; auto_disable_filter_on_overheat = 0
; auxiliary_fan = 1
; avoid_crossing_wall_includes_support = 0
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
; change_filament_gcode = ;=P1S 20251031=\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{else}\nM620.11 S0\n{endif}\nM400\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\n\n{if next_extruder < 255}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == "PETG"}\nM109 S260\n{elsif filament_type[next_extruder] == "PVA"}\nM109 S210\n{else}\nM109 S{flush_temperatures[next_extruder]}\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_fan_the_first_x_layers = 3
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 0
; cool_plate_temp_initial_layer = 0
; cooling_filter_enabled = 0
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL P1S 0.4 nozzle"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50
; different_settings_to_system = skeleton_infill_density;skin_infill_density;sparse_infill_density;top_shell_layers;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0.15
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 0
; enable_support = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 70
; eng_plate_temp_initial_layer = 70
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 33
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 34
; extruder_clearance_max_radius = 68
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats = Standard#1
; extruder_offset = 0x2
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard,Direct Drive High Flow"
; fan_cooling_layer_time = 30
; fan_direction = left
; fan_max_speed = 90
; fan_min_speed = 40
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 300
; filament_change_length = 10
; filament_change_length_nc = 10
; filament_colour = #F330F9
; filament_colour_type = 0
; filament_cooling_before_tower = 10
; filament_cost = 30
; filament_density = 1.27
; filament_diameter = 1.75
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.95
; filament_flush_temp = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFG99
; filament_is_support = 0
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 12
; filament_minimal_purge_on_wipe_tower = 15
; filament_multi_colour = #F330F9
; filament_notes = 
; filament_nozzle_map = 0
; filament_pre_cooling_temperature = 0
; filament_pre_cooling_temperature_nc = 0
; filament_prime_volume = 45
; filament_prime_volume_nc = 60
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_travel_time_nc = 0
; filament_ramming_volumetric_speed = -1
; filament_ramming_volumetric_speed_nc = -1
; filament_retract_length_nc = 14
; filament_scarf_gap = 0%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Generic PETG"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PETG
; filament_velocity_adaptation_factor = 1
; filament_vendor = Generic
; filament_volume_map = 0
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0
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
; group_algo_with_time = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; host_type = octoprint
; hot_plate_temp = 70
; hot_plate_temp_initial_layer = 70
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
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
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0
; machine_end_gcode = ;===== date: 20230428 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of "timelapse_record_flag"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n
; machine_hotend_change_time = 0
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
; machine_min_extruding_rate = 0
; machine_min_travel_rate = 0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: P1S-0.4 ========================\n;===== date: 20251031 =====================\n;===== turn on the HB fan & MC board fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\nM710 A1 S255 ;turn on MC fan by default(P1S)\n;===== reset machine status =================\nM290 X40 Y40 Z2.6666666\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action:54\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_extruder]A\nM620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== fmech mode fast check============================\n\n\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature_initial_layer[initial_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\n
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
; no_slow_down_for_cooling_on_outwalls = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.2
; nozzle_temperature = 255
; nozzle_temperature_initial_layer = 255
; nozzle_temperature_range_high = 270
; nozzle_temperature_range_low = 220
; nozzle_type = stainless_steel
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
; overhang_fan_speed = 90
; overhang_fan_threshold = 10%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
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
; prime_volume_mode = Default
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
; printer_model = Bambu Lab P1S
; printer_notes = 
; printer_settings_id = Bambu Lab P1S 0.4 nozzle
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
; raft_first_layer_expansion = -1
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
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 6%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 6%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 12
; slow_down_min_speed = 20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 150
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 6%
; sparse_infill_filament = 0
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 70
; supertack_plate_temp_initial_layer = 70
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_cooling_filter = 0
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
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 70
; template_custom_gcode = 
; textured_plate_temp = 70
; textured_plate_temp_initial_layer = 70
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;========Date 20250206========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\nM1004 S5 P1  ; external shutter\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; SKIPPABLE_END
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 3
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 165
; wipe_tower_y = 216.972
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R49
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: P1S-0.4 ========================
;===== date: 20251031 =====================
;===== turn on the HB fan & MC board fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
M710 A1 S255 ;turn on MC fan by default(P1S)
;===== reset machine status =================
M290 X40 Y40 Z2.6666666
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

;===== heatbed preheat ====================
M1002 gcode_claim_action:54
M140 S70 ;set bed temp
M190 S70 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S255 ;set extruder temp
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
    M109 S255
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A
M620.1 E F299.339 T270


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
M73 P3 R47
G1 E50 F200
M400
M104 S255
G92 E0
M73 P11 R43
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S235 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P12 R43
G1 E-0.5 F300

M73 P12 R42
G1 X70 F9000
G1 X76 F15000
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
M73 P13 R42
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S235
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
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X16.6681 Y29.8329 I169.171 J218.738
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

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S255 ; set extrude temp earlier, to reduce wait time

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
G1 F30000
G1 X230 Y15
G28 X ; re-home XY
;===== fmech mode fast check============================


;===== nozzle load line ===============================
M975 S1
G90
M83
T1000
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S255
G1 Z0.2
G0 E2 F300
G0 X240 E15 F4800
G0 Y11 E0.700 F1200
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F4800
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.04 ; for Textured PEI Plate

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S180


;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/75
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
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.163 Y133.703
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X120.805 Y238.062 E4.87436
G1 X113.486 Y244.092 E.34241
G1 X26.435 Y138.03 E4.95419
G1 X20.6 Y130.869 E.3335
G1 X28.291 Y124.495 E.36066
G1 X142.468 Y30.445 E5.34098
G1 X184.634 Y81.827 E2.39994
G1 X177.47 Y87.73 E.33515
G1 X142.579 Y45.213 E1.98585
G1 X35.21 Y133.665 E5.02275
M204 S6000
G1 X35.806 Y133.766 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X121.448 Y238.125 E4.87436
G1 X113.423 Y244.736 E.37542
G1 X26.082 Y138.32 E4.9707
M73 P14 R42
G1 X19.959 Y130.807 E.34995
G1 X28 Y124.143 E.37704
G1 X142.531 Y29.801 E5.35755
G1 X185.277 Y81.89 E2.43295
G1 X177.407 Y88.374 E.36816
G1 X142.516 Y45.857 E1.98585
G1 X35.853 Y133.728 E4.98975
; WIPE_START
G1 X37.121 Y135.274 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X42.535 Y129.895 Z.6 F30000
G1 X141.929 Y31.125 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50071
G1 F6300
M204 S500
G1 X145.241 Y34.437 E.16936
G1 X148.203 Y38.047 E.16886
G1 X141.721 Y31.564 E.33154
G1 X141.366 Y31.856 E.01663
G1 X151.166 Y41.656 E.50119
G1 X154.128 Y45.266 E.16886
G1 X141.011 Y32.149 E.67083
G1 X140.656 Y32.441 E.01663
G1 X157.09 Y48.876 E.84048
G1 X160.052 Y52.485 E.16886
G1 X140.301 Y32.734 E1.01013
G1 X139.946 Y33.026 E.01663
G1 X163.015 Y56.095 E1.17978
G1 X165.977 Y59.705 E.16886
G1 X139.591 Y33.318 E1.34942
G1 X139.236 Y33.611 E.01663
G1 X168.939 Y63.314 E1.51907
G1 X171.901 Y66.924 E.16886
G1 X138.881 Y33.903 E1.68872
G1 X138.526 Y34.196 E.01663
G1 X174.864 Y70.534 E1.85837
G1 X177.826 Y74.143 E.16886
G1 X138.171 Y34.488 E2.02801
G1 X137.816 Y34.78 E.01663
M73 P14 R41
G1 X180.788 Y77.753 E2.19766
G1 X183.751 Y81.363 E.16886
G1 X137.461 Y35.073 E2.36731
G1 X137.106 Y35.365 E.01663
M73 P15 R41
G1 X183.774 Y82.033 E2.38664
G1 X183.419 Y82.326 E.01663
G1 X136.751 Y35.658 E2.38664
G1 X136.396 Y35.95 E.01663
G1 X183.064 Y82.618 E2.38665
G1 X182.709 Y82.911 E.01663
G1 X136.041 Y36.243 E2.38665
G1 X135.686 Y36.535 E.01663
G1 X182.354 Y83.203 E2.38665
G1 X181.999 Y83.495 E.01663
G1 X135.331 Y36.827 E2.38665
G1 X134.976 Y37.12 E.01663
G1 X181.644 Y83.788 E2.38665
G1 X181.289 Y84.08 E.01663
G1 X146.103 Y48.894 E1.79946
G1 X149.065 Y52.504 E.16886
G1 X180.934 Y84.373 E1.62981
G1 X180.579 Y84.665 E.01663
G1 X152.027 Y56.113 E1.46017
G1 X154.989 Y59.723 E.16886
G1 X180.224 Y84.958 E1.29052
G1 X179.869 Y85.25 E.01663
G1 X157.951 Y63.333 E1.12088
G1 X160.914 Y66.942 E.16886
G1 X179.514 Y85.542 E.95123
G1 X179.159 Y85.835 E.01663
G1 X163.876 Y70.552 E.78159
G1 X166.838 Y74.162 E.16886
G1 X178.804 Y86.127 E.61194
G1 X178.449 Y86.42 E.01663
G1 X169.8 Y77.771 E.4423
G1 X172.763 Y81.381 E.16886
G1 X178.094 Y86.712 E.27265
G1 X177.739 Y87.005 E.01663
G1 X174.241 Y83.507 E.17887
; WIPE_START
G1 X175.655 Y84.921 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X170.756 Y79.069 Z.6 F30000
G1 X142.363 Y45.154 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X134.621 Y37.412 E.39593
G1 X134.266 Y37.705 E.01663
G1 X141.862 Y45.301 E.38846
G1 X141.507 Y45.593 E.01663
G1 X133.911 Y37.997 E.38846
G1 X133.556 Y38.29 E.01663
G1 X141.152 Y45.885 E.38846
G1 X140.797 Y46.178 E.01663
G1 X133.201 Y38.582 E.38846
G1 X132.846 Y38.874 E.01663
G1 X140.442 Y46.47 E.38846
G1 X140.087 Y46.763 E.01663
G1 X132.491 Y39.167 E.38846
M73 P16 R41
G1 X132.136 Y39.459 E.01663
G1 X139.732 Y47.055 E.38846
G1 X139.377 Y47.348 E.01663
G1 X131.781 Y39.752 E.38846
G1 X131.426 Y40.044 E.01663
G1 X139.022 Y47.64 E.38847
G1 X138.667 Y47.932 E.01663
G1 X131.071 Y40.336 E.38847
G1 X130.716 Y40.629 E.01663
G1 X138.312 Y48.225 E.38847
G1 X137.957 Y48.517 E.01663
G1 X130.361 Y40.921 E.38847
G1 X130.006 Y41.214 E.01663
G1 X137.602 Y48.81 E.38847
G1 X137.247 Y49.102 E.01663
G1 X129.651 Y41.506 E.38847
G1 X129.296 Y41.799 E.01663
G1 X136.892 Y49.395 E.38847
G1 X136.537 Y49.687 E.01663
G1 X128.941 Y42.091 E.38847
G1 X128.586 Y42.383 E.01663
G1 X136.182 Y49.979 E.38847
G1 X135.827 Y50.272 E.01663
G1 X128.231 Y42.676 E.38847
G1 X127.876 Y42.968 E.01663
G1 X135.472 Y50.564 E.38847
G1 X135.117 Y50.857 E.01663
G1 X127.521 Y43.261 E.38847
G1 X127.166 Y43.553 E.01663
G1 X134.762 Y51.149 E.38848
G1 X134.407 Y51.442 E.01663
G1 X126.811 Y43.845 E.38848
G1 X126.456 Y44.138 E.01663
G1 X134.052 Y51.734 E.38848
G1 X133.697 Y52.027 E.01663
G1 X126.101 Y44.43 E.38848
G1 X125.746 Y44.723 E.01663
G1 X133.342 Y52.319 E.38848
G1 X132.987 Y52.611 E.01663
G1 X125.391 Y45.015 E.38848
G1 X125.036 Y45.308 E.01663
G1 X132.632 Y52.904 E.38848
G1 X132.277 Y53.196 E.01663
G1 X124.681 Y45.6 E.38848
G1 X124.326 Y45.892 E.01663
G1 X131.922 Y53.489 E.38848
G1 X131.567 Y53.781 E.01663
G1 X123.971 Y46.185 E.38848
G1 X123.616 Y46.477 E.01663
G1 X131.212 Y54.074 E.38848
G1 X130.857 Y54.366 E.01663
G1 X123.261 Y46.77 E.38849
G1 X122.906 Y47.062 E.01663
G1 X130.502 Y54.658 E.38849
G1 X130.147 Y54.951 E.01663
G1 X122.551 Y47.354 E.38849
G1 X122.196 Y47.647 E.01663
G1 X129.792 Y55.243 E.38849
G1 X129.437 Y55.536 E.01663
G1 X121.841 Y47.939 E.38849
G1 X121.486 Y48.232 E.01663
G1 X129.082 Y55.828 E.38849
G1 X128.727 Y56.121 E.01663
G1 X121.131 Y48.524 E.38849
G1 X120.776 Y48.817 E.01663
G1 X128.372 Y56.413 E.38849
G1 X128.017 Y56.705 E.01663
G1 X120.421 Y49.109 E.38849
G1 X120.066 Y49.401 E.01663
G1 X127.662 Y56.998 E.38849
G1 X127.307 Y57.29 E.01663
G1 X119.711 Y49.694 E.38849
G1 X119.356 Y49.986 E.01663
G1 X126.952 Y57.583 E.3885
G1 X126.597 Y57.875 E.01663
G1 X119.001 Y50.279 E.3885
G1 X118.646 Y50.571 E.01663
G1 X126.242 Y58.168 E.3885
G1 X125.888 Y58.46 E.01663
G1 X118.291 Y50.863 E.3885
G1 X117.936 Y51.156 E.01663
G1 X125.533 Y58.753 E.3885
G1 X125.178 Y59.045 E.01663
G1 X117.581 Y51.448 E.3885
G1 X117.226 Y51.741 E.01663
G1 X124.823 Y59.337 E.3885
G1 X124.468 Y59.63 E.01663
G1 X116.871 Y52.033 E.3885
G1 X116.516 Y52.326 E.01663
G1 X124.113 Y59.922 E.3885
G1 X123.758 Y60.215 E.01663
G1 X116.161 Y52.618 E.3885
G1 X115.806 Y52.91 E.01663
G1 X123.403 Y60.507 E.3885
G1 X123.048 Y60.8 E.01663
G1 X115.451 Y53.203 E.38851
G1 X115.096 Y53.495 E.01663
G1 X122.693 Y61.092 E.38851
G1 X122.338 Y61.384 E.01663
G1 X114.741 Y53.788 E.38851
G1 X114.386 Y54.08 E.01663
G1 X121.983 Y61.677 E.38851
G1 X121.628 Y61.969 E.01663
G1 X114.031 Y54.373 E.38851
G1 X113.676 Y54.665 E.01663
G1 X121.273 Y62.262 E.38851
G1 X120.918 Y62.554 E.01663
G1 X113.321 Y54.957 E.38851
G1 X112.966 Y55.25 E.01663
G1 X120.563 Y62.847 E.38851
G1 X120.208 Y63.139 E.01663
G1 X112.611 Y55.542 E.38851
G1 X112.256 Y55.835 E.01663
G1 X119.853 Y63.431 E.38851
G1 X119.498 Y63.724 E.01663
G1 X111.901 Y56.127 E.38851
G1 X111.546 Y56.419 E.01663
G1 X119.143 Y64.016 E.38851
G1 X118.788 Y64.309 E.01663
G1 X111.191 Y56.712 E.38852
G1 X110.836 Y57.004 E.01663
G1 X118.433 Y64.601 E.38852
G1 X118.078 Y64.894 E.01663
G1 X110.481 Y57.297 E.38852
G1 X110.126 Y57.589 E.01663
G1 X117.723 Y65.186 E.38852
G1 X117.368 Y65.479 E.01663
G1 X109.771 Y57.882 E.38852
G1 X109.416 Y58.174 E.01663
G1 X117.013 Y65.771 E.38852
G1 X116.658 Y66.063 E.01663
G1 X109.061 Y58.466 E.38852
G1 X108.706 Y58.759 E.01663
G1 X116.303 Y66.356 E.38852
G1 X115.948 Y66.648 E.01663
G1 X108.351 Y59.051 E.38852
G1 X107.996 Y59.344 E.01663
G1 X115.593 Y66.941 E.38852
G1 X115.238 Y67.233 E.01663
G1 X107.641 Y59.636 E.38852
M73 P16 R40
G1 X107.286 Y59.928 E.01663
G1 X114.883 Y67.526 E.38853
G1 X114.528 Y67.818 E.01663
G1 X106.931 Y60.221 E.38853
G1 X106.576 Y60.513 E.01663
G1 X114.173 Y68.11 E.38853
G1 X113.818 Y68.403 E.01663
G1 X106.221 Y60.806 E.38853
G1 X105.866 Y61.098 E.01663
G1 X113.463 Y68.695 E.38853
G1 X113.108 Y68.988 E.01663
G1 X105.511 Y61.391 E.38853
G1 X105.156 Y61.683 E.01663
G1 X112.753 Y69.28 E.38853
G1 X112.398 Y69.573 E.01663
G1 X104.801 Y61.975 E.38853
G1 X104.446 Y62.268 E.01663
G1 X112.043 Y69.865 E.38853
G1 X111.688 Y70.158 E.01663
G1 X104.091 Y62.56 E.38853
G1 X103.736 Y62.853 E.01663
G1 X111.333 Y70.45 E.38853
G1 X110.978 Y70.742 E.01663
G1 X103.381 Y63.145 E.38854
G1 X103.026 Y63.437 E.01663
G1 X110.623 Y71.035 E.38854
G1 X110.269 Y71.327 E.01663
G1 X102.671 Y63.73 E.38854
G1 X102.316 Y64.022 E.01663
G1 X109.914 Y71.62 E.38854
G1 X109.559 Y71.912 E.01663
G1 X101.961 Y64.315 E.38854
G1 X101.606 Y64.607 E.01663
G1 X109.204 Y72.205 E.38854
G1 X108.849 Y72.497 E.01663
G1 X101.251 Y64.9 E.38854
M73 P17 R40
G1 X100.896 Y65.192 E.01663
G1 X108.494 Y72.789 E.38854
G1 X108.139 Y73.082 E.01663
G1 X100.541 Y65.484 E.38854
G1 X100.186 Y65.777 E.01663
G1 X107.784 Y73.374 E.38854
G1 X107.429 Y73.667 E.01663
G1 X99.831 Y66.069 E.38854
G1 X99.476 Y66.362 E.01663
G1 X107.074 Y73.959 E.38854
G1 X106.719 Y74.252 E.01663
G1 X99.121 Y66.654 E.38855
G1 X98.766 Y66.946 E.01663
G1 X106.364 Y74.544 E.38855
G1 X106.009 Y74.836 E.01663
G1 X98.411 Y67.239 E.38855
G1 X98.056 Y67.531 E.01663
G1 X105.654 Y75.129 E.38855
G1 X105.299 Y75.421 E.01663
G1 X97.701 Y67.824 E.38855
G1 X97.346 Y68.116 E.01663
G1 X104.944 Y75.714 E.38855
G1 X104.589 Y76.006 E.01663
G1 X96.991 Y68.409 E.38855
G1 X96.636 Y68.701 E.01663
G1 X104.234 Y76.299 E.38855
G1 X103.879 Y76.591 E.01663
G1 X96.281 Y68.993 E.38855
G1 X95.926 Y69.286 E.01663
G1 X103.524 Y76.884 E.38855
G1 X103.169 Y77.176 E.01663
G1 X95.571 Y69.578 E.38855
G1 X95.216 Y69.871 E.01663
G1 X102.814 Y77.468 E.38856
G1 X102.459 Y77.761 E.01663
G1 X94.861 Y70.163 E.38856
G1 X94.506 Y70.455 E.01663
G1 X102.104 Y78.053 E.38856
G1 X101.749 Y78.346 E.01663
G1 X94.151 Y70.748 E.38856
G1 X93.796 Y71.04 E.01663
G1 X101.394 Y78.638 E.38856
G1 X101.039 Y78.931 E.01663
G1 X93.441 Y71.333 E.38856
G1 X93.086 Y71.625 E.01663
G1 X100.684 Y79.223 E.38856
G1 X100.329 Y79.515 E.01663
G1 X92.731 Y71.918 E.38856
G1 X92.376 Y72.21 E.01663
G1 X99.974 Y79.808 E.38856
G1 X99.619 Y80.1 E.01663
G1 X92.021 Y72.502 E.38856
G1 X91.666 Y72.795 E.01663
G1 X99.264 Y80.393 E.38856
G1 X98.909 Y80.685 E.01663
G1 X91.311 Y73.087 E.38857
G1 X90.956 Y73.38 E.01663
G1 X98.554 Y80.978 E.38857
G1 X98.199 Y81.27 E.01663
G1 X90.601 Y73.672 E.38857
G1 X90.246 Y73.965 E.01663
G1 X97.844 Y81.563 E.38857
G1 X97.489 Y81.855 E.01663
G1 X89.891 Y74.257 E.38857
G1 X89.536 Y74.549 E.01663
G1 X97.134 Y82.147 E.38857
G1 X96.779 Y82.44 E.01663
G1 X89.181 Y74.842 E.38857
G1 X88.826 Y75.134 E.01663
G1 X96.424 Y82.732 E.38857
G1 X96.069 Y83.025 E.01663
G1 X88.471 Y75.427 E.38857
G1 X88.116 Y75.719 E.01663
G1 X95.714 Y83.317 E.38857
G1 X95.359 Y83.61 E.01663
G1 X87.761 Y76.011 E.38857
G1 X87.406 Y76.304 E.01663
G1 X95.004 Y83.902 E.38858
G1 X94.65 Y84.194 E.01663
G1 X87.051 Y76.596 E.38858
G1 X86.696 Y76.889 E.01663
G1 X94.295 Y84.487 E.38858
G1 X93.94 Y84.779 E.01663
G1 X86.341 Y77.181 E.38858
G1 X85.986 Y77.474 E.01663
G1 X93.585 Y85.072 E.38858
G1 X93.23 Y85.364 E.01663
G1 X85.631 Y77.766 E.38858
G1 X85.276 Y78.058 E.01663
G1 X92.875 Y85.657 E.38858
G1 X92.52 Y85.949 E.01663
G1 X84.921 Y78.351 E.38858
G1 X84.566 Y78.643 E.01663
G1 X92.165 Y86.241 E.38858
G1 X91.81 Y86.534 E.01663
G1 X84.211 Y78.936 E.38858
G1 X83.856 Y79.228 E.01663
G1 X91.455 Y86.826 E.38858
G1 X91.1 Y87.119 E.01663
G1 X83.501 Y79.52 E.38858
G1 X83.146 Y79.813 E.01663
G1 X90.745 Y87.411 E.38859
G1 X90.39 Y87.704 E.01663
G1 X82.791 Y80.105 E.38859
G1 X82.436 Y80.398 E.01663
G1 X90.035 Y87.996 E.38859
G1 X89.68 Y88.289 E.01663
G1 X82.081 Y80.69 E.38859
G1 X81.726 Y80.983 E.01663
G1 X89.325 Y88.581 E.38859
G1 X88.97 Y88.873 E.01663
G1 X81.371 Y81.275 E.38859
G1 X81.016 Y81.567 E.01663
G1 X88.615 Y89.166 E.38859
G1 X88.26 Y89.458 E.01663
G1 X80.661 Y81.86 E.38859
G1 X80.306 Y82.152 E.01663
G1 X87.905 Y89.751 E.38859
G1 X87.55 Y90.043 E.01663
G1 X79.951 Y82.445 E.38859
G1 X79.596 Y82.737 E.01663
G1 X87.195 Y90.336 E.38859
G1 X86.84 Y90.628 E.01663
G1 X79.241 Y83.029 E.3886
G1 X78.886 Y83.322 E.01663
G1 X86.485 Y90.92 E.3886
G1 X86.13 Y91.213 E.01663
G1 X78.531 Y83.614 E.3886
G1 X78.177 Y83.907 E.01663
G1 X85.775 Y91.505 E.3886
G1 X85.42 Y91.798 E.01663
G1 X77.822 Y84.199 E.3886
G1 X77.467 Y84.492 E.01663
G1 X85.065 Y92.09 E.3886
G1 X84.71 Y92.383 E.01663
G1 X77.112 Y84.784 E.3886
G1 X76.757 Y85.076 E.01663
G1 X84.355 Y92.675 E.3886
G1 X84 Y92.967 E.01663
G1 X76.402 Y85.369 E.3886
G1 X76.047 Y85.661 E.01663
G1 X83.645 Y93.26 E.3886
G1 X83.29 Y93.552 E.01663
G1 X75.692 Y85.954 E.3886
G1 X75.337 Y86.246 E.01663
G1 X82.935 Y93.845 E.38861
G1 X82.58 Y94.137 E.01663
G1 X74.982 Y86.539 E.38861
G1 X74.627 Y86.831 E.01663
G1 X82.225 Y94.43 E.38861
G1 X81.87 Y94.722 E.01663
G1 X74.272 Y87.123 E.38861
G1 X73.917 Y87.416 E.01663
G1 X81.515 Y95.015 E.38861
G1 X81.16 Y95.307 E.01663
G1 X73.562 Y87.708 E.38861
G1 X73.207 Y88.001 E.01663
G1 X80.805 Y95.599 E.38861
G1 X80.45 Y95.892 E.01663
G1 X72.852 Y88.293 E.38861
G1 X72.497 Y88.585 E.01663
G1 X80.095 Y96.184 E.38861
G1 X79.74 Y96.477 E.01663
G1 X72.142 Y88.878 E.38861
G1 X71.787 Y89.17 E.01663
G1 X79.385 Y96.769 E.38861
G1 X79.031 Y97.062 E.01663
G1 X71.432 Y89.463 E.38862
G1 X71.077 Y89.755 E.01663
G1 X78.676 Y97.354 E.38862
G1 X78.321 Y97.646 E.01663
G1 X70.722 Y90.048 E.38862
G1 X70.367 Y90.34 E.01663
G1 X77.966 Y97.939 E.38862
G1 X77.611 Y98.231 E.01663
G1 X70.012 Y90.632 E.38862
G1 X69.657 Y90.925 E.01663
G1 X77.256 Y98.524 E.38862
G1 X76.901 Y98.816 E.01663
G1 X69.302 Y91.217 E.38862
G1 X68.947 Y91.51 E.01663
G1 X76.546 Y99.109 E.38862
G1 X76.191 Y99.401 E.01663
G1 X68.592 Y91.802 E.38862
G1 X68.237 Y92.094 E.01663
G1 X75.836 Y99.694 E.38862
G1 X75.481 Y99.986 E.01663
G1 X67.882 Y92.387 E.38862
G1 X67.527 Y92.679 E.01663
G1 X75.126 Y100.278 E.38862
G1 X74.771 Y100.571 E.01663
G1 X67.172 Y92.972 E.38863
G1 X66.817 Y93.264 E.01663
G1 X74.416 Y100.863 E.38863
G1 X74.061 Y101.156 E.01663
G1 X66.462 Y93.557 E.38863
G1 X66.107 Y93.849 E.01663
G1 X73.706 Y101.448 E.38863
G1 X73.351 Y101.741 E.01663
G1 X65.752 Y94.141 E.38863
G1 X65.397 Y94.434 E.01663
M73 P18 R40
G1 X72.996 Y102.033 E.38863
G1 X72.641 Y102.325 E.01663
G1 X65.042 Y94.726 E.38863
G1 X64.687 Y95.019 E.01663
G1 X72.286 Y102.618 E.38863
G1 X71.931 Y102.91 E.01663
G1 X64.332 Y95.311 E.38863
G1 X63.977 Y95.603 E.01663
G1 X71.576 Y103.203 E.38863
G1 X71.221 Y103.495 E.01663
G1 X63.622 Y95.896 E.38863
G1 X63.267 Y96.188 E.01663
G1 X70.866 Y103.788 E.38864
G1 X70.511 Y104.08 E.01663
G1 X62.912 Y96.481 E.38864
G1 X62.557 Y96.773 E.01663
G1 X70.156 Y104.372 E.38864
G1 X69.801 Y104.665 E.01663
G1 X62.202 Y97.066 E.38864
G1 X61.847 Y97.358 E.01663
G1 X69.446 Y104.957 E.38864
G1 X69.091 Y105.25 E.01663
G1 X61.492 Y97.65 E.38864
G1 X61.137 Y97.943 E.01663
G1 X68.736 Y105.542 E.38864
G1 X68.381 Y105.835 E.01663
G1 X60.782 Y98.235 E.38864
G1 X60.427 Y98.528 E.01663
G1 X68.026 Y106.127 E.38864
G1 X67.671 Y106.42 E.01663
G1 X60.072 Y98.82 E.38864
G1 X59.717 Y99.112 E.01663
G1 X67.316 Y106.712 E.38864
G1 X66.961 Y107.004 E.01663
G1 X59.362 Y99.405 E.38865
G1 X59.007 Y99.697 E.01663
G1 X66.606 Y107.297 E.38865
G1 X66.251 Y107.589 E.01663
G1 X58.652 Y99.99 E.38865
G1 X58.297 Y100.282 E.01663
G1 X65.896 Y107.882 E.38865
G1 X65.541 Y108.174 E.01663
G1 X57.942 Y100.575 E.38865
G1 X57.587 Y100.867 E.01663
G1 X65.186 Y108.467 E.38865
G1 X64.831 Y108.759 E.01663
G1 X57.232 Y101.159 E.38865
G1 X56.877 Y101.452 E.01663
G1 X64.476 Y109.051 E.38865
G1 X64.121 Y109.344 E.01663
G1 X56.522 Y101.744 E.38865
G1 X56.167 Y102.037 E.01663
G1 X63.766 Y109.636 E.38865
G1 X63.411 Y109.929 E.01663
G1 X55.812 Y102.329 E.38865
G1 X55.457 Y102.621 E.01663
G1 X63.057 Y110.221 E.38866
G1 X62.702 Y110.514 E.01663
G1 X55.102 Y102.914 E.38866
G1 X54.747 Y103.206 E.01663
G1 X62.347 Y110.806 E.38866
G1 X61.992 Y111.098 E.01663
G1 X54.392 Y103.499 E.38866
G1 X54.037 Y103.791 E.01663
G1 X61.637 Y111.391 E.38866
G1 X61.282 Y111.683 E.01663
G1 X53.682 Y104.084 E.38866
G1 X53.327 Y104.376 E.01663
G1 X60.927 Y111.976 E.38866
G1 X60.572 Y112.268 E.01663
G1 X52.972 Y104.668 E.38866
G1 X52.617 Y104.961 E.01663
G1 X60.217 Y112.561 E.38866
G1 X59.862 Y112.853 E.01663
G1 X52.262 Y105.253 E.38866
G1 X51.907 Y105.546 E.01663
G1 X59.507 Y113.146 E.38866
G1 X59.152 Y113.438 E.01663
G1 X51.552 Y105.838 E.38867
G1 X51.197 Y106.131 E.01663
G1 X58.797 Y113.73 E.38867
G1 X58.442 Y114.023 E.01663
G1 X50.842 Y106.423 E.38867
G1 X50.487 Y106.715 E.01663
G1 X58.087 Y114.315 E.38867
G1 X57.732 Y114.608 E.01663
G1 X50.132 Y107.008 E.38867
G1 X49.777 Y107.3 E.01663
G1 X57.377 Y114.9 E.38867
G1 X57.022 Y115.193 E.01663
G1 X49.422 Y107.593 E.38867
G1 X49.067 Y107.885 E.01663
G1 X56.667 Y115.485 E.38867
G1 X56.312 Y115.777 E.01663
G1 X48.712 Y108.177 E.38867
G1 X48.357 Y108.47 E.01663
G1 X55.957 Y116.07 E.38867
G1 X55.602 Y116.362 E.01663
G1 X48.002 Y108.762 E.38867
G1 X47.647 Y109.055 E.01663
G1 X55.247 Y116.655 E.38867
G1 X54.892 Y116.947 E.01663
G1 X47.292 Y109.347 E.38868
G1 X46.937 Y109.64 E.01663
G1 X54.537 Y117.24 E.38868
G1 X54.182 Y117.532 E.01663
G1 X46.582 Y109.932 E.38868
G1 X46.227 Y110.224 E.01663
G1 X53.827 Y117.825 E.38868
G1 X53.472 Y118.117 E.01663
G1 X45.872 Y110.517 E.38868
G1 X45.517 Y110.809 E.01663
G1 X53.117 Y118.409 E.38868
G1 X52.762 Y118.702 E.01663
G1 X45.162 Y111.102 E.38868
G1 X44.807 Y111.394 E.01663
G1 X52.407 Y118.994 E.38868
G1 X52.052 Y119.287 E.01663
G1 X44.452 Y111.686 E.38868
G1 X44.097 Y111.979 E.01663
G1 X51.697 Y119.579 E.38868
G1 X51.342 Y119.872 E.01663
G1 X43.742 Y112.271 E.38868
G1 X43.387 Y112.564 E.01663
G1 X50.987 Y120.164 E.38869
G1 X50.632 Y120.456 E.01663
G1 X43.032 Y112.856 E.38869
G1 X42.677 Y113.149 E.01663
G1 X50.277 Y120.749 E.38869
G1 X49.922 Y121.041 E.01663
G1 X42.322 Y113.441 E.38869
G1 X41.967 Y113.733 E.01663
G1 X49.567 Y121.334 E.38869
G1 X49.212 Y121.626 E.01663
G1 X41.612 Y114.026 E.38869
G1 X41.257 Y114.318 E.01663
G1 X48.857 Y121.919 E.38869
G1 X48.502 Y122.211 E.01663
G1 X40.902 Y114.611 E.38869
G1 X40.547 Y114.903 E.01663
G1 X48.147 Y122.503 E.38869
G1 X47.792 Y122.796 E.01663
G1 X40.192 Y115.195 E.38869
G1 X39.837 Y115.488 E.01663
G1 X47.438 Y123.088 E.38869
G1 X47.083 Y123.381 E.01663
G1 X39.482 Y115.78 E.38869
G1 X39.127 Y116.073 E.01663
G1 X46.728 Y123.673 E.3887
G1 X46.373 Y123.966 E.01663
G1 X38.772 Y116.365 E.3887
G1 X38.417 Y116.658 E.01663
G1 X46.018 Y124.258 E.3887
G1 X45.663 Y124.551 E.01663
G1 X38.062 Y116.95 E.3887
G1 X37.707 Y117.242 E.01663
G1 X45.308 Y124.843 E.3887
G1 X44.953 Y125.135 E.01663
G1 X37.352 Y117.535 E.3887
G1 X36.997 Y117.827 E.01663
G1 X44.598 Y125.428 E.3887
G1 X44.243 Y125.72 E.01663
G1 X36.642 Y118.12 E.3887
G1 X36.287 Y118.412 E.01663
G1 X43.888 Y126.013 E.3887
G1 X43.533 Y126.305 E.01663
G1 X35.932 Y118.704 E.3887
G1 X35.577 Y118.997 E.01663
G1 X43.178 Y126.598 E.38871
G1 X42.823 Y126.89 E.01663
G1 X35.222 Y119.289 E.38871
M73 P18 R39
G1 X34.867 Y119.582 E.01663
G1 X42.468 Y127.182 E.38871
G1 X42.113 Y127.475 E.01663
G1 X34.512 Y119.874 E.38871
G1 X34.157 Y120.167 E.01663
G1 X41.758 Y127.767 E.38871
G1 X41.403 Y128.06 E.01663
G1 X33.802 Y120.459 E.38871
G1 X33.447 Y120.751 E.01663
G1 X41.048 Y128.352 E.38871
G1 X40.693 Y128.645 E.01663
G1 X33.092 Y121.044 E.38871
G1 X32.737 Y121.336 E.01663
G1 X40.338 Y128.937 E.38871
G1 X39.983 Y129.229 E.01663
G1 X32.382 Y121.629 E.38871
G1 X32.027 Y121.921 E.01663
G1 X39.628 Y129.522 E.38871
G1 X39.273 Y129.814 E.01663
G1 X31.672 Y122.214 E.38871
G1 X31.317 Y122.506 E.01663
G1 X38.918 Y130.107 E.38872
G1 X38.563 Y130.399 E.01663
G1 X30.962 Y122.798 E.38872
G1 X30.607 Y123.091 E.01663
G1 X38.208 Y130.692 E.38872
G1 X37.853 Y130.984 E.01663
G1 X30.252 Y123.383 E.38872
G1 X29.897 Y123.676 E.01663
G1 X37.498 Y131.277 E.38872
M73 P19 R39
G1 X37.143 Y131.569 E.01663
G1 X29.542 Y123.968 E.38872
G1 X29.187 Y124.26 E.01663
G1 X36.788 Y131.861 E.38872
G1 X36.433 Y132.154 E.01663
G1 X28.832 Y124.553 E.38872
G1 X28.477 Y124.845 E.01663
G1 X36.078 Y132.446 E.38871
G1 X35.723 Y132.739 E.01663
G1 X28.123 Y125.139 E.38867
G1 X27.769 Y125.432 E.01663
G1 X35.368 Y133.031 E.38862
G1 X35.013 Y133.324 E.01663
G1 X27.415 Y125.726 E.38857
G1 X27.061 Y126.019 E.01663
G1 X34.658 Y133.616 E.38852
G1 X34.617 Y133.65 E.00193
G1 X37.236 Y136.841 E.14927
G1 X26.707 Y126.312 E.53844
G1 X26.353 Y126.606 E.01663
G1 X40.198 Y140.451 E.70804
G1 X43.16 Y144.06 E.16886
G1 X25.999 Y126.899 E.87764
G1 X25.645 Y127.193 E.01663
G1 X46.123 Y147.67 E1.04724
G1 X49.085 Y151.28 E.16886
G1 X25.291 Y127.486 E1.21683
G1 X24.937 Y127.779 E.01663
G1 X52.047 Y154.889 E1.38643
G1 X55.009 Y158.499 E.16886
G1 X24.583 Y128.073 E1.55603
G1 X24.229 Y128.366 E.01663
G1 X57.972 Y162.109 E1.72563
G1 X60.934 Y165.718 E.16886
G1 X23.875 Y128.659 E1.89523
G1 X23.521 Y128.953 E.01663
G1 X63.896 Y169.328 E2.06483
G1 X66.859 Y172.938 E.16886
G1 X23.167 Y129.246 E2.23443
G1 X22.813 Y129.54 E.01663
G1 X69.821 Y176.548 E2.40403
G1 X72.783 Y180.157 E.16886
G1 X22.459 Y129.833 E2.57363
G1 X22.105 Y130.126 E.01663
G1 X75.745 Y183.767 E2.74323
G1 X78.708 Y187.377 E.16886
G1 X21.751 Y130.42 E2.91283
G1 X21.397 Y130.713 E.01663
G1 X81.67 Y190.986 E3.08243
G1 X84.632 Y194.596 E.16886
G1 X21.962 Y131.926 E3.20503
G1 X24.812 Y135.423 E.16315
G1 X87.595 Y198.206 E3.21077
G1 X90.557 Y201.815 E.16886
G1 X27.699 Y138.958 E3.21461
G1 X30.663 Y142.569 E.16897
G1 X93.519 Y205.425 E3.21451
G1 X96.481 Y209.035 E.16886
G1 X33.628 Y146.181 E3.2144
G1 X36.592 Y149.793 E.16897
G1 X99.444 Y212.645 E3.21429
G1 X102.406 Y216.254 E.16886
G1 X39.557 Y153.405 E3.21418
G1 X42.521 Y157.017 E.16897
G1 X105.368 Y219.864 E3.21408
G1 X108.331 Y223.474 E.16886
G1 X45.485 Y160.628 E3.21397
G1 X48.45 Y164.24 E.16897
G1 X111.293 Y227.083 E3.21386
G1 X114.255 Y230.693 E.16886
G1 X51.414 Y167.852 E3.21376
G1 X54.378 Y171.464 E.16897
G1 X117.218 Y234.303 E3.21365
G1 X120.18 Y237.912 E.16886
G1 X57.343 Y175.076 E3.21354
G1 X60.307 Y178.687 E.16897
G1 X119.914 Y238.294 E3.04833
G1 X119.559 Y238.586 E.01663
G1 X63.272 Y182.299 E2.87857
G1 X66.236 Y185.911 E.16897
G1 X119.204 Y238.879 E2.70882
G1 X118.849 Y239.171 E.01663
G1 X69.2 Y189.523 E2.53906
G1 X72.165 Y193.134 E.16897
G1 X118.494 Y239.463 E2.36931
G1 X118.139 Y239.756 E.01663
G1 X75.129 Y196.746 E2.19955
G1 X78.094 Y200.358 E.16897
G1 X117.784 Y240.048 E2.0298
G1 X117.429 Y240.341 E.01663
G1 X81.058 Y203.97 E1.86004
G1 X84.022 Y207.582 E.16897
G1 X117.074 Y240.633 E1.69029
G1 X116.719 Y240.926 E.01663
G1 X86.987 Y211.193 E1.52053
G1 X89.951 Y214.805 E.16897
G1 X116.364 Y241.218 E1.35078
G1 X116.009 Y241.511 E.01663
G1 X92.915 Y218.417 E1.18102
G1 X95.88 Y222.029 E.16897
G1 X115.654 Y241.803 E1.01127
G1 X115.299 Y242.095 E.01663
G1 X98.844 Y225.641 E.84151
G1 X101.809 Y229.252 E.16897
G1 X114.944 Y242.388 E.67176
G1 X114.589 Y242.68 E.01663
G1 X104.773 Y232.864 E.502
G1 X107.737 Y236.476 E.16897
G1 X114.234 Y242.973 E.33225
G1 X113.879 Y243.265 E.01663
G1 X109.217 Y238.603 E.23841
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X110.631 Y240.018 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/75
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
; open powerlost recovery
M1003 S1
M204 S10000
G17
G3 Z.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z.4
M73 P20 R39
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X113.436 Y244.464 E.32198
G1 X113.127 Y244.718 E.01286
G1 F4126.223
G1 X113.041 Y244.789 E.00358
G1 F2880
G1 X27.297 Y140.305 E4.34635
G1 X26.788 Y139.688 E.02573
G1 X26.533 Y139.379 E.01286
G1 F2760
G1 X25.435 Y138.055 E.05534
G3 X24.672 Y137.128 I64.922 J-54.221 E.03859
G1 F2640
G1 X22.275 Y134.195 E.12182
G1 F2520
G1 X19.498 Y130.797 E.14111
G1 F7500
G1 X19.806 Y130.542 E.01286
G1 X22.088 Y128.655 E.09523
G1 F8843.478
G1 X22.397 Y128.401 E.01286
G1 X26.807 Y124.754 E.18402
G1 X27.272 Y124.375 E.01929
G1 X28.774 Y123.148 E.06235
G2 X29.702 Y122.387 I-88.07 J-108.32 E.03859
G1 X142.196 Y29.713 E4.68685
G1 X142.237 Y29.762 E.00204
G1 X142.548 Y30.142 E.01581
G1 X184.993 Y81.862 E2.1515
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X113.983 Y244.521 E.29842
G1 X113.674 Y244.776 E.01191
G1 F6685.538
G1 X113.365 Y245.03 E.01191
G1 F1920
G1 X113.08 Y245.265 E.01099
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F600
G1 X112.987 Y245.342 E.00389
G1 X26.613 Y140.091 E4.37825
G1 X24.749 Y137.842 E.09392
G1 X18.947 Y130.743 E.29481
G3 X28.99 Y122.466 I693.98 J831.726 E.41849
G1 X142.25 Y29.16 E4.71876
G1 X142.297 Y29.217 E.00234
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1920
G1 X142.531 Y29.502 E.01099
G1 F6685.538
G1 X142.784 Y29.811 E.01191
G1 F9547.055
G1 X143.038 Y30.12 E.01191
G1 X185.544 Y81.916 E1.99584
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
M204 S10000
G1 X35.494 Y133.961 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42001
G1 F9546.792
G1 X28.369 Y141.086 E.30014
G1 X28.609 Y141.379 E.01129
G1 X35.613 Y134.375 E.29506
G1 X35.854 Y134.668 E.01129
G1 X28.849 Y141.672 E.29506
G1 X29.09 Y141.965 E.01129
G1 X36.094 Y134.961 E.29506
G1 X36.335 Y135.253 E.01129
G1 X29.33 Y142.258 E.29506
G1 X29.571 Y142.551 E.01129
G1 X36.575 Y135.546 E.29506
G1 X36.815 Y135.839 E.01129
G1 X29.811 Y142.844 E.29506
G1 X30.051 Y143.137 E.01129
G1 X37.056 Y136.132 E.29506
G1 X37.296 Y136.425 E.01129
G1 X30.292 Y143.429 E.29506
G1 X30.532 Y143.722 E.01129
G1 X37.536 Y136.718 E.29506
G1 X37.777 Y137.011 E.01129
G1 X30.772 Y144.015 E.29506
G1 X31.013 Y144.308 E.01129
G1 X38.017 Y137.304 E.29506
G1 X38.258 Y137.597 E.01129
G1 X31.253 Y144.601 E.29506
G1 X31.494 Y144.894 E.01129
G1 X38.498 Y137.89 E.29506
G1 X38.738 Y138.183 E.01129
G1 X31.734 Y145.187 E.29506
G1 X31.974 Y145.48 E.01129
G1 X38.979 Y138.475 E.29506
G1 X39.219 Y138.768 E.01129
G1 X32.215 Y145.773 E.29506
M73 P21 R38
G1 X32.455 Y146.066 E.01129
G1 X39.459 Y139.061 E.29506
G1 X39.7 Y139.354 E.01129
G1 X32.695 Y146.359 E.29506
G1 X32.936 Y146.651 E.01129
G1 X39.94 Y139.647 E.29506
G1 X40.181 Y139.94 E.01129
G1 X33.176 Y146.944 E.29506
G1 X33.417 Y147.237 E.01129
G1 X40.421 Y140.233 E.29506
G1 X40.661 Y140.526 E.01129
G1 X33.657 Y147.53 E.29506
G1 X33.897 Y147.823 E.01129
G1 X40.902 Y140.819 E.29506
G1 X41.142 Y141.112 E.01129
G1 X34.138 Y148.116 E.29506
G1 X34.378 Y148.409 E.01129
G1 X41.382 Y141.405 E.29506
G1 X41.623 Y141.698 E.01129
G1 X34.618 Y148.702 E.29506
G1 X34.859 Y148.995 E.01129
G1 X41.863 Y141.99 E.29506
G1 X42.104 Y142.283 E.01129
G1 X35.099 Y149.288 E.29506
G1 X35.34 Y149.581 E.01129
G1 X42.344 Y142.576 E.29506
G1 X42.584 Y142.869 E.01129
G1 X35.58 Y149.873 E.29506
G1 X35.82 Y150.166 E.01129
G1 X42.825 Y143.162 E.29506
G1 X43.065 Y143.455 E.01129
G1 X36.061 Y150.459 E.29506
G1 X36.301 Y150.752 E.01129
G1 X43.305 Y143.748 E.29506
G1 X43.546 Y144.041 E.01129
G1 X36.541 Y151.045 E.29506
G1 X36.782 Y151.338 E.01129
G1 X43.786 Y144.334 E.29506
G1 X44.027 Y144.627 E.01129
G1 X37.022 Y151.631 E.29506
G1 X37.263 Y151.924 E.01129
G1 X44.267 Y144.92 E.29506
G1 X44.507 Y145.212 E.01129
G1 X37.503 Y152.217 E.29506
G1 X37.743 Y152.51 E.01129
G1 X44.748 Y145.505 E.29506
G1 X44.988 Y145.798 E.01129
G1 X37.984 Y152.803 E.29506
M73 P22 R38
G1 X38.224 Y153.095 E.01129
G1 X45.228 Y146.091 E.29506
G1 X45.469 Y146.384 E.01129
G1 X38.464 Y153.388 E.29506
G1 X38.705 Y153.681 E.01129
G1 X45.709 Y146.677 E.29506
G1 X45.95 Y146.97 E.01129
G1 X38.945 Y153.974 E.29506
G1 X39.186 Y154.267 E.01129
G1 X46.19 Y147.263 E.29506
G1 X46.43 Y147.556 E.01129
G1 X39.426 Y154.56 E.29506
G1 X39.666 Y154.853 E.01129
G1 X46.671 Y147.849 E.29506
G1 X46.911 Y148.142 E.01129
G1 X39.907 Y155.146 E.29506
G1 X40.147 Y155.439 E.01129
G1 X47.151 Y148.434 E.29506
G1 X47.392 Y148.727 E.01129
G1 X40.387 Y155.732 E.29506
G1 X40.628 Y156.025 E.01129
G1 X47.632 Y149.02 E.29506
G1 X47.873 Y149.313 E.01129
G1 X40.868 Y156.317 E.29506
G1 X41.109 Y156.61 E.01129
G1 X48.113 Y149.606 E.29506
G1 X48.353 Y149.899 E.01129
G1 X41.349 Y156.903 E.29506
G1 X41.589 Y157.196 E.01129
G1 X48.594 Y150.192 E.29506
G1 X48.834 Y150.485 E.01129
G1 X41.83 Y157.489 E.29506
G1 X42.07 Y157.782 E.01129
G1 X49.074 Y150.778 E.29506
G1 X49.315 Y151.071 E.01129
G1 X42.31 Y158.075 E.29506
G1 X42.551 Y158.368 E.01129
G1 X49.555 Y151.364 E.29506
G1 X49.796 Y151.656 E.01129
G1 X42.791 Y158.661 E.29506
G1 X43.032 Y158.954 E.01129
G1 X50.036 Y151.949 E.29506
G1 X50.276 Y152.242 E.01129
G1 X43.272 Y159.247 E.29506
G1 X43.512 Y159.539 E.01129
G1 X50.517 Y152.535 E.29506
G1 X50.757 Y152.828 E.01129
G1 X43.753 Y159.832 E.29506
G1 X43.993 Y160.125 E.01129
G1 X50.997 Y153.121 E.29506
G1 X51.238 Y153.414 E.01129
G1 X44.233 Y160.418 E.29506
G1 X44.474 Y160.711 E.01129
G1 X51.478 Y153.707 E.29506
G1 X51.719 Y154 E.01129
G1 X44.714 Y161.004 E.29506
G1 X44.955 Y161.297 E.01129
G1 X51.959 Y154.293 E.29506
G1 X52.199 Y154.586 E.01129
G1 X45.195 Y161.59 E.29506
G1 X45.435 Y161.883 E.01129
G1 X52.44 Y154.878 E.29506
G1 X52.68 Y155.171 E.01129
G1 X45.676 Y162.176 E.29506
G1 X45.916 Y162.469 E.01129
G1 X52.92 Y155.464 E.29506
G1 X53.161 Y155.757 E.01129
G1 X46.156 Y162.762 E.29506
G1 X46.397 Y163.054 E.01129
G1 X53.401 Y156.05 E.29506
G1 X53.642 Y156.343 E.01129
G1 X46.637 Y163.347 E.29506
G1 X46.878 Y163.64 E.01129
G1 X53.882 Y156.636 E.29506
G1 X54.122 Y156.929 E.01129
G1 X47.118 Y163.933 E.29506
G1 X47.358 Y164.226 E.01129
G1 X54.363 Y157.222 E.29506
G1 X54.603 Y157.515 E.01129
G1 X47.599 Y164.519 E.29506
G1 X47.839 Y164.812 E.01129
G1 X54.843 Y157.808 E.29506
G1 X55.084 Y158.1 E.01129
G1 X48.079 Y165.105 E.29506
G1 X48.32 Y165.398 E.01129
G1 X55.324 Y158.393 E.29506
G1 X55.565 Y158.686 E.01129
G1 X48.56 Y165.691 E.29506
G1 X48.801 Y165.984 E.01129
G1 X55.805 Y158.979 E.29506
G1 X56.045 Y159.272 E.01129
G1 X49.041 Y166.276 E.29506
G1 X49.281 Y166.569 E.01129
G1 X56.286 Y159.565 E.29506
G1 X56.526 Y159.858 E.01129
G1 X49.522 Y166.862 E.29506
G1 X49.762 Y167.155 E.01129
G1 X56.766 Y160.151 E.29506
G1 X57.007 Y160.444 E.01129
G1 X50.002 Y167.448 E.29506
G1 X50.243 Y167.741 E.01129
G1 X57.247 Y160.737 E.29506
G1 X57.488 Y161.03 E.01129
G1 X50.483 Y168.034 E.29506
G1 X50.724 Y168.327 E.01129
G1 X57.728 Y161.322 E.29506
G1 X57.968 Y161.615 E.01129
G1 X50.964 Y168.62 E.29506
G1 X51.204 Y168.913 E.01129
G1 X58.209 Y161.908 E.29506
G1 X58.449 Y162.201 E.01129
G1 X51.445 Y169.206 E.29506
G1 X51.685 Y169.498 E.01129
G1 X58.689 Y162.494 E.29506
G1 X58.93 Y162.787 E.01129
G1 X51.925 Y169.791 E.29506
G1 X52.166 Y170.084 E.01129
G1 X59.17 Y163.08 E.29506
G1 X59.411 Y163.373 E.01129
G1 X52.406 Y170.377 E.29506
G1 X52.647 Y170.67 E.01129
G1 X59.651 Y163.666 E.29506
G1 X59.891 Y163.959 E.01129
G1 X52.887 Y170.963 E.29506
G1 X53.127 Y171.256 E.01129
G1 X60.132 Y164.252 E.29506
G1 X60.372 Y164.545 E.01129
G1 X53.368 Y171.549 E.29506
G1 X53.608 Y171.842 E.01129
G1 X60.612 Y164.837 E.29506
G1 X60.853 Y165.13 E.01129
G1 X53.848 Y172.135 E.29506
G1 X54.089 Y172.428 E.01129
G1 X61.093 Y165.423 E.29506
G1 X61.334 Y165.716 E.01129
G1 X54.329 Y172.72 E.29506
G1 X54.57 Y173.013 E.01129
G1 X61.574 Y166.009 E.29506
G1 X61.814 Y166.302 E.01129
G1 X54.81 Y173.306 E.29506
G1 X55.05 Y173.599 E.01129
G1 X62.055 Y166.595 E.29506
G1 X62.295 Y166.888 E.01129
G1 X55.291 Y173.892 E.29506
G1 X55.531 Y174.185 E.01129
G1 X62.535 Y167.181 E.29506
G1 X62.776 Y167.474 E.01129
G1 X55.771 Y174.478 E.29506
G1 X56.012 Y174.771 E.01129
G1 X63.016 Y167.767 E.29506
G1 X63.257 Y168.059 E.01129
G1 X56.252 Y175.064 E.29506
G1 X56.493 Y175.357 E.01129
G1 X63.497 Y168.352 E.29506
G1 X63.737 Y168.645 E.01129
G1 X56.733 Y175.65 E.29506
G1 X56.973 Y175.942 E.01129
G1 X63.978 Y168.938 E.29506
G1 X64.218 Y169.231 E.01129
G1 X57.214 Y176.235 E.29506
G1 X57.454 Y176.528 E.01129
G1 X64.458 Y169.524 E.29506
G1 X64.699 Y169.817 E.01129
G1 X57.695 Y176.821 E.29506
G1 X57.935 Y177.114 E.01129
G1 X64.939 Y170.11 E.29506
G1 X65.18 Y170.403 E.01129
G1 X58.175 Y177.407 E.29506
G1 X58.416 Y177.7 E.01129
G1 X65.42 Y170.696 E.29506
G1 X65.66 Y170.989 E.01129
G1 X58.656 Y177.993 E.29506
G1 X58.896 Y178.286 E.01129
G1 X65.901 Y171.281 E.29506
G1 X66.141 Y171.574 E.01129
G1 X59.137 Y178.579 E.29506
G1 X59.377 Y178.872 E.01129
G1 X66.381 Y171.867 E.29506
G1 X66.622 Y172.16 E.01129
G1 X59.618 Y179.164 E.29506
G1 X59.858 Y179.457 E.01129
G1 X66.862 Y172.453 E.29506
G1 X67.103 Y172.746 E.01129
G1 X60.098 Y179.75 E.29506
G1 X60.339 Y180.043 E.01129
G1 X67.343 Y173.039 E.29506
G1 X67.583 Y173.332 E.01129
G1 X60.579 Y180.336 E.29506
G1 X60.819 Y180.629 E.01129
G1 X67.824 Y173.625 E.29506
G1 X68.064 Y173.918 E.01129
G1 X61.06 Y180.922 E.29506
G1 X61.3 Y181.215 E.01129
G1 X68.304 Y174.211 E.29506
G1 X68.545 Y174.503 E.01129
G1 X61.541 Y181.508 E.29506
G1 X61.781 Y181.801 E.01129
G1 X68.785 Y174.796 E.29506
G1 X69.026 Y175.089 E.01129
G1 X62.021 Y182.094 E.29506
G1 X62.262 Y182.387 E.01129
G1 X69.266 Y175.382 E.29506
G1 X69.506 Y175.675 E.01129
G1 X62.502 Y182.679 E.29506
G1 X62.742 Y182.972 E.01129
G1 X69.747 Y175.968 E.29506
G1 X69.987 Y176.261 E.01129
G1 X62.983 Y183.265 E.29506
G1 X63.223 Y183.558 E.01129
G1 X70.227 Y176.554 E.29506
G1 X70.468 Y176.847 E.01129
G1 X63.464 Y183.851 E.29506
G1 X63.704 Y184.144 E.01129
G1 X70.708 Y177.14 E.29506
G1 X70.949 Y177.433 E.01129
G1 X63.944 Y184.437 E.29506
G1 X64.185 Y184.73 E.01129
G1 X71.189 Y177.725 E.29506
G1 X71.429 Y178.018 E.01129
G1 X64.425 Y185.023 E.29506
G1 X64.665 Y185.316 E.01129
G1 X71.67 Y178.311 E.29506
G1 X71.91 Y178.604 E.01129
G1 X64.906 Y185.609 E.29506
G1 X65.146 Y185.901 E.01129
G1 X72.15 Y178.897 E.29506
G1 X72.391 Y179.19 E.01129
G1 X65.387 Y186.194 E.29506
G1 X65.627 Y186.487 E.01129
G1 X72.631 Y179.483 E.29506
G1 X72.872 Y179.776 E.01129
G1 X65.867 Y186.78 E.29506
G1 X66.108 Y187.073 E.01129
G1 X73.112 Y180.069 E.29506
G1 X73.352 Y180.362 E.01129
G1 X66.348 Y187.366 E.29506
G1 X66.588 Y187.659 E.01129
G1 X73.593 Y180.655 E.29506
G1 X73.833 Y180.947 E.01129
G1 X66.829 Y187.952 E.29506
G1 X67.069 Y188.245 E.01129
G1 X74.073 Y181.24 E.29506
G1 X74.314 Y181.533 E.01129
G1 X67.31 Y188.538 E.29506
G1 X67.55 Y188.831 E.01129
G1 X74.554 Y181.826 E.29506
G1 X74.795 Y182.119 E.01129
G1 X67.79 Y189.123 E.29506
G1 X68.031 Y189.416 E.01129
G1 X75.035 Y182.412 E.29506
G1 X75.275 Y182.705 E.01129
G1 X68.271 Y189.709 E.29506
G1 X68.511 Y190.002 E.01129
G1 X75.516 Y182.998 E.29506
G1 X75.756 Y183.291 E.01129
G1 X68.752 Y190.295 E.29506
G1 X68.992 Y190.588 E.01129
G1 X75.996 Y183.584 E.29506
G1 X76.237 Y183.877 E.01129
G1 X69.233 Y190.881 E.29506
G1 X69.473 Y191.174 E.01129
G1 X76.477 Y184.169 E.29506
G1 X76.718 Y184.462 E.01129
G1 X69.713 Y191.467 E.29506
G1 X69.954 Y191.76 E.01129
G1 X76.958 Y184.755 E.29506
G1 X77.198 Y185.048 E.01129
G1 X70.194 Y192.053 E.29506
G1 X70.434 Y192.345 E.01129
G1 X77.439 Y185.341 E.29506
G1 X77.679 Y185.634 E.01129
G1 X70.675 Y192.638 E.29506
G1 X70.915 Y192.931 E.01129
G1 X77.919 Y185.927 E.29506
G1 X78.16 Y186.22 E.01129
G1 X71.156 Y193.224 E.29506
G1 X71.396 Y193.517 E.01129
G1 X78.4 Y186.513 E.29506
G1 X78.641 Y186.806 E.01129
G1 X71.636 Y193.81 E.29506
G1 X71.877 Y194.103 E.01129
G1 X78.881 Y187.099 E.29506
G1 X79.121 Y187.392 E.01129
G1 X72.117 Y194.396 E.29506
G1 X72.357 Y194.689 E.01129
G1 X79.362 Y187.684 E.29506
G1 X79.602 Y187.977 E.01129
G1 X72.598 Y194.982 E.29506
G1 X72.838 Y195.275 E.01129
G1 X79.842 Y188.27 E.29506
G1 X80.083 Y188.563 E.01129
G1 X73.079 Y195.567 E.29506
G1 X73.319 Y195.86 E.01129
G1 X80.323 Y188.856 E.29506
G1 X80.564 Y189.149 E.01129
G1 X73.559 Y196.153 E.29506
G1 X73.8 Y196.446 E.01129
G1 X80.804 Y189.442 E.29506
G1 X81.044 Y189.735 E.01129
G1 X74.04 Y196.739 E.29506
G1 X74.28 Y197.032 E.01129
G1 X81.285 Y190.028 E.29506
G1 X81.525 Y190.321 E.01129
G1 X74.521 Y197.325 E.29506
G1 X74.761 Y197.618 E.01129
G1 X81.765 Y190.614 E.29506
G1 X82.006 Y190.906 E.01129
G1 X75.002 Y197.911 E.29506
G1 X75.242 Y198.204 E.01129
G1 X82.246 Y191.199 E.29506
G1 X82.487 Y191.492 E.01129
G1 X75.482 Y198.497 E.29506
G1 X75.723 Y198.789 E.01129
G1 X82.727 Y191.785 E.29506
G1 X82.967 Y192.078 E.01129
G1 X75.963 Y199.082 E.29506
G1 X76.203 Y199.375 E.01129
G1 X83.208 Y192.371 E.29506
G1 X83.448 Y192.664 E.01129
G1 X76.444 Y199.668 E.29506
G1 X76.684 Y199.961 E.01129
G1 X83.688 Y192.957 E.29506
G1 X83.929 Y193.25 E.01129
G1 X76.925 Y200.254 E.29506
G1 X77.165 Y200.547 E.01129
G1 X84.169 Y193.543 E.29506
G1 X84.41 Y193.836 E.01129
G1 X77.405 Y200.84 E.29506
G1 X77.646 Y201.133 E.01129
G1 X84.65 Y194.128 E.29506
G1 X84.89 Y194.421 E.01129
G1 X77.886 Y201.426 E.29506
G1 X78.126 Y201.719 E.01129
G1 X85.131 Y194.714 E.29506
G1 X85.371 Y195.007 E.01129
G1 X78.367 Y202.011 E.29506
G1 X78.607 Y202.304 E.01129
G1 X85.611 Y195.3 E.29506
G1 X85.852 Y195.593 E.01129
G1 X78.848 Y202.597 E.29506
G1 X79.088 Y202.89 E.01129
G1 X86.092 Y195.886 E.29506
G1 X86.333 Y196.179 E.01129
G1 X79.328 Y203.183 E.29506
G1 X79.569 Y203.476 E.01129
G1 X86.573 Y196.472 E.29506
G1 X86.813 Y196.765 E.01129
G1 X79.809 Y203.769 E.29506
G1 X80.049 Y204.062 E.01129
G1 X87.054 Y197.058 E.29506
G1 X87.294 Y197.35 E.01129
G1 X80.29 Y204.355 E.29506
G1 X80.53 Y204.648 E.01129
G1 X87.534 Y197.643 E.29506
G1 X87.775 Y197.936 E.01129
G1 X80.771 Y204.941 E.29506
G1 X81.011 Y205.234 E.01129
G1 X88.015 Y198.229 E.29506
G1 X88.256 Y198.522 E.01129
G1 X81.251 Y205.526 E.29506
G1 X81.492 Y205.819 E.01129
G1 X88.496 Y198.815 E.29506
G1 X88.736 Y199.108 E.01129
G1 X81.732 Y206.112 E.29506
G1 X81.972 Y206.405 E.01129
G1 X88.977 Y199.401 E.29506
G1 X89.217 Y199.694 E.01129
G1 X82.213 Y206.698 E.29506
G1 X82.453 Y206.991 E.01129
G1 X89.457 Y199.987 E.29506
G1 X89.698 Y200.28 E.01129
G1 X82.694 Y207.284 E.29506
G1 X82.934 Y207.577 E.01129
G1 X89.938 Y200.572 E.29506
G1 X90.179 Y200.865 E.01129
G1 X83.174 Y207.87 E.29506
G1 X83.415 Y208.163 E.01129
G1 X90.419 Y201.158 E.29506
G1 X90.659 Y201.451 E.01129
G1 X83.655 Y208.456 E.29506
G1 X83.895 Y208.748 E.01129
G1 X90.9 Y201.744 E.29506
G1 X91.14 Y202.037 E.01129
G1 X84.136 Y209.041 E.29506
G1 X84.376 Y209.334 E.01129
G1 X91.381 Y202.33 E.29506
G1 X91.621 Y202.623 E.01129
G1 X84.617 Y209.627 E.29506
G1 X84.857 Y209.92 E.01129
G1 X91.861 Y202.916 E.29506
G1 X92.102 Y203.209 E.01129
G1 X85.097 Y210.213 E.29506
G1 X85.338 Y210.506 E.01129
G1 X92.342 Y203.502 E.29506
G1 X92.582 Y203.794 E.01129
G1 X85.578 Y210.799 E.29506
G1 X85.818 Y211.092 E.01129
G1 X92.823 Y204.087 E.29506
G1 X93.063 Y204.38 E.01129
G1 X86.059 Y211.385 E.29506
G1 X86.299 Y211.678 E.01129
G1 X93.303 Y204.673 E.29506
G1 X93.544 Y204.966 E.01129
G1 X86.54 Y211.97 E.29506
G1 X86.78 Y212.263 E.01129
G1 X93.784 Y205.259 E.29506
G1 X94.025 Y205.552 E.01129
G1 X87.02 Y212.556 E.29506
G1 X87.261 Y212.849 E.01129
G1 X94.265 Y205.845 E.29506
G1 X94.505 Y206.138 E.01129
G1 X87.501 Y213.142 E.29506
G1 X87.741 Y213.435 E.01129
G1 X94.746 Y206.431 E.29506
G1 X94.986 Y206.724 E.01129
G1 X87.982 Y213.728 E.29506
G1 X88.222 Y214.021 E.01129
G1 X95.227 Y207.017 E.29506
G1 X95.467 Y207.309 E.01129
G1 X88.463 Y214.314 E.29506
G1 X88.703 Y214.607 E.01129
G1 X95.707 Y207.602 E.29506
G1 X95.948 Y207.895 E.01129
G1 X88.943 Y214.9 E.29506
G1 X89.184 Y215.192 E.01129
G1 X96.188 Y208.188 E.29506
G1 X96.428 Y208.481 E.01129
G1 X89.424 Y215.485 E.29506
G1 X89.664 Y215.778 E.01129
G1 X96.669 Y208.774 E.29506
G1 X96.909 Y209.067 E.01129
G1 X89.905 Y216.071 E.29506
G1 X90.145 Y216.364 E.01129
G1 X97.15 Y209.36 E.29506
G1 X97.39 Y209.653 E.01129
G1 X90.386 Y216.657 E.29506
G1 X90.626 Y216.95 E.01129
G1 X97.63 Y209.946 E.29506
G1 X97.871 Y210.239 E.01129
G1 X90.866 Y217.243 E.29506
G1 X91.107 Y217.536 E.01129
G1 X98.111 Y210.531 E.29506
G1 X98.351 Y210.824 E.01129
G1 X91.347 Y217.829 E.29506
G1 X91.587 Y218.122 E.01129
G1 X98.592 Y211.117 E.29506
G1 X98.832 Y211.41 E.01129
G1 X91.828 Y218.414 E.29506
G1 X92.068 Y218.707 E.01129
G1 X99.073 Y211.703 E.29506
G1 X99.313 Y211.996 E.01129
G1 X92.309 Y219 E.29506
G1 X92.549 Y219.293 E.01129
G1 X99.553 Y212.289 E.29506
G1 X99.794 Y212.582 E.01129
G1 X92.789 Y219.586 E.29506
G1 X93.03 Y219.879 E.01129
G1 X100.034 Y212.875 E.29506
G1 X100.274 Y213.168 E.01129
G1 X93.27 Y220.172 E.29506
G1 X93.51 Y220.465 E.01129
G1 X100.515 Y213.461 E.29506
G1 X100.755 Y213.753 E.01129
G1 X93.751 Y220.758 E.29506
G1 X93.991 Y221.051 E.01129
G1 X100.996 Y214.046 E.29506
G1 X101.236 Y214.339 E.01129
G1 X94.232 Y221.344 E.29506
G1 X94.472 Y221.636 E.01129
G1 X101.476 Y214.632 E.29506
G1 X101.717 Y214.925 E.01129
G1 X94.712 Y221.929 E.29506
G1 X94.953 Y222.222 E.01129
G1 X101.957 Y215.218 E.29506
G1 X102.197 Y215.511 E.01129
G1 X95.193 Y222.515 E.29506
G1 X95.433 Y222.808 E.01129
G1 X102.438 Y215.804 E.29506
G1 X102.678 Y216.097 E.01129
G1 X95.674 Y223.101 E.29506
G1 X95.914 Y223.394 E.01129
G1 X102.919 Y216.39 E.29506
G1 X103.159 Y216.683 E.01129
G1 X96.155 Y223.687 E.29506
G1 X96.395 Y223.98 E.01129
G1 X103.399 Y216.975 E.29506
G1 X103.64 Y217.268 E.01129
G1 X96.635 Y224.273 E.29506
G1 X96.876 Y224.566 E.01129
G1 X103.88 Y217.561 E.29506
G1 X104.12 Y217.854 E.01129
G1 X97.116 Y224.859 E.29506
G1 X97.356 Y225.151 E.01129
G1 X104.361 Y218.147 E.29506
G1 X104.601 Y218.44 E.01129
G1 X97.597 Y225.444 E.29506
G1 X97.837 Y225.737 E.01129
G1 X104.842 Y218.733 E.29506
G1 X105.082 Y219.026 E.01129
G1 X98.078 Y226.03 E.29506
G1 X98.318 Y226.323 E.01129
G1 X105.322 Y219.319 E.29506
G1 X105.563 Y219.612 E.01129
G1 X98.558 Y226.616 E.29506
G1 X98.799 Y226.909 E.01129
G1 X105.803 Y219.905 E.29506
G1 X106.043 Y220.197 E.01129
G1 X99.039 Y227.202 E.29506
G1 X99.279 Y227.495 E.01129
G1 X106.284 Y220.49 E.29506
G1 X106.524 Y220.783 E.01129
G1 X99.52 Y227.788 E.29506
G1 X99.76 Y228.081 E.01129
G1 X106.765 Y221.076 E.29506
G1 X107.005 Y221.369 E.01129
G1 X100.001 Y228.373 E.29506
G1 X100.241 Y228.666 E.01129
G1 X107.245 Y221.662 E.29506
G1 X107.486 Y221.955 E.01129
G1 X100.481 Y228.959 E.29506
G1 X100.722 Y229.252 E.01129
G1 X107.726 Y222.248 E.29506
G1 X107.966 Y222.541 E.01129
G1 X100.962 Y229.545 E.29506
G1 X101.202 Y229.838 E.01129
G1 X108.207 Y222.834 E.29506
G1 X108.447 Y223.127 E.01129
G1 X101.443 Y230.131 E.29506
G1 X101.683 Y230.424 E.01129
G1 X108.688 Y223.419 E.29506
G1 X108.928 Y223.712 E.01129
G1 X101.924 Y230.717 E.29506
G1 X102.164 Y231.01 E.01129
G1 X109.168 Y224.005 E.29506
G1 X109.409 Y224.298 E.01129
G1 X102.404 Y231.303 E.29506
G1 X102.645 Y231.595 E.01129
G1 X109.649 Y224.591 E.29506
G1 X109.889 Y224.884 E.01129
G1 X102.885 Y231.888 E.29506
G1 X103.125 Y232.181 E.01129
G1 X110.13 Y225.177 E.29506
G1 X110.37 Y225.47 E.01129
G1 X103.366 Y232.474 E.29506
G1 X103.606 Y232.767 E.01129
G1 X110.611 Y225.763 E.29506
G1 X110.851 Y226.056 E.01129
G1 X103.847 Y233.06 E.29506
G1 X104.087 Y233.353 E.01129
G1 X111.091 Y226.349 E.29506
G1 X111.332 Y226.641 E.01129
G1 X104.327 Y233.646 E.29506
G1 X104.568 Y233.939 E.01129
G1 X111.572 Y226.934 E.29506
G1 X111.812 Y227.227 E.01129
G1 X104.808 Y234.232 E.29506
G1 X105.048 Y234.525 E.01129
G1 X112.053 Y227.52 E.29506
G1 X112.293 Y227.813 E.01129
G1 X105.289 Y234.817 E.29506
G1 X105.529 Y235.11 E.01129
G1 X112.534 Y228.106 E.29506
G1 X112.774 Y228.399 E.01129
G1 X105.77 Y235.403 E.29506
G1 X106.01 Y235.696 E.01129
G1 X113.014 Y228.692 E.29506
G1 X113.255 Y228.985 E.01129
G1 X106.25 Y235.989 E.29506
G1 X106.491 Y236.282 E.01129
G1 X113.495 Y229.278 E.29506
G1 X113.735 Y229.571 E.01129
G1 X106.731 Y236.575 E.29506
G1 X106.971 Y236.868 E.01129
G1 X113.976 Y229.864 E.29506
G1 X114.216 Y230.156 E.01129
G1 X107.212 Y237.161 E.29506
G1 X107.452 Y237.454 E.01129
G1 X114.457 Y230.449 E.29506
G1 X114.697 Y230.742 E.01129
G1 X107.693 Y237.747 E.29506
G1 X107.933 Y238.039 E.01129
G1 X114.937 Y231.035 E.29506
G1 X115.178 Y231.328 E.01129
G1 X108.173 Y238.332 E.29506
G1 X108.414 Y238.625 E.01129
G1 X115.418 Y231.621 E.29506
G1 X115.658 Y231.914 E.01129
G1 X108.654 Y238.918 E.29506
G1 X108.894 Y239.211 E.01129
G1 X115.899 Y232.207 E.29506
G1 X116.139 Y232.5 E.01129
G1 X109.135 Y239.504 E.29506
G1 X109.375 Y239.797 E.01129
G1 X116.38 Y232.793 E.29506
G1 X116.62 Y233.086 E.01129
G1 X109.616 Y240.09 E.29506
G1 X109.856 Y240.383 E.01129
G1 X116.86 Y233.378 E.29506
G1 X117.101 Y233.671 E.01129
G1 X110.096 Y240.676 E.29506
G1 X110.337 Y240.969 E.01129
G1 X117.341 Y233.964 E.29506
G1 X117.581 Y234.257 E.01129
G1 X110.577 Y241.261 E.29506
G1 X110.817 Y241.554 E.01129
G1 X117.822 Y234.55 E.29506
G1 X118.062 Y234.843 E.01129
G1 X111.058 Y241.847 E.29506
G1 X111.298 Y242.14 E.01129
G1 X118.303 Y235.136 E.29506
G1 X118.543 Y235.429 E.01129
G1 X111.539 Y242.433 E.29506
G1 X111.779 Y242.726 E.01129
G1 X118.783 Y235.722 E.29506
G1 X119.024 Y236.015 E.01129
G1 X112.019 Y243.019 E.29506
G1 X112.26 Y243.312 E.01129
G1 X119.264 Y236.308 E.29506
G1 X119.504 Y236.6 E.01129
G1 X112.5 Y243.605 E.29506
M73 P22 R37
G1 X112.74 Y243.898 E.01129
G1 X119.745 Y236.893 E.29506
G1 X119.985 Y237.186 E.01129
G1 X112.981 Y244.191 E.29506
G1 X113.087 Y244.32 E.00498
G1 X114.779 Y242.925 E.06532
G1 X120.226 Y237.479 E.22943
G1 X120.466 Y237.772 E.01129
G1 X116.558 Y241.68 E.16461
G1 X20.076 Y131.247 F30000
G1 F9546.792
G1 X22.936 Y128.387 E.12047
G1 X26.013 Y125.843 E.11892
G1 X20.437 Y131.42 E.23491
G1 X20.677 Y131.713 E.01129
G1 X28.976 Y123.413 E.34964
G2 X31.984 Y120.939 I-286.218 J-350.974 E.11601
G1 X20.916 Y132.007 E.46623
G1 X21.156 Y132.3 E.01129
G1 X35.011 Y118.445 E.58363
G1 X38.038 Y115.952 E.11682
G1 X21.396 Y132.593 E.70104
G1 X21.636 Y132.887 E.01129
G1 X41.065 Y113.458 E.81844
G1 X44.091 Y110.965 E.11682
G1 X21.876 Y133.18 E.93585
G1 X22.116 Y133.474 E.01129
G1 X47.118 Y108.471 E1.05325
G1 X50.145 Y105.978 E.11682
G1 X22.355 Y133.767 E1.17066
G1 X22.595 Y134.061 E.01129
G1 X53.172 Y103.484 E1.28806
G1 X56.199 Y100.99 E.11682
G1 X22.835 Y134.354 E1.40547
G1 X23.075 Y134.648 E.01129
G1 X59.226 Y98.497 E1.52288
G1 X62.253 Y96.003 E.11682
G1 X23.315 Y134.941 E1.64028
G1 X23.555 Y135.234 E.01129
G1 X65.279 Y93.51 E1.75769
G1 X68.306 Y91.016 E.11682
G1 X23.794 Y135.528 E1.87509
G1 X24.034 Y135.821 E.01129
G1 X71.333 Y88.523 E1.9925
G1 X74.36 Y86.029 E.11682
G1 X24.274 Y136.115 E2.1099
G1 X24.514 Y136.408 E.01129
G1 X77.387 Y83.535 E2.22731
G1 X80.414 Y81.042 E.11682
G1 X24.754 Y136.702 E2.34471
G1 X24.994 Y136.995 E.01129
G1 X83.441 Y78.548 E2.46212
G1 X86.467 Y76.055 E.11682
G1 X25.233 Y137.289 E2.57952
G2 X25.475 Y137.581 I21.048 J-17.127 E.01128
G1 X89.494 Y73.561 E2.69687
G1 X92.521 Y71.068 E.11682
G1 X25.716 Y137.872 E2.8142
G1 X25.958 Y138.164 E.01128
G1 X95.548 Y68.574 E2.93152
M73 P23 R37
G1 X98.575 Y66.08 E.11682
G1 X26.2 Y138.455 E3.04885
G1 X26.442 Y138.747 E.01128
G1 X101.602 Y63.587 E3.16617
G1 X104.628 Y61.093 E.11682
G1 X26.683 Y139.039 E3.2835
G1 X26.925 Y139.33 E.01128
G1 X107.655 Y58.6 E3.40082
G1 X110.682 Y56.106 E.11682
G1 X27.167 Y139.622 E3.51815
G1 X27.407 Y139.914 E.01129
G1 X113.709 Y53.613 E3.63553
G1 X116.736 Y51.119 E.11682
G1 X27.648 Y140.207 E3.75291
G1 X27.888 Y140.5 E.01129
G1 X119.763 Y48.626 E3.8703
G1 X122.79 Y46.132 E.11682
G1 X28.008 Y140.914 E3.99276
; WIPE_START
G1 X29.422 Y139.5 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X34.993 Y134.282 Z.8 F30000
G1 X37.829 Y131.626 Z.8
G1 Z.4
G1 E.8 F1800
G1 F9546.792
G1 X125.816 Y43.638 E3.70653
G1 X128.843 Y41.145 E.11682
G1 X42.104 Y127.884 E3.65397
G1 X45.131 Y125.391 E.11682
G1 X131.87 Y38.651 E3.65397
G1 X134.897 Y36.158 E.11682
G1 X48.158 Y122.897 E3.65397
G1 X51.184 Y120.404 E.11682
G1 X137.924 Y33.664 E3.65397
G1 X140.951 Y31.171 E.11682
G1 X54.211 Y117.91 E3.65397
G1 X57.238 Y115.417 E.11682
G1 X142.296 Y30.359 E3.58312
G1 X142.536 Y30.652 E.01129
G1 X60.265 Y112.923 E3.46573
G1 X63.292 Y110.429 E.11682
G1 X142.776 Y30.945 E3.34835
G1 X143.017 Y31.238 E.01129
G1 X66.319 Y107.936 E3.23097
G1 X69.345 Y105.442 E.11682
G1 X143.257 Y31.531 E3.11359
G1 X143.498 Y31.823 E.01129
G1 X72.372 Y102.949 E2.9962
G1 X75.399 Y100.455 E.11682
G1 X143.738 Y32.116 E2.87882
G1 X143.978 Y32.409 E.01129
G1 X78.426 Y97.962 E2.76144
G1 X81.453 Y95.468 E.11682
G1 X144.219 Y32.702 E2.64406
G1 X144.459 Y32.995 E.01129
G1 X84.48 Y92.974 E2.52668
G1 X87.507 Y90.481 E.11682
G1 X144.699 Y33.288 E2.40929
G1 X144.94 Y33.581 E.01129
G1 X90.533 Y87.987 E2.29191
G1 X93.56 Y85.494 E.11682
G1 X145.18 Y33.874 E2.17453
G1 X145.421 Y34.167 E.01129
G1 X96.587 Y83 E2.05715
G1 X99.614 Y80.507 E.11682
G1 X145.661 Y34.46 E1.93976
G1 X145.901 Y34.753 E.01129
G1 X102.641 Y78.013 E1.82238
G1 X105.668 Y75.519 E.11682
G1 X146.142 Y35.045 E1.705
G1 X146.382 Y35.338 E.01129
G1 X108.695 Y73.026 E1.58762
G1 X111.721 Y70.532 E.11682
G1 X146.622 Y35.631 E1.47023
G1 X146.863 Y35.924 E.01129
G1 X114.748 Y68.039 E1.35285
G1 X117.775 Y65.545 E.11682
G1 X147.103 Y36.217 E1.23547
G1 X147.344 Y36.51 E.01129
G1 X120.802 Y63.052 E1.11809
G1 X123.829 Y60.558 E.11682
G1 X147.584 Y36.803 E1.0007
G1 X147.824 Y37.096 E.01129
G1 X126.856 Y58.065 E.88332
G1 X129.882 Y55.571 E.11682
G1 X148.065 Y37.389 E.76594
G1 X148.305 Y37.682 E.01129
G1 X132.909 Y53.077 E.64856
G1 X135.936 Y50.584 E.11682
G1 X148.545 Y37.975 E.53118
G1 X148.786 Y38.267 E.01129
G1 X138.963 Y48.09 E.41379
G1 X141.99 Y45.597 E.11682
G1 X149.026 Y38.56 E.29641
G1 X149.267 Y38.853 E.01129
G1 X142.782 Y45.337 E.27315
G1 X143.023 Y45.63 E.01129
G1 X149.507 Y39.146 E.27315
G1 X149.747 Y39.439 E.01129
G1 X143.263 Y45.923 E.27315
G1 X143.504 Y46.216 E.01129
G1 X149.988 Y39.732 E.27315
G1 X150.228 Y40.025 E.01129
G1 X143.744 Y46.509 E.27315
G1 X143.984 Y46.802 E.01129
G1 X150.468 Y40.318 E.27315
G1 X150.709 Y40.611 E.01129
G1 X144.225 Y47.095 E.27315
G1 X144.465 Y47.388 E.01129
G1 X150.949 Y40.904 E.27315
G1 X151.19 Y41.197 E.01129
G1 X144.705 Y47.681 E.27315
G1 X144.946 Y47.974 E.01129
G1 X151.43 Y41.489 E.27315
M73 P24 R37
G1 X151.67 Y41.782 E.01129
G1 X145.186 Y48.267 E.27315
G1 X145.427 Y48.559 E.01129
G1 X151.911 Y42.075 E.27315
G1 X152.151 Y42.368 E.01129
G1 X145.667 Y48.852 E.27315
G1 X145.907 Y49.145 E.01129
G1 X152.391 Y42.661 E.27315
G1 X152.632 Y42.954 E.01129
G1 X146.148 Y49.438 E.27315
G1 X146.388 Y49.731 E.01129
G1 X152.872 Y43.247 E.27315
G1 X153.113 Y43.54 E.01129
G1 X146.628 Y50.024 E.27315
G1 X146.869 Y50.317 E.01129
G1 X153.353 Y43.833 E.27315
G1 X153.593 Y44.126 E.01129
G1 X147.109 Y50.61 E.27315
G1 X147.35 Y50.903 E.01129
G1 X153.834 Y44.419 E.27315
G1 X154.074 Y44.711 E.01129
G1 X147.59 Y51.196 E.27315
G1 X147.83 Y51.489 E.01129
G1 X154.314 Y45.004 E.27315
G1 X154.555 Y45.297 E.01129
G1 X148.071 Y51.782 E.27315
G1 X148.311 Y52.074 E.01129
G1 X154.795 Y45.59 E.27315
G1 X155.036 Y45.883 E.01129
G1 X148.551 Y52.367 E.27315
G1 X148.792 Y52.66 E.01129
G1 X155.276 Y46.176 E.27315
G1 X155.516 Y46.469 E.01129
G1 X149.032 Y52.953 E.27315
G1 X149.273 Y53.246 E.01129
G1 X155.757 Y46.762 E.27315
G1 X155.997 Y47.055 E.01129
G1 X149.513 Y53.539 E.27315
G1 X149.753 Y53.832 E.01129
G1 X156.237 Y47.348 E.27315
G1 X156.478 Y47.641 E.01129
G1 X149.994 Y54.125 E.27315
G1 X150.234 Y54.418 E.01129
G1 X156.718 Y47.934 E.27315
G1 X156.959 Y48.226 E.01129
G1 X150.474 Y54.711 E.27315
G1 X150.715 Y55.004 E.01129
G1 X157.199 Y48.519 E.27315
G1 X157.439 Y48.812 E.01129
G1 X150.955 Y55.296 E.27315
G1 X151.196 Y55.589 E.01129
G1 X157.68 Y49.105 E.27315
G1 X157.92 Y49.398 E.01129
G1 X151.436 Y55.882 E.27315
G1 X151.676 Y56.175 E.01129
G1 X158.16 Y49.691 E.27315
G1 X158.401 Y49.984 E.01129
G1 X151.917 Y56.468 E.27315
G1 X152.157 Y56.761 E.01129
G1 X158.641 Y50.277 E.27315
G1 X158.882 Y50.57 E.01129
G1 X152.397 Y57.054 E.27315
G1 X152.638 Y57.347 E.01129
G1 X159.122 Y50.863 E.27315
G1 X159.362 Y51.156 E.01129
G1 X152.878 Y57.64 E.27315
G1 X153.119 Y57.933 E.01129
G1 X159.603 Y51.448 E.27315
G1 X159.843 Y51.741 E.01129
G1 X153.359 Y58.226 E.27315
G1 X153.599 Y58.518 E.01129
G1 X160.083 Y52.034 E.27315
G1 X160.324 Y52.327 E.01129
G1 X153.84 Y58.811 E.27315
G1 X154.08 Y59.104 E.01129
G1 X160.564 Y52.62 E.27315
G1 X160.805 Y52.913 E.01129
G1 X154.32 Y59.397 E.27315
G1 X154.561 Y59.69 E.01129
G1 X161.045 Y53.206 E.27315
G1 X161.285 Y53.499 E.01129
G1 X154.801 Y59.983 E.27315
G1 X155.042 Y60.276 E.01129
G1 X161.526 Y53.792 E.27315
G1 X161.766 Y54.085 E.01129
G1 X155.282 Y60.569 E.27315
G1 X155.522 Y60.862 E.01129
G1 X162.006 Y54.378 E.27315
G1 X162.247 Y54.67 E.01129
G1 X155.763 Y61.155 E.27315
G1 X156.003 Y61.448 E.01129
G1 X162.487 Y54.963 E.27315
G1 X162.728 Y55.256 E.01129
G1 X156.243 Y61.74 E.27315
G1 X156.484 Y62.033 E.01129
G1 X162.968 Y55.549 E.27315
G1 X163.208 Y55.842 E.01129
G1 X156.724 Y62.326 E.27315
G1 X156.965 Y62.619 E.01129
G1 X163.449 Y56.135 E.27315
G1 X163.689 Y56.428 E.01129
G1 X157.205 Y62.912 E.27315
G1 X157.445 Y63.205 E.01129
G1 X163.929 Y56.721 E.27315
G1 X164.17 Y57.014 E.01129
G1 X157.686 Y63.498 E.27315
G1 X157.926 Y63.791 E.01129
G1 X164.41 Y57.307 E.27315
G1 X164.651 Y57.6 E.01129
G1 X158.166 Y64.084 E.27315
G1 X158.407 Y64.377 E.01129
G1 X164.891 Y57.892 E.27315
G1 X165.131 Y58.185 E.01129
G1 X158.647 Y64.67 E.27315
G1 X158.888 Y64.962 E.01129
G1 X165.372 Y58.478 E.27315
G1 X165.612 Y58.771 E.01129
G1 X159.128 Y65.255 E.27315
G1 X159.368 Y65.548 E.01129
G1 X165.852 Y59.064 E.27315
G1 X166.093 Y59.357 E.01129
G1 X159.609 Y65.841 E.27315
G1 X159.849 Y66.134 E.01129
G1 X166.333 Y59.65 E.27315
G1 X166.574 Y59.943 E.01129
G1 X160.089 Y66.427 E.27315
G1 X160.33 Y66.72 E.01129
G1 X166.814 Y60.236 E.27315
G1 X167.054 Y60.529 E.01129
G1 X160.57 Y67.013 E.27315
G1 X160.811 Y67.306 E.01129
G1 X167.295 Y60.822 E.27315
G1 X167.535 Y61.114 E.01129
G1 X161.051 Y67.599 E.27315
G1 X161.291 Y67.892 E.01129
G1 X167.775 Y61.407 E.27315
G1 X168.016 Y61.7 E.01129
G1 X161.532 Y68.184 E.27315
G1 X161.772 Y68.477 E.01129
G1 X168.256 Y61.993 E.27315
G1 X168.497 Y62.286 E.01129
G1 X162.012 Y68.77 E.27315
G1 X162.253 Y69.063 E.01129
G1 X168.737 Y62.579 E.27315
G1 X168.977 Y62.872 E.01129
G1 X162.493 Y69.356 E.27315
G1 X162.734 Y69.649 E.01129
G1 X169.218 Y63.165 E.27315
G1 X169.458 Y63.458 E.01129
G1 X162.974 Y69.942 E.27315
G1 X163.214 Y70.235 E.01129
G1 X169.699 Y63.751 E.27315
G1 X169.939 Y64.044 E.01129
G1 X163.455 Y70.528 E.27315
G1 X163.695 Y70.821 E.01129
G1 X170.179 Y64.336 E.27315
G1 X170.42 Y64.629 E.01129
G1 X163.935 Y71.114 E.27315
G1 X164.176 Y71.407 E.01129
G1 X170.66 Y64.922 E.27315
G1 X170.9 Y65.215 E.01129
G1 X164.416 Y71.699 E.27315
G1 X164.657 Y71.992 E.01129
G1 X171.141 Y65.508 E.27315
G1 X171.381 Y65.801 E.01129
G1 X164.897 Y72.285 E.27315
G1 X165.137 Y72.578 E.01129
G1 X171.622 Y66.094 E.27315
G1 X171.862 Y66.387 E.01129
G1 X165.378 Y72.871 E.27315
G1 X165.618 Y73.164 E.01129
G1 X172.102 Y66.68 E.27315
G1 X172.343 Y66.973 E.01129
G1 X165.858 Y73.457 E.27315
G1 X166.099 Y73.75 E.01129
G1 X172.583 Y67.266 E.27315
G1 X172.823 Y67.559 E.01129
G1 X166.339 Y74.043 E.27315
G1 X166.58 Y74.336 E.01129
G1 X173.064 Y67.851 E.27315
G1 X173.304 Y68.144 E.01129
G1 X166.82 Y74.629 E.27315
G1 X167.06 Y74.921 E.01129
G1 X173.545 Y68.437 E.27315
G1 X173.785 Y68.73 E.01129
G1 X167.301 Y75.214 E.27315
G1 X167.541 Y75.507 E.01129
G1 X174.025 Y69.023 E.27315
G1 X174.266 Y69.316 E.01129
G1 X167.781 Y75.8 E.27315
G1 X168.022 Y76.093 E.01129
G1 X174.506 Y69.609 E.27315
G1 X174.746 Y69.902 E.01129
G1 X168.262 Y76.386 E.27315
G1 X168.503 Y76.679 E.01129
G1 X174.987 Y70.195 E.27315
G1 X175.227 Y70.488 E.01129
G1 X168.743 Y76.972 E.27315
G1 X168.983 Y77.265 E.01129
G1 X175.468 Y70.781 E.27315
G1 X175.708 Y71.073 E.01129
G1 X169.224 Y77.558 E.27315
G1 X169.464 Y77.851 E.01129
G1 X175.948 Y71.366 E.27315
G1 X176.189 Y71.659 E.01129
G1 X169.704 Y78.143 E.27315
G1 X169.945 Y78.436 E.01129
G1 X176.429 Y71.952 E.27315
G1 X176.669 Y72.245 E.01129
G1 X170.185 Y78.729 E.27315
G1 X170.426 Y79.022 E.01129
G1 X176.91 Y72.538 E.27315
G1 X177.15 Y72.831 E.01129
G1 X170.666 Y79.315 E.27315
G1 X170.906 Y79.608 E.01129
G1 X177.391 Y73.124 E.27315
G1 X177.631 Y73.417 E.01129
G1 X171.147 Y79.901 E.27315
G1 X171.387 Y80.194 E.01129
G1 X177.871 Y73.71 E.27315
G1 X178.112 Y74.003 E.01129
G1 X171.627 Y80.487 E.27315
G1 X171.868 Y80.78 E.01129
G1 X178.352 Y74.295 E.27315
G1 X178.592 Y74.588 E.01129
G1 X172.108 Y81.073 E.27315
G1 X172.349 Y81.365 E.01129
G1 X178.833 Y74.881 E.27315
G1 X179.073 Y75.174 E.01129
G1 X172.589 Y81.658 E.27315
G1 X172.829 Y81.951 E.01129
G1 X179.314 Y75.467 E.27315
G1 X179.554 Y75.76 E.01129
G1 X173.07 Y82.244 E.27315
G1 X173.31 Y82.537 E.01129
G1 X179.794 Y76.053 E.27315
G1 X180.035 Y76.346 E.01129
G1 X173.55 Y82.83 E.27315
G1 X173.791 Y83.123 E.01129
G1 X180.275 Y76.639 E.27315
G1 X180.515 Y76.932 E.01129
G1 X174.031 Y83.416 E.27315
G1 X174.272 Y83.709 E.01129
G1 X180.756 Y77.225 E.27315
G1 X180.996 Y77.517 E.01129
G1 X174.512 Y84.002 E.27315
G1 X174.752 Y84.295 E.01129
G1 X181.237 Y77.81 E.27315
G1 X181.477 Y78.103 E.01129
G1 X174.993 Y84.587 E.27315
G1 X175.233 Y84.88 E.01129
G1 X181.717 Y78.396 E.27315
G1 X181.958 Y78.689 E.01129
G1 X175.473 Y85.173 E.27315
G1 X175.714 Y85.466 E.01129
G1 X182.198 Y78.982 E.27315
G1 X182.438 Y79.275 E.01129
G1 X175.954 Y85.759 E.27315
G1 X176.195 Y86.052 E.01129
G1 X182.679 Y79.568 E.27315
G1 X182.919 Y79.861 E.01129
G1 X176.435 Y86.345 E.27315
G1 X176.675 Y86.638 E.01129
G1 X183.16 Y80.154 E.27315
G1 X183.4 Y80.447 E.01129
G1 X176.916 Y86.931 E.27315
G1 X177.156 Y87.224 E.01129
G1 X183.64 Y80.739 E.27315
G1 X183.881 Y81.032 E.01129
G1 X177.396 Y87.517 E.27315
G1 X177.481 Y87.619 E.00396
G1 X179.446 Y86.001 E.07584
G1 X184.121 Y81.325 E.19695
G1 X184.361 Y81.618 E.01129
G1 X181.225 Y84.755 E.13213
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9546.792
G1 X182.639 Y83.341 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/75
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X112.787 Y244.999 E.34902
G1 X26.662 Y140.051 E4.36564
G1 X19.02 Y130.773 E.3865
G1 X29.049 Y122.537 E.41731
G1 X142.006 Y29.481 E4.70613
G1 X142.242 Y29.768 E.01195
G1 X184.993 Y81.862 E2.16702
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X113.573 Y244.859 E.31424
G1 X113.264 Y245.113 E.01191
G1 F7558.064
G1 X112.955 Y245.368 E.01191
G1 F2400
G1 X112.733 Y245.551 E.00859
G1 F600
G1 X26.74 Y140.764 E4.03772
G2 X24.248 Y137.74 I-984.428 J808.56 E.11672
G1 X22.519 Y135.642 E.08098
G1 X20.789 Y133.545 E.08098
G3 X18.85 Y131.183 I762.916 J-628.644 E.09102
G1 X18.469 Y130.72 E.01787
G1 X21.02 Y128.618 E.09844
G1 F720
G1 X23.768 Y126.363 E.10588
G1 F840
G1 X26.052 Y124.489 E.08801
G1 F960
G1 X28.8 Y122.234 E.10588
G1 F840
G1 X142.06 Y28.929 E4.371
G1 F1200
G1 X142.091 Y28.966 E.00142
G1 F2880
G1 X142.224 Y29.129 E.00628
G1 F8392.935
G1 X142.478 Y29.438 E.01191
G1 F9547.055
G1 X142.732 Y29.747 E.01191
G1 X185.544 Y81.916 E2.01022
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X41.744 Y141.568 Z1 F30000
G1 X113.235 Y244.417 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42007
G1 F9545.273
G1 X110.48 Y241.662 E.11609
G1 X108.039 Y238.688 E.11461
G1 X113.407 Y244.056 E.22616
G1 X113.7 Y243.815 E.01129
G1 X105.599 Y235.714 E.3413
G1 X103.158 Y232.74 E.11461
G1 X113.992 Y243.574 E.45645
G1 X114.284 Y243.333 E.01129
G1 X100.718 Y229.767 E.57159
G1 X98.277 Y226.793 E.11461
G1 X114.577 Y243.092 E.68673
G1 X114.869 Y242.851 E.01129
G1 X95.837 Y223.819 E.80188
G1 X93.397 Y220.845 E.11461
G1 X115.162 Y242.61 E.91702
G1 X115.454 Y242.369 E.01129
G1 X90.956 Y217.871 E1.03217
M73 P25 R36
G1 X88.516 Y214.898 E.11461
G1 X115.747 Y242.129 E1.14731
G1 X116.039 Y241.888 E.01129
G1 X86.075 Y211.924 E1.26245
G1 X83.635 Y208.95 E.11461
G1 X116.332 Y241.647 E1.3776
G1 X116.624 Y241.406 E.01129
G1 X81.194 Y205.976 E1.49274
G1 X78.754 Y203.002 E.11461
G1 X116.916 Y241.165 E1.60788
G1 X117.209 Y240.924 E.01129
G1 X76.313 Y200.028 E1.72303
G1 X73.873 Y197.055 E.11461
G1 X117.501 Y240.683 E1.83817
G1 X117.794 Y240.442 E.01129
G1 X71.432 Y194.081 E1.95331
G1 X68.992 Y191.107 E.11461
G1 X118.086 Y240.201 E2.06846
G1 X118.379 Y239.96 E.01129
G1 X66.552 Y188.133 E2.1836
G1 X64.111 Y185.159 E.11461
G1 X118.671 Y239.719 E2.29875
G1 X118.964 Y239.478 E.01129
G1 X61.671 Y182.185 E2.41389
G1 X59.23 Y179.212 E.11461
G1 X119.256 Y239.237 E2.52903
G1 X119.548 Y238.997 E.01129
G1 X56.79 Y176.238 E2.64418
G1 X54.349 Y173.264 E.11461
G1 X119.841 Y238.756 E2.75932
G1 X120.133 Y238.515 E.01129
G1 X51.909 Y170.29 E2.87446
G1 X49.468 Y167.316 E.11461
G1 X120.426 Y238.274 E2.98961
G1 X120.695 Y238.052 E.01041
G1 X120.504 Y237.819 E.00896
G1 X47.028 Y164.343 E3.09574
G1 X44.588 Y161.369 E.11461
G1 X118.064 Y234.845 E3.09574
G1 X115.624 Y231.871 E.11461
G1 X42.147 Y158.395 E3.09574
G1 X39.707 Y155.421 E.11461
G1 X113.183 Y228.898 E3.09574
G1 X110.743 Y225.924 E.11461
G1 X37.266 Y152.447 E3.09574
G1 X34.826 Y149.473 E.11461
G1 X108.302 Y222.95 E3.09574
G1 X105.862 Y219.976 E.11461
G1 X32.385 Y146.5 E3.09574
G1 X29.945 Y143.526 E.11461
G1 X103.421 Y217.002 E3.09574
G1 X100.981 Y214.028 E.11461
G1 X27.504 Y140.552 E3.09574
G2 X25.025 Y137.539 I-837.309 J686.535 E.11623
G1 X98.54 Y211.055 E3.09737
G1 X96.1 Y208.081 E.11461
G1 X22.534 Y134.515 E3.09952
G1 X20.042 Y131.49 E.11675
G1 X93.659 Y205.107 E3.10166
G1 X91.219 Y202.133 E.11461
G1 X19.718 Y130.632 E3.01252
G1 X20.011 Y130.391 E.01129
G1 X88.778 Y199.159 E2.89736
G1 X86.338 Y196.185 E.11461
G1 X20.303 Y130.151 E2.7822
G1 X20.596 Y129.91 E.01129
G1 X83.898 Y193.212 E2.66704
G1 X81.457 Y190.238 E.11461
G1 X20.889 Y129.67 E2.55188
G1 X21.182 Y129.429 E.01129
G1 X79.017 Y187.264 E2.43671
G1 X76.576 Y184.29 E.11461
G1 X21.475 Y129.189 E2.32155
G1 X21.768 Y128.948 E.01129
G1 X74.136 Y181.316 E2.20639
G1 X71.695 Y178.342 E.11461
G1 X22.061 Y128.708 E2.09123
G1 X22.353 Y128.467 E.01129
G1 X69.255 Y175.369 E1.97607
G1 X66.814 Y172.395 E.11461
M73 P26 R36
G1 X22.646 Y128.227 E1.86091
G1 X22.939 Y127.986 E.01129
G1 X64.374 Y169.421 E1.74575
G1 X61.933 Y166.447 E.11461
G1 X23.232 Y127.746 E1.63058
G1 X23.525 Y127.505 E.01129
G1 X59.493 Y163.473 E1.51542
G1 X57.052 Y160.499 E.11461
G1 X23.818 Y127.265 E1.40026
G1 X24.111 Y127.024 E.01129
G1 X54.612 Y157.526 E1.2851
G1 X52.172 Y154.552 E.11461
G1 X24.403 Y126.784 E1.16994
G1 X24.696 Y126.543 E.01129
G1 X49.731 Y151.578 E1.05478
G1 X47.291 Y148.604 E.11461
G1 X24.989 Y126.303 E.93962
G1 X25.282 Y126.062 E.01129
G1 X44.85 Y145.63 E.82445
G1 X42.41 Y142.656 E.11461
G1 X25.575 Y125.822 E.70929
G1 X25.868 Y125.581 E.01129
G1 X39.969 Y139.683 E.59413
G1 X37.529 Y136.709 E.11461
G1 X26.161 Y125.341 E.47897
G1 X26.453 Y125.1 E.01129
G1 X35.088 Y133.735 E.36381
G1 X35.053 Y133.692 E.00163
G1 X35.342 Y133.455 E.01113
G1 X26.746 Y124.859 E.36215
G1 X27.039 Y124.619 E.01129
G1 X35.634 Y133.214 E.36213
G1 X35.927 Y132.973 E.01129
G1 X27.332 Y124.378 E.36211
G1 X27.625 Y124.138 E.01129
G1 X36.219 Y132.732 E.3621
G1 X36.512 Y132.491 E.01129
G1 X27.918 Y123.897 E.36208
G1 X28.211 Y123.657 E.01129
G1 X36.804 Y132.25 E.36206
G1 X37.096 Y132.009 E.01129
G1 X28.503 Y123.416 E.36205
G1 X28.796 Y123.176 E.01129
G1 X37.389 Y131.769 E.36203
G1 X37.681 Y131.528 E.01129
G1 X29.089 Y122.935 E.36201
G1 X29.382 Y122.695 E.01129
G1 X37.974 Y131.287 E.362
G1 X38.266 Y131.046 E.01129
G1 X29.674 Y122.454 E.362
G1 X29.967 Y122.213 E.01129
G1 X38.559 Y130.805 E.362
G1 X38.851 Y130.564 E.01129
G1 X30.259 Y121.972 E.362
G1 X30.552 Y121.731 E.01129
G1 X39.144 Y130.323 E.362
G1 X39.436 Y130.082 E.01129
G1 X30.844 Y121.49 E.362
G1 X31.136 Y121.249 E.01129
G1 X39.728 Y129.841 E.362
G1 X40.021 Y129.6 E.01129
G1 X31.429 Y121.008 E.362
G1 X31.721 Y120.767 E.01129
G1 X40.313 Y129.359 E.362
G1 X40.606 Y129.118 E.01129
G1 X32.014 Y120.526 E.362
G1 X32.306 Y120.285 E.01129
G1 X40.898 Y128.877 E.362
G1 X41.191 Y128.637 E.01129
G1 X32.599 Y120.045 E.362
G1 X32.891 Y119.804 E.01129
G1 X41.483 Y128.396 E.362
G1 X41.776 Y128.155 E.01129
G1 X33.184 Y119.563 E.362
G1 X33.476 Y119.322 E.01129
G1 X42.068 Y127.914 E.362
G1 X42.361 Y127.673 E.01129
G1 X33.769 Y119.081 E.362
G1 X34.061 Y118.84 E.01129
G1 X42.653 Y127.432 E.362
G1 X42.945 Y127.191 E.01129
G1 X34.353 Y118.599 E.362
G1 X34.646 Y118.358 E.01129
G1 X43.238 Y126.95 E.362
G1 X43.53 Y126.709 E.01129
G1 X34.938 Y118.117 E.362
G1 X35.231 Y117.876 E.01129
G1 X43.823 Y126.468 E.362
G1 X44.115 Y126.227 E.01129
G1 X35.523 Y117.635 E.362
G1 X35.816 Y117.394 E.01129
G1 X44.408 Y125.986 E.362
G1 X44.7 Y125.745 E.01129
G1 X36.108 Y117.153 E.362
G1 X36.401 Y116.913 E.01129
G1 X44.993 Y125.505 E.362
G1 X45.285 Y125.264 E.01129
G1 X36.693 Y116.672 E.362
G1 X36.985 Y116.431 E.01129
G1 X45.577 Y125.023 E.362
G1 X45.87 Y124.782 E.01129
G1 X37.278 Y116.19 E.362
G1 X37.57 Y115.949 E.01129
G1 X46.162 Y124.541 E.362
G1 X46.455 Y124.3 E.01129
G1 X37.863 Y115.708 E.362
G1 X38.155 Y115.467 E.01129
G1 X46.747 Y124.059 E.362
G1 X47.04 Y123.818 E.01129
G1 X38.448 Y115.226 E.362
G1 X38.74 Y114.985 E.01129
G1 X47.332 Y123.577 E.362
G1 X47.625 Y123.336 E.01129
G1 X39.033 Y114.744 E.362
G1 X39.325 Y114.503 E.01129
G1 X47.917 Y123.095 E.362
G1 X48.209 Y122.854 E.01129
G1 X39.617 Y114.262 E.362
G1 X39.91 Y114.021 E.01129
G1 X48.502 Y122.613 E.362
G1 X48.794 Y122.373 E.01129
G1 X40.202 Y113.781 E.362
G1 X40.495 Y113.54 E.01129
G1 X49.087 Y122.132 E.362
G1 X49.379 Y121.891 E.01129
G1 X40.787 Y113.299 E.362
G1 X41.08 Y113.058 E.01129
G1 X49.672 Y121.65 E.362
G1 X49.964 Y121.409 E.01129
G1 X41.372 Y112.817 E.362
G1 X41.665 Y112.576 E.01129
G1 X50.257 Y121.168 E.362
G1 X50.549 Y120.927 E.01129
G1 X41.957 Y112.335 E.362
G1 X42.25 Y112.094 E.01129
G1 X50.842 Y120.686 E.362
G1 X51.134 Y120.445 E.01129
G1 X42.542 Y111.853 E.362
G1 X42.834 Y111.612 E.01129
G1 X51.426 Y120.204 E.362
G1 X51.719 Y119.963 E.01129
G1 X43.127 Y111.371 E.362
G1 X43.419 Y111.13 E.01129
G1 X52.011 Y119.722 E.362
G1 X52.304 Y119.481 E.01129
G1 X43.712 Y110.889 E.362
G1 X44.004 Y110.649 E.01129
G1 X52.596 Y119.241 E.362
G1 X52.889 Y119 E.01129
G1 X44.297 Y110.408 E.362
G1 X44.589 Y110.167 E.01129
G1 X53.181 Y118.759 E.362
G1 X53.474 Y118.518 E.01129
G1 X44.882 Y109.926 E.362
G1 X45.174 Y109.685 E.01129
G1 X53.766 Y118.277 E.362
G1 X54.058 Y118.036 E.01129
G1 X45.466 Y109.444 E.362
G1 X45.759 Y109.203 E.01129
G1 X54.351 Y117.795 E.362
G1 X54.643 Y117.554 E.01129
G1 X46.051 Y108.962 E.362
G1 X46.344 Y108.721 E.01129
G1 X54.936 Y117.313 E.362
G1 X55.228 Y117.072 E.01129
G1 X46.636 Y108.48 E.362
G1 X46.929 Y108.239 E.01129
G1 X55.521 Y116.831 E.362
G1 X55.813 Y116.59 E.01129
G1 X47.221 Y107.998 E.362
G1 X47.514 Y107.757 E.01129
G1 X56.106 Y116.349 E.362
G1 X56.398 Y116.109 E.01129
G1 X47.806 Y107.517 E.362
G1 X48.098 Y107.276 E.01129
G1 X56.69 Y115.868 E.362
G1 X56.983 Y115.627 E.01129
G1 X48.391 Y107.035 E.362
G1 X48.683 Y106.794 E.01129
G1 X57.275 Y115.386 E.362
G1 X57.568 Y115.145 E.01129
G1 X48.976 Y106.553 E.362
G1 X49.268 Y106.312 E.01129
G1 X57.86 Y114.904 E.362
G1 X58.153 Y114.663 E.01129
G1 X49.561 Y106.071 E.362
G1 X49.853 Y105.83 E.01129
G1 X58.445 Y114.422 E.362
G1 X58.738 Y114.181 E.01129
G1 X50.146 Y105.589 E.362
G1 X50.438 Y105.348 E.01129
G1 X59.03 Y113.94 E.362
G1 X59.322 Y113.699 E.01129
G1 X50.73 Y105.107 E.362
G1 X51.023 Y104.866 E.01129
G1 X59.615 Y113.458 E.362
G1 X59.907 Y113.217 E.01129
G1 X51.315 Y104.625 E.362
G1 X51.608 Y104.385 E.01129
G1 X60.2 Y112.977 E.362
G1 X60.492 Y112.736 E.01129
G1 X51.9 Y104.144 E.362
G1 X52.193 Y103.903 E.01129
G1 X60.785 Y112.495 E.362
G1 X61.077 Y112.254 E.01129
G1 X52.485 Y103.662 E.362
G1 X52.778 Y103.421 E.01129
G1 X61.37 Y112.013 E.362
G1 X61.662 Y111.772 E.01129
G1 X53.07 Y103.18 E.362
G1 X53.363 Y102.939 E.01129
G1 X61.955 Y111.531 E.362
G1 X62.247 Y111.29 E.01129
G1 X53.655 Y102.698 E.362
G1 X53.947 Y102.457 E.01129
G1 X62.539 Y111.049 E.362
G1 X62.832 Y110.808 E.01129
G1 X54.24 Y102.216 E.362
G1 X54.532 Y101.975 E.01129
G1 X63.124 Y110.567 E.362
G1 X63.417 Y110.326 E.01129
G1 X54.825 Y101.734 E.362
G1 X55.117 Y101.493 E.01129
G1 X63.709 Y110.085 E.362
G1 X64.002 Y109.845 E.01129
G1 X55.41 Y101.253 E.362
G1 X55.702 Y101.012 E.01129
G1 X64.294 Y109.604 E.362
G1 X64.587 Y109.363 E.01129
G1 X55.995 Y100.771 E.362
G1 X56.287 Y100.53 E.01129
G1 X64.879 Y109.122 E.362
G1 X65.171 Y108.881 E.01129
G1 X56.579 Y100.289 E.362
G1 X56.872 Y100.048 E.01129
G1 X65.464 Y108.64 E.362
G1 X65.756 Y108.399 E.01129
G1 X57.164 Y99.807 E.362
G1 X57.457 Y99.566 E.01129
G1 X66.049 Y108.158 E.362
G1 X66.341 Y107.917 E.01129
G1 X57.749 Y99.325 E.362
G1 X58.042 Y99.084 E.01129
G1 X66.634 Y107.676 E.362
G1 X66.926 Y107.435 E.01129
G1 X58.334 Y98.843 E.362
G1 X58.627 Y98.602 E.01129
G1 X67.219 Y107.194 E.362
G1 X67.511 Y106.953 E.01129
G1 X58.919 Y98.361 E.362
G1 X59.211 Y98.121 E.01129
G1 X67.803 Y106.713 E.362
G1 X68.096 Y106.472 E.01129
G1 X59.504 Y97.88 E.362
G1 X59.796 Y97.639 E.01129
G1 X68.388 Y106.231 E.362
G1 X68.681 Y105.99 E.01129
G1 X60.089 Y97.398 E.362
G1 X60.381 Y97.157 E.01129
G1 X68.973 Y105.749 E.362
G1 X69.266 Y105.508 E.01129
G1 X60.674 Y96.916 E.362
G1 X60.966 Y96.675 E.01129
M73 P26 R35
G1 X69.558 Y105.267 E.362
G1 X69.851 Y105.026 E.01129
G1 X61.259 Y96.434 E.362
G1 X61.551 Y96.193 E.01129
G1 X70.143 Y104.785 E.362
G1 X70.436 Y104.544 E.01129
G1 X61.844 Y95.952 E.362
G1 X62.136 Y95.711 E.01129
G1 X70.728 Y104.303 E.362
G1 X71.02 Y104.062 E.01129
G1 X62.428 Y95.47 E.362
G1 X62.721 Y95.229 E.01129
G1 X71.313 Y103.821 E.362
G1 X71.605 Y103.581 E.01129
G1 X63.013 Y94.989 E.362
G1 X63.306 Y94.748 E.01129
G1 X71.898 Y103.34 E.362
M73 P27 R35
G1 X72.19 Y103.099 E.01129
G1 X63.598 Y94.507 E.362
G1 X63.891 Y94.266 E.01129
G1 X72.483 Y102.858 E.362
G1 X72.775 Y102.617 E.01129
G1 X64.183 Y94.025 E.362
G1 X64.476 Y93.784 E.01129
G1 X73.068 Y102.376 E.362
G1 X73.36 Y102.135 E.01129
G1 X64.768 Y93.543 E.362
G1 X65.06 Y93.302 E.01129
G1 X73.652 Y101.894 E.362
G1 X73.945 Y101.653 E.01129
G1 X65.353 Y93.061 E.362
G1 X65.645 Y92.82 E.01129
G1 X74.237 Y101.412 E.362
G1 X74.53 Y101.171 E.01129
G1 X65.938 Y92.579 E.362
G1 X66.23 Y92.338 E.01129
G1 X74.822 Y100.93 E.362
G1 X75.115 Y100.689 E.01129
G1 X66.523 Y92.098 E.362
G1 X66.815 Y91.857 E.01129
G1 X75.407 Y100.449 E.362
G1 X75.7 Y100.208 E.01129
G1 X67.108 Y91.616 E.362
G1 X67.4 Y91.375 E.01129
G1 X75.992 Y99.967 E.362
G1 X76.284 Y99.726 E.01129
G1 X67.692 Y91.134 E.362
G1 X67.985 Y90.893 E.01129
G1 X76.577 Y99.485 E.362
G1 X76.869 Y99.244 E.01129
G1 X68.277 Y90.652 E.362
G1 X68.57 Y90.411 E.01129
G1 X77.162 Y99.003 E.362
G1 X77.454 Y98.762 E.01129
G1 X68.862 Y90.17 E.362
G1 X69.155 Y89.929 E.01129
G1 X77.747 Y98.521 E.362
G1 X78.039 Y98.28 E.01129
G1 X69.447 Y89.688 E.362
G1 X69.74 Y89.447 E.01129
G1 X78.332 Y98.039 E.362
G1 X78.624 Y97.798 E.01129
G1 X70.032 Y89.206 E.362
G1 X70.325 Y88.965 E.01129
G1 X78.916 Y97.557 E.362
G1 X79.209 Y97.317 E.01129
G1 X70.617 Y88.725 E.362
G1 X70.909 Y88.484 E.01129
G1 X79.501 Y97.076 E.362
G1 X79.794 Y96.835 E.01129
G1 X71.202 Y88.243 E.362
G1 X71.494 Y88.002 E.01129
G1 X80.086 Y96.594 E.362
G1 X80.379 Y96.353 E.01129
G1 X71.787 Y87.761 E.362
G1 X72.079 Y87.52 E.01129
G1 X80.671 Y96.112 E.362
G1 X80.964 Y95.871 E.01129
G1 X72.372 Y87.279 E.362
G1 X72.664 Y87.038 E.01129
G1 X81.256 Y95.63 E.362
G1 X81.549 Y95.389 E.01129
G1 X72.957 Y86.797 E.362
G1 X73.249 Y86.556 E.01129
G1 X81.841 Y95.148 E.362
G1 X82.133 Y94.907 E.01129
G1 X73.541 Y86.315 E.362
G1 X73.834 Y86.074 E.01129
G1 X82.426 Y94.666 E.362
G1 X82.718 Y94.425 E.01129
G1 X74.126 Y85.834 E.362
G1 X74.419 Y85.593 E.01129
G1 X83.011 Y94.185 E.362
G1 X83.303 Y93.944 E.01129
G1 X74.711 Y85.352 E.362
G1 X75.004 Y85.111 E.01129
G1 X83.596 Y93.703 E.362
G1 X83.888 Y93.462 E.01129
G1 X75.296 Y84.87 E.362
G1 X75.589 Y84.629 E.01129
G1 X84.181 Y93.221 E.362
G1 X84.473 Y92.98 E.01129
G1 X75.881 Y84.388 E.362
G1 X76.173 Y84.147 E.01129
G1 X84.765 Y92.739 E.362
G1 X85.058 Y92.498 E.01129
G1 X76.466 Y83.906 E.362
G1 X76.758 Y83.665 E.01129
G1 X85.35 Y92.257 E.362
G1 X85.643 Y92.016 E.01129
G1 X77.051 Y83.424 E.362
G1 X77.343 Y83.183 E.01129
G1 X85.935 Y91.775 E.362
G1 X86.228 Y91.534 E.01129
G1 X77.636 Y82.942 E.362
G1 X77.928 Y82.702 E.01129
G1 X86.52 Y91.293 E.362
G1 X86.813 Y91.053 E.01129
G1 X78.221 Y82.461 E.362
G1 X78.513 Y82.22 E.01129
G1 X87.105 Y90.812 E.362
G1 X87.397 Y90.571 E.01129
G1 X78.805 Y81.979 E.362
G1 X79.098 Y81.738 E.01129
G1 X87.69 Y90.33 E.362
G1 X87.982 Y90.089 E.01129
G1 X79.39 Y81.497 E.362
G1 X79.683 Y81.256 E.01129
G1 X88.275 Y89.848 E.362
G1 X88.567 Y89.607 E.01129
G1 X79.975 Y81.015 E.362
G1 X80.268 Y80.774 E.01129
G1 X88.86 Y89.366 E.362
G1 X89.152 Y89.125 E.01129
G1 X80.56 Y80.533 E.362
G1 X80.853 Y80.292 E.01129
G1 X89.445 Y88.884 E.362
G1 X89.737 Y88.643 E.01129
G1 X81.145 Y80.051 E.362
G1 X81.438 Y79.81 E.01129
G1 X90.03 Y88.402 E.362
G1 X90.322 Y88.161 E.01129
G1 X81.73 Y79.57 E.362
G1 X82.022 Y79.329 E.01129
G1 X90.614 Y87.921 E.362
G1 X90.907 Y87.68 E.01129
G1 X82.315 Y79.088 E.362
G1 X82.607 Y78.847 E.01129
G1 X91.199 Y87.439 E.362
G1 X91.492 Y87.198 E.01129
G1 X82.9 Y78.606 E.362
G1 X83.192 Y78.365 E.01129
G1 X91.784 Y86.957 E.362
G1 X92.077 Y86.716 E.01129
G1 X83.485 Y78.124 E.362
G1 X83.777 Y77.883 E.01129
G1 X92.369 Y86.475 E.362
G1 X92.662 Y86.234 E.01129
G1 X84.07 Y77.642 E.362
G1 X84.362 Y77.401 E.01129
G1 X92.954 Y85.993 E.362
G1 X93.246 Y85.752 E.01129
G1 X84.654 Y77.16 E.362
G1 X84.947 Y76.919 E.01129
G1 X93.539 Y85.511 E.362
G1 X93.831 Y85.27 E.01129
G1 X85.239 Y76.678 E.362
G1 X85.532 Y76.438 E.01129
G1 X94.124 Y85.029 E.362
G1 X94.416 Y84.789 E.01129
G1 X85.824 Y76.197 E.362
G1 X86.117 Y75.956 E.01129
G1 X94.709 Y84.548 E.362
G1 X95.001 Y84.307 E.01129
G1 X86.409 Y75.715 E.362
G1 X86.702 Y75.474 E.01129
G1 X95.294 Y84.066 E.362
G1 X95.586 Y83.825 E.01129
G1 X86.994 Y75.233 E.362
G1 X87.286 Y74.992 E.01129
G1 X95.878 Y83.584 E.362
G1 X96.171 Y83.343 E.01129
G1 X87.579 Y74.751 E.362
G1 X87.871 Y74.51 E.01129
G1 X96.463 Y83.102 E.362
G1 X96.756 Y82.861 E.01129
G1 X88.164 Y74.269 E.362
G1 X88.456 Y74.028 E.01129
G1 X97.048 Y82.62 E.362
G1 X97.341 Y82.379 E.01129
G1 X88.749 Y73.787 E.362
G1 X89.041 Y73.546 E.01129
G1 X97.633 Y82.138 E.362
G1 X97.926 Y81.898 E.01129
G1 X89.334 Y73.306 E.362
G1 X89.626 Y73.065 E.01129
G1 X98.218 Y81.657 E.362
G1 X98.51 Y81.416 E.01129
G1 X89.919 Y72.824 E.362
G1 X90.211 Y72.583 E.01129
G1 X98.803 Y81.175 E.362
G1 X99.095 Y80.934 E.01129
G1 X90.503 Y72.342 E.362
G1 X90.796 Y72.101 E.01129
G1 X99.388 Y80.693 E.362
G1 X99.68 Y80.452 E.01129
G1 X91.088 Y71.86 E.362
G1 X91.381 Y71.619 E.01129
G1 X99.973 Y80.211 E.362
G1 X100.265 Y79.97 E.01129
G1 X91.673 Y71.378 E.362
G1 X91.966 Y71.137 E.01129
G1 X100.558 Y79.729 E.362
G1 X100.85 Y79.488 E.01129
G1 X92.258 Y70.896 E.362
G1 X92.551 Y70.655 E.01129
G1 X101.143 Y79.247 E.362
G1 X101.435 Y79.006 E.01129
G1 X92.843 Y70.414 E.362
G1 X93.135 Y70.174 E.01129
G1 X101.727 Y78.766 E.362
G1 X102.02 Y78.525 E.01129
G1 X93.428 Y69.933 E.362
G1 X93.72 Y69.692 E.01129
G1 X102.312 Y78.284 E.362
G1 X102.605 Y78.043 E.01129
G1 X94.013 Y69.451 E.362
G1 X94.305 Y69.21 E.01129
G1 X102.897 Y77.802 E.362
G1 X103.19 Y77.561 E.01129
G1 X94.598 Y68.969 E.362
G1 X94.89 Y68.728 E.01129
G1 X103.482 Y77.32 E.362
G1 X103.775 Y77.079 E.01129
G1 X95.183 Y68.487 E.362
G1 X95.475 Y68.246 E.01129
G1 X104.067 Y76.838 E.362
G1 X104.359 Y76.597 E.01129
G1 X95.767 Y68.005 E.362
G1 X96.06 Y67.764 E.01129
G1 X104.652 Y76.356 E.362
G1 X104.944 Y76.115 E.01129
G1 X96.352 Y67.523 E.362
G1 X96.645 Y67.282 E.01129
G1 X105.237 Y75.874 E.362
G1 X105.529 Y75.634 E.01129
G1 X96.937 Y67.042 E.362
G1 X97.23 Y66.801 E.01129
G1 X105.822 Y75.393 E.362
G1 X106.114 Y75.152 E.01129
G1 X97.522 Y66.56 E.362
G1 X97.815 Y66.319 E.01129
G1 X106.407 Y74.911 E.362
G1 X106.699 Y74.67 E.01129
G1 X98.107 Y66.078 E.362
G1 X98.4 Y65.837 E.01129
G1 X106.991 Y74.429 E.362
G1 X107.284 Y74.188 E.01129
G1 X98.692 Y65.596 E.362
G1 X98.984 Y65.355 E.01129
G1 X107.576 Y73.947 E.362
G1 X107.869 Y73.706 E.01129
G1 X99.277 Y65.114 E.362
G1 X99.569 Y64.873 E.01129
G1 X108.161 Y73.465 E.362
G1 X108.454 Y73.224 E.01129
G1 X99.862 Y64.632 E.362
G1 X100.154 Y64.391 E.01129
G1 X108.746 Y72.983 E.362
G1 X109.039 Y72.742 E.01129
G1 X100.447 Y64.15 E.362
G1 X100.739 Y63.91 E.01129
G1 X109.331 Y72.502 E.362
G1 X109.624 Y72.261 E.01129
G1 X101.032 Y63.669 E.362
G1 X101.324 Y63.428 E.01129
G1 X109.916 Y72.02 E.362
G1 X110.208 Y71.779 E.01129
G1 X101.616 Y63.187 E.362
G1 X101.909 Y62.946 E.01129
G1 X110.501 Y71.538 E.362
G1 X110.793 Y71.297 E.01129
G1 X102.201 Y62.705 E.362
G1 X102.494 Y62.464 E.01129
G1 X111.086 Y71.056 E.362
G1 X111.378 Y70.815 E.01129
G1 X102.786 Y62.223 E.362
G1 X103.079 Y61.982 E.01129
G1 X111.671 Y70.574 E.362
G1 X111.963 Y70.333 E.01129
G1 X103.371 Y61.741 E.362
G1 X103.664 Y61.5 E.01129
G1 X112.256 Y70.092 E.362
G1 X112.548 Y69.851 E.01129
G1 X103.956 Y61.259 E.362
G1 X104.248 Y61.018 E.01129
G1 X112.84 Y69.61 E.362
G1 X113.133 Y69.37 E.01129
G1 X104.541 Y60.778 E.362
G1 X104.833 Y60.537 E.01129
G1 X113.425 Y69.129 E.362
G1 X113.718 Y68.888 E.01129
G1 X105.126 Y60.296 E.362
G1 X105.418 Y60.055 E.01129
G1 X114.01 Y68.647 E.362
G1 X114.303 Y68.406 E.01129
G1 X105.711 Y59.814 E.362
G1 X106.003 Y59.573 E.01129
G1 X114.595 Y68.165 E.362
G1 X114.888 Y67.924 E.01129
G1 X106.296 Y59.332 E.362
G1 X106.588 Y59.091 E.01129
G1 X115.18 Y67.683 E.362
G1 X115.472 Y67.442 E.01129
G1 X106.88 Y58.85 E.362
G1 X107.173 Y58.609 E.01129
G1 X115.765 Y67.201 E.362
G1 X116.057 Y66.96 E.01129
G1 X107.465 Y58.368 E.362
G1 X107.758 Y58.127 E.01129
G1 X116.35 Y66.719 E.362
G1 X116.642 Y66.478 E.01129
G1 X108.05 Y57.886 E.362
G1 X108.343 Y57.646 E.01129
G1 X116.935 Y66.238 E.362
G1 X117.227 Y65.997 E.01129
G1 X108.635 Y57.405 E.362
G1 X108.928 Y57.164 E.01129
G1 X117.52 Y65.756 E.362
G1 X117.812 Y65.515 E.01129
G1 X109.22 Y56.923 E.362
G1 X109.513 Y56.682 E.01129
G1 X118.104 Y65.274 E.362
G1 X118.397 Y65.033 E.01129
G1 X109.805 Y56.441 E.362
G1 X110.097 Y56.2 E.01129
G1 X118.689 Y64.792 E.362
G1 X118.982 Y64.551 E.01129
G1 X110.39 Y55.959 E.362
G1 X110.682 Y55.718 E.01129
G1 X119.274 Y64.31 E.362
G1 X119.567 Y64.069 E.01129
G1 X110.975 Y55.477 E.362
G1 X111.267 Y55.236 E.01129
G1 X119.859 Y63.828 E.362
G1 X120.152 Y63.587 E.01129
G1 X111.56 Y54.995 E.362
G1 X111.852 Y54.754 E.01129
G1 X120.444 Y63.346 E.362
G1 X120.737 Y63.106 E.01129
G1 X112.145 Y54.514 E.362
G1 X112.437 Y54.273 E.01129
G1 X121.029 Y62.865 E.362
G1 X121.321 Y62.624 E.01129
G1 X112.729 Y54.032 E.362
G1 X113.022 Y53.791 E.01129
G1 X121.614 Y62.383 E.362
G1 X121.906 Y62.142 E.01129
G1 X113.314 Y53.55 E.362
G1 X113.607 Y53.309 E.01129
G1 X122.199 Y61.901 E.362
G1 X122.491 Y61.66 E.01129
G1 X113.899 Y53.068 E.362
G1 X114.192 Y52.827 E.01129
G1 X122.784 Y61.419 E.362
G1 X123.076 Y61.178 E.01129
G1 X114.484 Y52.586 E.362
G1 X114.777 Y52.345 E.01129
G1 X123.369 Y60.937 E.362
G1 X123.661 Y60.696 E.01129
G1 X115.069 Y52.104 E.362
G1 X115.361 Y51.863 E.01129
G1 X123.953 Y60.455 E.362
G1 X124.246 Y60.214 E.01129
G1 X115.654 Y51.622 E.362
G1 X115.946 Y51.382 E.01129
G1 X124.538 Y59.974 E.362
G1 X124.831 Y59.733 E.01129
G1 X116.239 Y51.141 E.362
G1 X116.531 Y50.9 E.01129
G1 X125.123 Y59.492 E.362
G1 X125.416 Y59.251 E.01129
G1 X116.824 Y50.659 E.362
G1 X117.116 Y50.418 E.01129
G1 X125.708 Y59.01 E.362
G1 X126.001 Y58.769 E.01129
G1 X117.409 Y50.177 E.362
G1 X117.701 Y49.936 E.01129
G1 X126.293 Y58.528 E.362
G1 X126.585 Y58.287 E.01129
G1 X117.994 Y49.695 E.362
G1 X118.286 Y49.454 E.01129
G1 X126.878 Y58.046 E.362
G1 X127.17 Y57.805 E.01129
G1 X118.578 Y49.213 E.362
G1 X118.871 Y48.972 E.01129
G1 X127.463 Y57.564 E.362
G1 X127.755 Y57.323 E.01129
G1 X119.163 Y48.731 E.362
G1 X119.456 Y48.49 E.01129
G1 X128.048 Y57.082 E.362
G1 X128.34 Y56.842 E.01129
G1 X119.748 Y48.25 E.362
G1 X120.041 Y48.009 E.01129
G1 X128.633 Y56.601 E.362
G1 X128.925 Y56.36 E.01129
G1 X120.333 Y47.768 E.362
G1 X120.626 Y47.527 E.01129
G1 X129.218 Y56.119 E.362
G1 X129.51 Y55.878 E.01129
G1 X120.918 Y47.286 E.362
G1 X121.21 Y47.045 E.01129
G1 X129.802 Y55.637 E.362
G1 X130.095 Y55.396 E.01129
G1 X121.503 Y46.804 E.362
G1 X121.795 Y46.563 E.01129
G1 X130.387 Y55.155 E.362
G1 X130.68 Y54.914 E.01129
G1 X122.088 Y46.322 E.362
G1 X122.38 Y46.081 E.01129
G1 X130.972 Y54.673 E.362
G1 X131.265 Y54.432 E.01129
G1 X122.673 Y45.84 E.362
G1 X122.965 Y45.599 E.01129
G1 X131.557 Y54.191 E.362
G1 X131.85 Y53.95 E.01129
G1 X123.258 Y45.358 E.362
G1 X123.55 Y45.118 E.01129
G1 X132.142 Y53.71 E.362
G1 X132.434 Y53.469 E.01129
G1 X123.842 Y44.877 E.362
G1 X124.135 Y44.636 E.01129
G1 X132.727 Y53.228 E.362
G1 X133.019 Y52.987 E.01129
G1 X124.427 Y44.395 E.362
G1 X124.72 Y44.154 E.01129
G1 X133.312 Y52.746 E.362
G1 X133.604 Y52.505 E.01129
G1 X125.012 Y43.913 E.362
G1 X125.305 Y43.672 E.01129
G1 X133.897 Y52.264 E.362
G1 X134.189 Y52.023 E.01129
G1 X125.597 Y43.431 E.362
G1 X125.89 Y43.19 E.01129
G1 X134.482 Y51.782 E.362
G1 X134.774 Y51.541 E.01129
G1 X126.182 Y42.949 E.362
G1 X126.474 Y42.708 E.01129
G1 X135.066 Y51.3 E.362
G1 X135.359 Y51.059 E.01129
G1 X126.767 Y42.467 E.362
G1 X127.059 Y42.226 E.01129
G1 X135.651 Y50.818 E.362
G1 X135.944 Y50.578 E.01129
G1 X127.352 Y41.986 E.362
G1 X127.644 Y41.745 E.01129
G1 X136.236 Y50.337 E.362
G1 X136.529 Y50.096 E.01129
G1 X127.937 Y41.504 E.362
G1 X128.229 Y41.263 E.01129
G1 X136.821 Y49.855 E.362
G1 X137.114 Y49.614 E.01129
G1 X128.522 Y41.022 E.362
G1 X128.814 Y40.781 E.01129
G1 X137.406 Y49.373 E.362
G1 X137.698 Y49.132 E.01129
G1 X129.107 Y40.54 E.362
G1 X129.399 Y40.299 E.01129
G1 X137.991 Y48.891 E.362
G1 X138.283 Y48.65 E.01129
G1 X129.691 Y40.058 E.362
G1 X129.984 Y39.817 E.01129
G1 X138.576 Y48.409 E.362
G1 X138.868 Y48.168 E.01129
G1 X130.276 Y39.576 E.362
G1 X130.569 Y39.335 E.01129
G1 X139.161 Y47.927 E.362
G1 X139.453 Y47.686 E.01129
G1 X130.861 Y39.094 E.362
G1 X131.154 Y38.854 E.01129
G1 X139.746 Y47.446 E.362
G1 X140.038 Y47.205 E.01129
G1 X131.446 Y38.613 E.362
G1 X131.739 Y38.372 E.01129
G1 X140.331 Y46.964 E.362
G1 X140.623 Y46.723 E.01129
G1 X132.031 Y38.131 E.362
G1 X132.323 Y37.89 E.01129
G1 X140.915 Y46.482 E.362
G1 X141.208 Y46.241 E.01129
G1 X132.616 Y37.649 E.362
G1 X132.908 Y37.408 E.01129
G1 X141.5 Y46 E.362
G1 X141.793 Y45.759 E.01129
G1 X133.201 Y37.167 E.362
G1 X133.493 Y36.926 E.01129
G1 X142.085 Y45.518 E.362
G1 X142.378 Y45.277 E.01129
G1 X133.786 Y36.685 E.362
G1 X134.078 Y36.444 E.01129
G1 X181.742 Y84.109 E2.00821
G1 X182.035 Y83.868 E.01129
G1 X134.371 Y36.203 E2.00821
G1 X134.663 Y35.962 E.01129
G1 X182.327 Y83.627 E2.00821
G1 X182.62 Y83.386 E.01129
G1 X134.955 Y35.722 E2.00821
G1 X135.248 Y35.481 E.01129
G1 X182.912 Y83.145 E2.00821
G1 X183.205 Y82.904 E.01129
G1 X135.54 Y35.24 E2.00821
G1 X135.833 Y34.999 E.01129
G1 X183.497 Y82.663 E2.00821
G1 X183.789 Y82.422 E.01129
G1 X136.125 Y34.758 E2.00821
G1 X136.418 Y34.517 E.01129
G1 X184.082 Y82.181 E2.00821
G1 X184.374 Y81.94 E.01129
G1 X136.71 Y34.276 E2.00821
G1 X137.003 Y34.035 E.01129
G1 X183.335 Y80.368 E1.9521
G1 X180.895 Y77.394 E.11461
G1 X137.295 Y33.794 E1.83696
G1 X137.588 Y33.553 E.01129
G1 X178.454 Y74.42 E1.72181
G1 X176.014 Y71.446 E.11461
G1 X137.88 Y33.312 E1.60667
G1 X138.172 Y33.071 E.01129
G1 X173.573 Y68.472 E1.49152
G1 X171.133 Y65.498 E.11461
G1 X138.465 Y32.83 E1.37638
G1 X138.757 Y32.59 E.01129
G1 X168.692 Y62.525 E1.26124
G1 X166.252 Y59.551 E.11461
G1 X139.05 Y32.349 E1.14609
G1 X139.342 Y32.108 E.01129
G1 X163.811 Y56.577 E1.03095
G1 X161.371 Y53.603 E.11461
G1 X139.635 Y31.867 E.9158
G1 X139.927 Y31.626 E.01129
G1 X158.93 Y50.629 E.80066
G1 X156.49 Y47.655 E.11461
G1 X140.22 Y31.385 E.68552
G1 X140.512 Y31.144 E.01129
G1 X154.05 Y44.682 E.57037
G1 X151.609 Y41.708 E.11461
G1 X140.804 Y30.903 E.45523
G1 X141.097 Y30.662 E.01129
G1 X149.169 Y38.734 E.34008
G1 X146.728 Y35.76 E.11461
G1 X141.389 Y30.421 E.22494
G1 X141.682 Y30.18 E.01129
G1 X145.512 Y34.01 E.16136
G1 X181.57 Y84.47 F30000
G1 F9545.273
G1 X144.358 Y47.258 E1.56783
G1 X146.799 Y50.232 E.11461
G1 X181.157 Y84.59 E1.44761
G1 X180.865 Y84.831 E.01129
G1 X149.239 Y53.206 E1.33247
G1 X151.68 Y56.179 E.11461
M73 P28 R35
G1 X180.573 Y85.072 E1.21732
G1 X180.28 Y85.313 E.01129
G1 X154.12 Y59.153 E1.10218
G1 X156.561 Y62.127 E.11461
G1 X179.988 Y85.554 E.98704
G1 X179.695 Y85.795 E.01129
G1 X159.001 Y65.101 E.87189
G1 X161.442 Y68.075 E.11461
G1 X179.403 Y86.036 E.75675
G1 X179.11 Y86.277 E.01129
G1 X163.882 Y71.049 E.6416
G1 X166.323 Y74.022 E.11461
G1 X178.818 Y86.518 E.52646
G1 X178.525 Y86.759 E.01129
G1 X168.763 Y76.996 E.41132
G1 X171.203 Y79.97 E.11461
G1 X178.233 Y87 E.29617
G1 X177.941 Y87.241 E.01129
G1 X173.644 Y82.944 E.18103
G1 X176.084 Y85.918 E.11461
G1 X177.769 Y87.602 E.07096
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9545.273
G1 X176.354 Y86.188 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/75
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S102
G17
G3 Z1 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X112.566 Y245.181 E.35823
G1 X18.659 Y130.755 E4.75997
G1 X141.841 Y29.28 E5.13206
G1 X142.052 Y29.537 E.0107
G1 X184.993 Y81.862 E2.17665
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X113.319 Y245.068 E.32404
G1 X113.01 Y245.323 E.01191
G1 F7979.538
G1 X112.701 Y245.577 E.01191
M106 S229.5
G1 F2640
G1 X112.512 Y245.733 E.00732
M106 S102
M106 S229.5
G1 F1080
G1 X26.519 Y140.946 E4.03772
G2 X24.932 Y139.017 I-614.646 J504.027 E.07442
M106 S102
M106 S229.5
G1 F1200
G1 X20.636 Y133.782 E.20169
M106 S102
M106 S229.5
G1 F1320
G1 X18.108 Y130.702 E.11872
M106 S102
M106 S229.5
G1 F1680
G1 X18.571 Y130.32 E.01787
M106 S102
M106 S229.5
G1 F1560
G1 X59.524 Y96.583 E1.58049
M106 S102
M106 S229.5
G1 F1440
G1 X141.895 Y28.727 E3.17884
M106 S102
M106 S229.5
G1 F2880
G1 X142.034 Y28.897 E.00654
M106 S102
G1 F8392.935
G1 X142.288 Y29.206 E.01191
G1 F9547.055
G1 X142.542 Y29.515 E.01191
G1 X185.544 Y81.916 E2.01914
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.022 Y133.299 Z1.2 F30000
G1 X19.742 Y130.506 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.62597
G1 F6174.428
G1 X141.727 Y30.014 E7.27914
G1 X26.965 Y139.8 F30000
; LINE_WIDTH: 0.359284
G1 F11379.329
G1 X19.746 Y131.001 E.28442
; LINE_WIDTH: 0.380697
G1 F10657.93
G1 X19.722 Y130.917 E.00233
; LINE_WIDTH: 0.41459
G1 F9686.012
G1 X19.697 Y130.833 E.00257
; LINE_WIDTH: 0.448484
G1 F8876.542
G1 X19.673 Y130.749 E.0028
; LINE_WIDTH: 0.485802
G1 F8128.59
G1 X19.69 Y130.688 E.00221
; LINE_WIDTH: 0.526544
G1 F7443.803
G1 X19.708 Y130.627 E.00241
; LINE_WIDTH: 0.567287
G1 F6865.431
G1 X19.725 Y130.566 E.00262
; LINE_WIDTH: 0.608029
G1 F6370.456
G1 X19.742 Y130.506 E.00282
; LINE_WIDTH: 0.6035
G1 F6421.92
G1 X19.648 Y130.551 E.00463
; LINE_WIDTH: 0.5537
G1 F7048.045
G1 X19.554 Y130.596 E.00422
; LINE_WIDTH: 0.5039
G1 F7809.45
G1 X19.46 Y130.642 E.00381
; LINE_WIDTH: 0.437956
G1 F9113.101
G2 X19.217 Y130.81 I.221 J.58 E.00931
; LINE_WIDTH: 0.412838
G1 F9731.9
G1 X19.357 Y131.007 E.00707
; LINE_WIDTH: 0.361737
G1 F11291.754
G1 X19.498 Y131.204 E.0061
G1 X24.864 Y137.749 E.21315
G1 X112.615 Y244.67 E3.48348
G1 X112.861 Y244.468 E.00801
M73 P29 R34
G1 X27.003 Y139.846 E3.40847
G1 X49.63 Y121.665 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X48.373 Y122.7 E.05236
G1 X40.071 Y114.399 E.37752
G1 X50.593 Y105.731 E.43837
G1 X58.895 Y114.032 E.37752
G1 X69.417 Y105.364 E.43837
G1 X61.115 Y97.063 E.37752
G1 X71.637 Y88.395 E.43837
G1 X79.938 Y96.696 E.37752
G1 X90.46 Y88.028 E.43837
G1 X82.159 Y79.727 E.37752
G1 X81.084 Y80.612 E.04477
G1 X24.929 Y136.767 E2.55371
G2 X29.003 Y141.711 I537.377 J-438.729 E.206
G1 X99.316 Y212.024 E3.19755
G1 X101.063 Y214.152 E.08854
G1 X94.136 Y221.079 E.315
G1 X102.786 Y231.619 E.43845
G1 X109.713 Y224.692 E.315
G1 X118.362 Y235.233 E.43845
G1 X111.436 Y242.159 E.315
G1 X112.469 Y243.418 E.05236
G1 X86.52 Y211.797 F30000
G1 F8843.478
G1 X85.487 Y210.539 E.05236
G1 X92.413 Y203.612 E.315
G1 X83.763 Y193.072 E.43845
G1 X76.837 Y199.999 E.315
G1 X68.187 Y189.458 E.43845
G1 X75.114 Y182.532 E.315
G1 X66.464 Y171.991 E.43845
G1 X59.537 Y178.918 E.315
G1 X50.888 Y168.378 E.43845
G1 X57.814 Y161.451 E.315
G1 X49.165 Y150.911 E.43845
G1 X42.238 Y157.838 E.315
G1 X33.588 Y147.298 E.43845
G1 X40.515 Y140.371 E.315
G1 X35.032 Y133.69 E.2779
G1 X37.851 Y131.368 E.11743
G1 X29.549 Y123.067 E.37752
G3 X28.288 Y124.097 I-118.544 J-143.833 E.05236
G1 X133.804 Y52.321 F30000
G1 F8843.478
G1 X132.548 Y53.356 E.05236
G1 X124.246 Y45.054 E.37752
G1 X113.724 Y53.722 E.43837
G1 X122.026 Y62.024 E.37752
G1 X111.504 Y70.692 E.43837
G1 X103.202 Y62.39 E.37752
G1 X92.68 Y71.059 E.43837
G1 X100.982 Y79.36 E.37752
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X142.199 Y30.265 E.19244
G1 X134.768 Y36.386 E.3096
G1 X182.142 Y83.76 E2.15437
G1 X184.503 Y81.815 E.09839
G1 X180.594 Y77.051 E.19815
G1 X174.131 Y83.514 E.29391
G1 X165.482 Y72.974 E.43845
G1 X171.944 Y66.511 E.29391
G1 X172.977 Y67.77 E.05236
G1 X155.799 Y61.175 F30000
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X154.645 Y45.431 E.43845
G1 X148.182 Y51.894 E.29391
G1 X147.149 Y50.635 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X148.182 Y51.894 E-.61876
G1 X148.445 Y51.631 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/75
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M106 S140.25
G17
G3 Z1.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X112.421 Y245.3 E.36427
G1 X18.397 Y130.742 E4.76566
G1 X141.733 Y29.148 E5.13831
G1 X184.993 Y81.862 E2.19284
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X112.789 Y245.505 E.3445
G1 X112.48 Y245.759 E.01191
M106 S229.5
G1 F3957.921
G1 X112.367 Y245.853 E.00437
M106 S140.25
M106 S229.5
G1 F2400
G1 X26.374 Y141.066 E4.03771
G1 X25.866 Y140.448 E.02383
M106 S140.25
M106 S229.5
G1 X25.612 Y140.139 E.01191
M106 S140.25
M106 S229.5
G1 F2280
G1 X22.654 Y136.547 E.13858
G3 X21.892 Y135.62 I275.243 J-227.045 E.03574
G1 X17.845 Y130.688 E.19003
M106 S140.25
M106 S229.5
G1 F2520
G1 X23.193 Y126.283 E.2064
G3 X24.12 Y125.52 I268.652 J325.636 E.03574
G1 X28.063 Y122.281 E.15199
M106 S140.25
M106 S229.5
G1 F2640
G2 X28.99 Y121.519 I-267.725 J-326.398 E.03574
G1 X141.324 Y28.977 E4.33525
M106 S140.25
M106 S229.5
G1 F2520
G1 X141.787 Y28.595 E.01787
M106 S140.25
M106 S229.5
G1 F3877.984
G1 X141.867 Y28.694 E.00379
M106 S140.25
G1 F3907.269
G1 X141.869 Y28.696 E.00007
G1 F9547.055
G1 X142.123 Y29.005 E.01191
G1 X185.544 Y81.916 E2.03882
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.487 Y129.621 Z1.4 F30000
G1 X49.63 Y121.665 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X48.373 Y122.7 E.05236
G1 X39.858 Y114.186 E.3872
G1 X50.38 Y105.518 E.43837
G1 X58.895 Y114.032 E.3872
G1 X69.417 Y105.364 E.43837
G1 X60.902 Y96.85 E.3872
G1 X71.424 Y88.182 E.43837
G1 X79.938 Y96.696 E.3872
G1 X90.46 Y88.028 E.43837
G1 X81.946 Y79.514 E.3872
G1 X112.761 Y69.657 F30000
G1 F8843.478
G1 X111.504 Y70.692 E.05236
G1 X102.99 Y62.178 E.3872
G1 X113.511 Y53.51 E.43837
G1 X122.026 Y62.024 E.3872
G1 X132.548 Y53.356 E.43837
G1 X124.033 Y44.842 E.3872
G1 X134.555 Y36.174 E.43837
G1 X182.142 Y83.76 E2.16405
G1 X184.503 Y81.815 E.09839
G1 X180.594 Y77.051 E.19815
G1 X174.131 Y83.514 E.29391
G1 X165.482 Y72.974 E.43845
G1 X171.944 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X148.182 Y51.894 E.43845
G1 X154.645 Y45.431 E.29391
G1 X145.995 Y34.891 E.43845
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X92.468 Y70.846 E.3872
G1 X83.286 Y78.41 E.38253
G1 X24.7 Y136.996 E2.66427
G1 X26.62 Y139.328 E.09714
G1 X99.316 Y212.024 E3.30591
G1 X101.063 Y214.152 E.08854
G1 X93.902 Y221.313 E.32564
G1 X102.552 Y231.853 E.43845
G1 X109.713 Y224.692 E.32564
G1 X118.362 Y235.233 E.43845
G1 X111.202 Y242.393 E.32564
G1 X112.235 Y243.652 E.05236
G1 X112.483 Y244.665 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.53212
G1 F7358.954
G1 X19.208 Y131.029 E5.68112
; LINE_WIDTH: 0.545244
G1 F7166.699
G1 X19.173 Y130.956 E.00321
; LINE_WIDTH: 0.58273
G1 F6669.013
G1 X19.137 Y130.884 E.00345
; LINE_WIDTH: 0.620217
G1 F6235.962
G1 X19.102 Y130.811 E.00369
; LINE_WIDTH: 0.619648
M73 P30 R34
G1 F6242.116
G1 X19.143 Y130.752 E.00329
; LINE_WIDTH: 0.581023
G1 F6690.175
G1 X19.185 Y130.693 E.00307
; LINE_WIDTH: 0.542398
G1 F7207.532
G1 X19.226 Y130.634 E.00285
; LINE_WIDTH: 0.489637
G1 F8058.804
G1 X19.267 Y130.575 E.00255
G1 X141.627 Y29.791 E5.59384
; WIPE_START
G1 X140.084 Y31.062 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.535 Y37.191 Z1.4 F30000
G1 X50.197 Y152.17 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X49.165 Y150.911 E.05236
G1 X42.004 Y158.072 E.32564
G1 X33.354 Y147.532 E.43845
G1 X40.515 Y140.371 E.32564
G1 X35.032 Y133.69 E.2779
G1 X37.851 Y131.368 E.11743
G1 X29.337 Y122.854 E.3872
G1 X28.078 Y123.888 E.05236
G1 X49.621 Y167.353 F30000
G1 F8843.478
G1 X50.654 Y168.612 E.05236
G1 X57.814 Y161.451 E.32564
G1 X66.464 Y171.991 E.43845
G1 X59.303 Y179.152 E.32564
G1 X67.953 Y189.692 E.43845
G1 X75.114 Y182.532 E.32564
G1 X76.147 Y183.79 E.05236
G1 X75.57 Y198.974 F30000
G1 F8843.478
G1 X76.603 Y200.232 E.05236
G1 X83.763 Y193.072 E.32564
G1 X92.413 Y203.612 E.43845
G1 X85.253 Y210.773 E.32564
G1 X84.22 Y209.514 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X85.253 Y210.773 E-.61876
G1 X85.515 Y210.51 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/75
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S147.9
G17
G3 Z1.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X112.29 Y245.408 E.3697
G1 X26.166 Y140.46 E4.36562
G1 X18.154 Y130.73 E.4053
G1 X28.678 Y122.085 E.43796
G1 X141.635 Y29.029 E4.70613
G1 X184.993 Y81.862 E2.19778
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X112.644 Y245.624 E.35009
G1 X112.335 Y245.879 E.01191
M106 S229.5
G1 F4032.382
G1 X112.237 Y245.96 E.00381
M106 S147.9
M106 S229.5
G1 F2640
G1 X26.244 Y141.173 E4.03771
G1 X25.736 Y140.555 E.02383
M106 S147.9
M106 S229.5
G1 X25.482 Y140.246 E.01191
M106 S147.9
M106 S229.5
G1 F2400
G1 X17.602 Y130.676 E.36924
M106 S147.9
M106 S229.5
G1 F2640
G1 X18.066 Y130.295 E.01787
M106 S147.9
M106 S229.5
G1 F2760
G1 X27.966 Y122.163 E.38162
G2 X28.892 Y121.4 I-274.769 J-334.948 E.03574
G1 X141.689 Y28.477 E4.35312
M106 S147.9
M106 S229.5
G1 F3995.12
G1 X141.761 Y28.564 E.00335
M106 S147.9
G1 F9547.055
G1 X142.014 Y28.873 E.01191
G1 X185.544 Y81.916 E2.0439
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.487 Y129.621 Z1.6 F30000
G1 X49.63 Y121.665 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X48.373 Y122.7 E.05236
G1 X39.672 Y113.999 E.39569
G1 X29.15 Y122.667 E.43837
G1 X37.851 Y131.368 E.3957
G1 X35.032 Y133.69 E.11743
G1 X40.515 Y140.371 E.2779
G1 X33.149 Y147.737 E.33498
G1 X41.799 Y158.277 E.43845
G1 X49.165 Y150.911 E.33497
G1 X50.197 Y152.17 E.05236
G1 X91.38 Y202.353 F30000
G1 F8843.478
G1 X92.413 Y203.612 E.05236
G1 X85.048 Y210.977 E.33493
G1 X76.398 Y200.437 E.43845
G1 X83.763 Y193.072 E.33494
G1 X75.114 Y182.532 E.43845
G1 X67.748 Y189.897 E.33495
G1 X59.098 Y179.357 E.43845
G1 X66.464 Y171.991 E.33495
G1 X57.814 Y161.451 E.43845
G1 X50.449 Y168.817 E.33496
G1 X49.416 Y167.558 E.05236
G1 X92.665 Y220.258 F30000
G1 F8843.478
G1 X93.698 Y221.517 E.05236
G1 X101.063 Y214.152 E.33492
G1 X99.316 Y212.024 E.08854
G1 X24.499 Y137.197 E3.4026
G1 X85.212 Y76.484 E2.761
G1 X92.282 Y70.66 E.29454
G1 X100.982 Y79.36 E.39565
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X154.645 Y45.431 E.43845
G1 X148.182 Y51.894 E.29391
G1 X156.832 Y62.434 E.43845
G1 X163.295 Y55.971 E.29391
G1 X171.944 Y66.511 E.43845
G1 X165.482 Y72.974 E.29391
G1 X174.131 Y83.514 E.43845
G1 X180.594 Y77.051 E.29391
G1 X184.503 Y81.815 E.19815
G1 X182.142 Y83.76 E.09839
G1 X134.37 Y35.988 E2.17247
G1 X123.848 Y44.656 E.43837
G1 X132.548 Y53.356 E.39563
G1 X122.026 Y62.024 E.43837
G1 X113.326 Y53.324 E.39564
G1 X102.804 Y61.992 E.43837
G1 X111.504 Y70.692 E.39565
G1 X112.761 Y69.657 E.05236
G1 X80.503 Y80.363 F30000
G1 F8843.478
G1 X81.76 Y79.328 E.05236
G1 X90.46 Y88.028 E.39566
G1 X79.938 Y96.696 E.43837
G1 X71.238 Y87.996 E.39567
G1 X60.716 Y96.664 E.43837
G1 X69.417 Y105.364 E.39568
G1 X58.895 Y114.032 E.43837
G1 X50.194 Y105.331 E.39568
G1 X51.451 Y104.296 E.05236
; WIPE_START
G1 X50.194 Y105.331 E-.61876
G1 X50.457 Y105.594 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X53.837 Y112.437 Z1.6 F30000
G1 X108.68 Y223.434 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X102.348 Y232.057 E.33491
G1 X110.998 Y242.597 E.43845
G1 X118.362 Y235.233 E.3349
G1 X119.395 Y236.491 E.05236
G1 X112.344 Y244.855 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4285
G1 F9336.584
G1 X18.88 Y130.983 E4.48701
; LINE_WIDTH: 0.4541
G1 F8755.29
G1 X18.85 Y130.919 E.00228
; LINE_WIDTH: 0.48806
G1 F8087.343
G1 X18.82 Y130.856 E.00247
; LINE_WIDTH: 0.52202
G1 F7514.089
G1 X18.79 Y130.792 E.00266
; LINE_WIDTH: 0.516394
G1 F7603.386
G1 X18.837 Y130.724 E.00309
; LINE_WIDTH: 0.47118
G1 F8406.108
G1 X18.884 Y130.656 E.0028
; LINE_WIDTH: 0.425967
G1 F9398.332
G1 X18.931 Y130.588 E.0025
; LINE_WIDTH: 0.39547
M73 P31 R34
G1 F10211.318
G1 X141.537 Y29.597 E4.42366
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10211.318
G1 X139.994 Y30.868 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/75
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M106 S153
G17
G3 Z1.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
M73 P31 R33
G1 X35.522 Y133.738
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X112.175 Y245.502 E.3745
G1 X17.989 Y130.722 E4.7745
G1 X141.549 Y28.924 E5.14803
G1 X184.993 Y81.862 E2.20214
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X112.205 Y245.986 E.36703
M106 S229.5
G1 F4089.073
G1 X112.121 Y246.055 E.00323
M106 S153
M106 S229.5
G1 F2880
G1 X26.128 Y141.268 E4.03771
G3 X22.895 Y137.331 I1279.14 J-1053.91 E.15176
M106 S153
M106 S229.5
G1 F3000
G1 X21.879 Y136.091 E.04773
M106 S153
M106 S229.5
G1 F3900
G1 X21.626 Y135.782 E.01191
M106 S153
M106 S229.5
G1 X19.849 Y133.612 E.08354
M106 S153
M106 S229.5
G1 F4800
G1 X19.595 Y133.302 E.01191
M106 S153
M106 S229.5
G1 X17.438 Y130.668 E.10141
M106 S153
M106 S229.5
G1 F7500
G1 X17.747 Y130.414 E.01191
M106 S153
M106 S229.5
G1 X17.901 Y130.286 E.00596
M106 S153
M106 S229.5
G1 F6600
G1 X18.745 Y129.589 E.03261
M106 S153
M106 S229.5
G1 X19.054 Y129.335 E.01191
M106 S153
M106 S229.5
G1 F5700
G1 X21.051 Y127.686 E.07714
M106 S153
M106 S229.5
G1 X21.36 Y127.432 E.01191
M106 S153
M106 S229.5
G1 F4800
G1 X22.204 Y126.735 E.03261
M106 S153
M106 S229.5
G1 X22.513 Y126.48 E.01191
M106 S153
M106 S229.5
G1 F3900
G1 X24.51 Y124.832 E.07714
M106 S153
M106 S229.5
G1 X24.819 Y124.577 E.01191
M106 S153
M106 S229.5
G1 F3000
G1 X27.879 Y122.058 E.11808
G2 X28.806 Y121.295 I-237.987 J-290.3 E.03574
G1 X141.603 Y28.372 E4.35312
M106 S153
M106 S229.5
G1 F3958.388
G1 X141.658 Y28.438 E.00256
M106 S153
G1 F4066.244
G1 X141.663 Y28.445 E.00027
G1 F9547.055
G1 X141.917 Y28.754 E.01191
G1 X185.544 Y81.916 E2.04847
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X32.546 Y129.4 Z1.8 F30000
G1 X27.767 Y123.577 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X29.024 Y122.542 E.05236
G1 X37.851 Y131.368 E.4014
G1 X35.032 Y133.69 E.11743
G1 X40.515 Y140.371 E.2779
G1 X33.011 Y147.875 E.34124
G1 X41.662 Y158.414 E.43845
G1 X49.165 Y150.911 E.34121
G1 X57.814 Y161.451 E.43845
G1 X50.312 Y168.954 E.34118
G1 X58.962 Y179.493 E.43845
G1 X66.464 Y171.991 E.34115
G1 X75.114 Y182.532 E.43845
G1 X67.613 Y190.033 E.34112
G1 X76.263 Y200.572 E.43845
G1 X83.763 Y193.072 E.34109
G1 X92.413 Y203.612 E.43845
G1 X84.913 Y211.112 E.34106
G1 X93.564 Y221.651 E.43845
G1 X101.063 Y214.152 E.34103
G1 X99.316 Y212.024 E.08854
G1 X23.139 Y135.846 E3.46425
G1 X22.106 Y134.587 E.05236
G1 X49.63 Y121.665 F30000
G1 F8843.478
G1 X48.373 Y122.7 E.05236
G1 X39.547 Y113.874 E.40137
G1 X50.069 Y105.207 E.43837
G1 X58.895 Y114.032 E.40135
G1 X69.417 Y105.364 E.43837
G1 X60.592 Y96.539 E.40132
G1 X71.114 Y87.872 E.43837
G1 X79.938 Y96.696 E.4013
G1 X90.46 Y88.028 E.43837
G1 X81.636 Y79.204 E.40128
G1 X80.379 Y80.24 E.05236
G1 X112.761 Y69.657 F30000
G1 F8843.478
G1 X111.504 Y70.692 E.05236
G1 X102.681 Y61.869 E.40123
G1 X113.204 Y53.202 E.43837
G1 X122.026 Y62.024 E.4012
G1 X132.548 Y53.356 E.43837
G1 X123.726 Y44.534 E.40118
G1 X134.248 Y35.867 E.43837
G1 X182.142 Y83.76 E2.178
G1 X184.503 Y81.815 E.09839
G1 X180.594 Y77.051 E.19815
G1 X174.131 Y83.514 E.29391
G1 X165.482 Y72.974 E.43845
G1 X171.944 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X148.182 Y51.894 E.43845
G1 X154.645 Y45.431 E.29391
G1 X145.995 Y34.891 E.43845
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X92.159 Y70.537 E.40125
G1 X86.488 Y75.208 E.23624
G1 X24.361 Y137.335 E2.82531
G1 X101.181 Y230.932 F30000
G1 F8843.478
G1 X102.214 Y232.191 E.05236
G1 X109.713 Y224.692 E.341
G1 X118.362 Y235.233 E.43845
G1 X110.865 Y242.73 E.34097
G1 X112.712 Y244.609 E.08473
G1 X113.969 Y243.574 E.05236
G1 X112.226 Y244.977 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X18.646 Y130.947 E3.96186
; LINE_WIDTH: 0.401915
G1 F10027.994
G1 X18.607 Y130.863 E.00263
; LINE_WIDTH: 0.426624
G1 F9382.231
G1 X18.568 Y130.778 E.00281
G1 X18.689 Y130.6 E.00654
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X141.454 Y29.467 E4.27188
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10588.235
G1 X139.91 Y30.739 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/75
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S193.8
G17
G3 Z1.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X112.105 Y245.56 E.37743
G1 X25.98 Y140.613 E4.36562
G1 X17.831 Y130.714 E.41232
G1 X28.54 Y121.916 E.44569
G1 X141.497 Y28.86 E4.70612
G1 X142.054 Y29.539 E.02823
G1 X184.993 Y81.862 E2.17657
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X112.09 Y246.081 E.37148
G1 X112.051 Y246.113 E.00149
M106 S229.5
G1 X26.058 Y141.326 E4.03771
G2 X25.296 Y140.399 I-246.615 J201.999 E.03574
M106 S193.8
M106 S229.5
G1 F9300
G1 X23.686 Y138.445 E.07542
M106 S193.8
M106 S229.5
G1 X23.432 Y138.136 E.01191
M106 S193.8
M106 S229.5
G1 F8400
G1 X22.754 Y137.313 E.03175
M106 S193.8
M106 S229.5
G1 X22.5 Y137.004 E.01191
M106 S193.8
M106 S229.5
G1 F7500
G1 X20.89 Y135.05 E.07542
M106 S193.8
M106 S229.5
G1 X20.635 Y134.742 E.01191
M106 S193.8
M106 S229.5
G1 F6600
G1 X19.958 Y133.919 E.03175
M106 S193.8
M106 S229.5
G1 X19.703 Y133.61 E.01191
M106 S193.8
M106 S229.5
G1 F5700
G1 X18.771 Y132.479 E.04367
G3 X17.28 Y130.66 I615.877 J-506.666 E.07005
M106 S193.8
M106 S229.5
G1 F7500
G1 X17.588 Y130.406 E.01191
M106 S193.8
M106 S229.5
G1 X19.212 Y129.068 E.06266
M106 S193.8
M106 S229.5
G1 F8400
G1 X19.521 Y128.814 E.01191
M106 S193.8
M106 S229.5
G1 X20.442 Y128.057 E.03552
M106 S193.8
M106 S229.5
G1 F9300
G1 X20.751 Y127.804 E.01191
M106 S193.8
M106 S229.5
G1 X22.904 Y126.036 E.08296
M106 S193.8
M106 S229.5
G1 F9547.055
G1 X25.365 Y124.015 E.09487
M106 S193.8
M106 S229.5
G1 X26.596 Y123.004 E.04744
M106 S193.8
M106 S229.5
G1 X27.827 Y121.994 E.04744
G2 X28.754 Y121.231 I-237.987 J-290.3 E.03574
G1 X141.551 Y28.308 E4.35312
M106 S193.8
G1 X141.577 Y28.34 E.00125
G1 X142.357 Y29.29 E.03661
G1 X185.544 Y81.916 E2.02783
M73 P32 R33
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.487 Y129.621 Z2 F30000
G1 X49.63 Y121.665 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X48.373 Y122.7 E.05236
G1 X39.231 Y113.559 E.41572
G1 X49.753 Y104.891 E.43837
G1 X58.895 Y114.032 E.41572
G1 X69.417 Y105.364 E.43837
G1 X60.275 Y96.223 E.41572
G1 X70.797 Y87.555 E.43837
G1 X79.938 Y96.696 E.41572
G1 X90.46 Y88.028 E.43837
G1 X81.319 Y78.887 E.41572
G1 X80.062 Y79.922 E.05236
; WIPE_START
G1 X81.319 Y78.887 E-.61876
G1 X81.582 Y79.15 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X89 Y77.353 Z2 F30000
G1 X155.799 Y61.175 Z2
G1 Z1.6
G1 E.8 F1800
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X154.645 Y45.431 E.43845
G1 X148.182 Y51.894 E.29391
G1 X147.149 Y50.635 E.05236
G1 X144.962 Y33.632 F30000
G1 F8843.478
G1 X145.995 Y34.891 E.05236
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X91.841 Y70.219 E.41572
G1 X89.778 Y71.918 E.08593
G1 X24.016 Y137.68 E2.99058
G1 X32.67 Y148.216 E.43843
G1 X40.515 Y140.371 E.35675
G1 X35.032 Y133.69 E.2779
G1 X37.851 Y131.368 E.11743
G1 X28.709 Y122.227 E.41572
G1 X18.321 Y130.762 E.43234
G1 X19.563 Y132.27 E.06283
G1 X99.316 Y212.024 E3.62686
G1 X101.063 Y214.152 E.08854
G1 X93.218 Y221.997 E.35675
G1 X92.185 Y220.738 E.05236
G1 X108.68 Y223.434 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.868 Y232.537 E.35675
G1 X107.487 Y239.385 E.28484
G1 X112.712 Y244.609 E.23759
G1 X112.153 Y245.07 E.02329
G1 X110.518 Y243.077 E.08288
G1 X118.362 Y235.233 E.35675
G1 X119.395 Y236.491 E.05236
G1 X91.38 Y202.353 F30000
G1 F8843.478
G1 X92.413 Y203.612 E.05236
G1 X84.568 Y211.457 E.35675
G1 X75.919 Y200.917 E.43845
G1 X83.763 Y193.072 E.35675
G1 X75.114 Y182.532 E.43845
G1 X67.269 Y190.376 E.35675
G1 X58.619 Y179.836 E.43845
G1 X66.464 Y171.991 E.35675
G1 X57.814 Y161.451 E.43845
G1 X49.969 Y169.296 E.35675
G1 X41.32 Y158.756 E.43845
G1 X49.165 Y150.911 E.35675
G1 X50.197 Y152.17 E.05236
; WIPE_START
G1 X49.165 Y150.911 E-.61876
G1 X48.902 Y151.174 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X55.236 Y146.916 Z2 F30000
G1 X172.977 Y67.77 Z2
G1 Z1.6
G1 E.8 F1800
G1 F8843.478
G1 X171.944 Y66.511 E.05236
G1 X165.482 Y72.974 E.29391
G1 X174.131 Y83.514 E.43845
G1 X180.594 Y77.051 E.29391
G1 X184.503 Y81.815 E.19815
G1 X182.142 Y83.76 E.09839
G1 X133.928 Y35.546 E2.19257
G1 X123.406 Y44.214 E.43837
G1 X132.548 Y53.356 E.41572
G1 X122.026 Y62.024 E.43837
G1 X112.884 Y52.883 E.41572
G1 X102.362 Y61.551 E.43837
G1 X111.504 Y70.692 E.41572
G1 X112.761 Y69.657 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X111.504 Y70.692 E-.61876
G1 X111.241 Y70.429 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/75
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
G17
G3 Z2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X112.035 Y245.618 E.38036
G1 X17.726 Y130.709 E4.78021
G1 X141.444 Y28.796 E5.15431
G1 X142.753 Y30.391 E.06634
G1 X184.993 Y81.862 E2.14113
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X112.019 Y246.139 E.37419
G1 X111.981 Y246.171 E.00149
M106 S229.5
G1 X25.988 Y141.384 E4.03771
G3 X21.004 Y135.329 I1144.625 J-947.352 E.23358
M106 S193.8
M106 S229.5
G1 X19.854 Y133.926 E.05404
M106 S193.8
M106 S229.5
G1 X18.705 Y132.523 E.05404
M106 S193.8
G1 X17.175 Y130.655 E.07191
G1 X18.79 Y129.323 E.06236
G1 X19.942 Y128.372 E.04449
M106 S229.5
G1 X27.774 Y121.93 E.30209
G2 X28.701 Y121.167 I-237.987 J-290.3 E.03574
G1 X141.498 Y28.244 E4.35312
M106 S193.8
G1 X141.525 Y28.276 E.00125
G1 X143.056 Y30.142 E.0719
G1 X185.544 Y81.916 E1.995
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.487 Y129.621 Z2.2 F30000
G1 X49.63 Y121.665 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X48.373 Y122.7 E.05236
G1 X39.169 Y113.496 E.41856
G1 X49.691 Y104.829 E.43837
G1 X58.895 Y114.032 E.41854
G1 X69.417 Y105.364 E.43837
G1 X60.213 Y96.161 E.41853
G1 X70.735 Y87.493 E.43837
G1 X79.938 Y96.696 E.41851
G1 X90.46 Y88.028 E.43837
G1 X81.258 Y78.826 E.41849
G1 X80.001 Y79.861 E.05236
G1 X112.761 Y69.657 F30000
G1 F8843.478
G1 X111.504 Y70.692 E.05236
G1 X102.302 Y61.49 E.41846
G1 X112.824 Y52.823 E.43837
G1 X122.026 Y62.024 E.41844
G1 X132.548 Y53.356 E.43837
G1 X123.347 Y44.155 E.41842
G1 X133.869 Y35.487 E.43837
G1 X182.142 Y83.76 E2.19526
G1 X184.503 Y81.815 E.09839
G1 X180.594 Y77.051 E.19815
G1 X174.131 Y83.514 E.29391
G1 X165.482 Y72.974 E.43845
G1 X171.944 Y66.511 E.29391
G1 X170.911 Y65.252 E.05236
G1 X147.149 Y50.635 F30000
G1 F8843.478
G1 X148.182 Y51.894 E.05236
G1 X154.645 Y45.431 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X157.865 Y63.693 E.05236
; WIPE_START
G1 X156.832 Y62.434 E-.61876
G1 X157.095 Y62.171 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X151.256 Y67.087 Z2.2 F30000
G1 X50.197 Y152.17 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F8843.478
G1 X49.165 Y150.911 E.05236
G1 X41.251 Y158.824 E.35986
G1 X49.902 Y169.364 E.43845
G1 X57.814 Y161.451 E.35984
G1 X66.464 Y171.991 E.43845
G1 X58.552 Y179.904 E.35982
G1 X67.202 Y190.444 E.43845
G1 X75.114 Y182.532 E.3598
G1 X83.763 Y193.072 E.43845
G1 X75.852 Y200.983 E.35978
G1 X84.502 Y211.523 E.43845
G1 X92.413 Y203.612 E.35976
G1 X91.38 Y202.353 E.05236
G1 X94.185 Y223.321 F30000
G1 F8843.478
G1 X93.152 Y222.063 E.05236
G1 X101.063 Y214.152 E.35974
G1 X99.316 Y212.024 E.08854
G1 X18.977 Y131.684 E3.65351
G1 X18.216 Y130.757 E.03859
G1 X28.647 Y122.164 E.43457
G1 X37.851 Y131.368 E.41858
G1 X35.032 Y133.69 E.11743
G1 X40.515 Y140.371 E.2779
M73 P33 R33
G1 X32.601 Y148.285 E.35988
G1 X23.951 Y137.745 E.43845
G1 X90.406 Y71.289 E3.02212
G1 X91.78 Y70.158 E.05723
G1 X100.982 Y79.36 E.41848
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X144.962 Y33.632 E.05236
; WIPE_START
G1 X145.995 Y34.891 E-.61876
G1 X145.732 Y35.153 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X144.742 Y42.721 Z2.2 F30000
G1 X119.395 Y236.491 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.453 Y243.142 E.3597
M73 P33 R32
G1 X112.082 Y245.128 E.0826
G1 X112.712 Y244.609 E.02622
G1 X106.827 Y238.725 E.2676
G1 X101.803 Y232.602 E.25469
G1 X109.713 Y224.692 E.35972
G1 X108.68 Y223.434 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/75
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
G17
G3 Z2.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.976 Y245.667 E.38282
G1 X17.636 Y130.704 E4.78216
G1 X141.4 Y28.742 E5.15645
G1 X184.993 Y81.862 E2.20971
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.949 Y246.197 E.37691
G1 X111.922 Y246.219 E.00106
G1 X22.999 Y137.87 E4.17511
G1 X22.618 Y137.406 E.01787
G1 X20.042 Y134.26 E.12112
G1 X17.085 Y130.651 E.13899
G1 X17.548 Y130.269 E.01787
G1 X24.854 Y124.241 E.28214
G1 X26.905 Y122.555 E.07908
G2 X27.832 Y121.793 I-259.148 J-315.987 E.03574
G1 X141.454 Y28.19 E4.38495
G1 X141.472 Y28.212 E.00085
G1 X141.523 Y28.274 E.00238
G1 X185.544 Y81.916 E2.06699
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.08 Y137.502 Z2.4 F30000
G1 X24.936 Y139.051 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X23.903 Y137.793 E.05236
G1 X90.891 Y70.805 E3.04634
G1 X91.733 Y70.111 E.03509
G1 X100.982 Y79.36 E.42061
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X154.645 Y45.431 E.43845
G1 X148.182 Y51.894 E.29391
G1 X156.832 Y62.434 E.43845
G1 X163.295 Y55.971 E.29391
G1 X171.944 Y66.511 E.43845
G1 X165.482 Y72.974 E.29391
G1 X174.131 Y83.514 E.43845
G1 X180.594 Y77.051 E.29391
G1 X184.503 Y81.815 E.19815
G1 X182.142 Y83.76 E.09839
G1 X133.82 Y35.438 E2.19748
G1 X135.077 Y34.403 E.05236
G1 X103.512 Y60.408 F30000
G1 F8843.478
G1 X102.255 Y61.443 E.05236
G1 X111.504 Y70.692 E.42061
G1 X122.026 Y62.024 E.43837
G1 X112.776 Y52.775 E.42062
G1 X123.298 Y44.106 E.43837
G1 X132.548 Y53.356 E.42063
G1 X133.804 Y52.321 E.05236
G1 X91.717 Y86.993 F30000
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.211 Y78.779 E.4206
G1 X70.69 Y87.448 E.43837
G1 X79.938 Y96.696 E.42059
G1 X78.682 Y97.732 E.05236
G1 X49.63 Y121.665 F30000
G1 F8843.478
G1 X48.373 Y122.7 E.05236
G1 X39.125 Y113.452 E.42057
G1 X49.646 Y104.784 E.43837
G1 X58.895 Y114.032 E.42058
G1 X69.417 Y105.364 E.43837
G1 X60.168 Y96.116 E.42058
G1 X61.425 Y95.08 E.05236
; WIPE_START
G1 X60.168 Y96.116 E-.61876
G1 X60.431 Y96.379 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X59.054 Y103.886 Z2.4 F30000
G1 X50.197 Y152.17 Z2.4
G1 Z2
G1 E.8 F1800
G1 F8843.478
G1 X49.165 Y150.911 E.05236
G1 X41.202 Y158.873 E.36209
G1 X32.553 Y148.333 E.43845
G1 X40.515 Y140.371 E.36209
G1 X35.032 Y133.69 E.2779
G1 X37.851 Y131.368 E.11743
G1 X28.603 Y122.12 E.42056
G1 X18.125 Y130.752 E.43653
G1 X18.495 Y131.202 E.01873
G1 X99.316 Y212.024 E3.67543
G1 X101.063 Y214.152 E.08854
G1 X93.1 Y222.116 E.36215
G1 X94.132 Y223.374 E.05236
G1 X108.68 Y223.434 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.749 Y232.656 E.36215
G1 X106.28 Y238.177 E.22967
G1 X112.712 Y244.609 E.29249
G1 X112.023 Y245.176 E.02868
G1 X110.399 Y243.196 E.08236
G1 X118.362 Y235.233 E.36216
G1 X119.395 Y236.491 E.05236
G1 X50.885 Y170.673 F30000
G1 F8843.478
G1 X49.852 Y169.414 E.05236
G1 X57.814 Y161.451 E.3621
G1 X66.464 Y171.991 E.43845
G1 X58.501 Y179.954 E.36211
G1 X67.151 Y190.495 E.43845
G1 X75.114 Y182.532 E.36212
G1 X83.763 Y193.072 E.43845
G1 X75.8 Y201.035 E.36213
G1 X84.45 Y211.575 E.43845
G1 X92.413 Y203.612 E.36214
G1 X91.38 Y202.353 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X92.413 Y203.612 E-.61876
G1 X92.15 Y203.875 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/75
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
G17
G3 Z2.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.953 Y245.685 E.38375
G1 X17.568 Y130.701 E4.78364
G3 X24.095 Y125.345 I989.705 J1199.676 E.27151
G1 X141.383 Y28.722 E4.88656
G1 X142.063 Y29.55 E.03445
G1 X184.993 Y81.862 E2.17611
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.899 Y246.238 E.37882
G1 X20.424 Y134.792 E4.29464
G2 X19.216 Y133.323 I-1238.441 J1016.945 E.05665
G1 X18.61 Y132.585 E.02844
G1 X17.016 Y130.647 E.07475
G1 X17.479 Y130.266 E.01787
G1 X19.65 Y128.481 E.08373
G3 X23.846 Y125.042 I634.191 J769.686 E.16159
G1 X141.437 Y28.169 E4.53813
G1 X142.366 Y29.301 E.04361
G1 X185.544 Y81.916 E2.0274
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X43.092 Y130.229 Z2.6 F30000
G1 X91.717 Y86.993 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.192 Y78.76 E.42149
G1 X70.67 Y87.428 E.43837
G1 X79.938 Y96.696 E.42149
G1 X69.417 Y105.364 E.43837
G1 X60.148 Y96.096 E.42149
G1 X49.626 Y104.764 E.43837
G1 X58.895 Y114.032 E.42149
G1 X48.373 Y122.7 E.43837
G1 X39.104 Y113.432 E.42149
G1 X28.582 Y122.1 E.43837
G1 X37.851 Y131.368 E.42149
G1 X35.032 Y133.69 E.11743
G1 X40.515 Y140.371 E.2779
G1 X32.519 Y148.367 E.36361
G1 X41.17 Y158.906 E.43845
G1 X49.165 Y150.911 E.36356
G1 X57.814 Y161.451 E.43845
G1 X49.821 Y169.445 E.3635
G1 X58.472 Y179.984 E.43845
G1 X66.464 Y171.991 E.36344
G1 X75.114 Y182.532 E.43845
G1 X67.123 Y190.522 E.36339
G1 X75.774 Y201.061 E.43845
G1 X83.763 Y193.072 E.36333
M73 P34 R32
G1 X92.413 Y203.612 E.43845
G1 X84.425 Y211.6 E.36328
G1 X93.076 Y222.139 E.43845
G1 X101.063 Y214.152 E.36322
G1 X99.316 Y212.024 E.08854
G1 X18.131 Y130.838 E3.69199
G1 X18.058 Y130.749 E.0037
G1 X19.228 Y129.79 E.04866
G1 X112.761 Y69.657 F30000
G1 F8843.478
G1 X111.504 Y70.692 E.05236
G1 X102.235 Y61.424 E.42149
G1 X112.757 Y52.756 E.43837
G1 X122.026 Y62.024 E.42149
G1 X132.548 Y53.356 E.43837
G1 X123.279 Y44.087 E.42149
G1 X133.801 Y35.419 E.43837
G1 X182.142 Y83.76 E2.19834
G1 X184.503 Y81.815 E.09839
G1 X180.594 Y77.051 E.19815
G1 X174.131 Y83.514 E.29391
G1 X165.482 Y72.974 E.43845
G1 X171.944 Y66.511 E.29391
G1 X170.911 Y65.252 E.05236
G1 X147.149 Y50.635 F30000
G1 F8843.478
G1 X148.182 Y51.894 E.05236
G1 X154.645 Y45.431 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
G1 X144.962 Y33.632 F30000
G1 F8843.478
G1 X145.995 Y34.891 E.05236
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X91.714 Y70.092 E.42149
G1 X91.092 Y70.603 E.02588
G1 X23.868 Y137.828 E3.05709
G1 X24.901 Y139.086 E.05236
G1 X119.395 Y236.491 F30000
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.378 Y243.217 E.36311
G1 X112.001 Y245.195 E.08227
G1 X112.712 Y244.609 E.02961
G1 X106.061 Y237.958 E.30245
G1 X101.727 Y232.678 E.21967
G1 X109.713 Y224.692 E.36317
G1 X108.68 Y223.434 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/75
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
G17
G3 Z2.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.931 Y245.704 E.38468
G1 X17.531 Y130.701 E4.7844
G1 X20.573 Y128.213 E.12636
G1 X141.367 Y28.701 E5.03263
G1 X142.906 Y30.577 E.07803
G1 X184.993 Y81.862 E2.13337
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.877 Y246.256 E.37969
G1 X16.978 Y130.646 E4.45521
G1 X20.324 Y127.91 E.12872
G1 X141.421 Y28.149 E4.67343
G1 X143.209 Y30.329 E.08398
G1 X185.544 Y81.916 E1.9878
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.096 Y133.047 Z2.8 F30000
G1 X19.293 Y129.709 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X18.033 Y130.74 E.05236
G1 X99.316 Y212.024 E3.69645
G1 X101.063 Y214.152 E.08854
G1 X93.055 Y222.16 E.36415
G1 X84.404 Y211.621 E.43845
G1 X92.413 Y203.612 E.36421
G1 X83.763 Y193.072 E.43845
G1 X75.753 Y201.082 E.36426
G1 X67.103 Y190.543 E.43845
G1 X75.114 Y182.532 E.36432
G1 X74.081 Y181.273 E.05236
G1 X57.419 Y178.745 F30000
G1 F8843.478
G1 X58.452 Y180.004 E.05236
G1 X66.464 Y171.991 E.36437
G1 X57.814 Y161.451 E.43845
G1 X49.801 Y169.465 E.36442
G1 X41.15 Y158.926 E.43845
G1 X49.165 Y150.911 E.36448
G1 X50.197 Y152.17 E.05236
; WIPE_START
G1 X49.165 Y150.911 E-.61876
G1 X48.902 Y151.174 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X52.118 Y144.253 Z2.8 F30000
G1 X70.673 Y104.329 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8843.478
G1 X69.417 Y105.364 E.05236
G1 X60.129 Y96.077 E.42234
G1 X49.608 Y104.745 E.43837
G1 X58.895 Y114.032 E.42234
G1 X48.373 Y122.7 E.43837
G1 X39.086 Y113.413 E.42234
G1 X28.564 Y122.081 E.43837
G1 X37.851 Y131.368 E.42234
G1 X35.032 Y133.69 E.11743
G1 X40.515 Y140.371 E.2779
G1 X32.499 Y148.387 E.36453
G1 X23.848 Y137.848 E.43845
G1 X91.286 Y70.41 E3.06681
G1 X91.695 Y70.073 E.01703
G1 X100.982 Y79.36 E.42234
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X154.645 Y45.431 E.43845
G1 X148.182 Y51.894 E.29391
G1 X156.832 Y62.434 E.43845
G1 X163.295 Y55.971 E.29391
G1 X171.944 Y66.511 E.43845
G1 X165.482 Y72.974 E.29391
G1 X174.131 Y83.514 E.43845
G1 X180.594 Y77.051 E.29391
G1 X184.503 Y81.815 E.19815
G1 X182.142 Y83.76 E.09839
G1 X133.782 Y35.401 E2.19919
G1 X135.039 Y34.365 E.05236
G1 X103.474 Y60.37 F30000
G1 F8843.478
G1 X102.217 Y61.405 E.05236
G1 X111.504 Y70.692 E.42234
G1 X122.026 Y62.024 E.43837
G1 X112.739 Y52.737 E.42234
G1 X123.26 Y44.069 E.43837
G1 X132.548 Y53.356 E.42234
G1 X133.804 Y52.321 E.05236
G1 X69.394 Y88.444 F30000
G1 F8843.478
G1 X70.651 Y87.409 E.05236
G1 X79.938 Y96.696 E.42234
G1 X90.46 Y88.028 E.43837
G1 X81.173 Y78.741 E.42234
G1 X79.916 Y79.776 E.05236
; WIPE_START
G1 X81.173 Y78.741 E-.61876
G1 X81.436 Y79.004 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X82.851 Y86.504 Z2.8 F30000
G1 X108.68 Y223.434 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.706 Y232.699 E.3641
G1 X105.852 Y237.749 E.21012
G1 X112.712 Y244.609 E.31195
G1 X111.979 Y245.213 E.03055
G1 X110.357 Y243.238 E.08218
G1 X118.362 Y235.233 E.36405
G1 X119.395 Y236.491 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/75
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
G17
G3 Z2.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M73 P35 R32
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X143.749 Y31.605 E.12162
G1 X184.993 Y81.862 E2.09063
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X144.052 Y31.356 E.12436
G1 X185.544 Y81.916 E1.94821
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.097 Y133.044 Z3 F30000
G1 X19.28 Y129.695 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X99.316 Y212.024 E3.69688
G1 X101.063 Y214.152 E.08854
M73 P35 R31
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X83.763 Y193.072 E.43845
G1 X75.738 Y201.097 E.36497
G1 X74.705 Y199.839 E.05236
G1 X74.081 Y181.273 F30000
G1 F8843.478
G1 X75.114 Y182.532 E.05236
G1 X67.088 Y190.557 E.36497
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36497
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36497
G1 X41.139 Y158.937 E.43845
G1 X49.165 Y150.911 E.36497
G1 X50.197 Y152.17 E.05236
; WIPE_START
G1 X49.165 Y150.911 E-.61876
G1 X48.902 Y151.174 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X50.556 Y143.723 Z3 F30000
G1 X61.367 Y95.023 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8843.478
G1 X60.111 Y96.058 E.05236
G1 X69.417 Y105.364 E.42319
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.42319
G1 X48.332 Y105.762 E.05236
G1 X78.682 Y97.732 F30000
G1 F8843.478
G1 X79.938 Y96.696 E.05236
G1 X70.633 Y87.39 E.42319
G1 X81.154 Y78.722 E.43837
G1 X90.46 Y88.028 E.42319
G1 X91.717 Y86.993 E.05236
G1 X133.804 Y52.321 F30000
G1 F8843.478
G1 X132.548 Y53.356 E.05236
G1 X123.242 Y44.05 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X111.504 Y70.692 E.43837
G1 X102.198 Y61.386 E.42319
G1 X103.455 Y60.351 E.05236
; WIPE_START
G1 X102.198 Y61.386 E-.61876
G1 X102.461 Y61.649 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X109.872 Y59.823 Z3 F30000
G1 X147.149 Y50.635 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8843.478
G1 X148.182 Y51.894 E.05236
G1 X154.645 Y45.431 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
G1 X170.911 Y65.252 F30000
G1 F8843.478
G1 X171.944 Y66.511 E.05236
G1 X165.482 Y72.974 E.29391
G1 X174.131 Y83.514 E.43845
G1 X180.594 Y77.051 E.29391
G1 X184.503 Y81.815 E.19815
G1 X182.142 Y83.76 E.09839
G1 X133.764 Y35.382 E2.20004
G1 X141.302 Y29.172 E.31407
G1 X145.995 Y34.891 E.23789
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X91.676 Y70.054 E.42319
G1 X23.839 Y137.856 E3.08416
G1 X32.489 Y148.397 E.43845
G1 X40.515 Y140.371 E.36497
G1 X35.032 Y133.69 E.2779
G1 X37.851 Y131.368 E.11743
G1 X28.545 Y122.063 E.42319
G1 X39.067 Y113.395 E.43837
G1 X48.373 Y122.7 E.42319
G1 X49.63 Y121.665 E.05236
; WIPE_START
G1 X48.373 Y122.7 E-.61876
G1 X48.11 Y122.438 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X52.155 Y128.91 Z3 F30000
G1 X119.395 Y236.491 Z3
G1 Z2.6
G1 E.8 F1800
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.337 Y243.258 E.36497
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03147
G1 X105.652 Y237.549 E.32105
G1 X101.687 Y232.718 E.20098
G1 X109.713 Y224.692 E.36497
G1 X108.68 Y223.434 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/75
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
G17
G3 Z3 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X141.437 Y28.787 E.0044
G1 X184.993 Y81.862 E2.20785
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X141.74 Y28.538 E.01578
G1 X185.544 Y81.916 E2.0568
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.487 Y129.621 Z3.2 F30000
G1 X49.63 Y121.665 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X48.373 Y122.7 E.05236
G1 X39.067 Y113.395 E.42319
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
G1 X35.032 Y133.69 E.11743
G1 X40.515 Y140.371 E.2779
G1 X32.489 Y148.397 E.36497
G1 X23.839 Y137.856 E.43845
G1 X91.48 Y70.216 E3.076
G1 X91.676 Y70.054 E.00819
G1 X100.982 Y79.36 E.42319
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X154.645 Y45.431 E.43845
G1 X148.182 Y51.894 E.29391
G1 X156.832 Y62.434 E.43845
G1 X163.295 Y55.971 E.29391
G1 X171.944 Y66.511 E.43845
G1 X165.482 Y72.974 E.29391
G1 X174.131 Y83.514 E.43845
G1 X180.594 Y77.051 E.29391
G1 X184.503 Y81.815 E.19815
G1 X182.142 Y83.76 E.09839
G1 X133.764 Y35.382 E2.20004
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.42319
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.42319
G1 X102.198 Y61.386 E.43837
G1 X111.504 Y70.692 E.42319
G1 X112.761 Y69.657 E.05236
G1 X91.717 Y86.993 F30000
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.154 Y78.722 E.42319
G1 X70.633 Y87.39 E.43837
G1 X79.938 Y96.696 E.42319
G1 X78.682 Y97.732 E.05236
M73 P36 R31
G1 X50.846 Y103.691 F30000
G1 F8843.478
G1 X49.589 Y104.726 E.05236
G1 X58.895 Y114.032 E.42319
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.42319
G1 X61.367 Y95.023 E.05236
; WIPE_START
G1 X60.111 Y96.058 E-.61876
G1 X60.373 Y96.321 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X61.077 Y103.921 Z3.2 F30000
G1 X67.497 Y173.25 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F8843.478
G1 X66.464 Y171.991 E.05236
G1 X58.438 Y180.017 E.36497
G1 X49.789 Y169.477 E.43845
G1 X57.814 Y161.451 E.36497
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36497
G1 X42.172 Y160.195 E.05236
G1 X76.771 Y202.356 F30000
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.763 Y193.072 E.36497
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36497
G1 X66.055 Y189.299 E.05236
G1 X91.38 Y202.353 F30000
G1 F8843.478
G1 X92.413 Y203.612 E.05236
G1 X84.388 Y211.638 E.36497
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36497
G1 X99.316 Y212.024 E.08854
G1 X18.023 Y130.731 E3.69688
G1 X19.28 Y129.695 E.05236
G1 X108.68 Y223.434 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36497
G1 X105.652 Y237.55 E.20098
G1 X112.712 Y244.609 E.32105
G1 X111.956 Y245.232 E.03147
G1 X110.337 Y243.258 E.08209
G1 X118.362 Y235.233 E.36497
G1 X119.395 Y236.491 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/75
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
G17
G3 Z3.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X141.906 Y29.359 E.02819
G1 X184.993 Y81.862 E2.18405
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X142.209 Y29.11 E.03782
G1 X185.544 Y81.916 E2.03475
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.097 Y133.044 Z3.4 F30000
G1 X19.28 Y129.695 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X99.316 Y212.024 E3.69688
G1 X101.063 Y214.152 E.08854
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X91.38 Y202.353 E.05236
G1 X66.055 Y189.299 F30000
G1 F8843.478
G1 X67.088 Y190.557 E.05236
G1 X75.114 Y182.532 E.36497
G1 X83.763 Y193.072 E.43845
G1 X75.738 Y201.097 E.36497
G1 X76.771 Y202.356 E.05236
G1 X42.172 Y160.195 F30000
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36497
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36497
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36497
G1 X67.497 Y173.25 E.05236
G1 X119.395 Y236.491 F30000
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.337 Y243.258 E.36497
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03147
G1 X105.652 Y237.55 E.32105
G1 X101.687 Y232.718 E.20098
G1 X109.713 Y224.692 E.36497
G1 X108.68 Y223.434 E.05236
; WIPE_START
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X109.613 Y217.324 Z3.4 F30000
G1 X112.761 Y69.657 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8843.478
G1 X111.504 Y70.692 E.05236
G1 X102.198 Y61.386 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X132.548 Y53.356 E.43837
G1 X123.242 Y44.05 E.42319
G1 X133.764 Y35.382 E.43837
G1 X182.142 Y83.76 E2.20004
G1 X184.503 Y81.815 E.09839
G1 X180.594 Y77.051 E.19815
G1 X174.131 Y83.514 E.29391
G1 X165.482 Y72.974 E.43845
G1 X171.944 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X148.182 Y51.894 E.43845
G1 X154.645 Y45.431 E.29391
G1 X145.995 Y34.891 E.43845
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X91.676 Y70.054 E.42319
G1 X91.48 Y70.216 E.00819
G1 X23.839 Y137.856 E3.076
G1 X32.489 Y148.397 E.43845
G1 X40.515 Y140.371 E.36497
G1 X35.032 Y133.69 E.2779
G1 X37.851 Y131.368 E.11743
G1 X28.545 Y122.063 E.42319
G1 X39.067 Y113.395 E.43837
G1 X48.373 Y122.7 E.42319
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.42319
G1 X60.111 Y96.058 E.43837
G1 X69.417 Y105.364 E.42319
G1 X79.938 Y96.696 E.43837
G1 X70.633 Y87.39 E.42319
G1 X81.154 Y78.722 E.43837
G1 X90.46 Y88.028 E.42319
G1 X91.717 Y86.993 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X90.46 Y88.028 E-.61876
G1 X90.197 Y87.765 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/75
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
G17
G3 Z3.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X142.376 Y29.931 E.05199
G1 X184.993 Y81.862 E2.16026
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X142.679 Y29.682 E.05986
G1 X185.544 Y81.916 E2.01271
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.097 Y133.044 Z3.6 F30000
G1 X19.28 Y129.695 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X99.316 Y212.024 E3.69688
G1 X101.063 Y214.152 E.08854
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X83.763 Y193.072 E.43845
G1 X75.738 Y201.097 E.36497
G1 X67.088 Y190.557 E.43845
G1 X75.114 Y182.532 E.36497
G1 X66.464 Y171.991 E.43845
G1 X58.438 Y180.017 E.36497
G1 X49.789 Y169.477 E.43845
G1 X57.814 Y161.451 E.36497
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36497
G1 X42.172 Y160.195 E.05236
; WIPE_START
G1 X41.139 Y158.937 E-.61876
G1 X41.402 Y158.674 E-.14125
; WIPE_END
G1 E-.04 F1800
M73 P37 R31
G1 X43.058 Y151.223 Z3.6 F30000
G1 X49.63 Y121.665 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8843.478
G1 X48.373 Y122.7 E.05236
G1 X39.067 Y113.395 E.42319
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
M73 P37 R30
G1 X35.032 Y133.69 E.11743
G1 X40.515 Y140.371 E.2779
G1 X32.489 Y148.397 E.36497
G1 X23.839 Y137.856 E.43845
G1 X91.676 Y70.054 E3.08416
G1 X100.982 Y79.36 E.42319
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X141.302 Y29.172 E.23789
G1 X133.764 Y35.382 E.31407
G1 X182.142 Y83.76 E2.20004
G1 X184.503 Y81.815 E.09839
G1 X180.594 Y77.051 E.19815
G1 X174.131 Y83.514 E.29391
G1 X165.482 Y72.974 E.43845
G1 X171.944 Y66.511 E.29391
G1 X172.977 Y67.77 E.05236
G1 X155.799 Y61.175 F30000
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X154.645 Y45.431 E.43845
G1 X148.182 Y51.894 E.29391
G1 X147.149 Y50.635 E.05236
; WIPE_START
G1 X148.182 Y51.894 E-.61876
G1 X148.445 Y51.631 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X140.952 Y53.083 Z3.6 F30000
G1 X103.455 Y60.351 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8843.478
G1 X102.198 Y61.386 E.05236
G1 X111.504 Y70.692 E.42319
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.42319
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.42319
G1 X133.804 Y52.321 E.05236
G1 X91.717 Y86.993 F30000
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.154 Y78.722 E.42319
G1 X70.633 Y87.39 E.43837
G1 X79.938 Y96.696 E.42319
G1 X78.682 Y97.732 E.05236
G1 X48.332 Y105.762 F30000
G1 F8843.478
G1 X49.589 Y104.726 E.05236
G1 X58.895 Y114.032 E.42319
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.42319
G1 X61.367 Y95.023 E.05236
; WIPE_START
G1 X60.111 Y96.058 E-.61876
G1 X60.373 Y96.321 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X63.085 Y103.456 Z3.6 F30000
G1 X108.68 Y223.434 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36497
G1 X105.652 Y237.55 E.20098
G1 X112.712 Y244.609 E.32105
G1 X111.956 Y245.232 E.03147
G1 X110.337 Y243.258 E.08209
G1 X118.362 Y235.233 E.36497
G1 X119.395 Y236.491 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/75
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
G17
G3 Z3.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X142.845 Y30.503 E.07579
G1 X184.993 Y81.862 E2.13646
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X143.148 Y30.254 E.0819
G1 X185.544 Y81.916 E1.99067
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X38.828 Y142.796 Z3.8 F30000
G1 X42.172 Y160.195 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36497
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36497
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36497
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36497
G1 X75.738 Y201.097 E.43845
G1 X83.763 Y193.072 E.36497
G1 X92.413 Y203.612 E.43845
G1 X84.388 Y211.638 E.36497
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36497
G1 X99.316 Y212.024 E.08854
G1 X18.023 Y130.731 E3.69688
G1 X19.28 Y129.695 E.05236
G1 X61.367 Y95.023 F30000
G1 F8843.478
G1 X60.111 Y96.058 E.05236
G1 X69.417 Y105.364 E.42319
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.42319
G1 X48.332 Y105.762 E.05236
G1 X78.682 Y97.732 F30000
G1 F8843.478
G1 X79.938 Y96.696 E.05236
G1 X70.633 Y87.39 E.42319
G1 X81.154 Y78.722 E.43837
G1 X90.46 Y88.028 E.42319
G1 X91.717 Y86.993 E.05236
G1 X133.804 Y52.321 F30000
G1 F8843.478
G1 X132.548 Y53.356 E.05236
G1 X123.242 Y44.05 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X111.504 Y70.692 E.43837
G1 X102.198 Y61.386 E.42319
G1 X103.455 Y60.351 E.05236
; WIPE_START
G1 X102.198 Y61.386 E-.61876
G1 X102.461 Y61.649 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X109.872 Y59.823 Z3.8 F30000
G1 X147.149 Y50.635 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F8843.478
G1 X148.182 Y51.894 E.05236
G1 X154.645 Y45.431 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
G1 X170.911 Y65.252 F30000
G1 F8843.478
G1 X171.944 Y66.511 E.05236
G1 X165.482 Y72.974 E.29391
M73 P38 R30
G1 X174.131 Y83.514 E.43845
G1 X180.594 Y77.051 E.29391
G1 X184.503 Y81.815 E.19815
G1 X182.142 Y83.76 E.09839
G1 X133.764 Y35.382 E2.20004
G1 X141.302 Y29.172 E.31407
G1 X145.995 Y34.891 E.23789
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X91.676 Y70.054 E.42319
G1 X23.839 Y137.856 E3.08416
G1 X32.489 Y148.397 E.43845
G1 X40.515 Y140.371 E.36497
G1 X35.032 Y133.69 E.2779
G1 X37.851 Y131.368 E.11743
G1 X28.545 Y122.063 E.42319
G1 X39.067 Y113.395 E.43837
G1 X48.373 Y122.7 E.42319
G1 X49.63 Y121.665 E.05236
; WIPE_START
G1 X48.373 Y122.7 E-.61876
G1 X48.11 Y122.438 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X52.155 Y128.91 Z3.8 F30000
G1 X119.395 Y236.491 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.337 Y243.258 E.36497
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03147
G1 X105.652 Y237.55 E.32105
G1 X101.687 Y232.718 E.20098
G1 X109.713 Y224.692 E.36497
G1 X108.68 Y223.434 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/75
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
G17
G3 Z3.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X143.315 Y31.075 E.09958
G1 X184.993 Y81.862 E2.11266
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X143.618 Y30.826 E.10394
G1 X185.544 Y81.916 E1.96863
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.487 Y129.621 Z4 F30000
G1 X49.63 Y121.665 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X48.373 Y122.7 E.05236
G1 X39.067 Y113.395 E.42319
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
G1 X35.032 Y133.69 E.11743
G1 X40.515 Y140.371 E.2779
G1 X32.489 Y148.397 E.36497
G1 X23.839 Y137.856 E.43845
G1 X91.676 Y70.054 E3.08416
G1 X100.982 Y79.36 E.42319
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X141.302 Y29.172 E.23789
G1 X133.764 Y35.382 E.31407
G1 X182.142 Y83.76 E2.20004
G1 X184.503 Y81.815 E.09839
G1 X180.594 Y77.051 E.19815
G1 X174.131 Y83.514 E.29391
G1 X165.482 Y72.974 E.43845
G1 X171.944 Y66.511 E.29391
G1 X170.911 Y65.252 E.05236
G1 X155.799 Y61.175 F30000
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X154.645 Y45.431 E.43845
G1 X148.182 Y51.894 E.29391
G1 X147.149 Y50.635 E.05236
; WIPE_START
G1 X148.182 Y51.894 E-.61876
G1 X148.445 Y51.631 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X140.952 Y53.083 Z4 F30000
G1 X103.455 Y60.351 Z4
G1 Z3.6
G1 E.8 F1800
G1 F8843.478
G1 X102.198 Y61.386 E.05236
G1 X111.504 Y70.692 E.42319
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.42319
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.42319
G1 X133.804 Y52.321 E.05236
G1 X91.717 Y86.993 F30000
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.154 Y78.722 E.42319
G1 X70.633 Y87.39 E.43837
G1 X79.938 Y96.696 E.42319
G1 X78.682 Y97.732 E.05236
G1 X48.332 Y105.762 F30000
G1 F8843.478
G1 X49.589 Y104.726 E.05236
G1 X58.895 Y114.032 E.42319
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.42319
G1 X61.367 Y95.023 E.05236
; WIPE_START
G1 X60.111 Y96.058 E-.61876
G1 X60.373 Y96.321 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X61.077 Y103.921 Z4 F30000
G1 X67.497 Y173.25 Z4
G1 Z3.6
G1 E.8 F1800
G1 F8843.478
G1 X66.464 Y171.991 E.05236
G1 X58.438 Y180.017 E.36497
G1 X49.789 Y169.477 E.43845
G1 X57.814 Y161.451 E.36497
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36497
G1 X42.172 Y160.195 E.05236
G1 X76.771 Y202.356 F30000
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.763 Y193.072 E.36497
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36497
G1 X66.055 Y189.299 E.05236
G1 X91.38 Y202.353 F30000
G1 F8843.478
G1 X92.413 Y203.612 E.05236
G1 X84.388 Y211.638 E.36497
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36497
G1 X99.316 Y212.024 E.08854
G1 X18.023 Y130.731 E3.69688
G1 X19.28 Y129.695 E.05236
G1 X108.68 Y223.434 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36497
G1 X105.652 Y237.55 E.20098
G1 X112.712 Y244.609 E.32105
G1 X111.956 Y245.232 E.03147
G1 X110.337 Y243.258 E.08209
G1 X118.362 Y235.233 E.36497
G1 X119.395 Y236.491 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/75
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
M106 S191.25
G17
G3 Z4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X143.784 Y31.647 E.12338
G1 X184.993 Y81.862 E2.08887
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X144.087 Y31.398 E.12599
G1 X185.544 Y81.916 E1.94659
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.097 Y133.044 Z4.2 F30000
G1 X19.28 Y129.695 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X99.316 Y212.024 E3.69688
G1 X101.063 Y214.152 E.08854
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X91.38 Y202.353 E.05236
G1 X66.055 Y189.299 F30000
G1 F8843.478
G1 X67.088 Y190.557 E.05236
G1 X75.114 Y182.532 E.36497
G1 X83.763 Y193.072 E.43845
G1 X75.738 Y201.097 E.36497
G1 X76.771 Y202.356 E.05236
G1 X42.172 Y160.195 F30000
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36497
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36497
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36497
G1 X67.497 Y173.25 E.05236
; WIPE_START
G1 X66.464 Y171.991 E-.61876
G1 X66.201 Y172.254 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X67.462 Y164.727 Z4.2 F30000
M73 P39 R30
G1 X78.682 Y97.732 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F8843.478
G1 X79.938 Y96.696 E.05236
G1 X70.633 Y87.39 E.42319
G1 X81.154 Y78.722 E.43837
G1 X90.46 Y88.028 E.42319
G1 X91.717 Y86.993 E.05236
G1 X61.367 Y95.023 F30000
G1 F8843.478
M73 P39 R29
G1 X60.111 Y96.058 E.05236
G1 X69.417 Y105.364 E.42319
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.42319
G1 X48.332 Y105.762 E.05236
G1 X133.804 Y52.321 F30000
G1 F8843.478
G1 X132.548 Y53.356 E.05236
G1 X123.242 Y44.05 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X111.504 Y70.692 E.43837
G1 X102.198 Y61.386 E.42319
G1 X103.455 Y60.351 E.05236
; WIPE_START
G1 X102.198 Y61.386 E-.61876
G1 X102.461 Y61.649 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X109.872 Y59.823 Z4.2 F30000
G1 X147.149 Y50.635 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F8843.478
G1 X148.182 Y51.894 E.05236
G1 X154.645 Y45.431 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
G1 X170.911 Y65.252 F30000
G1 F8843.478
G1 X171.944 Y66.511 E.05236
G1 X165.482 Y72.974 E.29391
G1 X174.131 Y83.514 E.43845
G1 X180.594 Y77.051 E.29391
G1 X184.503 Y81.815 E.19815
G1 X182.142 Y83.76 E.09839
G1 X133.764 Y35.382 E2.20004
G1 X141.302 Y29.172 E.31407
G1 X145.995 Y34.891 E.23789
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X91.676 Y70.054 E.42319
G1 X23.839 Y137.856 E3.08416
G1 X32.489 Y148.397 E.43845
G1 X40.515 Y140.371 E.36497
G1 X35.032 Y133.69 E.2779
G1 X37.851 Y131.368 E.11743
G1 X28.545 Y122.063 E.42319
G1 X39.067 Y113.395 E.43837
G1 X48.373 Y122.7 E.42319
G1 X49.63 Y121.665 E.05236
; WIPE_START
G1 X48.373 Y122.7 E-.61876
G1 X48.11 Y122.438 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X52.155 Y128.91 Z4.2 F30000
G1 X119.395 Y236.491 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.337 Y243.258 E.36497
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03147
G1 X105.652 Y237.55 E.32105
G1 X101.687 Y232.718 E.20098
G1 X109.713 Y224.692 E.36497
G1 X108.68 Y223.434 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/75
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
M106 S178.5
G17
G3 Z4.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X144.253 Y32.219 E.14717
G1 X184.993 Y81.862 E2.06507
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X144.556 Y31.97 E.14803
G1 X185.544 Y81.916 E1.92454
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X34.869 Y133.674 Z4.4 F30000
G1 Z4
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X36.262 Y135.211 E.05571
G1 X41.174 Y141.197 E.20796
G1 X41.23 Y141.364 E.00474
G1 X42.086 Y142.308 E.0342
G1 X44.086 Y144.745 E.08469
G1 X44.142 Y144.913 E.00474
G1 X44.997 Y145.856 E.0342
G1 X46.998 Y148.294 E.08469
G1 X47.054 Y148.461 E.00474
G1 X47.909 Y149.405 E.0342
G1 X49.27 Y151.062 E.0576
; Slow Down End
G1 X32.653 Y148.574 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X26.655 Y141.265 E.25393
G1 X26.599 Y141.098 E.00474
G1 X25.744 Y140.154 E.0342
G1 X23.743 Y137.717 E.08468
G1 X23.717 Y137.624 E.00259
; Slow Down End
G1 X54.003 Y174.589 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X57.204 Y178.49 E.13555
; Slow Down End
G1 X62.295 Y166.934 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X65.353 Y170.66 E.12948
; Slow Down End
G1 X76.771 Y202.356 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.763 Y193.072 E.36497
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36497
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36497
G1 X65.632 Y170.978 E.04216
G1 X65.364 Y171.246 E.01219
G1 X61.806 Y166.91 E.18039
G1 X62.074 Y166.642 E.01219
G1 X57.814 Y161.451 E.21591
G1 X49.789 Y169.477 E.36497
G1 X41.139 Y158.937 E.43845
G1 X48.897 Y151.179 E.35278
G1 X49.281 Y151.648 E.01951
G1 X49.549 Y151.38 E.01219
G1 X49.957 Y151.877 E.02066
G1 X91.38 Y202.353 F30000
G1 F8843.478
G1 X92.413 Y203.612 E.05236
G1 X84.388 Y211.638 E.36497
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36497
G1 X99.316 Y212.024 E.08854
G1 X18.023 Y130.731 E3.69688
G1 X19.28 Y129.695 E.05236
G1 X91.717 Y86.993 F30000
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.154 Y78.722 E.42319
G1 X70.633 Y87.39 E.43837
G1 X79.938 Y96.696 E.42319
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.42319
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.42319
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.395 E.42319
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
G1 X35.154 Y133.59 E.11237
G1 X34.886 Y133.323 E.01218
G1 X34.502 Y133.639 E.01599
G1 X40.247 Y140.639 E.2912
G1 X32.757 Y148.129 E.3406
G1 X24.107 Y137.588 E.43845
G1 X91.676 Y70.054 E3.07197
G1 X100.982 Y79.36 E.42319
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X141.302 Y29.172 E.23789
G1 X133.764 Y35.382 E.31407
G1 X182.142 Y83.76 E2.20004
G1 X184.503 Y81.815 E.09839
G1 X180.594 Y77.051 E.19815
G1 X174.131 Y83.514 E.29391
G1 X173.454 Y82.688 E.03435
G1 X173.722 Y82.42 E.01219
G1 X173.607 Y82.28 E.00583
G1 X170.28 Y78.798 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X173.195 Y82.35 E.1234
; Slow Down End
G1 X177.009 Y72.705 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X179.78 Y76.083 E.11733
; Slow Down End
G1 X172.977 Y67.77 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X171.944 Y66.511 E.05236
G1 X165.482 Y72.974 E.29391
G1 X156.832 Y62.434 E.43845
G1 X163.027 Y56.239 E.28172
G1 X154.377 Y45.699 E.43845
G1 X148.45 Y51.626 E.26955
G1 X149.483 Y52.885 E.05236
G1 X150.396 Y54.397 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.396369
M73 P40 R29
G1 F3000;_EXTRUDE_SET_SPEED
G1 X148.906 Y52.754 E.06192
G1 X142.695 Y45.184 E.27338
G1 X142.59 Y45.1 E.00377
G1 X142.41 Y45.22 E.00603
; Slow Down End
G1 X149.352 Y39.176 F30000
; Slow Down Start
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X150.841 Y40.819 E.05956
G1 X155.754 Y46.805 E.20796
G1 X155.81 Y46.972 E.00474
G1 X156.665 Y47.915 E.0342
G1 X158.665 Y50.353 E.08468
G1 X158.722 Y50.52 E.00474
G1 X159.577 Y51.464 E.0342
G1 X161.577 Y53.901 E.08469
G1 X161.634 Y54.068 E.00474
G3 X163.4 Y56.122 I-20.01 J18.995 E.07278
; Slow Down End
; WIPE_START
G1 X162.489 Y55.012 E-.54574
G1 X162.11 Y54.594 E-.21426
; WIPE_END
G1 E-.04 F1800
G1 X154.514 Y55.34 Z4.4 F30000
G1 X103.455 Y60.351 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X102.198 Y61.386 E.05236
G1 X111.504 Y70.692 E.42319
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.42319
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.42319
G1 X133.804 Y52.321 E.05236
; WIPE_START
G1 X132.548 Y53.356 E-.61876
G1 X132.285 Y53.093 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X131.237 Y60.653 Z4.4 F30000
G1 X108.68 Y223.434 Z4.4
G1 Z4
G1 E.8 F1800
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36497
G1 X105.652 Y237.55 E.20098
G1 X112.712 Y244.609 E.32105
G1 X111.956 Y245.232 E.03147
G1 X110.337 Y243.258 E.08209
G1 X118.362 Y235.233 E.36497
G1 X119.395 Y236.491 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/75
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
M106 S102
G17
G3 Z4.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X144.723 Y32.791 E.17097
G1 X184.993 Y81.862 E2.04128
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X145.026 Y32.542 E.17007
G1 X185.544 Y81.916 E1.9025
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X31.487 Y130.459 Z4.6 F30000
G1 X31.056 Y130.106 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40902
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F3000
G1 X36.67 Y135.719 E.41199
G1 X39.64 Y139.339 E.24299
G1 X30.875 Y130.574 E.6433
G1 X30.55 Y130.898 E.02382
G1 X42.61 Y142.958 E.88511
G1 X44.038 Y144.698 E.11682
G1 X43.892 Y144.844 E.01072
G1 X45.375 Y146.327 E.10881
G1 X45.58 Y146.578 E.01682
G1 X30.226 Y131.223 E1.12693
G1 X29.901 Y131.547 E.02382
G1 X48.551 Y150.197 E1.36874
G1 X49.261 Y151.062 E.05811
G1 X49.014 Y151.309 E.01812
G1 X29.576 Y131.872 E1.42657
G1 X29.252 Y132.196 E.02382
G1 X48.689 Y151.634 E1.42657
G1 X48.365 Y151.959 E.02382
G1 X28.927 Y132.521 E1.42657
G1 X28.603 Y132.846 E.02382
G1 X48.04 Y152.283 E1.42657
G1 X47.716 Y152.608 E.02382
G1 X28.278 Y133.17 E1.42657
G1 X27.954 Y133.495 E.02382
G1 X47.391 Y152.932 E1.42657
G1 X47.066 Y153.257 E.02382
G1 X27.629 Y133.819 E1.42657
G1 X27.304 Y134.144 E.02382
G1 X46.742 Y153.581 E1.42657
G1 X46.417 Y153.906 E.02382
G1 X26.98 Y134.468 E1.42657
G1 X26.655 Y134.793 E.02382
G1 X46.093 Y154.231 E1.42657
G1 X45.768 Y154.555 E.02382
G1 X26.331 Y135.118 E1.42657
G1 X26.006 Y135.442 E.02382
G1 X45.444 Y154.88 E1.42657
G1 X45.119 Y155.204 E.02382
G1 X25.681 Y135.767 E1.42657
G1 X25.357 Y136.091 E.02382
G1 X35.199 Y145.934 E.72237
G1 X34.875 Y146.258 E.02382
G1 X25.032 Y136.416 E.72237
G1 X24.708 Y136.74 E.02382
G1 X34.55 Y146.583 E.72237
G1 X34.226 Y146.908 E.02382
G1 X24.383 Y137.065 E.72237
G1 X24.059 Y137.39 E.02382
G1 X33.901 Y147.232 E.72237
G1 X33.577 Y147.557 E.02382
G1 X23.826 Y137.806 E.71561
G1 X25.366 Y139.683 E.12601
G1 X26.849 Y141.166 E.10882
G1 X26.703 Y141.312 E.01072
G1 X26.796 Y141.426 E.00763
G1 X33.252 Y147.881 E.47379
G1 X32.927 Y148.206 E.02382
G1 X28.306 Y143.585 E.33917
M106 S102
G1 X25.219 Y135.623 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
G1 X24.067 Y136.775 E.05236
G1 X18.023 Y130.731 E.27486
G1 X19.28 Y129.695 E.05236
G1 X48.332 Y105.762 F30000
G1 F8843.478
G1 X49.589 Y104.726 E.05236
G1 X58.895 Y114.032 E.42319
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.42319
G1 X70.633 Y87.39 E.43837
G1 X79.938 Y96.696 E.42319
G1 X90.46 Y88.028 E.43837
G1 X81.154 Y78.722 E.42319
G1 X79.898 Y79.758 E.05236
G1 X112.761 Y69.657 F30000
G1 F8843.478
G1 X111.504 Y70.692 E.05236
G1 X102.198 Y61.386 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X132.548 Y53.356 E.43837
G1 X123.242 Y44.05 E.42319
G1 X133.764 Y35.382 E.43837
G1 X139.207 Y40.825 E.24753
G1 X138.313 Y41.719 E.04063
G1 X138.74 Y42.145 E.01941
G1 X104.067 Y76.818 E1.57678
G1 X100.982 Y79.36 E.12854
G1 X91.676 Y70.054 E.42319
G1 X91.48 Y70.216 E.00819
G1 X31.629 Y130.066 E2.72174
G1 X35.154 Y133.591 E.16027
G1 X37.851 Y131.368 E.11238
G1 X28.545 Y122.063 E.42319
G1 X39.067 Y113.395 E.43837
G1 X48.373 Y122.7 E.42319
G1 X49.63 Y121.665 E.05236
; WIPE_START
G1 X48.373 Y122.7 E-.61876
G1 X48.11 Y122.438 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X49.818 Y129.876 Z4.6 F30000
G1 X56.781 Y160.193 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F8843.478
G1 X57.814 Y161.451 E.05236
G1 X49.789 Y169.477 E.36497
G1 X53.761 Y174.318 E.20137
G1 X57.686 Y170.393 E.17847
G1 X34.516 Y147.223 E1.05367
G1 X35.317 Y146.422 E.03644
G1 X44.486 Y155.59 E.41693
M73 P41 R29
G1 X41.139 Y158.937 E.15219
G1 X40.106 Y157.678 E.05236
G1 X53.912 Y174.787 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.41876
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F3000
G1 X58.119 Y170.579 E.32368
G1 X58.431 Y170.891 E.02397
G1 X62.332 Y166.99 E.30009
G1 X62.35 Y167.012 E.00154
G1 X54.355 Y175.007 E.61506
G1 X54.653 Y175.371 E.02562
G1 X62.649 Y167.376 E.61506
G1 X62.947 Y167.74 E.02562
G1 X54.952 Y175.735 E.61506
G1 X55.251 Y176.099 E.02562
G1 X63.246 Y168.104 E.61506
G1 X63.545 Y168.468 E.02562
G1 X55.55 Y176.463 E.61506
G1 X55.849 Y176.827 E.02562
G1 X63.844 Y168.832 E.61506
G1 X64.143 Y169.197 E.02562
G1 X56.147 Y177.192 E.61506
G1 X56.446 Y177.556 E.02562
G1 X64.441 Y169.561 E.61506
G1 X64.74 Y169.925 E.02562
G1 X56.745 Y177.92 E.61506
G1 X57.044 Y178.284 E.02562
G1 X65.039 Y170.289 E.61506
G1 X65.338 Y170.653 E.02562
G1 X61.375 Y174.616 E.30488
M106 S102
G1 X76.147 Y183.79 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
G1 X75.114 Y182.532 E.05236
G1 X67.088 Y190.557 E.36497
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36497
G1 X65.632 Y170.978 E.04216
G1 X61.951 Y174.659 E.16739
G1 X99.316 Y212.024 E1.6992
G1 X101.063 Y214.152 E.08854
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X83.763 Y193.072 E.43845
G1 X75.738 Y201.097 E.36497
G1 X74.705 Y199.839 E.05236
G1 X119.395 Y236.491 F30000
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.337 Y243.258 E.36497
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03147
G1 X105.652 Y237.55 E.32105
G1 X101.687 Y232.718 E.20098
G1 X109.713 Y224.692 E.36497
G1 X108.68 Y223.434 E.05236
; WIPE_START
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X112.916 Y218.155 Z4.6 F30000
G1 X180.885 Y84.795 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F8843.478
M73 P41 R28
G1 X182.142 Y83.76 E.05236
G1 X177.421 Y79.039 E.21468
G1 X180.06 Y76.4 E.12001
G1 X180.594 Y77.051 E.02708
G1 X174.131 Y83.514 E.29391
G1 X175.164 Y84.773 E.05236
G1 X176.844 Y78.996 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.42047
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F3000
G1 X179.765 Y76.075 E.22658
G1 X179.465 Y75.709 E.02593
G1 X173.033 Y82.142 E.49889
G1 X172.733 Y81.776 E.02593
G1 X179.165 Y75.344 E.49889
G1 X178.865 Y74.978 E.02593
G1 X172.433 Y81.411 E.49889
G1 X172.133 Y81.045 E.02593
G1 X178.565 Y74.613 E.49889
G1 X178.265 Y74.247 E.02593
G1 X171.833 Y80.68 E.49889
G1 X171.533 Y80.314 E.02593
G1 X177.966 Y73.882 E.49889
G1 X177.666 Y73.516 E.02593
G1 X171.233 Y79.949 E.49889
G1 X170.933 Y79.583 E.02593
G1 X177.366 Y73.151 E.49889
G1 X177.066 Y72.786 E.02593
G1 X170.633 Y79.218 E.49889
G1 X170.334 Y78.853 E.02593
G1 X174.051 Y75.135 E.28831
M106 S102
G1 X155.799 Y61.175 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X157.453 Y61.813 E.02825
G1 X157.88 Y62.24 E.01941
G1 X159.251 Y60.869 E.06234
G1 X173.474 Y75.092 E.64681
G1 X170.039 Y78.527 E.15621
G1 X165.482 Y72.974 E.23099
G1 X171.944 Y66.511 E.29391
G1 X170.911 Y65.252 E.05236
G1 X147.035 Y50.782 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.41023
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F3000
G1 X157.883 Y61.63 E.80089
G1 X158.209 Y61.304 E.02403
G1 X145.518 Y48.613 E.93695
G1 X142.595 Y45.051 E.24055
G1 X142.407 Y45.206 E.0127
G1 X138.92 Y41.719 E.25746
G1 X139.097 Y41.541 E.01308
G1 X158.534 Y60.979 E1.43502
G1 X158.86 Y60.653 E.02403
G1 X139.422 Y41.216 E1.43502
G1 X139.748 Y40.891 E.02403
G1 X159.185 Y60.328 E1.43502
G1 X159.511 Y60.003 E.02403
G1 X140.073 Y40.565 E1.43502
G1 X140.399 Y40.24 E.02403
G1 X159.836 Y59.677 E1.43502
G1 X160.161 Y59.352 E.02403
G1 X140.724 Y39.914 E1.43502
G1 X141.049 Y39.589 E.02403
G1 X160.487 Y59.026 E1.43502
G1 X160.812 Y58.701 E.02403
G1 X141.375 Y39.263 E1.43502
G1 X141.7 Y38.938 E.02403
G1 X161.138 Y58.375 E1.43502
G1 X161.463 Y58.05 E.02403
G1 X142.026 Y38.612 E1.43502
G1 X142.351 Y38.287 E.02403
G1 X161.789 Y57.725 E1.43502
G1 X162.114 Y57.399 E.02403
G1 X142.677 Y37.962 E1.43502
G1 X143.002 Y37.636 E.02403
G1 X162.439 Y57.074 E1.43502
G1 X162.765 Y56.748 E.02403
G1 X143.327 Y37.311 E1.43502
G1 X143.653 Y36.985 E.02403
G1 X163.09 Y56.423 E1.43502
G1 X163.391 Y56.122 E.0222
G1 X163.165 Y55.846 E.01862
G1 X143.978 Y36.66 E1.41649
G1 X144.304 Y36.334 E.02403
G1 X160.187 Y52.217 E1.1726
G1 X159.954 Y51.934 E.01912
G1 X158.472 Y50.452 E.10946
G1 X158.618 Y50.306 E.01078
G1 X157.209 Y48.589 E.11596
G1 X144.629 Y36.009 E.92871
G1 X144.955 Y35.684 E.02403
G1 X154.231 Y44.96 E.68482
G1 X151.252 Y41.331 E.24507
G1 X145.137 Y35.215 E.4515
M106 S102
G1 X144.559 Y35.473 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8843.478
G1 X145.284 Y34.748 E.03295
G1 X145.711 Y35.175 E.01941
G1 X145.995 Y34.891 E.01294
G1 X144.962 Y33.632 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X145.995 Y34.891 E-.61876
G1 X145.732 Y35.153 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/75
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
M106 S173.4
G17
G3 Z4.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X145.192 Y33.363 E.19477
G1 X184.993 Y81.862 E2.01748
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X145.495 Y33.114 E.19211
G1 X185.544 Y81.916 E1.88046
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X38.356 Y140.266 Z4.8 F30000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51936
G1 F7556.042
G1 X38.054 Y139.898 E.01793
G1 X31.809 Y145.043 E.30453
G1 X32.111 Y145.411 E.01793
G1 X38.31 Y140.304 E.30227
G1 X38.957 Y140.324 F30000
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X38.113 Y139.296 E.03961
G1 X31.209 Y144.984 E.26644
G1 X32.052 Y146.012 E.03961
G1 X38.91 Y140.363 E.26465
G1 X39.487 Y140.376 F30000
G1 F9547.299
G1 X38.165 Y138.765 E.06208
G1 X30.678 Y144.932 E.2889
G1 X32.001 Y146.543 E.06208
G1 X39.44 Y140.414 E.28711
G1 X40.017 Y140.428 F30000
G1 F9547.299
G1 X38.216 Y138.234 E.08454
G1 X30.148 Y144.881 E.31136
G1 X31.949 Y147.075 E.08454
G1 X39.971 Y140.466 E.30958
G1 X40.547 Y140.48 F30000
G1 F9547.299
G1 X38.268 Y137.703 E.107
G1 X29.618 Y144.829 E.33383
G1 X31.897 Y147.606 E.107
G1 X40.501 Y140.518 E.33204
G1 X38.121 Y142.986 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X36.864 Y144.021 E.05236
G1 X32.489 Y148.397 E.19896
G1 X32.112 Y147.937 E.01913
G1 X33.821 Y146.529 E.07121
G1 X58.249 Y170.956 E1.11087
G1 X53.925 Y174.518 E.18012
M73 P42 R28
G1 X49.789 Y169.477 E.20969
G1 X57.814 Y161.451 E.36497
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36497
G1 X42.172 Y160.195 E.05236
G1 X64 Y169.058 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X62.858 Y167.667 E.0536
G1 X54.208 Y174.793 E.33383
G1 X56.487 Y177.57 E.107
G1 X65.137 Y170.444 E.33383
G1 X64.038 Y169.104 E.05161
G1 X63.708 Y169.297 F30000
G1 F9547.299
G1 X62.806 Y168.198 E.04235
G1 X54.738 Y174.845 E.31137
G1 X56.539 Y177.039 E.08454
G1 X64.607 Y170.392 E.31137
G1 X63.746 Y169.343 E.0404
G1 X63.417 Y169.536 F30000
G1 F9547.299
G1 X62.754 Y168.729 E.0311
G1 X55.268 Y174.896 E.2889
G1 X56.59 Y176.507 E.06208
G1 X64.077 Y170.34 E.2889
G1 X63.455 Y169.583 E.02919
G1 X63.125 Y169.775 F30000
G1 F9547.299
G1 X62.703 Y169.26 E.01984
G1 X55.799 Y174.948 E.26644
G1 X56.642 Y175.976 E.03961
G1 X63.546 Y170.288 E.26644
G1 X63.163 Y169.822 E.01798
G1 X62.795 Y170.046 F30000
; LINE_WIDTH: 0.51936
G1 F7556.044
G1 X62.644 Y169.862 E.00898
G1 X56.399 Y175.007 E.30453
G1 X56.701 Y175.375 E.01793
G1 X62.946 Y170.23 E.30453
G1 X62.833 Y170.092 E.00669
G1 X76.771 Y202.356 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.763 Y193.072 E.36497
G1 X92.413 Y203.612 E.43845
G1 X84.388 Y211.638 E.36497
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36497
G1 X99.316 Y212.024 E.08854
G1 X61.358 Y174.065 E1.72621
G1 X65.42 Y170.719 E.16923
G1 X66.464 Y171.991 E.05294
G1 X58.438 Y180.017 E.36497
G1 X67.088 Y190.557 E.43845
G1 X75.114 Y182.532 E.36497
G1 X74.081 Y181.273 E.05236
G1 X108.68 Y223.434 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36497
G1 X105.652 Y237.55 E.20098
G1 X112.712 Y244.609 E.32105
G1 X111.956 Y245.232 E.03147
G1 X110.337 Y243.258 E.08209
G1 X118.362 Y235.233 E.36497
G1 X119.395 Y236.491 E.05236
; WIPE_START
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X120.802 Y228.357 Z4.8 F30000
G1 X175.164 Y84.773 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F8843.478
G1 X174.131 Y83.514 E.05236
G1 X180.594 Y77.051 E.29391
G1 X179.999 Y76.326 E.03016
G1 X177.098 Y78.716 E.12087
G1 X182.142 Y83.76 E.22937
G1 X180.885 Y84.795 E.05236
G1 X172.676 Y79.216 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51935
G1 F7556.199
G1 X172.978 Y79.584 E.01793
G1 X177.526 Y75.837 E.22176
G1 X177.224 Y75.469 E.01793
G1 X172.722 Y79.178 E.2195
G1 X172.076 Y79.157 F30000
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X172.919 Y80.185 E.03961
G1 X178.126 Y75.896 E.20093
G1 X177.282 Y74.868 E.03961
G1 X172.122 Y79.119 E.19914
G1 X171.546 Y79.105 F30000
G1 F9547.299
G1 X172.868 Y80.716 E.06208
G1 X178.656 Y75.948 E.22339
G1 X177.334 Y74.337 E.06208
G1 X171.592 Y79.067 E.22161
G1 X171.015 Y79.054 F30000
G1 F9547.299
G1 X172.816 Y81.248 E.08454
G1 X179.187 Y75.999 E.24586
G1 X177.386 Y73.805 E.08454
G1 X171.062 Y79.016 E.24407
G1 X170.485 Y79.002 F30000
G1 F9547.299
G1 X172.764 Y81.779 E.107
G1 X179.717 Y76.051 E.26832
G1 X177.438 Y73.274 E.107
G1 X170.531 Y78.964 E.26653
G1 X150.818 Y50.145 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X149.561 Y51.18 E.05236
G1 X173.989 Y75.607 E1.11087
G1 X170.203 Y78.727 E.15776
G1 X165.482 Y72.974 E.23931
G1 X171.944 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
G1 X153.99 Y44.701 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X152.848 Y43.31 E.0536
G1 X145.895 Y49.038 E.26832
G1 X148.174 Y51.815 E.107
G1 X155.127 Y46.087 E.26832
G1 X154.028 Y44.748 E.05161
G1 X153.698 Y44.94 F30000
G1 F9547.299
G1 X152.796 Y43.841 E.04235
G1 X146.425 Y49.09 E.24586
G1 X148.226 Y51.284 E.08454
G1 X154.597 Y46.035 E.24586
G1 X153.736 Y44.987 E.0404
G1 X153.407 Y45.18 F30000
G1 F9547.299
G1 X152.744 Y44.373 E.0311
G1 X146.956 Y49.141 E.22339
G1 X148.278 Y50.752 E.06208
G1 X154.066 Y45.984 E.22339
G1 X153.445 Y45.226 E.02919
G1 X153.115 Y45.419 F30000
G1 F9547.299
G1 X152.693 Y44.904 E.01984
G1 X147.486 Y49.193 E.20093
G1 X148.33 Y50.221 E.03961
G1 X153.536 Y45.932 E.20093
G1 X153.153 Y45.465 E.01798
G1 X152.785 Y45.69 F30000
; LINE_WIDTH: 0.519355
G1 F7556.121
G1 X152.634 Y45.505 E.00898
G1 X148.086 Y49.252 E.22176
G1 X148.388 Y49.62 E.01793
G1 X152.936 Y45.873 E.22176
G1 X152.823 Y45.736 E.00669
; WIPE_START
G1 X152.936 Y45.873 E-.06756
G1 X151.53 Y47.032 E-.69245
; WIPE_END
G1 E-.04 F1800
G1 X144.174 Y49.07 Z4.8 F30000
G1 X103.455 Y60.351 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X102.198 Y61.386 E.05236
G1 X111.504 Y70.692 E.42319
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.42319
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.42319
G1 X142.592 Y45.081 E.41846
G1 X145.613 Y48.763 E.15314
G1 X146.453 Y48.071 E.03499
G1 X133.764 Y35.382 E.57704
G1 X141.302 Y29.172 E.31407
G1 X145.995 Y34.891 E.23789
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X91.676 Y70.054 E.42319
G1 X91.48 Y70.216 E.00819
G1 X23.839 Y137.856 E3.076
G1 X29.336 Y144.554 E.2786
G1 X30.712 Y143.42 E.05735
G1 X18.023 Y130.731 E.57704
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.395 E.42319
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.42319
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.42319
G1 X70.633 Y87.39 E.43837
G1 X79.938 Y96.696 E.42319
G1 X90.46 Y88.028 E.43837
G1 X81.154 Y78.722 E.42319
G1 X79.898 Y79.758 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X81.154 Y78.722 E-.61876
G1 X81.417 Y78.985 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/75
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
M106 S175.95
G17
G3 Z4.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X145.662 Y33.935 E.21856
G1 X184.993 Y81.862 E1.99369
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X145.965 Y33.687 E.21416
G1 X185.544 Y81.916 E1.85842
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X39.41 Y139.094 Z5 F30000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X38.264 Y137.697 E.05382
G1 X29.613 Y144.823 E.33383
G1 X31.901 Y147.611 E.10743
G1 X40.552 Y140.485 E.33383
G1 X39.448 Y139.14 E.05182
G1 X39.118 Y139.333 F30000
G1 F9547.299
G1 X38.212 Y138.228 E.04256
G1 X30.144 Y144.875 E.31136
G1 X31.953 Y147.08 E.08496
G1 X40.022 Y140.433 E.31136
G1 X39.156 Y139.379 E.04061
G1 X38.827 Y139.572 F30000
G1 F9547.299
G1 X38.16 Y138.76 E.03131
G1 X30.674 Y144.927 E.2889
G1 X32.005 Y146.549 E.0625
G1 X39.491 Y140.382 E.2889
G1 X38.865 Y139.619 E.0294
G1 X38.535 Y139.811 F30000
G1 F9547.299
G1 X38.108 Y139.291 E.02006
G1 X31.204 Y144.978 E.26644
G1 X32.057 Y146.018 E.04004
G1 X38.961 Y140.33 E.26644
G1 X38.574 Y139.858 E.01819
G1 X38.203 Y140.084 F30000
; LINE_WIDTH: 0.526495
G1 F7444.554
G1 X38.049 Y139.897 E.00925
G1 X31.809 Y145.038 E.30882
G1 X32.116 Y145.411 E.01847
G1 X38.356 Y140.271 E.30882
G1 X38.241 Y140.131 E.00693
G1 X42.172 Y160.195 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36497
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36497
G1 X53.921 Y174.512 E.20946
G1 X58.244 Y170.951 E.1801
G1 X33.826 Y146.534 E1.11041
G1 X32.116 Y147.942 E.07124
G1 X32.489 Y148.397 E.0189
G1 X36.812 Y144.074 E.19657
G1 X38.069 Y143.039 E.05236
G1 X64 Y169.058 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X62.854 Y167.661 E.05382
G1 X54.203 Y174.787 E.33383
G1 X56.491 Y177.575 E.10743
G1 X65.142 Y170.449 E.33383
G1 X64.038 Y169.104 E.05182
G1 X63.708 Y169.297 F30000
G1 F9547.299
G1 X62.802 Y168.192 E.04256
G1 X54.734 Y174.839 E.31136
G1 X56.543 Y177.044 E.08496
G1 X64.611 Y170.397 E.31136
G1 X63.746 Y169.343 E.04061
G1 X63.417 Y169.536 F30000
G1 F9547.299
G1 X62.75 Y168.724 E.03131
G1 X55.264 Y174.891 E.2889
G1 X56.595 Y176.513 E.0625
G1 X64.081 Y170.346 E.2889
G1 X63.455 Y169.583 E.0294
G1 X63.125 Y169.775 F30000
G1 F9547.299
G1 X62.698 Y169.255 E.02006
G1 X55.794 Y174.942 E.26644
G1 X56.647 Y175.982 E.04004
G1 X63.551 Y170.294 E.26644
G1 X63.163 Y169.822 E.01819
G1 X62.793 Y170.048 F30000
; LINE_WIDTH: 0.5265
G1 F7444.477
G1 X62.639 Y169.861 E.00925
G1 X56.399 Y175.002 E.30882
G1 X56.706 Y175.375 E.01847
G1 X62.946 Y170.235 E.30882
G1 X62.831 Y170.095 E.00693
G1 X74.081 Y181.273 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.114 Y182.532 E.05236
G1 X67.088 Y190.557 E.36497
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36497
G1 X65.424 Y170.724 E.05271
G1 X61.363 Y174.07 E.16921
G1 X99.316 Y212.024 E1.72598
G1 X101.063 Y214.152 E.08854
G1 X93.037 Y222.178 E.36497
M73 P43 R28
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X83.763 Y193.072 E.43845
G1 X75.738 Y201.097 E.36497
G1 X76.771 Y202.356 E.05236
G1 X119.395 Y236.491 F30000
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.337 Y243.258 E.36497
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03147
G1 X105.652 Y237.55 E.32105
G1 X101.687 Y232.718 E.20098
G1 X109.713 Y224.692 E.36497
G1 X108.68 Y223.434 E.05236
; WIPE_START
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X107.928 Y217.476 Z5 F30000
G1 X79.898 Y79.758 Z5
G1 Z4.6
G1 E.8 F1800
G1 F8843.478
G1 X81.154 Y78.722 E.05236
G1 X90.46 Y88.028 E.42319
G1 X79.938 Y96.696 E.43837
G1 X70.633 Y87.39 E.42319
G1 X60.111 Y96.058 E.43837
G1 X69.417 Y105.364 E.42319
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.42319
G1 X39.067 Y113.395 E.43837
G1 X48.373 Y122.7 E.42319
G1 X37.851 Y131.368 E.43837
G1 X28.545 Y122.063 E.42319
G1 X18.023 Y130.731 E.43837
G1 X30.707 Y143.415 E.57681
G1 X29.331 Y144.548 E.05733
G1 X23.839 Y137.856 E.27837
G1 X91.48 Y70.216 E3.076
G1 X91.676 Y70.054 E.00819
G1 X100.982 Y79.36 E.42319
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X152.629 Y42.974 E.33625
G1 X146.447 Y48.066 E.25752
G1 X133.764 Y35.382 E.57681
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.42319
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.42319
G1 X102.198 Y61.386 E.43837
G1 X111.504 Y70.692 E.42319
G1 X112.761 Y69.657 E.05236
; WIPE_START
G1 X111.504 Y70.692 E-.61876
G1 X111.241 Y70.429 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X118.714 Y68.877 Z5 F30000
G1 X155.799 Y61.175 Z5
G1 Z4.6
G1 E.8 F1800
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X171.944 Y66.511 E.43845
G1 X165.482 Y72.974 E.29391
G1 X170.198 Y78.721 E.23908
G1 X173.984 Y75.602 E.15773
G1 X149.567 Y51.185 E1.11041
G1 X150.823 Y50.15 E.05236
G1 X153.99 Y44.701 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X152.843 Y43.305 E.05382
G1 X145.891 Y49.032 E.26832
G1 X148.179 Y51.82 E.10743
G1 X155.131 Y46.093 E.26832
G1 X154.028 Y44.748 E.05182
G1 X153.698 Y44.94 F30000
G1 F9547.299
G1 X152.792 Y43.836 E.04256
G1 X146.421 Y49.084 E.24586
G1 X148.23 Y51.289 E.08496
G1 X154.601 Y46.041 E.24586
G1 X153.736 Y44.987 E.04061
G1 X153.407 Y45.18 F30000
G1 F9547.299
G1 X152.74 Y44.367 E.03131
G1 X146.951 Y49.136 E.22339
G1 X148.282 Y50.758 E.0625
G1 X154.071 Y45.989 E.22339
G1 X153.445 Y45.226 E.0294
G1 X153.115 Y45.419 F30000
G1 F9547.299
M73 P43 R27
G1 X152.688 Y44.898 E.02006
G1 X147.481 Y49.188 E.20093
G1 X148.334 Y50.227 E.04004
G1 X153.541 Y45.937 E.20093
G1 X153.153 Y45.465 E.01819
G1 X152.783 Y45.692 F30000
; LINE_WIDTH: 0.52649
G1 F7444.636
G1 X152.629 Y45.505 E.00925
G1 X148.087 Y49.247 E.22481
G1 X148.393 Y49.62 E.01847
G1 X152.936 Y45.878 E.22481
G1 X152.821 Y45.738 E.00693
G1 X178.579 Y74.665 F30000
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X177.433 Y73.269 E.05382
G1 X170.481 Y78.996 E.26832
G1 X172.769 Y81.784 E.10743
G1 X179.721 Y76.057 E.26832
G1 X178.618 Y74.712 E.05182
G1 X178.288 Y74.904 F30000
G1 F9547.299
G1 X177.382 Y73.8 E.04256
G1 X171.011 Y79.048 E.24586
G1 X172.82 Y81.253 E.08496
G1 X179.191 Y76.005 E.24586
G1 X178.326 Y74.951 E.04061
G1 X177.997 Y75.144 F30000
G1 F9547.299
G1 X177.33 Y74.331 E.03131
G1 X171.541 Y79.1 E.22339
G1 X172.872 Y80.722 E.0625
G1 X178.661 Y75.953 E.22339
G1 X178.035 Y75.19 E.0294
G1 X177.705 Y75.383 F30000
G1 F9547.299
G1 X177.278 Y74.862 E.02006
G1 X172.071 Y79.152 E.20093
G1 X172.924 Y80.191 E.04004
G1 X178.131 Y75.901 E.20093
G1 X177.743 Y75.429 E.01819
G1 X177.372 Y75.656 F30000
; LINE_WIDTH: 0.526485
G1 F7444.707
G1 X177.219 Y75.469 E.00925
G1 X172.676 Y79.211 E.22481
G1 X172.983 Y79.584 E.01847
G1 X177.525 Y75.842 E.22481
G1 X177.41 Y75.702 E.00693
G1 X180.885 Y84.795 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X182.142 Y83.76 E.05236
G1 X177.103 Y78.721 E.22914
G1 X180.004 Y76.332 E.12085
G1 X180.594 Y77.051 E.02993
G1 X174.131 Y83.514 E.29391
G1 X175.164 Y84.773 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X174.131 Y83.514 E-.61876
G1 X174.394 Y83.251 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/75
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
M106 S163.2
G17
G3 Z5 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X146.131 Y34.507 E.24236
G1 X184.993 Y81.862 E1.96989
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X146.434 Y34.259 E.2362
G1 X185.544 Y81.916 E1.83637
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X35.245 Y142.626 Z5.2 F30000
G1 X34.039 Y146.746 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X58.031 Y170.738 E1.09106
G1 X53.731 Y174.281 E.17915
G1 X49.789 Y169.477 E.19983
G1 X57.814 Y161.451 E.36497
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36497
G1 X32.489 Y148.397 E.43845
G1 X34.61 Y146.276 E.09642
G1 X35.866 Y145.241 E.05236
G1 X32.091 Y147.843 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F3000;_EXTRUDE_SET_SPEED
G1 X32.021 Y147.757 E.00331
; Slow Down End
G1 F9547.299
G1 X29.494 Y144.678 E.11865
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X29.424 Y144.592 E.00331
G1 X38.074 Y137.466 E.33383
G1 X38.144 Y137.551 E.00331
; Slow Down End
G1 F9547.299
G1 X40.671 Y140.631 E.11865
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X40.742 Y140.717 E.00331
; Slow Down End
G1 F9547.299
G1 X32.138 Y147.805 E.33204
G1 X39.119 Y139.333 F30000
G1 F9547.299
G1 X38.022 Y137.997 E.0515
G1 X29.954 Y144.644 E.31136
G1 X32.143 Y147.312 E.1028
G1 X40.211 Y140.665 E.31136
G1 X39.157 Y139.38 E.04952
G1 X38.827 Y139.573 F30000
G1 F9547.299
G1 X37.97 Y138.528 E.04025
G1 X30.484 Y144.695 E.2889
G1 X32.195 Y146.78 E.08034
G1 X39.681 Y140.613 E.2889
G1 X38.865 Y139.619 E.03831
G1 X38.536 Y139.812 F30000
G1 F9547.299
G1 X37.918 Y139.059 E.02899
G1 X31.014 Y144.747 E.26644
G1 X32.247 Y146.249 E.05788
G1 X39.151 Y140.561 E.26644
G1 X38.574 Y139.858 E.0271
G1 X38.244 Y140.051 F30000
G1 F9547.299
G1 X37.866 Y139.591 E.01774
G1 X31.544 Y144.799 E.24398
G1 X32.299 Y145.718 E.03542
G1 X38.621 Y140.51 E.24398
G1 X38.282 Y140.097 E.01589
G1 X37.942 Y140.299 F30000
; LINE_WIDTH: 0.4489
G1 F8867.432
G1 X37.813 Y140.142 E.00652
G1 X32.095 Y144.852 E.23757
G1 X32.353 Y145.166 E.01302
G1 X38.07 Y140.456 E.23757
G1 X37.98 Y140.346 E.00457
G1 X62.734 Y167.515 F30000
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X65.261 Y170.595 E.11865
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X65.332 Y170.681 E.00331
G1 X56.681 Y177.807 E.33383
G1 X56.611 Y177.721 E.00331
; Slow Down End
G1 F9547.299
G1 X54.084 Y174.642 E.11865
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X54.013 Y174.556 E.00331
G1 X62.664 Y167.43 E.33383
; Slow Down End
G1 F9547.299
G1 X62.696 Y167.469 E.00152
G1 X63.709 Y169.297 F30000
G1 F9547.299
G1 X62.612 Y167.961 E.0515
G1 X54.544 Y174.608 E.31136
G1 X56.733 Y177.276 E.1028
G1 X64.801 Y170.629 E.31137
G1 X63.747 Y169.344 E.04952
G1 X63.417 Y169.537 F30000
G1 F9547.299
G1 X62.56 Y168.492 E.04025
G1 X55.074 Y174.659 E.2889
G1 X56.785 Y176.744 E.08034
G1 X64.271 Y170.577 E.2889
G1 X63.455 Y169.583 E.03831
G1 X63.126 Y169.776 F30000
G1 F9547.299
G1 X62.508 Y169.023 E.02899
G1 X55.604 Y174.711 E.26644
G1 X56.837 Y176.213 E.05788
G1 X63.741 Y170.525 E.26644
G1 X63.164 Y169.822 E.0271
G1 X62.834 Y170.015 F30000
G1 F9547.299
G1 X62.456 Y169.555 E.01774
G1 X56.134 Y174.763 E.24398
G1 X56.889 Y175.682 E.03542
G1 X63.211 Y170.474 E.24398
G1 X62.872 Y170.061 E.01589
G1 X62.532 Y170.263 F30000
; LINE_WIDTH: 0.44889
G1 F8867.654
G1 X62.403 Y170.106 E.00652
G1 X56.685 Y174.816 E.23756
G1 X56.942 Y175.13 E.01302
G1 X62.66 Y170.42 E.23757
G1 X62.57 Y170.31 E.00457
G1 X74.705 Y199.839 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.763 Y193.072 E.36497
G1 X92.413 Y203.612 E.43845
G1 X84.388 Y211.638 E.36497
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36497
G1 X99.316 Y212.024 E.08854
G1 X61.575 Y174.283 E1.7163
G1 X65.614 Y170.956 E.16826
G1 X66.464 Y171.991 E.04308
G1 X58.438 Y180.017 E.36497
G1 X67.088 Y190.557 E.43845
G1 X75.114 Y182.532 E.36497
G1 X76.147 Y183.79 E.05236
G1 X108.68 Y223.434 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36497
G1 X105.652 Y237.55 E.20098
G1 X112.712 Y244.609 E.32105
G1 X111.956 Y245.232 E.03147
G1 X110.337 Y243.258 E.08209
G1 X118.362 Y235.233 E.36497
G1 X119.395 Y236.491 E.05236
; WIPE_START
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X120.802 Y228.357 Z5.2 F30000
G1 X175.164 Y84.773 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F8843.478
G1 X174.131 Y83.514 E.05236
G1 X180.594 Y77.051 E.29391
G1 X180.194 Y76.563 E.0203
G1 X177.316 Y78.934 E.1199
G1 X182.142 Y83.76 E.21946
G1 X180.885 Y84.795 E.05236
G1 X178.58 Y74.666 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X179.841 Y76.202 E.05921
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X179.911 Y76.288 E.00331
G1 X172.958 Y82.016 E.26832
G1 X172.888 Y81.93 E.00331
; Slow Down End
G1 F9547.299
G1 X170.361 Y78.851 E.11865
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X170.291 Y78.765 E.00331
G1 X177.243 Y73.037 E.26832
G1 X177.314 Y73.123 E.00331
; Slow Down End
G1 F9547.299
G1 X178.542 Y74.619 E.05766
G1 X178.288 Y74.905 F30000
G1 F9547.299
G1 X177.192 Y73.568 E.0515
G1 X170.821 Y78.817 E.24586
G1 X173.01 Y81.485 E.1028
G1 X179.381 Y76.236 E.24586
G1 X178.326 Y74.951 E.04952
G1 X177.997 Y75.144 F30000
G1 F9547.299
G1 X177.14 Y74.1 E.04025
G1 X171.351 Y78.868 E.22339
G1 X173.062 Y80.953 E.08034
G1 X178.851 Y76.185 E.22339
G1 X178.035 Y75.191 E.03831
G1 X177.705 Y75.383 F30000
G1 F9547.299
G1 X177.088 Y74.631 E.02899
G1 X171.881 Y78.92 E.20093
G1 X173.114 Y80.422 E.05788
G1 X178.321 Y76.133 E.20093
G1 X177.743 Y75.43 E.0271
G1 X177.414 Y75.623 F30000
G1 F9547.299
G1 X177.036 Y75.162 E.01774
G1 X172.411 Y78.972 E.17847
G1 X173.166 Y79.891 E.03542
G1 X177.79 Y76.081 E.17847
G1 X177.452 Y75.669 E.01589
G1 X177.111 Y75.871 F30000
; LINE_WIDTH: 0.44889
G1 F8867.651
G1 X176.982 Y75.714 E.00652
G1 X172.962 Y79.026 E.16704
G1 X173.22 Y79.339 E.01302
G1 X177.24 Y76.028 E.16704
G1 X177.149 Y75.917 E.00457
G1 X151.036 Y50.362 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X149.779 Y51.398 E.05236
G1 X173.771 Y75.39 E1.09106
G1 X170.008 Y78.49 E.15679
G1 X165.482 Y72.974 E.22945
G1 X171.944 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
G1 X148.298 Y51.966 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X145.771 Y48.887 E.11865
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X145.701 Y48.801 E.00331
G1 X152.654 Y43.073 E.26832
G1 X152.724 Y43.159 E.00331
; Slow Down End
G1 F9547.299
G1 X155.251 Y46.238 E.11865
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X155.321 Y46.324 E.00331
G1 X148.369 Y52.052 E.26832
; Slow Down End
G1 F9547.299
G1 X148.336 Y52.012 E.00152
G1 X153.699 Y44.941 F30000
G1 F9547.299
G1 X152.602 Y43.604 E.0515
G1 X146.231 Y48.853 E.24586
G1 X148.42 Y51.521 E.1028
G1 X154.791 Y46.272 E.24586
G1 X153.737 Y44.987 E.04952
G1 X153.407 Y45.18 F30000
G1 F9547.299
G1 X152.55 Y44.136 E.04025
G1 X146.761 Y48.904 E.22339
G1 X148.472 Y50.989 E.08034
G1 X154.261 Y46.221 E.22339
G1 X153.445 Y45.227 E.03831
G1 X153.116 Y45.419 F30000
G1 F9547.299
G1 X152.498 Y44.667 E.02899
G1 X147.291 Y48.956 E.20093
G1 X148.524 Y50.458 E.05788
G1 X153.731 Y46.169 E.20093
G1 X153.154 Y45.466 E.0271
G1 X152.824 Y45.659 F30000
G1 F9547.299
G1 X152.446 Y45.198 E.01774
G1 X147.822 Y49.008 E.17847
G1 X148.576 Y49.927 E.03542
G1 X153.2 Y46.117 E.17847
G1 X152.862 Y45.705 E.01589
G1 X152.521 Y45.907 F30000
; LINE_WIDTH: 0.44888
G1 F8867.871
M73 P44 R27
G1 X152.392 Y45.75 E.00652
G1 X148.372 Y49.062 E.16703
G1 X148.63 Y49.375 E.01302
G1 X152.65 Y46.063 E.16703
G1 X152.559 Y45.953 E.00457
; WIPE_START
G1 X152.65 Y46.063 E-.05419
G1 X151.216 Y47.245 E-.70582
; WIPE_END
G1 E-.04 F1800
G1 X144.622 Y51.088 Z5.2 F30000
G1 X112.761 Y69.657 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X111.504 Y70.692 E.05236
G1 X102.198 Y61.386 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X132.548 Y53.356 E.43837
G1 X123.242 Y44.05 E.42319
G1 X133.764 Y35.382 E.43837
G1 X146.235 Y47.853 E.56714
G1 X152.439 Y42.742 E.25847
G1 X145.995 Y34.891 E.32662
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X91.676 Y70.054 E.42319
G1 X91.48 Y70.216 E.00819
G1 X23.839 Y137.856 E3.076
G1 X29.141 Y144.317 E.26874
G1 X30.494 Y143.202 E.05638
G1 X18.023 Y130.731 E.56714
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.395 E.42319
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.42319
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.42319
G1 X70.633 Y87.39 E.43837
G1 X79.938 Y96.696 E.42319
G1 X90.46 Y88.028 E.43837
G1 X81.154 Y78.722 E.42319
G1 X79.898 Y79.758 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X81.154 Y78.722 E-.61876
G1 X81.417 Y78.985 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/75
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
M106 S153
G17
G3 Z5.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X34.999 Y145.004
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X40.827 Y140.203 E.24282
G1 X63.183 Y167.445 E1.13322
G1 X53.928 Y175.07 E.38561
G1 X31.572 Y147.828 E1.13322
G1 X34.953 Y145.042 E.14086
; WIPE_START
G1 X36.496 Y143.771 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X40.316 Y150.379 Z5.4 F30000
G1 X56.162 Y177.792 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8843.478
G1 X65.417 Y170.167 E.38561
G1 X121.164 Y238.097 E2.82579
G1 X111.909 Y245.722 E.38561
G1 X56.2 Y177.838 E2.82386
; WIPE_START
G1 X57.737 Y176.559 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X63.626 Y171.704 Z5.4 F30000
G1 X172.439 Y82.001 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8843.478
G1 X179.997 Y75.774 E.31489
G1 X184.993 Y81.862 E.25325
G1 X177.435 Y88.089 E.31489
G1 X172.477 Y82.047 E.25132
; WIPE_START
G1 X174.013 Y80.766 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X168.874 Y75.123 Z5.4 F30000
G1 X147.849 Y52.037 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8843.478
G1 X155.407 Y45.81 E.31489
G1 X177.763 Y73.052 E1.13322
G1 X170.205 Y79.279 E.31489
G1 X147.887 Y52.083 E1.13129
; WIPE_START
G1 X149.423 Y50.802 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X143.253 Y55.295 Z5.4 F30000
G1 X35.522 Y133.738 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8843.478
G1 X38.593 Y137.481 E.15568
G1 X29.338 Y145.106 E.38561
G1 X17.515 Y130.698 E.59931
G1 X141.35 Y28.681 E5.15934
G1 X146.601 Y35.079 E.26615
G1 X153.173 Y43.088 E.33316
G1 X145.615 Y49.315 E.31489
G1 X142.544 Y45.572 E.15569
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X146.904 Y34.831 E.25824
G1 X185.544 Y81.916 E1.81433
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.594 Y132.404 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X37.851 Y131.368 E.05236
G1 X28.545 Y122.063 E.42319
G1 X39.067 Y113.395 E.43837
G1 X48.373 Y122.7 E.42319
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.42319
G1 X60.111 Y96.058 E.43837
G1 X69.417 Y105.364 E.42319
G1 X68.16 Y106.4 E.05236
G1 X79.898 Y79.758 F30000
G1 F8843.478
G1 X81.154 Y78.722 E.05236
G1 X90.46 Y88.028 E.42319
G1 X79.938 Y96.696 E.43837
G1 X70.633 Y87.39 E.42319
G1 X69.376 Y88.426 E.05236
; WIPE_START
G1 X70.633 Y87.39 E-.61876
G1 X70.895 Y87.653 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X67.088 Y94.268 Z5.4 F30000
G1 X40.799 Y139.938 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X38.614 Y137.752 E.09206
G1 X38.321 Y137.993
G1 X40.507 Y140.179 E.09206
G1 X40.214 Y140.42
G1 X38.029 Y138.234 E.09206
G1 X37.736 Y138.475
G1 X39.922 Y140.66 E.09206
G1 X39.629 Y140.901
G1 X37.444 Y138.716 E.09206
G1 X37.152 Y138.957
G1 X39.337 Y141.142 E.09206
G1 X39.045 Y141.383
G1 X36.859 Y139.198 E.09206
G1 X36.567 Y139.439
G1 X38.752 Y141.624 E.09206
G1 X38.46 Y141.865
G1 X36.275 Y139.679 E.09206
G1 X35.982 Y139.92
G1 X38.167 Y142.106 E.09206
G1 X37.875 Y142.347
G1 X35.69 Y140.161 E.09206
G1 X35.397 Y140.402
G1 X37.583 Y142.587 E.09206
G1 X37.29 Y142.828
G1 X35.105 Y140.643 E.09206
G1 X34.813 Y140.884
G1 X36.998 Y143.069 E.09206
G1 X36.706 Y143.31
G1 X34.52 Y141.125 E.09206
G1 X34.228 Y141.366
G1 X36.413 Y143.551 E.09206
G1 X36.121 Y143.792
G1 X33.935 Y141.606 E.09206
G1 X33.643 Y141.847
G1 X35.828 Y144.033 E.09206
G1 X35.536 Y144.274
G1 X33.351 Y142.088 E.09206
G1 X33.058 Y142.329
G1 X35.244 Y144.514 E.09206
G1 X34.951 Y144.755
G1 X32.766 Y142.57 E.09206
G1 X32.474 Y142.811
G1 X34.659 Y144.996 E.09206
G1 X34.366 Y145.237
G1 X32.181 Y143.052 E.09206
G1 X31.889 Y143.293
G1 X34.074 Y145.478 E.09206
G1 X33.782 Y145.719
G1 X31.596 Y143.533 E.09206
G1 X31.304 Y143.774
G1 X33.489 Y145.96 E.09206
G1 X33.197 Y146.2
G1 X31.012 Y144.015 E.09206
G1 X30.719 Y144.256
G1 X32.905 Y146.441 E.09206
G1 X32.612 Y146.682
G1 X30.427 Y144.497 E.09206
G1 X30.134 Y144.738
G1 X32.32 Y146.923 E.09206
G1 X32.027 Y147.164
G1 X29.842 Y144.979 E.09206
G1 X29.55 Y145.22
G1 X31.735 Y147.405 E.09206
G1 X31.443 Y147.646
G1 X29.999 Y146.202 E.06083
M204 S10000
G1 X30.059 Y146.142 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.217979
G1 F15000
G1 X29.704 Y145.751 E.0073
; LINE_WIDTH: 0.173699
G1 X29.35 Y145.36 E.00545
; WIPE_START
G1 X29.704 Y145.751 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X35.893 Y141.284 Z5.4 F30000
G1 X39.697 Y138.539 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.107997
G1 F15000
G1 X39.403 Y138.214 E.00226
; LINE_WIDTH: 0.147641
G1 X39.108 Y137.889 E.00363
; LINE_WIDTH: 0.187286
G1 X38.813 Y137.564 E.005
; WIPE_START
G1 X39.108 Y137.889 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X32.772 Y142.144 Z5.4 F30000
G1 X29.406 Y144.405 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.63076
G1 F6124.116
G1 X37.848 Y137.451 E.50785
; WIPE_START
G1 X36.304 Y138.722 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X33.232 Y145.709 Z5.4 F30000
G1 X32.271 Y147.896 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.63075
G1 F6124.22
G1 X40.713 Y140.942 E.50785
G1 X40.106 Y157.678 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36497
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36497
G1 X53.566 Y174.079 E.19145
G1 X57.846 Y170.553 E.17832
G1 X34.224 Y146.931 E1.07422
G1 X35.481 Y145.896 E.05236
; WIPE_START
G1 X34.224 Y146.931 E-.61876
G1 X34.487 Y147.194 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X29.48 Y141.433 Z5.4 F30000
G1 X19.28 Y129.695 Z5.4
G1 Z5
G1 E.8 F1800
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X30.309 Y143.017 E.55872
G1 X28.976 Y144.115 E.05556
G1 X23.839 Y137.856 E.26035
G1 X91.48 Y70.216 E3.076
G1 X91.676 Y70.054 E.00819
G1 X100.982 Y79.36 E.42319
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X152.273 Y42.541 E.31824
G1 X146.05 Y47.668 E.2593
G1 X133.764 Y35.382 E.55872
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.42319
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.42319
G1 X102.198 Y61.386 E.43837
G1 X111.504 Y70.692 E.42319
G1 X112.761 Y69.657 E.05236
; WIPE_START
G1 X111.504 Y70.692 E-.61876
G1 X111.241 Y70.429 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X117.689 Y66.345 Z5.4 F30000
G1 X145.684 Y48.614 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.63073
G1 F6124.428
G1 X152.427 Y43.058 E.40571
; WIPE_START
G1 X150.884 Y44.33 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.36 Y45.462 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X153.229 Y43.331 E.08976
G1 X152.936 Y43.572
G1 X155.122 Y45.757 E.09206
G1 X154.829 Y45.998
G1 X152.644 Y43.812 E.09206
G1 X152.352 Y44.053
G1 X154.537 Y46.239 E.09206
G1 X154.245 Y46.48
G1 X152.059 Y44.294 E.09206
G1 X151.767 Y44.535
G1 X153.952 Y46.72 E.09206
G1 X153.66 Y46.961
G1 X151.475 Y44.776 E.09206
G1 X151.182 Y45.017
G1 X153.367 Y47.202 E.09206
G1 X153.075 Y47.443
G1 X150.89 Y45.258 E.09206
G1 X150.597 Y45.499
G1 X152.783 Y47.684 E.09206
G1 X152.49 Y47.925
G1 X150.305 Y45.739 E.09206
G1 X150.013 Y45.98
G1 X152.198 Y48.166 E.09206
G1 X151.906 Y48.407
G1 X149.72 Y46.221 E.09206
G1 X149.428 Y46.462
G1 X151.613 Y48.647 E.09206
G1 X151.321 Y48.888
G1 X149.135 Y46.703 E.09206
G1 X148.843 Y46.944
G1 X151.028 Y49.129 E.09206
G1 X150.736 Y49.37
G1 X148.551 Y47.185 E.09206
G1 X148.258 Y47.426
G1 X150.444 Y49.611 E.09206
G1 X150.151 Y49.852
G1 X147.966 Y47.666 E.09206
G1 X147.674 Y47.907
G1 X149.859 Y50.093 E.09206
G1 X149.566 Y50.334
G1 X147.381 Y48.148 E.09206
G1 X147.089 Y48.389
G1 X149.274 Y50.574 E.09206
G1 X148.982 Y50.815
G1 X146.796 Y48.63 E.09206
G1 X146.504 Y48.871
G1 X148.689 Y51.056 E.09206
G1 X148.397 Y51.297
G1 X146.212 Y49.112 E.09206
G1 X145.919 Y49.353
G1 X148.105 Y51.538 E.09206
G1 X147.812 Y51.779
G1 X145.627 Y49.593 E.09206
; WIPE_START
M204 S10000
G1 X147.041 Y51.008 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X147.621 Y51.961 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.16198
G1 F15000
G1 X147.252 Y51.554 E.00516
; LINE_WIDTH: 0.112777
G1 X146.884 Y51.148 E.00303
; WIPE_START
G1 X147.252 Y51.554 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.375 Y46.997 Z5.4 F30000
G1 X155.404 Y45.486 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.129942
G1 F15000
G1 X155.254 Y45.622 E.00139
; WIPE_START
G1 X155.404 Y45.486 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.981 Y43.785 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.106966
G1 F15000
G1 X153.696 Y43.471 E.00215
; LINE_WIDTH: 0.144547
G1 X153.411 Y43.157 E.00341
; WIPE_START
G1 X153.696 Y43.471 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.787 Y50.027 Z5.4 F30000
G1 X148.548 Y52.105 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.63073
G1 F6124.428
G1 X155.292 Y46.549 E.40571
G1 X155.799 Y61.175 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X171.944 Y66.511 E.43845
G1 X165.482 Y72.974 E.29391
G1 X169.843 Y78.288 E.22107
G1 X173.586 Y75.204 E.15596
G1 X149.964 Y51.583 E1.07422
G1 X151.221 Y50.547 E.05236
G1 X170.273 Y78.578 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.63074
G1 F6124.324
G1 X177.017 Y73.022 E.40572
; WIPE_START
G1 X175.474 Y74.294 E-.76
; WIPE_END
M73 P45 R27
G1 E-.04 F1800
G1 X179.759 Y75.194 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X177.842 Y73.276 E.08078
G1 X177.549 Y73.517
G1 X179.734 Y75.702 E.09206
G1 X179.442 Y75.943
G1 X177.257 Y73.758 E.09206
G1 X176.964 Y73.999
G1 X179.15 Y76.184 E.09206
G1 X178.857 Y76.425
G1 X176.672 Y74.239 E.09206
G1 X176.38 Y74.48
G1 X178.565 Y76.666 E.09206
G1 X178.273 Y76.907
G1 X176.087 Y74.721 E.09206
G1 X175.795 Y74.962
G1 X177.98 Y77.147 E.09206
G1 X177.688 Y77.388
G1 X175.502 Y75.203 E.09206
G1 X175.21 Y75.444
G1 X177.395 Y77.629 E.09206
G1 X177.103 Y77.87
G1 X174.918 Y75.685 E.09206
G1 X174.625 Y75.926
G1 X176.811 Y78.111 E.09206
G1 X176.518 Y78.352
G1 X174.333 Y76.166 E.09206
G1 X174.04 Y76.407
G1 X176.226 Y78.593 E.09206
G1 X175.933 Y78.834
G1 X173.748 Y76.648 E.09206
G1 X173.456 Y76.889
G1 X175.641 Y79.074 E.09206
G1 X175.349 Y79.315
G1 X173.163 Y77.13 E.09206
G1 X172.871 Y77.371
G1 X175.056 Y79.556 E.09206
G1 X174.764 Y79.797
G1 X172.579 Y77.612 E.09206
G1 X172.286 Y77.853
G1 X174.472 Y80.038 E.09206
G1 X174.179 Y80.279
G1 X171.994 Y78.093 E.09206
G1 X171.701 Y78.334
G1 X173.887 Y80.52 E.09206
G1 X173.594 Y80.761
G1 X171.409 Y78.575 E.09206
G1 X171.117 Y78.816
G1 X173.302 Y81.001 E.09206
G1 X173.01 Y81.242
G1 X170.824 Y79.057 E.09206
G1 X170.532 Y79.298
G1 X172.717 Y81.483 E.09206
G1 X172.425 Y81.724
G1 X170.239 Y79.539 E.09206
; WIPE_START
M204 S10000
G1 X171.654 Y80.953 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X172.222 Y81.915 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.193602
G1 F15000
G1 X171.909 Y81.57 E.00554
; LINE_WIDTH: 0.151431
G1 X171.596 Y81.225 E.00399
; LINE_WIDTH: 0.10926
G1 X171.284 Y80.88 E.00244
; WIPE_START
G1 X171.596 Y81.225 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X176.639 Y75.496 Z5.4 F30000
G1 X178.38 Y73.517 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.111698
G1 F15000
G1 X178.012 Y73.111 E.00298
; WIPE_START
G1 X178.38 Y73.517 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X174.391 Y80.025 Z5.4 F30000
G1 X173.138 Y82.069 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.63074
G1 F6124.324
G1 X179.882 Y76.513 E.40572
G1 X180.885 Y84.795 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X182.142 Y83.76 E.05236
G1 X177.501 Y79.119 E.21104
G1 X180.359 Y76.765 E.11908
G1 X180.594 Y77.051 E.01192
G1 X174.131 Y83.514 E.29391
G1 X175.164 Y84.773 E.05236
; WIPE_START
G1 X174.131 Y83.514 E-.61876
G1 X174.394 Y83.251 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X168.419 Y88.001 Z5.4 F30000
G1 X65.412 Y169.883 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S2000
G1 X63.226 Y167.698 E.09206
G1 X62.934 Y167.939
G1 X65.119 Y170.124 E.09206
G1 X64.827 Y170.365
G1 X62.641 Y168.179 E.09206
G1 X62.349 Y168.42
G1 X64.534 Y170.606 E.09206
G1 X64.242 Y170.847
G1 X62.057 Y168.661 E.09206
G1 X61.764 Y168.902
G1 X63.95 Y171.087 E.09206
G1 X63.657 Y171.328
G1 X61.472 Y169.143 E.09206
G1 X61.18 Y169.384
G1 X63.365 Y171.569 E.09206
G1 X63.073 Y171.81
G1 X60.887 Y169.625 E.09206
G1 X60.595 Y169.866
G1 X62.78 Y172.051 E.09206
G1 X62.488 Y172.292
G1 X60.302 Y170.106 E.09206
G1 X60.01 Y170.347
G1 X62.195 Y172.533 E.09206
G1 X61.903 Y172.774
G1 X59.718 Y170.588 E.09206
G1 X59.425 Y170.829
G1 X61.611 Y173.014 E.09206
G1 X61.318 Y173.255
G1 X59.133 Y171.07 E.09206
G1 X58.84 Y171.311
G1 X61.026 Y173.496 E.09206
G1 X60.733 Y173.737
G1 X58.548 Y171.552 E.09206
G1 X58.256 Y171.793
G1 X60.441 Y173.978 E.09206
G1 X60.149 Y174.219
G1 X57.963 Y172.033 E.09206
G1 X57.671 Y172.274
G1 X59.856 Y174.46 E.09206
G1 X59.564 Y174.7
G1 X57.379 Y172.515 E.09206
G1 X57.086 Y172.756
G1 X59.272 Y174.941 E.09206
G1 X58.979 Y175.182
G1 X56.794 Y172.997 E.09206
G1 X56.501 Y173.238
G1 X58.687 Y175.423 E.09206
G1 X58.394 Y175.664
G1 X56.209 Y173.479 E.09206
G1 X55.917 Y173.72
G1 X58.102 Y175.905 E.09206
G1 X57.81 Y176.146
G1 X55.624 Y173.96 E.09206
G1 X55.332 Y174.201
G1 X57.517 Y176.387 E.09206
G1 X57.225 Y176.627
G1 X55.039 Y174.442 E.09206
G1 X54.747 Y174.683
G1 X56.932 Y176.868 E.09206
G1 X56.64 Y177.109
G1 X54.455 Y174.924 E.09206
G1 X54.162 Y175.165
G1 X56.348 Y177.35 E.09206
G1 X56.055 Y177.591
G1 X54.398 Y175.934 E.06981
; WIPE_START
M204 S10000
G1 X55.812 Y177.348 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X60.957 Y171.71 Z5.4 F30000
G1 X64.097 Y168.271 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.110872
G1 F15000
G1 X63.756 Y167.895 E.00273
; LINE_WIDTH: 0.156265
G1 X63.415 Y167.518 E.00455
G1 X54.458 Y175.874 F30000
; LINE_WIDTH: 0.225725
M73 P45 R26
G1 F15000
G1 X54.205 Y175.594 E.00545
; LINE_WIDTH: 0.196957
G1 X53.951 Y175.314 E.00459
; WIPE_START
G1 X54.205 Y175.594 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X55.899 Y177.744 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0945355
G1 F15000
G1 X55.777 Y177.61 E.00074
; WIPE_START
G1 X55.899 Y177.744 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X56.861 Y177.86 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.63076
G1 F6124.116
G1 X65.302 Y170.906 E.50785
; WIPE_START
G1 X63.759 Y172.177 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X56.312 Y173.849 Z5.4 F30000
G1 X53.996 Y174.369 Z5.4
G1 Z5
G1 E.8 F1800
G1 F6124.116
G1 X62.438 Y167.415 E.50786
; WIPE_START
G1 X60.894 Y168.686 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X64.149 Y175.59 Z5.4 F30000
G1 X76.771 Y202.356 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.763 Y193.072 E.36497
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36497
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36497
G1 X65.779 Y171.157 E.0347
G1 X61.761 Y174.468 E.16744
G1 X99.316 Y212.024 E1.70788
G1 X101.063 Y214.152 E.08854
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X91.38 Y202.353 E.05236
G1 X119.395 Y236.491 F30000
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.337 Y243.258 E.36497
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03147
G1 X105.652 Y237.55 E.32105
G1 X101.687 Y232.718 E.20098
G1 X109.713 Y224.692 E.36497
G1 X108.68 Y223.434 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/75
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
M106 S165.75
G17
G3 Z5.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X40.525 Y139.835
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X62.502 Y166.614 E1.11397
G1 X63.485 Y167.813 E.04984
G1 X54.23 Y175.437 E.38561
G1 X31.27 Y147.46 E1.16381
G1 X40.479 Y139.873 E.38368
G1 X40.579 Y139.283 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X62.805 Y166.366 E1.04358
G1 X64.036 Y167.866 E.05783
G1 X54.176 Y175.99 E.38055
G1 X30.719 Y147.406 E1.1014
G1 X40.533 Y139.321 E.37876
; WIPE_START
M204 S10000
G1 X41.804 Y140.865 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X40.744 Y140.719 Z5.6 F30000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X40.472 Y140.387 E.01279
G1 X31.821 Y147.514 E.33383
G1 X32.365 Y148.176 E.02553
G1 X41.015 Y141.05 E.33383
G1 X40.782 Y140.766 E.01095
G1 X32.424 Y147.572 F30000
; LINE_WIDTH: 0.52306
G1 F7497.813
G1 X40.366 Y141.029 E.39029
G1 X35.602 Y146.017 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X34.345 Y147.053 E.05236
G1 X57.724 Y170.432 E1.06319
G1 X53.457 Y173.947 E.17778
G1 X49.789 Y169.477 E.18596
G1 X57.814 Y161.451 E.36497
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36497
G1 X40.106 Y157.678 E.05236
G1 X62.662 Y167.428 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X62.39 Y167.096 E.01279
G1 X53.74 Y174.222 E.33383
G1 X54.284 Y174.885 E.02553
G1 X62.934 Y167.759 E.33383
G1 X62.7 Y167.474 E.01095
G1 X54.342 Y174.281 F30000
; LINE_WIDTH: 0.52307
G1 F7497.657
G1 X62.285 Y167.738 E.3903
; WIPE_START
G1 X60.741 Y169.01 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X65.115 Y169.799 Z5.6 F30000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X67.578 Y172.801 E.12486
G1 X121.164 Y238.097 E2.71623
G1 X111.909 Y245.722 E.38561
G1 X55.86 Y177.424 E2.84109
G1 X65.069 Y169.837 E.38368
G1 X65.169 Y169.247 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X67.882 Y172.552 E.12736
G1 X121.715 Y238.151 E2.52771
G1 X111.855 Y246.275 E.38055
G1 X55.309 Y177.37 E2.65507
G1 X65.123 Y169.285 E.37876
; WIPE_START
M204 S10000
G1 X66.413 Y170.813 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X65.334 Y170.683 Z5.6 F30000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X65.061 Y170.351 E.01279
G1 X56.411 Y177.478 E.33383
G1 X56.955 Y178.14 E.02553
G1 X65.605 Y171.014 E.33383
G1 X65.372 Y170.73 E.01095
G1 X57.014 Y177.536 F30000
; LINE_WIDTH: 0.52305
G1 F7497.969
G1 X64.956 Y170.993 E.39028
G1 X59.471 Y181.276 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X58.438 Y180.017 E.05236
G1 X66.464 Y171.991 E.36497
G1 X65.888 Y171.289 E.02921
G1 X61.882 Y174.589 E.1669
G1 X99.316 Y212.024 E1.70237
G1 X101.063 Y214.152 E.08854
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X83.763 Y193.072 E.43845
G1 X75.738 Y201.097 E.36497
G1 X67.088 Y190.557 E.43845
G1 X75.114 Y182.532 E.36497
G1 X74.081 Y181.273 E.05236
G1 X108.68 Y223.434 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36497
G1 X105.652 Y237.549 E.20098
G1 X112.712 Y244.609 E.32105
G1 X111.956 Y245.232 E.03147
G1 X110.337 Y243.258 E.08209
G1 X118.362 Y235.233 E.36497
G1 X119.395 Y236.491 E.05236
; WIPE_START
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X120.629 Y228.294 Z5.6 F30000
G1 X172.137 Y81.633 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X179.695 Y75.407 E.31489
G1 X179.923 Y75.685 E.01157
G1 X184.993 Y81.862 E.25698
G1 X177.435 Y88.089 E.31489
G1 X172.175 Y81.679 E.26662
G1 X171.586 Y81.579 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X179.749 Y74.854 E.31504
G1 X180.226 Y75.436 E.02242
G1 X185.544 Y81.916 E.2497
G1 X177.381 Y88.641 E.31504
G1 X171.624 Y81.626 E.27033
; WIPE_START
M204 S10000
G1 X173.16 Y80.345 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X179.774 Y84.155 Z5.6 F30000
G1 X180.885 Y84.795 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X182.142 Y83.76 E.05236
G1 X177.622 Y79.241 E.20553
G1 X173.447 Y82.68 E.17396
G1 X174.131 Y83.514 E.03469
G1 X180.594 Y77.051 E.29391
G1 X181.627 Y78.31 E.05236
G1 X179.914 Y76.291 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X179.641 Y75.959 E.01279
G1 X172.688 Y81.687 E.26832
G1 X173.232 Y82.349 E.02553
G1 X180.185 Y76.622 E.26832
G1 X179.952 Y76.337 E.01095
G1 X173.291 Y81.746 F30000
; LINE_WIDTH: 0.52304
G1 F7498.126
G1 X179.536 Y76.601 E.30686
; WIPE_START
G1 X177.992 Y77.873 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X172.207 Y72.894 Z5.6 F30000
G1 X147.547 Y51.669 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X155.105 Y45.443 E.31489
G1 X177.081 Y72.222 E1.11397
G1 X178.065 Y73.42 E.04984
G1 X170.507 Y79.647 E.31489
G1 X147.585 Y51.715 E1.16188
G1 X146.996 Y51.615 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X155.159 Y44.89 E.31504
G1 X177.385 Y71.973 E1.04358
G1 X178.616 Y73.474 E.05783
G1 X170.453 Y80.199 E.31504
G1 X147.034 Y51.662 E1.09962
; WIPE_START
M204 S10000
G1 X148.57 Y50.381 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.343 Y50.669 Z5.6 F30000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X150.086 Y51.704 E.05236
G1 X173.465 Y75.083 E1.06319
G1 X169.734 Y78.156 E.15542
G1 X165.482 Y72.974 E.21558
G1 X171.944 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
G1 X155.324 Y46.327 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X155.051 Y45.995 E.01279
G1 X148.098 Y51.723 E.26832
G1 X148.642 Y52.385 E.02553
G1 X155.595 Y46.658 E.26832
G1 X155.362 Y46.373 E.01095
G1 X148.701 Y51.782 F30000
; LINE_WIDTH: 0.52304
G1 F7498.126
G1 X154.946 Y46.637 E.30686
G1 X177.242 Y73.036 F30000
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X176.97 Y72.704 E.01279
G1 X170.017 Y78.432 E.26832
G1 X170.561 Y79.094 E.02553
G1 X177.513 Y73.366 E.26832
G1 X177.28 Y73.082 E.01095
G1 X170.62 Y78.49 F30000
; LINE_WIDTH: 0.52304
G1 F7498.126
G1 X176.864 Y73.346 E.30686
; WIPE_START
G1 X175.321 Y74.617 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X168.291 Y77.59 Z5.6 F30000
G1 X35.522 Y133.738 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.895 Y137.849 E.17098
G1 X29.64 Y145.473 E.38561
G1 X17.515 Y130.698 E.61461
G1 X141.35 Y28.681 E5.15934
G1 X147.07 Y35.651 E.28995
G1 X153.475 Y43.456 E.32466
G1 X145.917 Y49.682 E.31489
G1 X142.544 Y45.572 E.17098
G1 X72.057 Y103.64 E2.93667
G1 X35.568 Y133.7 E1.52023
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.447 Y137.902 E.15838
G1 X29.586 Y146.026 E.38055
G1 X16.963 Y130.645 E.59267
G1 X141.404 Y28.129 E4.80247
G1 X147.373 Y35.403 E.28028
G1 X154.026 Y43.51 E.31239
G1 X145.863 Y50.235 E.31504
G1 X142.49 Y46.125 E.15838
G1 X72.307 Y103.943 E2.70855
G1 X36.12 Y133.754 E1.39654
; WIPE_START
M204 S10000
G1 X37.371 Y135.314 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X38.073 Y137.464 Z5.6 F30000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X37.8 Y137.132 E.01279
G1 X29.15 Y144.258 E.33383
G1 X29.694 Y144.921 E.02553
G1 X38.344 Y137.795 E.33383
G1 X38.111 Y137.51 E.01095
G1 X29.753 Y144.317 F30000
; LINE_WIDTH: 0.52306
G1 F7497.813
G1 X37.695 Y137.774 E.39029
; WIPE_START
G1 X36.151 Y139.046 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X41.533 Y133.634 Z5.6 F30000
G1 X70.673 Y104.329 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X69.417 Y105.364 E.05236
G1 X60.111 Y96.058 E.42319
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.42319
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.395 E.42319
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
G1 X36.594 Y132.404 E.05236
G1 X69.376 Y88.426 F30000
G1 F8843.478
G1 X70.633 Y87.39 E.05236
G1 X79.938 Y96.696 E.42319
G1 X90.46 Y88.028 E.43837
G1 X81.154 Y78.722 E.42319
G1 X79.898 Y79.758 E.05236
G1 X112.761 Y69.657 F30000
G1 F8843.478
G1 X111.504 Y70.692 E.05236
G1 X102.198 Y61.386 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X132.548 Y53.356 E.43837
M73 P46 R26
G1 X123.242 Y44.05 E.42319
G1 X133.764 Y35.382 E.43837
G1 X145.928 Y47.547 E.5532
G1 X152.165 Y42.409 E.25984
G1 X145.995 Y34.891 E.31274
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12855
G1 X91.676 Y70.054 E.42319
G1 X91.48 Y70.216 E.00819
G1 X23.839 Y137.856 E3.076
G1 X28.867 Y143.983 E.25486
G1 X30.188 Y142.895 E.05502
G1 X18.023 Y130.731 E.5532
G1 X19.28 Y129.695 E.05236
; WIPE_START
G1 X18.023 Y130.731 E-.61876
G1 X18.286 Y130.993 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X24.673 Y126.814 Z5.6 F30000
G1 X152.652 Y43.072 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X152.38 Y42.74 E.01279
G1 X145.427 Y48.467 E.26832
G1 X145.971 Y49.13 E.02553
G1 X152.924 Y43.402 E.26832
G1 X152.69 Y43.118 E.01095
G1 X146.03 Y48.526 F30000
; LINE_WIDTH: 0.52305
G1 F7497.969
G1 X152.275 Y43.382 E.30687
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7497.969
G1 X150.731 Y44.653 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/75
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
M106 S173.4
G17
G3 Z5.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.589 Y137.475 E.15546
G1 X29.333 Y145.1 E.38561
G1 X17.515 Y130.698 E.59909
G1 X141.35 Y28.681 E5.15934
G1 X147.54 Y36.223 E.31375
G1 X153.169 Y43.083 E.28534
G1 X145.611 Y49.309 E.31489
G1 X142.544 Y45.572 E.15546
G1 X73.472 Y102.475 E2.87774
G1 X35.568 Y133.7 E1.57917
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X39.14 Y137.529 E.144
G1 X29.28 Y145.652 E.38055
G1 X16.963 Y130.645 E.57829
G1 X141.404 Y28.129 E4.80247
G1 X147.843 Y35.975 E.30233
G1 X153.72 Y43.137 E.27597
G1 X145.557 Y49.862 E.31504
G1 X142.49 Y46.125 E.144
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.369 Y135.315 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.841 Y137.242 Z5.8 F30000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.49537
G1 F7956.681
G1 X37.698 Y137.067 E.0081
G1 X29.105 Y144.145 E.39787
G1 X29.393 Y144.495 E.01617
G1 X37.985 Y137.416 E.39787
G1 X37.879 Y137.288 E.00593
; WIPE_START
G1 X37.985 Y137.416 E-.063
G1 X36.569 Y138.583 E-.697
; WIPE_END
G1 E-.04 F1800
G1 X41.095 Y132.437 Z5.8 F30000
G1 X79.898 Y79.758 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X81.154 Y78.722 E.05236
G1 X90.46 Y88.028 E.42319
G1 X79.938 Y96.696 E.43837
G1 X70.633 Y87.39 E.42319
G1 X60.111 Y96.058 E.43837
G1 X69.417 Y105.364 E.42319
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.42319
G1 X39.067 Y113.395 E.43837
G1 X48.373 Y122.7 E.42319
G1 X37.851 Y131.368 E.43837
G1 X28.545 Y122.063 E.42319
G1 X18.023 Y130.731 E.43837
G1 X30.079 Y142.786 E.54824
G1 X28.77 Y143.865 E.05453
G1 X23.839 Y137.856 E.24993
G1 X91.48 Y70.216 E3.076
G1 X91.676 Y70.054 E.00819
G1 X100.982 Y79.36 E.42319
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X152.068 Y42.29 E.30781
G1 X145.819 Y47.438 E.26033
G1 X133.764 Y35.382 E.54824
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.42319
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.42319
G1 X102.198 Y61.386 E.43837
G1 X111.504 Y70.692 E.42319
G1 X112.761 Y69.657 E.05236
; WIPE_START
G1 X111.504 Y70.692 E-.61876
G1 X111.241 Y70.429 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X117.583 Y66.182 Z5.8 F30000
G1 X152.421 Y42.849 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.495365
G1 F7956.77
G1 X152.277 Y42.674 E.0081
G1 X145.383 Y48.354 E.31926
G1 X145.67 Y48.704 E.01617
G1 X152.564 Y43.024 E.31926
G1 X152.459 Y42.896 E.00593
; WIPE_START
G1 X152.564 Y43.024 E-.063
G1 X151.149 Y44.19 E-.697
; WIPE_END
G1 E-.04 F1800
G1 X148.195 Y51.228 Z5.8 F30000
G1 X147.853 Y52.042 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X155.411 Y45.816 E.31489
G1 X158.354 Y49.401 E.14914
G1 X177.759 Y73.047 E.98362
G1 X170.2 Y79.273 E.31489
G1 X147.892 Y52.089 E1.13083
G1 X147.302 Y51.988 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X155.465 Y45.263 E.31504
G1 X158.657 Y49.152 E.14985
G1 X178.31 Y73.101 E.92279
G1 X170.147 Y79.826 E.31504
G1 X147.34 Y52.035 E1.07085
; WIPE_START
M204 S10000
G1 X148.877 Y50.754 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.34 Y46.695 Z5.8 F30000
G1 X155.496 Y46.597 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.495365
G1 F7956.768
G1 X155.352 Y46.421 E.0081
G1 X148.458 Y52.101 E.31926
G1 X148.745 Y52.451 E.01617
G1 X155.639 Y46.771 E.31926
G1 X155.534 Y46.643 E.00593
G1 X155.799 Y61.175 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X171.944 Y66.511 E.43845
G1 X165.482 Y72.974 E.29391
G1 X169.637 Y78.038 E.21064
G1 X173.356 Y74.974 E.15493
G1 X150.195 Y51.813 E1.05327
G1 X151.452 Y50.778 E.05236
G1 X177.011 Y72.813 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.495365
G1 F7956.774
G1 X176.867 Y72.638 E.0081
G1 X169.973 Y78.318 E.31926
G1 X170.26 Y78.668 E.01617
G1 X177.154 Y72.988 E.31926
G1 X177.049 Y72.86 E.00593
; WIPE_START
G1 X177.154 Y72.988 E-.063
G1 X175.739 Y74.154 E-.697
; WIPE_END
G1 E-.04 F1800
G1 X172.785 Y81.192 Z5.8 F30000
G1 X172.443 Y82.006 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X180.001 Y75.78 E.31489
G1 X184.993 Y81.862 E.25302
G1 X177.435 Y88.089 E.31489
G1 X172.481 Y82.053 E.25109
G1 X171.892 Y81.952 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X180.055 Y75.227 E.31504
G1 X185.544 Y81.916 E.25773
G1 X177.381 Y88.641 E.31504
G1 X171.93 Y81.999 E.25595
; WIPE_START
M204 S10000
G1 X173.466 Y80.718 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X179.93 Y76.659 Z5.8 F30000
G1 X180.086 Y76.561 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.49536
G1 F7956.856
G1 X179.942 Y76.385 E.0081
G1 X173.048 Y82.065 E.31926
G1 X173.335 Y82.415 E.01617
G1 X180.229 Y76.735 E.31926
G1 X180.124 Y76.607 E.00593
G1 X181.627 Y78.31 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X180.594 Y77.051 E.05236
G1 X174.131 Y83.514 E.29391
G1 X173.544 Y82.799 E.02975
G1 X177.731 Y79.35 E.17444
G1 X182.142 Y83.76 E.20057
G1 X180.885 Y84.795 E.05236
; WIPE_START
G1 X182.142 Y83.76 E-.61876
G1 X181.879 Y83.497 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X175.756 Y88.054 Z5.8 F30000
G1 X65.422 Y170.172 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E2.82556
G1 X111.909 Y245.722 E.38561
G1 X56.166 Y177.797 E2.82556
G1 X65.375 Y170.21 E.38368
G1 X65.476 Y169.62 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X65.765 Y169.973 E.0136
G1 X121.715 Y238.151 E2.62708
G1 X111.855 Y246.275 E.38055
G1 X55.615 Y177.743 E2.64069
G1 X65.429 Y169.658 E.37876
; WIPE_START
M204 S10000
G1 X65.765 Y169.973 E-.17499
G1 X66.742 Y171.163 E-.58501
; WIPE_END
G1 E-.04 F1800
G1 X65.506 Y170.953 Z5.8 F30000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.49537
G1 F7956.684
G1 X65.363 Y170.778 E.0081
G1 X56.77 Y177.856 E.39787
G1 X57.057 Y178.206 E.01617
G1 X65.65 Y171.128 E.39787
G1 X65.544 Y170.999 E.00593
G1 X74.705 Y199.839 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.764 Y193.072 E.36497
G1 X92.413 Y203.612 E.43845
G1 X84.388 Y211.638 E.36497
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36497
G1 X99.316 Y212.024 E.08854
G1 X61.991 Y174.698 E1.69741
G1 X65.985 Y171.408 E.16641
G1 X66.464 Y171.991 E.02428
G1 X58.438 Y180.017 E.36497
G1 X67.088 Y190.557 E.43845
G1 X75.114 Y182.532 E.36497
G1 X76.147 Y183.79 E.05236
G1 X119.395 Y236.491 F30000
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.337 Y243.258 E.36497
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03147
G1 X105.652 Y237.55 E.32105
G1 X101.687 Y232.718 E.20098
G1 X109.713 Y224.692 E.36497
G1 X110.746 Y225.951 E.05236
; WIPE_START
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X104.647 Y219.023 Z5.8 F30000
G1 X40.832 Y140.208 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X43.774 Y143.794 E.14914
G1 X63.179 Y167.439 E.98362
G1 X53.923 Y175.064 E.38561
G1 X31.576 Y147.833 E1.13276
G1 X40.785 Y140.246 E.38368
G1 X40.886 Y139.656 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X44.077 Y143.545 E.14985
G1 X63.73 Y167.493 E.92279
G1 X53.869 Y175.616 E.38055
G1 X31.025 Y147.779 E1.07264
G1 X40.839 Y139.694 E.37876
; WIPE_START
M204 S10000
G1 X42.126 Y141.225 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X40.917 Y140.989 Z5.8 F30000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.49537
G1 F7956.684
G1 X40.773 Y140.814 E.0081
G1 X32.181 Y147.892 E.39787
G1 X32.468 Y148.242 E.01617
G1 X41.06 Y141.164 E.39787
G1 X40.955 Y141.035 E.00593
G1 X40.106 Y157.678 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36497
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36497
G1 X53.36 Y173.829 E.18102
G1 X57.615 Y170.323 E.1773
G1 X34.454 Y147.162 E1.05327
G1 X35.711 Y146.126 E.05236
G1 X62.431 Y167.206 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.49537
G1 F7956.681
G1 X62.287 Y167.031 E.0081
G1 X53.695 Y174.109 E.39787
G1 X53.982 Y174.459 E.01617
G1 X62.574 Y167.38 E.39787
G1 X62.469 Y167.252 E.00593
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7956.681
G1 X62.574 Y167.38 E-.06301
G1 X61.159 Y168.547 E-.69699
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/75
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
M106 S175.95
G17
G3 Z5.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X41.022 Y140.44
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X54.086 Y156.359 E.6622
G1 X62.989 Y167.208 E.4513
G1 X53.733 Y174.833 E.38561
G1 X31.766 Y148.065 E1.1135
G1 X40.975 Y140.478 E.38368
G1 X41.076 Y139.887 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X54.389 Y156.11 E.6251
G1 X63.54 Y167.262 E.4297
G1 X53.679 Y175.385 E.38055
G1 X31.215 Y148.011 E1.0548
G1 X41.029 Y139.926 E.37876
; WIPE_START
M204 S10000
G1 X42.303 Y141.468 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X41.086 Y141.131 Z6 F30000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41355
G1 F9713.197
G1 X40.968 Y140.988 E.00544
G1 X32.313 Y148.118 E.32832
G1 X32.548 Y148.404 E.01085
M73 P47 R26
G1 X41.203 Y141.274 E.32832
G1 X41.124 Y141.178 E.00366
G1 X35.808 Y146.223 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X34.551 Y147.258 E.05236
G1 X57.519 Y170.226 E1.0445
G1 X53.274 Y173.724 E.17687
G1 X49.789 Y169.477 E.17666
G1 X57.814 Y161.451 E.36497
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36497
G1 X40.106 Y157.678 E.05236
G1 X62.325 Y167.011 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.413545
G1 F9713.322
G1 X62.207 Y166.868 E.00544
G1 X53.552 Y173.998 E.32831
G1 X53.787 Y174.285 E.01085
G1 X62.442 Y167.154 E.32831
G1 X62.363 Y167.058 E.00366
; WIPE_START
G1 X62.442 Y167.154 E-.04748
G1 X60.995 Y168.347 E-.71252
; WIPE_END
G1 E-.04 F1800
G1 X65.612 Y170.404 Z6 F30000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X67.695 Y172.942 E.10559
G1 X121.164 Y238.097 E2.71034
G1 X111.909 Y245.722 E.38561
G1 X56.356 Y178.029 E2.81593
G1 X65.565 Y170.442 E.38368
G1 X65.665 Y169.851 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X67.998 Y172.693 E.10951
G1 X121.715 Y238.151 E2.52225
G1 X111.855 Y246.275 E.38055
G1 X55.805 Y177.975 E2.63177
G1 X65.619 Y169.89 E.37876
; WIPE_START
M204 S10000
G1 X66.913 Y171.415 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X65.676 Y171.095 Z6 F30000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41355
G1 F9713.197
G1 X65.558 Y170.952 E.00544
G1 X56.903 Y178.082 E.32832
G1 X57.138 Y178.368 E.01085
G1 X65.793 Y171.238 E.32832
G1 X65.714 Y171.142 E.00366
G1 X91.38 Y202.353 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X92.413 Y203.612 E.05236
G1 X84.388 Y211.638 E.36497
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36497
G1 X99.316 Y212.024 E.08854
G1 X62.087 Y174.795 E1.69302
G1 X66.071 Y171.513 E.16598
G1 X66.464 Y171.991 E.01991
G1 X58.438 Y180.017 E.36497
G1 X67.088 Y190.557 E.43845
G1 X75.114 Y182.532 E.36497
G1 X83.763 Y193.072 E.43845
G1 X75.738 Y201.097 E.36497
G1 X76.771 Y202.356 E.05236
G1 X108.68 Y223.434 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36497
G1 X105.652 Y237.55 E.20098
G1 X112.712 Y244.609 E.32105
G1 X111.956 Y245.232 E.03147
G1 X110.337 Y243.258 E.08209
G1 X118.362 Y235.233 E.36497
G1 X119.395 Y236.491 E.05236
; WIPE_START
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X120.658 Y228.305 Z6 F30000
G1 X172.633 Y82.238 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X180.191 Y76.011 E.31489
G1 X184.993 Y81.862 E.24339
G1 X177.435 Y88.089 E.31489
G1 X172.671 Y82.284 E.24146
G1 X172.082 Y82.184 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X180.245 Y75.459 E.31504
G1 X180.521 Y75.796 E.01297
G1 X185.544 Y81.916 E.23584
G1 X177.381 Y88.641 E.31504
G1 X172.12 Y82.23 E.24703
; WIPE_START
M204 S10000
G1 X173.656 Y80.95 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X177.828 Y79.446 Z6 F30000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X182.142 Y83.76 E.19618
G1 X184.503 Y81.815 E.09839
G1 X180.651 Y77.12 E.19527
M73 P47 R25
G1 X179.936 Y77.709 E.02977
G1 X174.131 Y83.514 E.264
G1 X175.164 Y84.773 E.05236
G1 X180.256 Y76.703 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41354
G1 F9713.453
G1 X180.138 Y76.559 E.00544
G1 X173.18 Y82.291 E.26392
G1 X173.415 Y82.578 E.01085
G1 X180.373 Y76.846 E.26392
G1 X180.294 Y76.749 E.00366
; WIPE_START
G1 X180.373 Y76.846 E-.04748
G1 X178.926 Y78.038 E-.71252
; WIPE_END
G1 E-.04 F1800
G1 X173.065 Y73.149 Z6 F30000
G1 X148.043 Y52.274 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X155.601 Y46.047 E.31489
G1 X168.665 Y61.966 E.6622
G1 X177.569 Y72.815 E.4513
G1 X170.011 Y79.042 E.31489
G1 X148.082 Y52.32 E1.11157
G1 X147.492 Y52.22 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X155.655 Y45.495 E.31504
G1 X168.968 Y61.718 E.6251
G1 X178.12 Y72.869 E.4297
G1 X169.957 Y79.594 E.31504
G1 X147.53 Y52.266 E1.05301
; WIPE_START
M204 S10000
G1 X149.067 Y50.986 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.548 Y50.874 Z6 F30000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X150.291 Y51.91 E.05236
G1 X173.259 Y74.878 E1.0445
G1 X169.551 Y77.933 E.1545
G1 X165.482 Y72.974 E.20627
G1 X171.944 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
G1 X155.666 Y46.739 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41354
G1 F9713.453
G1 X155.548 Y46.595 E.00544
G1 X148.59 Y52.327 E.26392
G1 X148.825 Y52.614 E.01085
G1 X155.783 Y46.882 E.26392
G1 X155.704 Y46.785 E.00366
G1 X176.904 Y72.619 F30000
; LINE_WIDTH: 0.41354
G1 F9713.452
G1 X176.787 Y72.476 E.00544
G1 X169.829 Y78.207 E.26392
G1 X170.064 Y78.494 E.01085
G1 X177.022 Y72.762 E.26392
G1 X176.942 Y72.665 E.00366
; WIPE_START
G1 X177.022 Y72.762 E-.04749
G1 X175.575 Y73.954 E-.71252
; WIPE_END
G1 E-.04 F1800
G1 X168.555 Y76.951 Z6 F30000
G1 X35.522 Y133.738 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.399 Y137.244 E.14583
G1 X29.143 Y144.869 E.38561
G1 X17.515 Y130.698 E.58946
G1 X141.35 Y28.681 E5.15934
G1 X148.009 Y36.795 E.33754
G1 X152.979 Y42.851 E.25191
G1 X145.421 Y49.078 E.31489
G1 X142.544 Y45.572 E.14583
G1 X74.886 Y101.309 E2.8188
G1 X35.568 Y133.7 E1.6381
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.95 Y137.298 E.13508
G1 X29.09 Y145.421 E.38055
G1 X16.963 Y130.645 E.56937
G1 X141.404 Y28.129 E4.80247
G1 X148.312 Y36.547 E.32437
G1 X153.53 Y42.905 E.24501
G1 X145.367 Y49.63 E.31504
G1 X142.49 Y46.125 E.13508
G1 X75.136 Y101.612 E2.59937
G1 X36.12 Y133.754 E1.50573
; WIPE_START
M204 S10000
G1 X37.368 Y135.317 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.735 Y137.047 Z6 F30000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41355
G1 F9713.19
G1 X37.617 Y136.904 E.00544
G1 X28.962 Y144.034 E.32832
G1 X29.197 Y144.321 E.01085
G1 X37.852 Y137.19 E.32832
G1 X37.773 Y137.094 E.00366
; WIPE_START
G1 X37.852 Y137.19 E-.04748
G1 X36.405 Y138.383 E-.71252
; WIPE_END
G1 E-.04 F1800
G1 X41.983 Y133.173 Z6 F30000
G1 X89.203 Y89.064 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.154 Y78.722 E.42319
G1 X70.633 Y87.39 E.43837
G1 X79.938 Y96.696 E.42319
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.42319
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.42319
G1 X60.151 Y112.997 E.05236
G1 X112.761 Y69.657 F30000
G1 F8843.478
G1 X111.504 Y70.692 E.05236
G1 X102.198 Y61.386 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X132.548 Y53.356 E.43837
G1 X123.242 Y44.05 E.42319
G1 X133.764 Y35.382 E.43837
G1 X145.723 Y47.341 E.54385
G1 X151.982 Y42.185 E.26076
G1 X145.995 Y34.891 E.30344
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X91.676 Y70.054 E.42319
G1 X91.48 Y70.216 E.00819
G1 X23.839 Y137.856 E3.076
G1 X28.684 Y143.76 E.24556
G1 X29.982 Y142.69 E.0541
G1 X18.023 Y130.731 E.54385
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.395 E.42319
G1 X40.324 Y112.359 E.05236
; WIPE_START
G1 X39.067 Y113.395 E-.61876
G1 X39.33 Y113.657 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X45.792 Y109.596 Z6 F30000
G1 X152.315 Y42.655 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41354
G1 F9713.452
G1 X152.197 Y42.511 E.00544
G1 X145.239 Y48.243 E.26392
G1 X145.474 Y48.53 E.01085
G1 X152.432 Y42.798 E.26392
G1 X152.353 Y42.701 E.00366
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9713.452
G1 X152.432 Y42.798 E-.04749
G1 X150.985 Y43.99 E-.71252
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/75
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
M106 S173.4
G17
G3 Z6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.234 Y137.042 E.13744
G1 X28.978 Y144.667 E.38561
G1 X17.515 Y130.698 E.58107
G1 X141.35 Y28.681 E5.15934
G1 X148.478 Y37.367 E.36134
G1 X152.813 Y42.65 E.21974
G1 X145.255 Y48.876 E.31489
G1 X142.544 Y45.572 E.13745
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.785 Y137.096 E.12732
G1 X28.924 Y145.219 E.38055
G1 X16.963 Y130.645 E.56161
G1 X141.404 Y28.129 E4.80247
G1 X148.781 Y37.119 E.34641
G1 X153.365 Y42.704 E.2152
G1 X145.201 Y49.429 E.31504
G1 X142.49 Y46.125 E.12732
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.367 Y135.318 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.594 Y132.404 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X37.851 Y131.368 E.05236
G1 X28.545 Y122.063 E.42319
G1 X39.067 Y113.395 E.43837
G1 X48.373 Y122.7 E.42319
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.42319
G1 X60.111 Y96.058 E.43837
G1 X69.417 Y105.364 E.42319
G1 X79.938 Y96.696 E.43837
G1 X70.633 Y87.39 E.42319
G1 X81.154 Y78.722 E.43837
G1 X90.46 Y88.028 E.42319
G1 X89.203 Y89.063 E.05236
; WIPE_START
G1 X90.46 Y88.028 E-.61876
G1 X90.197 Y87.765 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X96.398 Y83.314 Z6.2 F30000
G1 X145.322 Y48.193 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.60636
G1 F6389.323
G1 X152.085 Y42.621 E.38997
; WIPE_START
G1 X150.541 Y43.893 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.152 Y48.069 Z6.2 F30000
G1 X19.28 Y129.695 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X29.924 Y142.631 E.54118
G1 X28.631 Y143.696 E.05384
G1 X23.839 Y137.856 E.2429
G1 X91.48 Y70.216 E3.076
G1 X91.676 Y70.054 E.00819
G1 X100.982 Y79.36 E.42319
G1 X104.067 Y76.818 E.12855
G1 X145.995 Y34.891 E1.90671
G1 X141.302 Y29.172 E.23789
G1 X133.764 Y35.382 E.31407
G1 X145.664 Y47.282 E.54118
G1 X144.909 Y47.905 E.03147
G1 X142.592 Y45.081 E.11744
G1 X132.548 Y53.356 E.41846
M73 P48 R25
G1 X123.242 Y44.05 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X111.504 Y70.692 E.43837
G1 X102.198 Y61.386 E.42319
G1 X103.455 Y60.351 E.05236
; WIPE_START
G1 X102.198 Y61.386 E-.61876
G1 X102.461 Y61.649 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X97.381 Y67.346 Z6.2 F30000
G1 X29.045 Y143.983 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.60635
G1 F6389.436
G1 X37.505 Y137.014 E.48785
; WIPE_START
G1 X35.961 Y138.286 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.025 Y133.65 Z6.2 F30000
G1 X148.209 Y52.475 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X155.767 Y46.249 E.31489
G1 X157.25 Y48.057 E.07521
G1 X177.403 Y72.614 E1.02153
G1 X169.845 Y78.84 E.31489
G1 X148.247 Y52.522 E1.09481
G1 X147.657 Y52.421 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X155.821 Y45.696 E.31504
G1 X157.554 Y47.808 E.08137
G1 X177.955 Y72.668 E.95791
G1 X169.791 Y79.393 E.31504
G1 X147.696 Y52.468 E1.03748
; WIPE_START
M204 S10000
G1 X149.232 Y51.187 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.891 Y52.542 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.60634
G1 F6389.55
G1 X155.654 Y46.971 E.38996
G1 X155.799 Y61.175 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X171.944 Y66.511 E.43845
G1 X165.482 Y72.974 E.29391
G1 X169.498 Y77.869 E.20361
G1 X173.2 Y74.819 E.15424
G1 X150.35 Y51.968 E1.03914
G1 X151.607 Y50.933 E.05236
G1 X169.912 Y78.157 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.60636
G1 F6389.323
G1 X176.675 Y72.585 E.38997
; WIPE_START
G1 X175.131 Y73.857 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X173.129 Y81.222 Z6.2 F30000
G1 X172.799 Y82.439 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X180.357 Y76.213 E.31489
G1 X184.993 Y81.862 E.23501
G1 X177.435 Y88.089 E.31489
G1 X172.837 Y82.486 E.23308
G1 X172.247 Y82.385 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X180.411 Y75.66 E.31504
G1 X185.544 Y81.916 E.24105
G1 X177.381 Y88.641 E.31504
G1 X172.285 Y82.432 E.23926
; WIPE_START
M204 S10000
G1 X173.822 Y81.151 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X173.481 Y82.506 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.60633
G1 F6389.663
G1 X180.244 Y76.935 E.38995
G1 X175.164 Y84.773 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X174.131 Y83.514 E.05236
G1 X179.327 Y78.318 E.23629
G1 X180.703 Y77.184 E.05734
G1 X184.503 Y81.815 E.19261
G1 X182.142 Y83.76 E.09839
G1 X177.887 Y79.505 E.19351
; WIPE_START
G1 X179.301 Y80.919 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X173.312 Y85.651 Z6.2 F30000
G1 X65.777 Y170.605 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E2.80755
G1 X111.909 Y245.722 E.38561
G1 X56.521 Y178.23 E2.80755
G1 X65.731 Y170.643 E.38368
G1 X65.831 Y170.053 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X66.04 Y170.307 E.0098
G1 X121.715 Y238.151 E2.6142
G1 X111.855 Y246.275 E.38055
G1 X55.97 Y178.176 E2.624
G1 X65.785 Y170.091 E.37876
; WIPE_START
M204 S10000
G1 X66.04 Y170.307 E-.12707
G1 X67.096 Y171.595 E-.63293
; WIPE_END
G1 E-.04 F1800
G1 X60.777 Y175.876 Z6.2 F30000
G1 X57.204 Y178.297 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.60636
G1 F6389.323
G1 X65.664 Y171.327 E.48786
G1 X74.081 Y181.273 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.114 Y182.532 E.05236
G1 X67.088 Y190.557 E.36497
G1 X75.738 Y201.097 E.43845
G1 X83.764 Y193.072 E.36497
G1 X92.413 Y203.612 E.43845
G1 X84.388 Y211.638 E.36497
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36497
G1 X99.316 Y212.024 E.08854
G1 X62.146 Y174.854 E1.69035
G1 X66.124 Y171.577 E.16572
G1 X66.464 Y171.991 E.01725
G1 X58.438 Y180.017 E.36497
G1 X59.471 Y181.276 E.05236
G1 X119.395 Y236.491 F30000
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.337 Y243.258 E.36497
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03147
G1 X105.652 Y237.549 E.32105
G1 X101.687 Y232.718 E.20098
G1 X109.713 Y224.692 E.36497
G1 X108.68 Y223.434 E.05236
; WIPE_START
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X104.647 Y219.023 Z6.2 F30000
G1 X41.187 Y140.641 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X42.671 Y142.449 E.07521
G1 X62.823 Y167.006 E1.02153
G1 X53.568 Y174.631 E.38561
G1 X31.932 Y148.266 E1.09674
G1 X41.141 Y140.679 E.38368
G1 X41.241 Y140.089 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X42.974 Y142.2 E.08137
G1 X63.375 Y167.06 E.95791
G1 X53.514 Y175.184 E.38055
G1 X31.38 Y148.212 E1.03927
G1 X41.195 Y140.127 E.37876
; WIPE_START
M204 S10000
G1 X42.497 Y141.645 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.176 Y145.922 Z6.2 F30000
G1 X32.614 Y148.333 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.60635
G1 F6389.436
G1 X41.074 Y141.363 E.48785
G1 X40.106 Y157.678 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36497
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36497
G1 X53.221 Y173.66 E.17399
G1 X57.46 Y170.168 E.1766
G1 X34.61 Y147.317 E1.03914
G1 X35.866 Y146.282 E.05236
G1 X53.635 Y173.947 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.60636
G1 F6389.323
G1 X62.095 Y166.978 E.48786
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6389.323
G1 X60.551 Y168.25 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/75
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
M106 S178.5
G17
G3 Z6.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X41.295 Y140.773
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X56.019 Y158.715 E.74632
G1 X62.715 Y166.874 E.33943
G1 X53.46 Y174.499 E.38561
G1 X32.04 Y148.398 E1.08576
G1 X41.249 Y140.811 E.38368
G1 X41.349 Y140.221 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X56.322 Y158.466 E.70302
G1 X63.266 Y166.928 E.32608
G1 X53.406 Y175.052 E.38055
G1 X31.489 Y148.344 E1.0291
G1 X41.303 Y140.259 E.37876
; WIPE_START
M204 S10000
G1 X42.576 Y141.802 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.272 Y146.104 Z6.4 F30000
G1 X35.925 Y146.341 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X34.669 Y147.376 E.05236
G1 X57.401 Y170.109 E1.03379
G1 X53.169 Y173.596 E.17634
G1 X49.789 Y169.477 E.17133
G1 X57.814 Y161.451 E.36497
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36497
G1 X40.106 Y157.678 E.05236
G1 X32.66 Y148.459 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.51846
G1 F7570.341
G1 X41.188 Y141.433 E.41505
G1 X53.52 Y173.877 F30000
; LINE_WIDTH: 0.51845
G1 F7570.5
G1 X62.048 Y166.852 E.41504
; WIPE_START
G1 X60.505 Y168.124 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X65.885 Y170.737 Z6.4 F30000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X68.802 Y174.291 E.14784
G1 X121.164 Y238.097 E2.65422
G1 X111.909 Y245.722 E.38561
G1 X56.63 Y178.362 E2.80206
G1 X65.839 Y170.775 E.38368
G1 X65.939 Y170.185 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X69.105 Y174.043 E.14864
G1 X121.715 Y238.151 E2.47027
G1 X111.855 Y246.275 E.38055
G1 X56.078 Y178.308 E2.61892
G1 X65.893 Y170.223 E.37876
; WIPE_START
M204 S10000
G1 X67.18 Y171.754 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X60.844 Y176.009 Z6.4 F30000
G1 X57.25 Y178.423 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.51846
G1 F7570.341
G1 X65.778 Y171.397 E.41505
G1 X59.471 Y181.276 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X58.438 Y180.017 E.05236
G1 X66.464 Y171.991 E.36497
G1 X66.176 Y171.641 E.01458
G1 X62.205 Y174.913 E.16545
G1 X99.316 Y212.024 E1.68767
G1 X101.063 Y214.152 E.08854
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X83.763 Y193.072 E.43845
G1 X75.738 Y201.097 E.36497
G1 X67.088 Y190.557 E.43845
G1 X75.114 Y182.532 E.36497
G1 X74.081 Y181.273 E.05236
G1 X108.68 Y223.434 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36497
G1 X105.652 Y237.549 E.20098
G1 X112.712 Y244.609 E.32105
G1 X111.956 Y245.232 E.03147
G1 X110.337 Y243.258 E.08209
G1 X118.362 Y235.233 E.36497
G1 X119.395 Y236.491 E.05236
; WIPE_START
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X120.675 Y228.31 Z6.4 F30000
G1 X172.907 Y82.571 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X180.465 Y76.345 E.31489
G1 X184.993 Y81.862 E.22952
G1 X177.435 Y88.089 E.31489
G1 X172.945 Y82.618 E.22759
G1 X172.356 Y82.517 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X180.519 Y75.792 E.31504
G1 X180.843 Y76.187 E.0152
G1 X185.544 Y81.916 E.22077
G1 X177.381 Y88.641 E.31504
G1 X172.394 Y82.564 E.23418
; WIPE_START
M204 S10000
G1 X173.93 Y81.283 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X173.528 Y82.632 Z6.4 F30000
G1 Z6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.51846
G1 F7570.341
G1 X180.358 Y77.005 E.33244
G1 X179.975 Y77.892 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X178.718 Y78.927 E.05236
G1 X174.131 Y83.514 E.20859
G1 X177.483 Y87.598 E.16989
G1 X182.142 Y83.76 E.1941
G1 X177.945 Y79.564 E.19083
; WIPE_START
G1 X179.36 Y80.978 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X173.726 Y75.829 Z6.4 F30000
G1 X148.317 Y52.607 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X155.875 Y46.381 E.31489
G1 X170.599 Y64.322 E.74632
G1 X177.295 Y72.482 E.33943
G1 X169.737 Y78.708 E.31489
G1 X148.355 Y52.654 E1.08383
G1 X147.766 Y52.553 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X155.929 Y45.828 E.31504
G1 X170.902 Y64.073 E.70302
G1 X177.846 Y72.536 E.32608
G1 X169.683 Y79.261 E.31504
G1 X147.804 Y52.6 E1.02731
; WIPE_START
M204 S10000
G1 X149.34 Y51.319 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.938 Y52.668 Z6.4 F30000
G1 Z6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.51846
G1 F7570.341
G1 X155.768 Y47.041 E.33244
G1 X151.666 Y50.992 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X150.409 Y52.027 E.05236
G1 X173.142 Y74.76 E1.03379
G1 X169.446 Y77.805 E.15398
G1 X165.482 Y72.974 E.20095
G1 X171.944 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
G1 X169.798 Y78.087 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.51844
G1 F7570.659
G1 X176.628 Y72.459 E.33242
; WIPE_START
G1 X175.084 Y73.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X168.073 Y76.746 Z6.4 F30000
G1 X35.522 Y133.738 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.125 Y136.91 E.13195
G1 X28.87 Y144.535 E.38561
G1 X17.515 Y130.698 E.57558
G1 X141.35 Y28.681 E5.15934
G1 X148.948 Y37.94 E.38513
G1 X152.705 Y42.518 E.19045
G1 X145.147 Y48.744 E.31489
G1 X142.544 Y45.572 E.13195
G1 X77.716 Y98.979 E2.70093
G1 X35.568 Y133.7 E1.75597
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.677 Y136.964 E.12223
G1 X28.816 Y145.087 E.38055
G1 X16.963 Y130.645 E.55652
G1 X141.404 Y28.129 E4.80247
G1 X149.251 Y37.691 E.36845
G1 X153.256 Y42.572 E.18807
G1 X145.093 Y49.297 E.31504
G1 X142.49 Y46.125 E.12223
G1 X77.965 Y99.281 E2.49019
G1 X36.12 Y133.754 E1.61491
; WIPE_START
M204 S10000
G1 X37.366 Y135.318 E-.76
; WIPE_END
M73 P49 R25
G1 E-.04 F1800
G1 X32.02 Y140.766 Z6.4 F30000
G1 X28.93 Y143.913 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.51845
G1 F7570.5
G1 X37.458 Y136.888 E.41504
; WIPE_START
G1 X35.915 Y138.16 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X41.528 Y132.988 Z6.4 F30000
G1 X89.203 Y89.064 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.154 Y78.722 E.42319
G1 X70.633 Y87.39 E.43837
G1 X79.938 Y96.696 E.42319
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.42319
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.42319
G1 X57.638 Y115.068 E.05236
G1 X112.761 Y69.657 F30000
G1 F8843.478
G1 X111.504 Y70.692 E.05236
G1 X102.198 Y61.386 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X132.548 Y53.356 E.43837
G1 X123.242 Y44.05 E.42319
G1 X133.764 Y35.382 E.43837
G1 X145.605 Y47.223 E.5385
G1 X151.876 Y42.057 E.26128
G1 X145.995 Y34.891 E.29811
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12855
G1 X91.676 Y70.054 E.42319
G1 X91.48 Y70.216 E.00819
G1 X23.839 Y137.856 E3.076
G1 X28.579 Y143.631 E.24023
G1 X29.865 Y142.572 E.05357
G1 X18.023 Y130.731 E.5385
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.395 E.42319
G1 X40.324 Y112.359 E.05236
; WIPE_START
G1 X39.067 Y113.395 E-.61876
G1 X39.33 Y113.657 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X45.82 Y109.64 Z6.4 F30000
G1 X145.208 Y48.123 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.51847
G1 F7570.182
G1 X152.038 Y42.495 E.33244
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7570.182
G1 X150.495 Y43.767 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/75
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
G17
G3 Z6.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.028 Y136.792 E.12702
G1 X28.772 Y144.416 E.38561
G1 X17.515 Y130.698 E.57065
G1 X141.35 Y28.681 E5.15934
G1 X149.417 Y38.512 E.40893
G1 X152.608 Y42.399 E.16172
G1 X145.05 Y48.626 E.31489
G1 X142.544 Y45.572 E.12702
G1 X79.13 Y97.813 E2.642
G1 X35.568 Y133.7 E1.81491
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.579 Y136.845 E.11766
M73 P49 R24
G1 X28.719 Y144.969 E.38055
G1 X16.963 Y130.645 E.55195
G1 X141.404 Y28.129 E4.80247
G1 X149.72 Y38.263 E.39049
G1 X153.159 Y42.453 E.16146
G1 X144.996 Y49.178 E.31504
G1 X142.49 Y46.125 E.11766
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.365 Y135.319 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.594 Y132.404 Z6.6 F30000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X37.851 Y131.368 E.05236
G1 X28.545 Y122.063 E.42319
G1 X39.067 Y113.395 E.43837
G1 X48.373 Y122.7 E.42319
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.42319
G1 X60.111 Y96.058 E.43837
G1 X69.417 Y105.364 E.42319
G1 X70.673 Y104.329 E.05236
G1 X79.898 Y79.758 F30000
G1 F8843.478
G1 X81.154 Y78.722 E.05236
G1 X90.46 Y88.028 E.42319
G1 X79.938 Y96.696 E.43837
G1 X70.633 Y87.39 E.42319
G1 X69.376 Y88.426 E.05236
G1 X19.28 Y129.695 F30000
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X29.815 Y142.523 E.53625
G1 X28.535 Y143.578 E.05335
G1 X23.839 Y137.856 E.238
G1 X91.48 Y70.216 E3.076
G1 X91.676 Y70.054 E.00819
G1 X100.982 Y79.36 E.42319
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X151.832 Y42.003 E.29588
G1 X145.556 Y47.174 E.2615
G1 X133.764 Y35.382 E.53626
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.42319
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.42319
G1 X102.198 Y61.386 E.43837
G1 X111.504 Y70.692 E.42319
G1 X112.761 Y69.657 E.05236
; WIPE_START
G1 X111.504 Y70.692 E-.61876
G1 X111.241 Y70.429 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X117.61 Y66.223 Z6.6 F30000
G1 X145.105 Y48.063 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.43452
G1 F9193.054
G1 X152 Y42.383 E.27635
; WIPE_START
G1 X150.456 Y43.654 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.565 Y48.507 Z6.6 F30000
G1 X28.827 Y143.854 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.43454
G1 F9192.585
G1 X37.42 Y136.775 E.3444
; WIPE_START
G1 X35.876 Y138.047 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X41.959 Y133.436 Z6.6 F30000
G1 X148.414 Y52.726 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X155.972 Y46.499 E.31489
G1 X162.064 Y53.922 E.30877
G1 X177.198 Y72.363 E.76712
G1 X169.639 Y78.59 E.31489
G1 X148.453 Y52.772 E1.07396
G1 X147.863 Y52.672 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X156.026 Y45.947 E.31504
G1 X162.367 Y53.673 E.29772
G1 X177.749 Y72.417 E.72224
G1 X169.586 Y79.142 E.31504
G1 X147.901 Y52.718 E1.01817
; WIPE_START
M204 S10000
G1 X149.438 Y51.438 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.976 Y52.781 Z6.6 F30000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.43453
G1 F9192.819
G1 X155.871 Y47.1 E.27636
G1 X155.799 Y61.175 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X171.944 Y66.511 E.43845
G1 X165.482 Y72.974 E.29391
G1 X169.402 Y77.751 E.19871
G1 X173.092 Y74.711 E.15376
G1 X150.458 Y52.077 E1.0293
G1 X151.715 Y51.041 E.05236
G1 X169.694 Y78.027 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.43452
G1 F9193.054
G1 X176.59 Y72.347 E.27635
; WIPE_START
G1 X175.046 Y73.618 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X173.37 Y81.064 Z6.6 F30000
G1 X173.004 Y82.69 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X180.562 Y76.463 E.31489
G1 X184.993 Y81.862 E.22459
G1 X177.435 Y88.089 E.31489
G1 X173.042 Y82.736 E.22266
G1 X172.453 Y82.636 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X180.616 Y75.911 E.31504
G1 X180.679 Y75.987 E.00293
G1 X185.544 Y81.916 E.22846
G1 X177.381 Y88.641 E.31504
G1 X172.491 Y82.682 E.22961
; WIPE_START
M204 S10000
G1 X174.027 Y81.402 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X173.566 Y82.745 Z6.6 F30000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.43454
G1 F9192.585
G1 X180.461 Y77.064 E.27637
G1 X183.399 Y82.725 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X182.142 Y83.76 E.05236
G1 X177.995 Y79.613 E.18858
G1 X178.207 Y79.439 E.00882
G1 X174.131 Y83.514 E.18533
G1 X175.164 Y84.773 E.05236
; WIPE_START
G1 X174.131 Y83.514 E-.61876
G1 X174.394 Y83.251 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X168.458 Y88.048 Z6.6 F30000
G1 X65.983 Y170.856 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X67.014 Y172.113 E.05228
G1 X121.164 Y238.097 E2.74485
G1 X111.909 Y245.722 E.38561
G1 X56.727 Y178.481 E2.79712
G1 X65.936 Y170.894 E.38368
G1 X66.037 Y170.304 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X67.317 Y171.864 E.06012
G1 X121.715 Y238.151 E2.55422
G1 X111.855 Y246.275 E.38055
G1 X56.176 Y178.427 E2.61434
G1 X65.99 Y170.342 E.37876
; WIPE_START
M204 S10000
G1 X67.304 Y171.849 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X60.956 Y176.087 Z6.6 F30000
G1 X57.289 Y178.536 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.43455
G1 F9192.351
G1 X65.881 Y171.457 E.34441
G1 X76.771 Y202.356 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.763 Y193.072 E.36497
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36497
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36497
G1 X66.22 Y171.695 E.01235
G1 X62.254 Y174.962 E.16523
G1 X99.316 Y212.024 E1.68542
G1 X101.063 Y214.152 E.08854
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X91.38 Y202.353 E.05236
G1 X119.395 Y236.491 F30000
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.337 Y243.258 E.36497
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03147
G1 X105.652 Y237.55 E.32105
G1 X101.687 Y232.718 E.20098
G1 X109.713 Y224.692 E.36497
G1 X108.68 Y223.434 E.05236
; WIPE_START
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X104.647 Y219.023 Z6.6 F30000
G1 X41.393 Y140.892 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X47.484 Y148.315 E.30877
G1 X62.618 Y166.756 E.76712
G1 X53.362 Y174.381 E.38561
G1 X32.137 Y148.517 E1.07589
G1 X41.346 Y140.93 E.38368
G1 X41.447 Y140.34 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X47.787 Y148.066 E.29772
G1 X63.169 Y166.809 E.72224
G1 X53.308 Y174.933 E.38055
G1 X31.586 Y148.463 E1.01996
G1 X41.4 Y140.378 E.37876
; WIPE_START
M204 S10000
G1 X42.678 Y141.916 E-.76
; WIPE_END
G1 E-.04 F1800
M73 P50 R24
G1 X36.328 Y146.151 Z6.6 F30000
G1 X32.699 Y148.571 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.43455
G1 F9192.351
G1 X41.292 Y141.493 E.34441
G1 X40.106 Y157.678 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36497
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36497
G1 X53.124 Y173.542 E.16909
G1 X57.352 Y170.059 E.17612
G1 X34.718 Y147.425 E1.0293
G1 X35.975 Y146.39 E.05236
G1 X53.417 Y173.818 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.43454
G1 F9192.585
G1 X62.01 Y166.739 E.3444
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9192.585
G1 X60.466 Y168.011 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/75
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
M106 S181.05
G17
G3 Z6.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X41.479 Y140.997
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X61.128 Y164.94 E.99599
G1 X62.532 Y166.651 E.07116
G1 X53.276 Y174.276 E.38561
G1 X32.223 Y148.622 E1.06715
G1 X41.433 Y141.035 E.38368
G1 X41.533 Y140.444 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X61.431 Y164.691 E.93429
G1 X63.083 Y166.705 E.07757
G1 X53.222 Y174.828 E.38055
G1 X31.672 Y148.568 E1.01187
G1 X41.487 Y140.483 E.37876
; WIPE_START
M204 S10000
G1 X42.758 Y142.026 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.353 Y146.176 Z6.8 F30000
G1 X35.993 Y146.409 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X34.737 Y147.444 E.05236
G1 X57.333 Y170.041 E1.02759
G1 X53.108 Y173.521 E.17604
G1 X49.789 Y169.477 E.16824
G1 X57.814 Y161.451 E.36497
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36497
G1 X40.106 Y157.678 E.05236
G1 X32.708 Y148.669 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X41.385 Y141.521 E.30195
G1 X53.324 Y173.79 F30000
G1 F10588.235
G1 X62.001 Y166.642 E.30195
; WIPE_START
G1 X60.457 Y167.913 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X66.069 Y170.961 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X70.327 Y176.15 E.21584
G1 X121.164 Y238.097 E2.57692
G1 X111.909 Y245.722 E.38561
G1 X56.813 Y178.586 E2.79276
G1 X66.022 Y170.999 E.38368
G1 X66.123 Y170.409 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X70.63 Y175.901 E.21163
G1 X121.715 Y238.151 E2.39866
G1 X111.855 Y246.275 E.38055
G1 X56.262 Y178.532 E2.6103
G1 X66.076 Y170.447 E.37876
; WIPE_START
M204 S10000
G1 X67.358 Y171.982 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X60.991 Y176.191 Z6.8 F30000
G1 X57.298 Y178.633 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X65.975 Y171.485 E.30195
G1 X74.081 Y181.273 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.114 Y182.532 E.05236
G1 X67.088 Y190.557 E.36497
G1 X75.738 Y201.097 E.43845
G1 X83.763 Y193.072 E.36497
G1 X92.413 Y203.612 E.43845
G1 X84.388 Y211.638 E.36497
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36497
G1 X99.316 Y212.024 E.08854
G1 X62.273 Y174.981 E1.68457
G1 X66.237 Y171.715 E.16515
G1 X66.464 Y171.991 E.0115
G1 X58.438 Y180.017 E.36497
G1 X59.471 Y181.276 E.05236
G1 X108.68 Y223.434 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36497
G1 X105.652 Y237.55 E.20098
G1 X112.712 Y244.609 E.32105
G1 X111.956 Y245.232 E.03147
G1 X110.337 Y243.258 E.08209
G1 X118.362 Y235.233 E.36497
G1 X119.395 Y236.491 E.05236
; WIPE_START
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X120.686 Y228.314 Z6.8 F30000
G1 X173.09 Y82.795 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X180.648 Y76.568 E.31489
G1 X180.812 Y76.767 E.00827
G1 X184.993 Y81.862 E.21195
G1 X177.435 Y88.089 E.31489
G1 X173.129 Y82.841 E.21829
G1 X172.539 Y82.741 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X180.702 Y76.016 E.31504
G1 X181.115 Y76.518 E.01936
G1 X185.544 Y81.916 E.20799
G1 X177.381 Y88.641 E.31504
G1 X172.577 Y82.787 E.22556
M204 S10000
G1 X173.575 Y82.842 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X180.555 Y77.092 E.24288
G1 X183.399 Y82.725 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X182.142 Y83.76 E.05236
G1 X178.014 Y79.632 E.18773
G1 X174.131 Y83.514 E.17655
G1 X175.164 Y84.773 E.05236
; WIPE_START
G1 X174.131 Y83.514 E-.61876
G1 X174.394 Y83.251 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X169.447 Y77.439 Z6.8 F30000
G1 X148.501 Y52.831 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X156.059 Y46.604 E.31489
G1 X175.708 Y70.548 E.99599
G1 X177.111 Y72.258 E.07116
G1 X169.553 Y78.485 E.31489
G1 X148.539 Y52.877 E1.06522
G1 X147.949 Y52.777 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X156.113 Y46.052 E.31504
G1 X176.011 Y70.299 E.93429
G1 X177.663 Y72.312 E.07757
G1 X169.499 Y79.037 E.31504
G1 X147.987 Y52.823 E1.01008
M204 S10000
G1 X148.985 Y52.878 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X155.965 Y47.128 E.24288
G1 X151.734 Y51.06 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X150.477 Y52.095 E.05236
G1 X173.074 Y74.692 E1.02759
G1 X169.385 Y77.731 E.15368
G1 X165.482 Y72.974 E.19786
G1 X171.944 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
G1 X169.601 Y77.999 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X176.58 Y72.249 E.24288
; WIPE_START
G1 X175.037 Y73.521 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X168.029 Y76.545 Z6.8 F30000
G1 X35.522 Y133.738 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X37.942 Y136.687 E.12265
G1 X28.686 Y144.311 E.38561
G1 X17.515 Y130.698 E.56628
G1 X141.35 Y28.681 E5.15934
G1 X149.887 Y39.084 E.43273
G1 X152.522 Y42.294 E.13356
G1 X144.964 Y48.521 E.31489
G1 X142.544 Y45.572 E.12265
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.493 Y136.74 E.11361
G1 X28.632 Y144.864 E.38055
G1 X16.963 Y130.645 E.54791
G1 X141.404 Y28.129 E4.80247
G1 X150.19 Y38.835 E.41254
G1 X153.073 Y42.348 E.13537
G1 X144.91 Y49.073 E.31504
G1 X142.49 Y46.125 E.11361
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.364 Y135.32 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X31.928 Y140.677 Z6.8 F30000
G1 X28.734 Y143.826 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X37.411 Y136.678 E.30195
; WIPE_START
G1 X35.867 Y137.949 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X41.327 Y132.615 Z6.8 F30000
G1 X68.16 Y106.4 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X69.417 Y105.364 E.05236
G1 X60.111 Y96.058 E.42319
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.42319
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.395 E.42319
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
G1 X36.594 Y132.404 E.05236
G1 X69.376 Y88.426 F30000
G1 F8843.478
G1 X70.633 Y87.39 E.05236
G1 X79.938 Y96.696 E.42319
G1 X90.46 Y88.028 E.43837
G1 X81.154 Y78.722 E.42319
G1 X79.898 Y79.758 E.05236
G1 X112.761 Y69.657 F30000
G1 F8843.478
G1 X111.504 Y70.692 E.05236
G1 X102.198 Y61.386 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X132.548 Y53.356 E.43837
G1 X123.242 Y44.05 E.42319
G1 X133.764 Y35.382 E.43837
G1 X145.537 Y47.155 E.5354
G1 X151.816 Y41.983 E.26158
G1 X145.995 Y34.891 E.29503
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12855
G1 X91.676 Y70.054 E.42319
G1 X91.48 Y70.216 E.00819
G1 X23.839 Y137.856 E3.076
G1 X28.518 Y143.557 E.23715
G1 X29.797 Y142.504 E.05327
G1 X18.023 Y130.731 E.5354
G1 X19.28 Y129.695 E.05236
; WIPE_START
G1 X18.023 Y130.731 E-.61876
G1 X18.286 Y130.993 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X24.672 Y126.813 Z6.8 F30000
G1 X145.011 Y48.035 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
G1 X151.991 Y42.285 E.24288
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10588.235
G1 X150.447 Y43.557 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/75
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
M106 S186.15
G17
G3 Z6.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X41.531 Y141.061
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X53.935 Y156.175 E.62873
G1 X62.479 Y166.587 E.43309
G1 X53.224 Y174.211 E.38561
G1 X32.276 Y148.686 E1.06183
G1 X41.485 Y141.099 E.38368
G1 X41.585 Y140.509 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X54.238 Y155.927 E.5941
G1 X63.03 Y166.64 E.41283
G1 X53.17 Y174.764 E.38055
G1 X31.725 Y148.632 E1.00693
G1 X41.539 Y140.547 E.37876
; WIPE_START
M204 S10000
G1 X42.812 Y142.089 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X41.507 Y149.609 Z7 F30000
G1 X40.106 Y157.678 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36498
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36498
G1 X53.271 Y173.721 E.17654
G1 X57.516 Y170.224 E.17686
G1 X34.553 Y147.261 E1.04427
G1 X35.81 Y146.225 E.05236
; WIPE_START
G1 X34.553 Y147.261 E-.61877
G1 X34.816 Y147.524 E-.14123
; WIPE_END
G1 E-.04 F1800
G1 X40.92 Y152.106 Z7 F30000
G1 X66.121 Y171.025 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X68.701 Y174.168 E.13076
G1 X121.164 Y238.097 E2.65934
G1 X111.909 Y245.722 E.38561
G1 X56.866 Y178.65 E2.79009
G1 X66.075 Y171.063 E.38368
G1 X66.175 Y170.473 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X69.004 Y173.92 E.13282
G1 X121.715 Y238.151 E2.47501
G1 X111.855 Y246.275 E.38055
G1 X56.315 Y178.596 E2.60783
G1 X66.129 Y170.511 E.37876
; WIPE_START
M204 S10000
G1 X67.418 Y172.04 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X69.354 Y179.423 Z7 F30000
G1 X74.705 Y199.839 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.764 Y193.072 E.36498
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36498
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36498
G1 X66.073 Y171.515 E.0198
G1 X62.09 Y174.797 E.16597
G1 X99.317 Y212.024 E1.69294
G1 X101.063 Y214.152 E.08851
G1 X93.037 Y222.178 E.36498
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36498
G1 X91.38 Y202.353 E.05236
G1 X119.396 Y236.491 F30000
G1 F8843.478
G1 X118.363 Y235.232 E.05236
G1 X110.337 Y243.258 E.36498
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03148
G1 X105.651 Y237.549 E.32108
M73 P51 R24
G1 X101.687 Y232.718 E.20095
G1 X109.713 Y224.692 E.36498
G1 X110.746 Y225.951 E.05236
; WIPE_START
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X112.572 Y217.99 Z7 F30000
G1 X173.143 Y82.859 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X180.701 Y76.633 E.31489
G1 X184.993 Y81.862 E.21756
G1 X177.435 Y88.089 E.31489
G1 X173.181 Y82.905 E.21563
G1 X172.592 Y82.805 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X180.755 Y76.08 E.31504
G1 X180.97 Y76.342 E.01009
G1 X185.544 Y81.916 E.21479
G1 X177.381 Y88.641 E.31504
G1 X172.63 Y82.851 E.22309
; WIPE_START
M204 S10000
G1 X174.166 Y81.571 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X175.164 Y84.773 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X174.131 Y83.514 E.05236
G1 X179.911 Y77.734 E.26285
G1 X180.653 Y77.123 E.03092
G1 X184.503 Y81.815 E.19517
G1 X182.142 Y83.76 E.09839
G1 X177.83 Y79.449 E.19607
; WIPE_START
G1 X179.244 Y80.863 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X173.603 Y75.722 Z7 F30000
G1 X148.553 Y52.895 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X156.111 Y46.668 E.31489
G1 X168.515 Y61.783 E.62873
G1 X177.059 Y72.194 E.43309
G1 X169.501 Y78.421 E.31489
G1 X148.591 Y52.941 E1.0599
G1 X148.002 Y52.841 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X156.165 Y46.116 E.31504
G1 X168.818 Y61.534 E.5941
G1 X177.61 Y72.248 E.41283
G1 X169.447 Y78.973 E.31504
G1 X148.04 Y52.887 E1.00514
; WIPE_START
M204 S10000
G1 X149.576 Y51.607 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.737 Y58.005 Z7 F30000
G1 X155.799 Y61.175 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X171.945 Y66.511 E.43845
G1 X165.481 Y72.974 E.29391
G1 X169.549 Y77.93 E.20616
G1 X173.257 Y74.875 E.1545
G1 X150.294 Y51.912 E1.04427
G1 X151.55 Y50.877 E.05236
; WIPE_START
G1 X150.294 Y51.912 E-.61876
G1 X150.557 Y52.175 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X144.33 Y56.59 Z7 F30000
G1 X35.522 Y133.738 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X37.889 Y136.623 E.11999
G1 X28.634 Y144.247 E.38561
G1 X17.515 Y130.698 E.56362
G1 X141.35 Y28.681 E5.15934
G1 X150.356 Y39.656 E.45652
G1 X152.469 Y42.23 E.1071
G1 X144.911 Y48.457 E.31489
G1 X142.544 Y45.572 E.11999
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.441 Y136.676 E.11115
G1 X28.58 Y144.8 E.38055
G1 X16.963 Y130.645 E.54544
G1 X141.404 Y28.129 E4.80247
G1 X150.659 Y39.407 E.43458
G1 X153.02 Y42.284 E.11086
G1 X144.857 Y49.009 E.31504
G1 X142.49 Y46.125 E.11115
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.363 Y135.32 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.075 Y133.053 Z7 F30000
G1 X19.28 Y129.695 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X29.98 Y142.687 E.54375
G1 X28.682 Y143.757 E.05409
G1 X23.839 Y137.856 E.24545
G1 X91.48 Y70.215 E3.07604
G1 X91.676 Y70.054 E.00816
G1 X100.982 Y79.36 E.4232
G1 X104.067 Y76.819 E.12851
G1 X145.995 Y34.89 E1.90675
G1 X141.302 Y29.172 E.2379
G1 X133.764 Y35.382 E.31408
G1 X145.72 Y47.339 E.54375
G1 X144.959 Y47.966 E.03173
G1 X142.592 Y45.082 E.11999
G1 X132.548 Y53.356 E.41846
G1 X123.242 Y44.05 E.4232
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.4232
G1 X111.504 Y70.692 E.43837
G1 X102.198 Y61.386 E.4232
M73 P51 R23
G1 X103.455 Y60.351 E.05236
G1 X89.204 Y89.064 F30000
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.154 Y78.722 E.4232
G1 X70.632 Y87.39 E.43837
G1 X79.938 Y96.696 E.4232
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.4232
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.4232
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.394 E.4232
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.369 E.4232
G1 X36.594 Y132.404 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X37.851 Y131.369 E-.61876
G1 X37.588 Y131.106 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/75
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
M106 S188.7
G17
G3 Z7 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X37.837 Y136.559 E.11732
G1 X28.581 Y144.183 E.38561
G1 X17.515 Y130.698 E.56095
G1 X141.35 Y28.681 E5.15934
G1 X150.826 Y40.228 E.48032
G1 X152.416 Y42.166 E.08064
G1 X144.858 Y48.393 E.31489
G1 X142.544 Y45.572 E.11732
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.388 Y136.612 E.10868
G1 X28.527 Y144.736 E.38055
G1 X16.963 Y130.645 E.54297
G1 X141.404 Y28.129 E4.80247
G1 X151.129 Y39.979 E.45662
G1 X152.968 Y42.22 E.08635
G1 X144.805 Y48.945 E.31504
G1 X142.49 Y46.125 E.10868
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.363 Y135.321 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.594 Y132.404 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X37.851 Y131.369 E.05236
G1 X28.545 Y122.063 E.4232
G1 X39.067 Y113.394 E.43837
G1 X48.373 Y122.7 E.4232
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.4232
G1 X60.111 Y96.058 E.43837
G1 X69.417 Y105.364 E.4232
G1 X79.938 Y96.696 E.43837
G1 X70.632 Y87.39 E.4232
G1 X81.154 Y78.722 E.43837
G1 X90.46 Y88.028 E.4232
G1 X89.204 Y89.064 E.05236
G1 X103.455 Y60.351 F30000
G1 F8843.478
G1 X102.198 Y61.386 E.05236
G1 X111.504 Y70.692 E.4232
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.4232
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.4232
G1 X142.592 Y45.082 E.41846
G1 X144.906 Y47.902 E.11732
G1 X145.662 Y47.28 E.03147
G1 X133.764 Y35.382 E.54107
G1 X141.302 Y29.172 E.31408
G1 X145.995 Y34.89 E.2379
G1 X104.067 Y76.819 E1.90674
G1 X100.982 Y79.36 E.12851
G1 X91.676 Y70.054 E.4232
G1 X91.48 Y70.215 E.00816
G1 X23.839 Y137.856 E3.07604
G1 X28.629 Y143.693 E.24279
G1 X29.921 Y142.629 E.05383
G1 X18.023 Y130.731 E.54107
G1 X19.28 Y129.695 E.05236
; WIPE_START
G1 X18.023 Y130.731 E-.61876
G1 X18.286 Y130.993 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X24.834 Y127.072 Z7.2 F30000
G1 X148.606 Y52.959 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X156.164 Y46.732 E.31489
G1 X161.322 Y53.018 E.26147
G1 X177.006 Y72.13 E.79503
G1 X169.448 Y78.357 E.31489
G1 X148.644 Y53.005 E1.05457
G1 X148.054 Y52.905 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X156.218 Y46.18 E.31504
G1 X161.625 Y52.769 E.2539
G1 X177.558 Y72.184 E.74809
G1 X169.394 Y78.909 E.31504
G1 X148.092 Y52.952 E1.00021
; WIPE_START
M204 S10000
G1 X149.629 Y51.671 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.609 Y50.936 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X150.353 Y51.971 E.05236
G1 X173.198 Y74.816 E1.03892
G1 X169.496 Y77.866 E.15423
G1 X165.481 Y72.974 E.2035
G1 X171.945 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
; WIPE_START
G1 X156.832 Y62.434 E-.61876
G1 X157.095 Y62.171 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X161.773 Y68.201 Z7.2 F30000
G1 X173.196 Y82.923 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X180.754 Y76.697 E.31489
G1 X184.993 Y81.862 E.21489
G1 X177.435 Y88.089 E.31489
G1 X173.234 Y82.969 E.21296
G1 X172.644 Y82.869 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X180.807 Y76.144 E.31504
G1 X180.825 Y76.165 E.00082
G1 X185.544 Y81.916 E.22159
G1 X177.381 Y88.641 E.31504
G1 X172.682 Y82.916 E.22063
; WIPE_START
M204 S10000
G1 X174.219 Y81.635 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X177.889 Y79.507 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X182.142 Y83.76 E.1934
G1 X184.503 Y81.815 E.09839
G1 X180.706 Y77.187 E.1925
G1 X179.302 Y78.344 E.05849
G1 X174.131 Y83.514 E.23514
G1 X175.164 Y84.773 E.05236
; WIPE_START
G1 X174.131 Y83.514 E-.61876
G1 X174.394 Y83.251 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X168.468 Y88.061 Z7.2 F30000
G1 X66.174 Y171.089 Z7.2
M73 P52 R23
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X67.075 Y172.187 E.04567
G1 X121.164 Y238.097 E2.74176
G1 X111.909 Y245.722 E.38561
G1 X56.918 Y178.714 E2.78743
G1 X66.128 Y171.127 E.38368
G1 X66.228 Y170.537 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X67.378 Y171.938 E.05401
G1 X121.715 Y238.151 E2.55136
G1 X111.855 Y246.275 E.38055
G1 X56.367 Y178.66 E2.60536
G1 X66.181 Y170.575 E.37876
; WIPE_START
M204 S10000
G1 X67.378 Y171.938 E-.68932
G1 X67.496 Y172.082 E-.07068
; WIPE_END
G1 E-.04 F1800
G1 X69.415 Y179.469 Z7.2 F30000
G1 X74.705 Y199.839 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.764 Y193.072 E.36498
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36498
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36498
G1 X66.126 Y171.579 E.01714
G1 X62.149 Y174.856 E.16571
G1 X99.317 Y212.024 E1.69027
G1 X101.063 Y214.152 E.08851
G1 X93.037 Y222.178 E.36498
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36498
G1 X91.38 Y202.353 E.05236
G1 X110.746 Y225.951 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36498
G1 X105.651 Y237.549 E.20095
G1 X112.712 Y244.609 E.32108
G1 X111.956 Y245.232 E.03148
G1 X110.337 Y243.258 E.08209
G1 X118.363 Y235.232 E.36498
G1 X119.396 Y236.491 E.05236
; WIPE_START
G1 X118.363 Y235.232 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X113.293 Y229.567 Z7.2 F30000
G1 X41.584 Y141.125 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X46.742 Y147.411 E.26147
G1 X62.427 Y166.523 E.79503
G1 X53.171 Y174.147 E.38561
G1 X32.329 Y148.75 E1.0565
G1 X41.538 Y141.163 E.38368
G1 X41.638 Y140.573 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X47.045 Y147.162 E.2539
G1 X62.978 Y166.576 E.74809
G1 X53.117 Y174.7 E.38055
G1 X31.777 Y148.696 E1.002
G1 X41.592 Y140.611 E.37876
; WIPE_START
M204 S10000
G1 X42.871 Y142.148 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.3 Y146.03 Z7.2 F30000
G1 X35.869 Y146.284 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X34.612 Y147.32 E.05236
G1 X57.458 Y170.165 E1.03892
G1 X53.219 Y173.657 E.1766
G1 X49.789 Y169.477 E.17388
G1 X57.814 Y161.451 E.36498
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36498
G1 X40.106 Y157.678 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X41.139 Y158.937 E-.61876
G1 X41.402 Y158.674 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/75
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
G17
G3 Z7.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X41.628 Y141.179
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X61.206 Y165.036 E.99241
G1 X62.382 Y166.469 E.05962
G1 X53.127 Y174.094 E.38561
G1 X32.373 Y148.804 E1.05203
G1 X41.582 Y141.217 E.38368
G1 X41.682 Y140.626 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X61.509 Y164.787 E.93097
G1 X62.934 Y166.523 E.06688
G1 X53.073 Y174.646 E.38055
G1 X31.821 Y148.75 E.99785
G1 X41.636 Y140.664 E.37876
; WIPE_START
M204 S10000
G1 X42.907 Y142.208 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X41.547 Y149.718 Z7.4 F30000
G1 X40.106 Y157.678 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36498
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36498
G1 X53.175 Y173.603 E.17164
G1 X57.408 Y170.116 E.17638
G1 X34.662 Y147.369 E1.03443
G1 X35.918 Y146.334 E.05236
; WIPE_START
G1 X34.662 Y147.369 E-.61876
G1 X34.924 Y147.632 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X41.027 Y152.216 Z7.4 F30000
G1 X66.218 Y171.143 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X70.338 Y176.163 E.20885
G1 X121.164 Y238.097 E2.57634
G1 X111.909 Y245.722 E.38561
G1 X56.963 Y178.768 E2.78519
G1 X66.172 Y171.181 E.38368
G1 X66.272 Y170.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X70.641 Y175.915 E.20516
G1 X121.715 Y238.151 E2.39813
G1 X111.855 Y246.275 E.38055
G1 X56.411 Y178.714 E2.60329
G1 X66.226 Y170.629 E.37876
; WIPE_START
M204 S10000
G1 X67.508 Y172.163 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X70.934 Y178.983 Z7.4 F30000
G1 X92.004 Y220.919 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X93.037 Y222.178 E.05236
G1 X101.063 Y214.152 E.36498
G1 X99.317 Y212.024 E.0885
G1 X62.198 Y174.906 E1.68802
G1 X66.17 Y171.633 E.16549
G1 X66.464 Y171.991 E.0149
G1 X58.438 Y180.017 E.36498
G1 X67.088 Y190.557 E.43845
G1 X75.114 Y182.532 E.36498
G1 X83.764 Y193.072 E.43845
G1 X75.738 Y201.097 E.36498
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36498
G1 X91.38 Y202.353 E.05236
G1 X119.396 Y236.491 F30000
G1 F8843.478
G1 X118.363 Y235.232 E.05236
G1 X110.337 Y243.258 E.36498
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03148
G1 X105.651 Y237.549 E.32108
G1 X101.687 Y232.718 E.20095
G1 X109.713 Y224.692 E.36498
G1 X110.746 Y225.951 E.05236
; WIPE_START
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X112.578 Y217.993 Z7.4 F30000
G1 X173.24 Y82.977 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X180.798 Y76.75 E.31489
G1 X184.993 Y81.862 E.21266
G1 X177.435 Y88.089 E.31489
G1 X173.278 Y83.023 E.21073
G1 X172.688 Y82.923 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X180.852 Y76.198 E.31504
G1 X181.161 Y76.575 E.01453
G1 X185.544 Y81.916 E.20582
G1 X177.381 Y88.641 E.31504
G1 X172.726 Y82.969 E.21855
; WIPE_START
M204 S10000
G1 X174.263 Y81.689 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X177.938 Y79.557 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X182.142 Y83.76 E.19115
G1 X177.483 Y87.598 E.19411
G1 X174.131 Y83.514 E.16989
G1 X178.79 Y78.855 E.21188
G1 X180.047 Y77.82 E.05236
; WIPE_START
G1 X178.79 Y78.855 E-.61876
G1 X178.528 Y79.118 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X172.78 Y74.096 Z7.4 F30000
G1 X148.65 Y53.013 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X156.208 Y46.786 E.31489
G1 X175.786 Y70.643 E.99241
G1 X176.962 Y72.076 E.05962
G1 X169.404 Y78.303 E.31489
G1 X148.688 Y53.059 E1.0501
G1 X148.099 Y52.959 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X156.262 Y46.234 E.31504
G1 X176.089 Y70.395 E.93097
G1 X177.513 Y72.13 E.06688
G1 X169.35 Y78.855 E.31504
G1 X148.137 Y53.005 E.99607
; WIPE_START
M204 S10000
G1 X149.673 Y51.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.825 Y58.129 Z7.4 F30000
G1 X155.799 Y61.175 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X171.945 Y66.511 E.43845
G1 X165.481 Y72.974 E.29391
G1 X169.452 Y77.812 E.20126
G1 X173.149 Y74.767 E.15401
G1 X150.402 Y52.02 E1.03443
G1 X151.659 Y50.985 E.05236
; WIPE_START
G1 X150.402 Y52.02 E-.61876
G1 X150.665 Y52.283 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X144.434 Y56.691 Z7.4 F30000
G1 X35.522 Y133.738 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X37.793 Y136.505 E.11509
G1 X28.537 Y144.13 E.38561
G1 X17.515 Y130.698 E.55872
G1 X141.35 Y28.681 E5.15934
G1 X151.295 Y40.8 E.50411
G1 X152.372 Y42.112 E.0546
G1 X144.814 Y48.339 E.31489
G1 X142.544 Y45.572 E.11509
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.344 Y136.559 E.10661
G1 X28.483 Y144.682 E.38055
G1 X16.963 Y130.645 E.5409
G1 X141.404 Y28.129 E4.80247
G1 X151.598 Y40.551 E.47866
G1 X152.924 Y42.166 E.06224
G1 X144.76 Y48.891 E.31504
G1 X142.49 Y46.125 E.10661
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.362 Y135.321 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.075 Y133.054 Z7.4 F30000
G1 X19.28 Y129.695 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X29.872 Y142.579 E.53882
G1 X28.585 Y143.639 E.05361
G1 X23.839 Y137.856 E.24055
G1 X91.48 Y70.215 E3.07604
G1 X91.676 Y70.054 E.00816
G1 X100.982 Y79.36 E.4232
G1 X104.067 Y76.819 E.12851
G1 X145.995 Y34.89 E1.90675
G1 X141.302 Y29.172 E.2379
G1 X133.764 Y35.382 E.31408
G1 X145.612 Y47.23 E.53882
G1 X144.862 Y47.848 E.03125
G1 X142.592 Y45.082 E.11509
G1 X132.548 Y53.356 E.41846
G1 X123.242 Y44.05 E.4232
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.4232
G1 X111.504 Y70.692 E.43837
G1 X102.198 Y61.386 E.4232
G1 X103.455 Y60.351 E.05236
G1 X89.204 Y89.064 F30000
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.154 Y78.722 E.4232
G1 X70.632 Y87.39 E.43837
G1 X79.938 Y96.696 E.4232
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.4232
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.4232
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.394 E.4232
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.369 E.4232
G1 X36.594 Y132.404 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X37.851 Y131.369 E-.61876
G1 X37.588 Y131.106 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/75
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
G17
G3 Z7.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X41.645 Y141.199
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X54.569 Y156.948 E.65514
G1 X62.366 Y166.449 E.39519
G1 X53.11 Y174.073 E.38561
G1 X32.389 Y148.824 E1.05033
G1 X41.599 Y141.237 E.38368
G1 X41.699 Y140.647 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X54.872 Y156.7 E.61856
G1 X62.917 Y166.502 E.37772
G1 X53.056 Y174.626 E.38055
G1 X31.838 Y148.77 E.99628
G1 X41.652 Y140.685 E.37876
; WIPE_START
M204 S10000
G1 X42.926 Y142.227 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.353 Y146.107 Z7.6 F30000
G1 X35.937 Y146.352 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X34.68 Y147.388 E.05236
G1 X57.389 Y170.097 E1.03272
G1 X53.158 Y173.583 E.17629
G1 X49.789 Y169.477 E.1708
G1 X57.814 Y161.451 E.36498
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36498
G1 X40.106 Y157.678 E.05236
; WIPE_START
M73 P53 R23
G1 X41.139 Y158.937 E-.61876
G1 X41.402 Y158.674 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X48.22 Y162.103 Z7.6 F30000
G1 X66.235 Y171.163 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X68.854 Y174.355 E.13277
G1 X121.164 Y238.097 E2.65158
G1 X111.909 Y245.722 E.38561
G1 X56.979 Y178.788 E2.78434
G1 X66.188 Y171.201 E.38368
G1 X66.289 Y170.611 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X69.157 Y174.106 E.13469
G1 X121.715 Y238.151 E2.46782
G1 X111.855 Y246.275 E.38055
G1 X56.428 Y178.734 E2.60251
G1 X66.242 Y170.649 E.37876
; WIPE_START
M204 S10000
G1 X67.531 Y172.178 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X72.264 Y178.166 Z7.6 F30000
G1 X91.38 Y202.353 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X92.413 Y203.612 E.05236
G1 X84.388 Y211.638 E.36498
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36498
G1 X99.317 Y212.024 E.08851
G1 X62.217 Y174.924 E1.68717
G1 X66.187 Y171.654 E.16541
G1 X66.464 Y171.991 E.01405
G1 X58.438 Y180.017 E.36498
G1 X67.088 Y190.557 E.43845
G1 X75.114 Y182.532 E.36498
G1 X83.764 Y193.072 E.43845
G1 X75.738 Y201.097 E.36498
G1 X74.705 Y199.839 E.05236
G1 X110.746 Y225.951 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36498
G1 X105.651 Y237.549 E.20095
G1 X112.712 Y244.609 E.32108
G1 X111.956 Y245.232 E.03148
G1 X110.337 Y243.258 E.08209
G1 X118.363 Y235.232 E.36498
G1 X119.396 Y236.491 E.05236
; WIPE_START
G1 X118.363 Y235.232 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X120.696 Y228.318 Z7.6 F30000
G1 X173.256 Y82.997 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X180.814 Y76.771 E.31489
G1 X184.993 Y81.862 E.21181
G1 X177.435 Y88.089 E.31489
G1 X173.294 Y83.043 E.20988
G1 X172.705 Y82.943 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X180.868 Y76.218 E.31504
G1 X181.03 Y76.415 E.00759
G1 X185.544 Y81.916 E.21196
G1 X177.381 Y88.641 E.31504
G1 X172.743 Y82.99 E.21777
; WIPE_START
M204 S10000
G1 X174.28 Y81.709 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X179.853 Y78.013 Z7.6 F30000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X178.597 Y79.049 E.05236
G1 X174.131 Y83.514 E.20307
G1 X177.483 Y87.598 E.16989
G1 X182.142 Y83.76 E.19411
G1 X177.957 Y79.576 E.1903
; WIPE_START
G1 X179.371 Y80.99 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X173.728 Y75.851 Z7.6 F30000
G1 X148.667 Y53.033 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X156.225 Y46.807 E.31489
G1 X169.149 Y62.556 E.65514
G1 X176.945 Y72.056 E.39519
G1 X169.387 Y78.282 E.31489
G1 X148.705 Y53.079 E1.0484
G1 X148.115 Y52.979 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X156.278 Y46.254 E.31504
G1 X169.452 Y62.307 E.61856
G1 X177.497 Y72.11 E.37772
G1 X169.334 Y78.835 E.31504
G1 X148.153 Y53.026 E.9945
; WIPE_START
M204 S10000
G1 X149.69 Y51.745 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.677 Y51.004 Z7.6 F30000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X150.421 Y52.039 E.05236
G1 X173.13 Y74.748 E1.03272
G1 X169.435 Y77.792 E.15393
G1 X165.481 Y72.974 E.20042
G1 X171.945 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
; WIPE_START
G1 X156.832 Y62.434 E-.61876
G1 X157.095 Y62.171 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X150.517 Y66.043 Z7.6 F30000
G1 X35.522 Y133.738 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X37.776 Y136.484 E.11424
G1 X28.52 Y144.109 E.38561
G1 X17.515 Y130.698 E.55787
G1 X141.35 Y28.681 E5.15934
G1 X151.765 Y41.372 E.52791
G1 X152.356 Y42.092 E.02996
G1 X144.798 Y48.318 E.31489
G1 X142.544 Y45.572 E.11424
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.327 Y136.538 E.10582
M73 P53 R22
G1 X28.466 Y144.662 E.38055
G1 X16.963 Y130.645 E.54012
G1 X141.404 Y28.129 E4.80247
G1 X152.068 Y41.123 E.50071
G1 X152.907 Y42.146 E.03941
G1 X144.744 Y48.871 E.31504
G1 X142.49 Y46.125 E.10582
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.362 Y135.321 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.594 Y132.404 Z7.6 F30000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X37.851 Y131.369 E.05236
G1 X28.545 Y122.063 E.4232
G1 X39.067 Y113.394 E.43837
G1 X48.373 Y122.7 E.4232
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.4232
G1 X60.111 Y96.058 E.43837
G1 X69.417 Y105.364 E.4232
G1 X79.938 Y96.696 E.43837
G1 X70.632 Y87.39 E.4232
G1 X81.154 Y78.722 E.43837
G1 X90.46 Y88.028 E.4232
G1 X89.204 Y89.064 E.05236
G1 X103.455 Y60.351 F30000
G1 F8843.478
G1 X102.198 Y61.386 E.05236
G1 X111.504 Y70.692 E.4232
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.4232
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.4232
G1 X142.592 Y45.082 E.41846
G1 X144.845 Y47.828 E.11424
G1 X145.593 Y47.212 E.03116
G1 X133.764 Y35.382 E.53797
G1 X141.302 Y29.172 E.31408
G1 X145.995 Y34.89 E.2379
G1 X104.067 Y76.819 E1.90675
G1 X100.982 Y79.36 E.12851
G1 X91.676 Y70.054 E.4232
G1 X91.48 Y70.215 E.00816
G1 X23.839 Y137.856 E3.07604
G1 X28.568 Y143.619 E.2397
G1 X29.853 Y142.56 E.05353
G1 X18.023 Y130.731 E.53797
G1 X19.28 Y129.695 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X18.023 Y130.731 E-.61876
G1 X18.286 Y130.993 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/75
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
G17
G3 Z7.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X37.759 Y136.464 E.11339
G1 X28.504 Y144.089 E.38561
G1 X17.515 Y130.698 E.55702
G1 X141.35 Y28.681 E5.15934
G1 X152.234 Y41.944 E.55171
G1 X152.339 Y42.072 E.00532
G1 X144.781 Y48.298 E.31489
G1 X142.544 Y45.572 E.1134
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.31 Y136.518 E.10504
G1 X28.45 Y144.641 E.38055
G1 X16.963 Y130.645 E.53933
G1 X141.404 Y28.129 E4.80247
G1 X152.537 Y41.695 E.52275
G1 X152.89 Y42.125 E.01658
G1 X144.727 Y48.85 E.31504
G1 X142.49 Y46.125 E.10504
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.362 Y135.321 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.074 Y133.054 Z7.8 F30000
G1 X19.28 Y129.695 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X29.834 Y142.542 E.53712
G1 X28.552 Y143.598 E.05344
G1 X23.839 Y137.856 E.23886
G1 X91.48 Y70.215 E3.07604
G1 X91.676 Y70.054 E.00816
G1 X100.982 Y79.36 E.4232
G1 X104.067 Y76.819 E.12851
G1 X145.995 Y34.89 E1.90675
G1 X141.302 Y29.172 E.2379
G1 X133.764 Y35.382 E.31408
G1 X145.575 Y47.193 E.53712
G1 X144.829 Y47.808 E.03108
G1 X142.592 Y45.082 E.11339
G1 X132.548 Y53.356 E.41846
G1 X123.242 Y44.05 E.4232
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.4232
G1 X111.504 Y70.692 E.43837
G1 X102.198 Y61.386 E.4232
G1 X103.455 Y60.351 E.05236
G1 X89.204 Y89.064 F30000
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.154 Y78.722 E.4232
G1 X70.632 Y87.39 E.43837
G1 X79.938 Y96.696 E.4232
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.4232
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.4232
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.394 E.4232
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.369 E.4232
G1 X36.594 Y132.404 E.05236
; WIPE_START
G1 X37.851 Y131.369 E-.61876
G1 X37.588 Y131.106 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X43.833 Y126.718 Z7.8 F30000
G1 X148.683 Y53.053 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X156.241 Y46.827 E.31489
G1 X162.512 Y54.468 E.31787
G1 X176.929 Y72.036 E.73077
G1 X169.371 Y78.262 E.31489
G1 X148.721 Y53.1 E1.04671
G1 X148.132 Y53 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X156.295 Y46.275 E.31504
G1 X162.815 Y54.22 E.30615
G1 X177.48 Y72.09 E.68857
G1 X169.317 Y78.815 E.31504
G1 X148.17 Y53.046 E.99293
; WIPE_START
M204 S10000
G1 X149.706 Y51.766 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.855 Y58.172 Z7.8 F30000
G1 X155.799 Y61.175 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X171.945 Y66.511 E.43845
G1 X165.481 Y72.974 E.29391
M73 P54 R22
G1 X169.419 Y77.772 E.19957
G1 X173.111 Y74.73 E.15385
G1 X150.439 Y52.058 E1.03102
G1 X151.696 Y51.022 E.05236
; WIPE_START
G1 X150.439 Y52.058 E-.61876
G1 X150.702 Y52.321 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X155.224 Y58.47 Z7.8 F30000
G1 X173.273 Y83.017 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X180.831 Y76.791 E.31489
G1 X184.993 Y81.862 E.21096
G1 X177.435 Y88.089 E.31489
G1 X173.311 Y83.064 E.20903
G1 X172.722 Y82.964 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X180.885 Y76.239 E.31504
G1 X180.899 Y76.256 E.00066
G1 X185.544 Y81.916 E.21811
G1 X177.381 Y88.641 E.31504
G1 X172.76 Y83.01 E.21698
; WIPE_START
M204 S10000
G1 X174.296 Y81.73 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X177.976 Y79.594 Z7.8 F30000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X182.142 Y83.76 E.18945
G1 X177.483 Y87.598 E.19411
G1 X174.131 Y83.514 E.16989
G1 X178.403 Y79.242 E.19427
G1 X179.66 Y78.207 E.05236
; WIPE_START
G1 X178.403 Y79.242 E-.61876
G1 X178.14 Y79.505 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X172.237 Y84.343 Z7.8 F30000
G1 X66.251 Y171.183 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X67.37 Y172.546 E.05669
G1 X121.164 Y238.097 E2.72681
G1 X111.909 Y245.722 E.38561
G1 X56.996 Y178.808 E2.7835
G1 X66.205 Y171.222 E.38368
G1 X66.305 Y170.631 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X67.673 Y172.297 E.06421
G1 X121.715 Y238.151 E2.53751
G1 X111.855 Y246.275 E.38055
G1 X56.445 Y178.754 E2.60172
G1 X66.259 Y170.669 E.37876
; WIPE_START
M204 S10000
G1 X67.57 Y172.179 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X69.477 Y179.57 Z7.8 F30000
G1 X74.705 Y199.839 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.764 Y193.072 E.36498
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36498
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36498
G1 X66.204 Y171.674 E.01321
G1 X62.235 Y174.943 E.16532
G1 X99.317 Y212.024 E1.68632
G1 X101.063 Y214.152 E.08851
G1 X93.037 Y222.178 E.36498
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36498
G1 X91.38 Y202.353 E.05236
G1 X119.396 Y236.491 F30000
G1 F8843.478
G1 X118.363 Y235.232 E.05236
G1 X110.337 Y243.258 E.36498
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03148
G1 X105.651 Y237.549 E.32108
G1 X101.687 Y232.718 E.20095
G1 X109.713 Y224.692 E.36498
G1 X110.746 Y225.951 E.05236
; WIPE_START
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X104.648 Y219.023 Z7.8 F30000
G1 X41.662 Y141.219 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X47.932 Y148.861 E.31787
G1 X62.349 Y166.428 E.73077
G1 X53.094 Y174.053 E.38561
G1 X32.406 Y148.844 E1.04864
G1 X41.615 Y141.258 E.38368
G1 X41.715 Y140.667 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X48.236 Y148.612 E.30615
G1 X62.9 Y166.482 E.68857
G1 X53.04 Y174.605 E.38055
G1 X31.855 Y148.79 E.99472
G1 X41.669 Y140.705 E.37876
; WIPE_START
M204 S10000
G1 X42.947 Y142.244 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X41.565 Y149.75 Z7.8 F30000
G1 X40.106 Y157.678 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36498
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36498
G1 X53.141 Y173.562 E.16995
G1 X57.371 Y170.078 E.17621
G1 X34.699 Y147.406 E1.03102
G1 X35.956 Y146.371 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X34.699 Y147.406 E-.61876
G1 X34.962 Y147.669 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/75
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
G17
G3 Z7.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X37.742 Y136.444 E.11255
G1 X28.487 Y144.069 E.38561
G1 X17.515 Y130.698 E.55618
G1 X141.35 Y28.681 E5.15934
G1 X152.322 Y42.051 E.55618
G1 X144.764 Y48.278 E.31489
G1 X142.544 Y45.572 E.11255
G1 X89.032 Y89.656 E2.22946
G1 X35.568 Y133.7 E2.22745
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.294 Y136.498 E.10425
G1 X28.433 Y144.621 E.38055
G1 X16.963 Y130.645 E.53855
G1 X141.404 Y28.129 E4.80247
G1 X152.874 Y42.105 E.53855
G1 X144.71 Y48.83 E.31504
G1 X142.49 Y46.125 E.10425
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.362 Y135.321 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.594 Y132.404 Z8 F30000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X37.851 Y131.369 E.05236
G1 X28.545 Y122.063 E.4232
G1 X39.067 Y113.394 E.43837
G1 X48.373 Y122.7 E.4232
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.4232
G1 X60.111 Y96.058 E.43837
G1 X69.417 Y105.364 E.4232
G1 X79.938 Y96.696 E.43837
G1 X70.632 Y87.39 E.4232
G1 X81.154 Y78.722 E.43837
G1 X90.46 Y88.028 E.4232
G1 X91.717 Y86.993 E.05236
G1 X103.455 Y60.351 F30000
G1 F8843.478
G1 X102.198 Y61.386 E.05236
G1 X111.504 Y70.692 E.4232
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.4232
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.4232
G1 X142.592 Y45.082 E.41846
G1 X144.812 Y47.787 E.11255
G1 X145.556 Y47.174 E.031
G1 X133.764 Y35.382 E.53627
G1 X141.302 Y29.172 E.31408
G1 X145.995 Y34.89 E.2379
G1 X104.067 Y76.819 E1.90674
G1 X100.982 Y79.36 E.12851
G1 X91.676 Y70.054 E.4232
G1 X91.48 Y70.215 E.00816
G1 X23.839 Y137.856 E3.07604
G1 X28.535 Y143.578 E.23801
G1 X29.816 Y142.523 E.05336
G1 X18.023 Y130.731 E.53627
G1 X19.28 Y129.695 E.05236
; WIPE_START
G1 X18.023 Y130.731 E-.61876
G1 X18.286 Y130.993 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X24.838 Y127.079 Z8 F30000
G1 X148.7 Y53.074 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X156.258 Y46.847 E.31489
G1 X176.912 Y72.015 E1.04694
G1 X169.354 Y78.242 E.31489
G1 X148.738 Y53.12 E1.04502
G1 X148.149 Y53.02 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X156.312 Y46.295 E.31504
G1 X177.463 Y72.069 E.99315
G1 X169.3 Y78.794 E.31504
G1 X148.187 Y53.066 E.99136
; WIPE_START
M204 S10000
G1 X149.723 Y51.786 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.715 Y51.041 Z8 F30000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X150.458 Y52.076 E.05236
G1 X173.092 Y74.711 E1.02932
G1 X169.402 Y77.751 E.15376
G1 X165.481 Y72.974 E.19872
G1 X171.945 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
; WIPE_START
G1 X156.832 Y62.434 E-.61876
G1 X157.095 Y62.171 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X161.774 Y68.201 Z8 F30000
G1 X173.29 Y83.038 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X180.848 Y76.811 E.31489
G1 X184.993 Y81.862 E.21012
G1 X177.435 Y88.089 E.31489
G1 X173.328 Y83.084 E.20819
G1 X172.738 Y82.984 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X180.902 Y76.259 E.31504
G1 X185.544 Y81.916 E.21799
G1 X177.381 Y88.641 E.31504
G1 X172.777 Y83.03 E.2162
; WIPE_START
M204 S10000
G1 X174.313 Y81.75 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X175.164 Y84.773 Z8 F30000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X174.131 Y83.514 E.05236
G1 X178.21 Y79.436 E.18547
G1 X177.995 Y79.613 E.00895
G1 X182.142 Y83.76 E.1886
G1 X183.399 Y82.725 E.05236
; WIPE_START
G1 X182.142 Y83.76 E-.61876
G1 X181.879 Y83.497 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X174.822 Y86.404 Z8 F30000
G1 X41.678 Y141.24 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X62.332 Y166.408 E1.04694
G1 X53.077 Y174.033 E.38561
G1 X32.423 Y148.865 E1.04694
G1 X41.632 Y141.278 E.38368
G1 X41.732 Y140.687 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X62.884 Y166.462 E.99315
G1 X53.023 Y174.585 E.38055
G1 X31.871 Y148.811 E.99315
G1 X41.686 Y140.726 E.37876
; WIPE_START
M204 S10000
G1 X42.957 Y142.269 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.384 Y146.148 Z8 F30000
G1 X35.974 Y146.39 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X34.718 Y147.425 E.05236
G1 X57.352 Y170.06 E1.02932
G1 X53.125 Y173.542 E.17613
G1 X49.789 Y169.477 E.1691
G1 X57.814 Y161.451 E.36498
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36498
G1 X40.106 Y157.678 E.05236
; WIPE_START
G1 X41.139 Y158.937 E-.61876
G1 X41.402 Y158.674 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X48.218 Y162.108 Z8 F30000
G1 X66.268 Y171.204 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E2.78265
G1 X111.909 Y245.722 E.38561
G1 X57.013 Y178.829 E2.78265
G1 X66.222 Y171.242 E.38368
G1 X66.322 Y170.651 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E2.60094
G1 X111.855 Y246.275 E.38055
G1 X56.461 Y178.775 E2.60094
G1 X66.276 Y170.69 E.37876
; WIPE_START
M204 S10000
G1 X67.546 Y172.235 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X72.103 Y178.357 Z8 F30000
G1 X76.147 Y183.79 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.114 Y182.532 E.05236
G1 X67.088 Y190.557 E.36498
G1 X75.738 Y201.097 E.43845
G1 X83.764 Y193.072 E.36498
G1 X92.413 Y203.612 E.43845
G1 X84.388 Y211.638 E.36498
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36498
G1 X99.317 Y212.025 E.0885
G1 X62.254 Y174.962 E1.68547
G1 X66.22 Y171.694 E.16524
G1 X66.464 Y171.991 E.01236
G1 X58.438 Y180.017 E.36498
G1 X59.471 Y181.276 E.05236
G1 X110.746 Y225.951 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36498
G1 X105.651 Y237.549 E.20095
G1 X112.712 Y244.609 E.32108
G1 X111.956 Y245.232 E.03148
G1 X110.337 Y243.258 E.08209
G1 X118.363 Y235.232 E.36498
G1 X119.396 Y236.491 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X118.363 Y235.232 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/75
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
M106 S186.15
G17
G3 Z8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X41.662 Y141.219
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X56.077 Y158.785 E.73069
M73 P55 R22
G1 X62.349 Y166.428 E.31794
G1 X53.094 Y174.053 E.38561
G1 X32.406 Y148.844 E1.04864
G1 X41.615 Y141.258 E.38368
G1 X41.715 Y140.667 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X56.38 Y158.536 E.68855
G1 X62.9 Y166.482 E.30617
G1 X53.04 Y174.605 E.38055
G1 X31.855 Y148.79 E.99472
G1 X41.669 Y140.705 E.37876
; WIPE_START
M204 S10000
G1 X42.942 Y142.248 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X41.562 Y149.755 Z8.2 F30000
G1 X40.106 Y157.678 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36498
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36498
G1 X53.141 Y173.562 E.16995
G1 X57.371 Y170.078 E.17621
G1 X34.699 Y147.406 E1.03102
G1 X35.956 Y146.371 E.05236
; WIPE_START
G1 X34.699 Y147.406 E-.61876
G1 X34.962 Y147.669 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X41.063 Y152.255 Z8.2 F30000
G1 X66.251 Y171.183 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X67.37 Y172.546 E.05669
G1 X121.164 Y238.097 E2.72681
G1 X111.909 Y245.722 E.38561
G1 X56.996 Y178.808 E2.7835
G1 X66.205 Y171.222 E.38368
G1 X66.305 Y170.631 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X67.673 Y172.297 E.06421
G1 X121.715 Y238.151 E2.53751
G1 X111.855 Y246.275 E.38055
G1 X56.445 Y178.754 E2.60172
G1 X66.259 Y170.669 E.37876
; WIPE_START
M204 S10000
G1 X67.57 Y172.179 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X69.477 Y179.57 Z8.2 F30000
G1 X74.705 Y199.839 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.764 Y193.072 E.36498
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36498
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36498
G1 X66.204 Y171.674 E.01321
G1 X62.235 Y174.943 E.16532
G1 X99.317 Y212.024 E1.68632
G1 X101.063 Y214.152 E.08851
G1 X93.037 Y222.178 E.36498
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36498
G1 X91.38 Y202.353 E.05236
G1 X119.396 Y236.491 F30000
G1 F8843.478
G1 X118.363 Y235.232 E.05236
G1 X110.337 Y243.258 E.36498
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03148
G1 X105.651 Y237.549 E.32108
G1 X101.687 Y232.718 E.20095
G1 X109.713 Y224.692 E.36498
G1 X110.746 Y225.951 E.05236
; WIPE_START
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X112.58 Y217.994 Z8.2 F30000
G1 X173.273 Y83.017 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X180.831 Y76.791 E.31489
G1 X184.993 Y81.862 E.21096
G1 X177.435 Y88.089 E.31489
G1 X173.311 Y83.064 E.20903
G1 X172.722 Y82.964 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X180.885 Y76.239 E.31504
G1 X180.899 Y76.256 E.00066
G1 X185.544 Y81.916 E.21811
G1 X177.381 Y88.641 E.31504
G1 X172.76 Y83.01 E.21698
; WIPE_START
M204 S10000
G1 X174.296 Y81.73 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X177.976 Y79.594 Z8.2 F30000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X182.142 Y83.76 E.18945
G1 X177.483 Y87.598 E.19411
G1 X174.131 Y83.514 E.16989
G1 X178.403 Y79.242 E.19427
G1 X179.66 Y78.207 E.05236
; WIPE_START
G1 X178.403 Y79.242 E-.61876
G1 X178.14 Y79.505 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X172.461 Y74.406 Z8.2 F30000
G1 X148.683 Y53.053 Z8.2
M73 P55 R21
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X156.241 Y46.827 E.31489
G1 X170.656 Y64.393 E.73069
G1 X176.929 Y72.036 E.31794
G1 X169.371 Y78.262 E.31489
G1 X148.721 Y53.1 E1.04671
G1 X148.132 Y53 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X156.295 Y46.275 E.31504
G1 X170.959 Y64.144 E.68855
G1 X177.48 Y72.09 E.30617
G1 X169.317 Y78.815 E.31504
G1 X148.17 Y53.046 E.99293
; WIPE_START
M204 S10000
G1 X149.706 Y51.766 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.855 Y58.172 Z8.2 F30000
G1 X155.799 Y61.175 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X171.945 Y66.511 E.43845
G1 X165.481 Y72.974 E.29391
G1 X169.419 Y77.772 E.19957
G1 X173.111 Y74.73 E.15385
G1 X150.439 Y52.058 E1.03102
G1 X151.696 Y51.022 E.05236
; WIPE_START
G1 X150.439 Y52.058 E-.61876
G1 X150.702 Y52.321 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X144.47 Y56.726 Z8.2 F30000
G1 X35.522 Y133.738 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X37.759 Y136.464 E.11339
G1 X28.504 Y144.089 E.38561
G1 X17.515 Y130.698 E.55702
G1 X141.35 Y28.681 E5.15934
G1 X152.234 Y41.944 E.55171
G1 X152.339 Y42.072 E.00532
G1 X144.781 Y48.298 E.31489
G1 X142.544 Y45.572 E.1134
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.31 Y136.518 E.10504
G1 X28.45 Y144.641 E.38055
G1 X16.963 Y130.645 E.53933
G1 X141.404 Y28.129 E4.80247
G1 X152.537 Y41.695 E.52275
G1 X152.89 Y42.125 E.01658
G1 X144.727 Y48.85 E.31504
G1 X142.49 Y46.125 E.10504
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.362 Y135.321 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.074 Y133.054 Z8.2 F30000
G1 X19.28 Y129.695 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X29.834 Y142.542 E.53712
G1 X28.552 Y143.598 E.05344
G1 X23.839 Y137.856 E.23886
G1 X91.48 Y70.215 E3.07604
G1 X91.676 Y70.054 E.00816
G1 X100.982 Y79.36 E.4232
G1 X104.067 Y76.819 E.12851
G1 X145.995 Y34.89 E1.90675
G1 X141.302 Y29.172 E.2379
G1 X133.764 Y35.382 E.31408
G1 X145.575 Y47.193 E.53712
G1 X144.829 Y47.808 E.03108
G1 X142.592 Y45.082 E.11339
G1 X132.548 Y53.356 E.41846
G1 X123.242 Y44.05 E.4232
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.4232
G1 X111.504 Y70.692 E.43837
G1 X102.198 Y61.386 E.4232
G1 X103.455 Y60.351 E.05236
G1 X89.204 Y89.064 F30000
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.154 Y78.722 E.4232
G1 X70.632 Y87.39 E.43837
G1 X79.938 Y96.696 E.4232
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.4232
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.4232
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.394 E.4232
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.369 E.4232
G1 X36.594 Y132.404 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X37.851 Y131.369 E-.61876
G1 X37.588 Y131.106 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/75
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
M106 S188.7
G17
G3 Z8.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X37.776 Y136.484 E.11424
G1 X28.52 Y144.109 E.38561
G1 X17.515 Y130.698 E.55787
G1 X141.35 Y28.681 E5.15934
G1 X151.765 Y41.372 E.52791
G1 X152.356 Y42.092 E.02996
G1 X144.798 Y48.318 E.31489
G1 X142.544 Y45.572 E.11424
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.327 Y136.538 E.10582
G1 X28.466 Y144.662 E.38055
G1 X16.963 Y130.645 E.54012
G1 X141.404 Y28.129 E4.80247
G1 X152.068 Y41.123 E.50071
G1 X152.907 Y42.146 E.03941
G1 X144.744 Y48.871 E.31504
G1 X142.49 Y46.125 E.10582
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.362 Y135.321 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.594 Y132.404 Z8.4 F30000
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X37.851 Y131.369 E.05236
G1 X28.545 Y122.063 E.4232
G1 X39.067 Y113.394 E.43837
G1 X48.373 Y122.7 E.4232
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.4232
G1 X60.111 Y96.058 E.43837
G1 X69.417 Y105.364 E.4232
G1 X79.938 Y96.696 E.43837
G1 X70.632 Y87.39 E.4232
G1 X81.154 Y78.722 E.43837
G1 X90.46 Y88.028 E.4232
G1 X89.204 Y89.064 E.05236
G1 X103.455 Y60.351 F30000
G1 F8843.478
G1 X102.198 Y61.386 E.05236
G1 X111.504 Y70.692 E.4232
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.4232
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.4232
G1 X142.592 Y45.082 E.41846
G1 X144.845 Y47.828 E.11424
G1 X145.593 Y47.212 E.03116
G1 X133.764 Y35.382 E.53797
G1 X141.302 Y29.172 E.31408
G1 X145.995 Y34.89 E.2379
G1 X104.067 Y76.819 E1.90675
G1 X100.982 Y79.36 E.12851
G1 X91.676 Y70.054 E.4232
G1 X91.48 Y70.215 E.00816
G1 X23.839 Y137.856 E3.07604
G1 X28.568 Y143.619 E.2397
G1 X29.853 Y142.56 E.05353
G1 X18.023 Y130.731 E.53797
G1 X19.28 Y129.695 E.05236
; WIPE_START
G1 X18.023 Y130.731 E-.61876
G1 X18.286 Y130.993 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X24.837 Y127.076 Z8.4 F30000
M73 P56 R21
G1 X148.667 Y53.033 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X156.225 Y46.807 E.31489
G1 X164.019 Y56.305 E.39512
G1 X176.945 Y72.056 E.65521
G1 X169.387 Y78.282 E.31489
G1 X148.705 Y53.079 E1.0484
G1 X148.115 Y52.979 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X156.278 Y46.254 E.31504
G1 X164.323 Y56.056 E.3777
G1 X177.497 Y72.11 E.61858
G1 X169.334 Y78.835 E.31504
G1 X148.153 Y53.026 E.9945
; WIPE_START
M204 S10000
G1 X149.69 Y51.745 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.677 Y51.004 Z8.4 F30000
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X150.421 Y52.039 E.05236
G1 X173.13 Y74.748 E1.03272
G1 X169.435 Y77.792 E.15393
G1 X165.481 Y72.974 E.20042
G1 X171.945 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
; WIPE_START
G1 X156.832 Y62.434 E-.61876
G1 X157.095 Y62.171 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X161.774 Y68.201 Z8.4 F30000
G1 X173.256 Y82.997 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X180.814 Y76.771 E.31489
G1 X184.993 Y81.862 E.21181
G1 X177.435 Y88.089 E.31489
G1 X173.294 Y83.043 E.20988
G1 X172.705 Y82.943 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X180.868 Y76.218 E.31504
G1 X181.03 Y76.415 E.00759
G1 X185.544 Y81.916 E.21196
G1 X177.381 Y88.641 E.31504
G1 X172.743 Y82.99 E.21777
; WIPE_START
M204 S10000
G1 X174.28 Y81.709 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X179.853 Y78.013 Z8.4 F30000
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X178.597 Y79.049 E.05236
G1 X174.131 Y83.514 E.20307
G1 X177.483 Y87.598 E.16989
G1 X182.142 Y83.76 E.19411
G1 X177.957 Y79.576 E.1903
; WIPE_START
G1 X179.371 Y80.99 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X173.403 Y85.747 Z8.4 F30000
G1 X66.235 Y171.163 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X68.854 Y174.355 E.13277
G1 X121.164 Y238.097 E2.65158
G1 X111.909 Y245.722 E.38561
G1 X56.979 Y178.788 E2.78434
G1 X66.188 Y171.201 E.38368
G1 X66.289 Y170.611 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X69.157 Y174.106 E.13469
G1 X121.715 Y238.151 E2.46782
G1 X111.855 Y246.275 E.38055
G1 X56.428 Y178.734 E2.60251
G1 X66.242 Y170.649 E.37876
; WIPE_START
M204 S10000
G1 X67.531 Y172.178 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X72.264 Y178.166 Z8.4 F30000
G1 X91.38 Y202.353 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X92.413 Y203.612 E.05236
G1 X84.388 Y211.638 E.36498
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36498
G1 X99.317 Y212.024 E.08851
G1 X62.217 Y174.924 E1.68717
G1 X66.187 Y171.654 E.16541
G1 X66.464 Y171.991 E.01405
G1 X58.438 Y180.017 E.36498
G1 X67.088 Y190.557 E.43845
G1 X75.114 Y182.532 E.36498
G1 X83.764 Y193.072 E.43845
G1 X75.738 Y201.097 E.36498
G1 X74.705 Y199.839 E.05236
G1 X110.746 Y225.951 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36498
G1 X105.651 Y237.549 E.20095
G1 X112.712 Y244.609 E.32108
G1 X111.956 Y245.232 E.03148
G1 X110.337 Y243.258 E.08209
G1 X118.363 Y235.232 E.36498
G1 X119.396 Y236.491 E.05236
; WIPE_START
G1 X118.363 Y235.232 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X113.293 Y229.567 Z8.4 F30000
G1 X41.645 Y141.199 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X49.44 Y150.698 E.39512
G1 X62.366 Y166.449 E.65521
G1 X53.11 Y174.073 E.38561
G1 X32.389 Y148.824 E1.05033
G1 X41.599 Y141.237 E.38368
G1 X41.699 Y140.647 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X49.743 Y150.449 E.3777
G1 X62.917 Y166.502 E.61858
G1 X53.056 Y174.626 E.38055
G1 X31.838 Y148.77 E.99628
G1 X41.652 Y140.685 E.37876
; WIPE_START
M204 S10000
G1 X42.929 Y142.225 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.356 Y146.105 Z8.4 F30000
G1 X35.937 Y146.352 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X34.68 Y147.388 E.05236
G1 X57.389 Y170.097 E1.03272
G1 X53.158 Y173.583 E.17629
G1 X49.789 Y169.477 E.1708
G1 X57.814 Y161.451 E.36498
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36498
G1 X40.106 Y157.678 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X41.139 Y158.937 E-.61876
G1 X41.402 Y158.674 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/75
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
M106 S186.15
G17
G3 Z8.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X37.793 Y136.505 E.11509
G1 X28.537 Y144.13 E.38561
G1 X17.515 Y130.698 E.55872
G1 X141.35 Y28.681 E5.15934
G1 X151.295 Y40.8 E.50411
G1 X152.372 Y42.112 E.0546
G1 X144.814 Y48.339 E.31489
G1 X142.544 Y45.572 E.11509
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.344 Y136.559 E.10661
G1 X28.483 Y144.682 E.38055
G1 X16.963 Y130.645 E.5409
G1 X141.404 Y28.129 E4.80247
G1 X151.598 Y40.551 E.47866
G1 X152.924 Y42.166 E.06224
G1 X144.76 Y48.891 E.31504
G1 X142.49 Y46.125 E.10661
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.362 Y135.321 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.075 Y133.054 Z8.6 F30000
G1 X19.28 Y129.695 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X29.872 Y142.579 E.53882
G1 X28.585 Y143.639 E.05361
G1 X23.839 Y137.856 E.24055
G1 X91.48 Y70.215 E3.07604
G1 X91.676 Y70.054 E.00816
G1 X100.982 Y79.36 E.4232
G1 X104.067 Y76.819 E.12851
G1 X145.995 Y34.89 E1.90675
G1 X141.302 Y29.172 E.2379
G1 X133.764 Y35.382 E.31408
G1 X145.612 Y47.23 E.53882
G1 X144.862 Y47.848 E.03125
G1 X142.592 Y45.082 E.11509
G1 X132.548 Y53.356 E.41846
G1 X123.242 Y44.05 E.4232
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.4232
G1 X111.504 Y70.692 E.43837
G1 X102.198 Y61.386 E.4232
G1 X103.455 Y60.351 E.05236
G1 X89.204 Y89.064 F30000
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.154 Y78.722 E.4232
G1 X70.632 Y87.39 E.43837
G1 X79.938 Y96.696 E.4232
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.4232
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.4232
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.394 E.4232
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.369 E.4232
G1 X36.594 Y132.404 E.05236
; WIPE_START
G1 X37.851 Y131.369 E-.61876
G1 X37.588 Y131.106 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X43.832 Y126.716 Z8.6 F30000
G1 X148.65 Y53.013 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X156.208 Y46.786 E.31489
G1 X157.383 Y48.218 E.05954
G1 X176.962 Y72.076 E.99248
G1 X169.404 Y78.303 E.31489
G1 X148.688 Y53.059 E1.0501
G1 X148.099 Y52.959 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X156.262 Y46.234 E.31504
G1 X157.686 Y47.969 E.06686
G1 X177.513 Y72.13 E.931
G1 X169.35 Y78.855 E.31504
G1 X148.137 Y53.005 E.99607
; WIPE_START
M204 S10000
G1 X149.673 Y51.725 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.825 Y58.129 Z8.6 F30000
G1 X155.799 Y61.175 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X171.945 Y66.511 E.43845
G1 X165.481 Y72.974 E.29391
G1 X169.452 Y77.812 E.20126
G1 X173.149 Y74.767 E.15401
G1 X150.402 Y52.02 E1.03443
G1 X151.659 Y50.985 E.05236
; WIPE_START
G1 X150.402 Y52.02 E-.61876
G1 X150.665 Y52.283 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X155.187 Y58.432 Z8.6 F30000
G1 X173.24 Y82.977 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X180.798 Y76.75 E.31489
G1 X184.993 Y81.862 E.21266
G1 X177.435 Y88.089 E.31489
G1 X173.278 Y83.023 E.21073
G1 X172.688 Y82.923 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X180.852 Y76.198 E.31504
G1 X181.161 Y76.575 E.01453
G1 X185.544 Y81.916 E.20582
G1 X177.381 Y88.641 E.31504
G1 X172.726 Y82.969 E.21855
; WIPE_START
M204 S10000
G1 X174.263 Y81.689 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X177.938 Y79.557 Z8.6 F30000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X182.142 Y83.76 E.19115
G1 X177.483 Y87.598 E.19411
G1 X174.131 Y83.514 E.16989
G1 X178.79 Y78.855 E.21188
G1 X180.047 Y77.82 E.05236
; WIPE_START
G1 X178.79 Y78.855 E-.61876
G1 X178.528 Y79.118 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X172.624 Y83.955 Z8.6 F30000
G1 X66.218 Y171.143 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X70.338 Y176.163 E.20885
G1 X121.164 Y238.097 E2.57634
G1 X111.909 Y245.722 E.38561
G1 X56.963 Y178.768 E2.78519
G1 X66.172 Y171.181 E.38368
G1 X66.272 Y170.59 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X70.641 Y175.915 E.20516
G1 X121.715 Y238.151 E2.39813
G1 X111.855 Y246.275 E.38055
G1 X56.411 Y178.714 E2.60329
G1 X66.226 Y170.629 E.37876
; WIPE_START
M204 S10000
G1 X67.508 Y172.163 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X72.242 Y178.15 Z8.6 F30000
G1 X91.38 Y202.353 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X92.413 Y203.612 E.05236
G1 X84.388 Y211.638 E.36498
G1 X75.738 Y201.097 E.43845
G1 X83.764 Y193.072 E.36498
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36498
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36498
G1 X66.17 Y171.633 E.0149
G1 X62.198 Y174.906 E.16549
G1 X99.317 Y212.024 E1.68802
G1 X101.063 Y214.152 E.08851
G1 X93.037 Y222.178 E.36498
G1 X92.004 Y220.919 E.05236
G1 X119.396 Y236.491 F30000
G1 F8843.478
G1 X118.363 Y235.232 E.05236
G1 X110.337 Y243.258 E.36498
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03148
M73 P57 R21
G1 X105.651 Y237.549 E.32108
G1 X101.687 Y232.718 E.20095
G1 X109.713 Y224.692 E.36498
G1 X110.746 Y225.951 E.05236
; WIPE_START
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X104.648 Y219.023 Z8.6 F30000
G1 X41.628 Y141.179 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X42.803 Y142.61 E.05954
G1 X62.382 Y166.469 E.99248
G1 X53.127 Y174.094 E.38561
G1 X32.373 Y148.804 E1.05203
G1 X41.582 Y141.217 E.38368
G1 X41.682 Y140.626 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X43.106 Y142.361 E.06686
G1 X62.934 Y166.523 E.931
G1 X53.073 Y174.646 E.38055
G1 X31.821 Y148.75 E.99785
G1 X41.636 Y140.664 E.37876
; WIPE_START
M204 S10000
G1 X42.945 Y142.176 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X41.57 Y149.684 Z8.6 F30000
G1 X40.106 Y157.678 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36498
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36498
G1 X53.175 Y173.603 E.17164
G1 X57.408 Y170.116 E.17638
G1 X34.662 Y147.369 E1.03443
G1 X35.918 Y146.334 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X34.662 Y147.369 E-.61876
G1 X34.924 Y147.632 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/75
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
M106 S188.7
G17
G3 Z8.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X41.584 Y141.125
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X57.267 Y160.235 E.79495
G1 X62.427 Y166.523 E.26154
G1 X53.171 Y174.147 E.38561
G1 X32.329 Y148.75 E1.0565
G1 X41.538 Y141.163 E.38368
G1 X41.638 Y140.573 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X41.656 Y140.595 E.00085
G1 X57.57 Y159.987 E.74722
G1 X62.96 Y166.554 E.25308
G1 X62.978 Y166.576 E.00085
G1 X53.117 Y174.7 E.38055
G1 X53.099 Y174.678 E.00085
G1 X31.795 Y148.718 E1.00029
G1 X31.777 Y148.696 E.00085
G1 X41.592 Y140.611 E.37876
; WIPE_START
M204 S10000
G1 X41.656 Y140.595 E-.02523
G1 X42.883 Y142.089 E-.73477
; WIPE_END
G1 E-.04 F1800
G1 X36.332 Y146.007 Z8.8 F30000
G1 X35.869 Y146.284 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X34.612 Y147.32 E.05236
G1 X57.458 Y170.165 E1.03892
G1 X53.219 Y173.657 E.1766
G1 X49.789 Y169.477 E.17388
G1 X57.814 Y161.451 E.36498
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36498
G1 X40.106 Y157.678 E.05236
; WIPE_START
G1 X41.139 Y158.937 E-.61876
G1 X41.402 Y158.674 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X48.225 Y162.094 Z8.8 F30000
G1 X66.174 Y171.089 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X67.075 Y172.187 E.04567
G1 X121.164 Y238.097 E2.74176
G1 X111.909 Y245.722 E.38561
G1 X56.918 Y178.714 E2.78743
G1 X66.128 Y171.127 E.38368
G1 X66.228 Y170.537 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X66.246 Y170.559 E.00085
G1 X67.378 Y171.938 E.05316
G1 X121.715 Y238.151 E2.55136
G1 X111.855 Y246.275 E.38055
G1 X56.385 Y178.682 E2.60451
G1 X56.367 Y178.66 E.00085
G1 X66.181 Y170.575 E.37876
; WIPE_START
M204 S10000
G1 X66.246 Y170.559 E-.02523
G1 X67.378 Y171.938 E-.67814
G1 X67.473 Y172.053 E-.05663
; WIPE_END
G1 E-.04 F1800
G1 X69.395 Y179.44 Z8.8 F30000
G1 X74.705 Y199.839 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.764 Y193.072 E.36498
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36498
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36498
G1 X66.126 Y171.579 E.01714
G1 X62.149 Y174.856 E.16571
G1 X99.317 Y212.024 E1.69027
G1 X101.063 Y214.152 E.08851
G1 X93.037 Y222.178 E.36498
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36498
G1 X91.38 Y202.353 E.05236
G1 X110.746 Y225.951 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36498
G1 X105.651 Y237.549 E.20095
G1 X112.712 Y244.609 E.32108
G1 X111.956 Y245.232 E.03148
G1 X110.337 Y243.258 E.08209
G1 X118.363 Y235.232 E.36498
G1 X119.396 Y236.491 E.05236
; WIPE_START
G1 X118.363 Y235.232 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X120.692 Y228.317 Z8.8 F30000
G1 X173.196 Y82.923 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
M73 P57 R20
G1 X180.754 Y76.697 E.31489
G1 X184.993 Y81.862 E.21489
G1 X177.435 Y88.089 E.31489
G1 X173.234 Y82.969 E.21296
G1 X172.662 Y82.891 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X172.644 Y82.869 E.00085
G1 X180.807 Y76.144 E.31504
G1 X180.825 Y76.165 E.00082
G1 X180.826 Y76.166 E.00003
G1 X185.544 Y81.916 E.22156
G1 X177.381 Y88.641 E.31504
G1 X172.7 Y82.938 E.21977
; WIPE_START
M204 S10000
G1 X172.644 Y82.869 E-.03365
G1 X174.12 Y81.654 E-.72635
; WIPE_END
G1 E-.04 F1800
G1 X177.889 Y79.507 Z8.8 F30000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X182.142 Y83.76 E.1934
G1 X184.503 Y81.815 E.09839
G1 X180.706 Y77.187 E.1925
G1 X179.302 Y78.344 E.05849
G1 X174.131 Y83.514 E.23514
G1 X175.164 Y84.773 E.05236
; WIPE_START
G1 X174.131 Y83.514 E-.61876
G1 X174.394 Y83.251 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X169.446 Y77.44 Z8.8 F30000
G1 X148.606 Y52.959 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X156.164 Y46.732 E.31489
G1 X171.847 Y65.843 E.79495
G1 X177.006 Y72.13 E.26154
G1 X169.448 Y78.357 E.31489
G1 X148.644 Y53.005 E1.05457
G1 X148.054 Y52.905 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X156.218 Y46.18 E.31504
G1 X156.236 Y46.202 E.00085
G1 X172.15 Y65.594 E.74722
G1 X177.539 Y72.162 E.25307
G1 X177.558 Y72.184 E.00085
G1 X169.394 Y78.909 E.31504
G1 X169.376 Y78.887 E.00085
G1 X148.092 Y52.952 E.99936
; WIPE_START
M204 S10000
G1 X149.629 Y51.671 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.609 Y50.936 Z8.8 F30000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X150.353 Y51.971 E.05236
G1 X173.198 Y74.816 E1.03892
G1 X169.496 Y77.866 E.15423
G1 X165.481 Y72.974 E.2035
G1 X171.945 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
; WIPE_START
G1 X156.832 Y62.434 E-.61876
G1 X157.095 Y62.171 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X150.517 Y66.043 Z8.8 F30000
G1 X35.522 Y133.738 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X37.837 Y136.559 E.11732
G1 X28.581 Y144.183 E.38561
G1 X17.515 Y130.698 E.56095
G1 X141.35 Y28.681 E5.15934
G1 X150.826 Y40.228 E.48032
G1 X152.416 Y42.166 E.08064
G1 X144.858 Y48.393 E.31489
G1 X142.544 Y45.572 E.11732
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.37 Y136.59 E.10783
G1 X38.388 Y136.612 E.00085
G1 X28.527 Y144.736 E.38055
G1 X28.509 Y144.714 E.00085
G1 X16.963 Y130.645 E.54212
G1 X141.404 Y28.129 E4.80247
G1 X151.129 Y39.979 E.45662
G1 X152.95 Y42.198 E.0855
G1 X152.968 Y42.22 E.00085
G1 X144.805 Y48.945 E.31504
G1 X144.786 Y48.923 E.00085
G1 X142.49 Y46.125 E.10783
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.363 Y135.321 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.594 Y132.404 Z8.8 F30000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X37.851 Y131.369 E.05236
G1 X28.545 Y122.063 E.4232
G1 X39.067 Y113.394 E.43837
G1 X48.373 Y122.7 E.4232
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.4232
G1 X60.111 Y96.058 E.43837
G1 X69.417 Y105.364 E.4232
G1 X79.938 Y96.696 E.43837
G1 X70.632 Y87.39 E.4232
G1 X81.154 Y78.722 E.43837
G1 X90.46 Y88.028 E.4232
G1 X89.204 Y89.064 E.05236
G1 X103.455 Y60.351 F30000
G1 F8843.478
G1 X102.198 Y61.386 E.05236
G1 X111.504 Y70.692 E.4232
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.4232
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.4232
G1 X142.592 Y45.082 E.41846
G1 X144.906 Y47.902 E.11732
G1 X145.662 Y47.28 E.03147
G1 X133.764 Y35.382 E.54107
G1 X141.302 Y29.172 E.31408
G1 X145.995 Y34.89 E.2379
G1 X104.067 Y76.819 E1.90674
G1 X100.982 Y79.36 E.12851
G1 X91.676 Y70.054 E.4232
G1 X91.48 Y70.215 E.00816
G1 X23.839 Y137.856 E3.07604
G1 X28.629 Y143.693 E.24279
G1 X29.921 Y142.629 E.05383
G1 X18.023 Y130.731 E.54107
G1 X19.28 Y129.695 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8843.478
G1 X18.023 Y130.731 E-.61876
G1 X18.286 Y130.993 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/75
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
M106 S186.15
G17
G3 Z8.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X37.889 Y136.623 E.11999
G1 X28.634 Y144.247 E.38561
G1 X17.515 Y130.698 E.56362
G1 X141.35 Y28.681 E5.15934
G1 X150.356 Y39.656 E.45652
G1 X152.469 Y42.23 E.1071
G1 X144.911 Y48.457 E.31489
G1 X142.544 Y45.572 E.11999
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.414 Y136.644 E.1099
G1 X38.441 Y136.676 E.00125
M106 S229.5
G1 X28.58 Y144.8 E.38055
M106 S186.15
G1 X28.553 Y144.767 E.00125
G1 X16.963 Y130.645 E.54419
G1 X141.404 Y28.129 E4.80247
G1 X150.659 Y39.407 E.43458
G1 X152.994 Y42.252 E.10961
G1 X153.02 Y42.284 E.00125
M106 S229.5
G1 X144.857 Y49.009 E.31504
M106 S186.15
G1 X144.831 Y48.977 E.00125
G1 X142.49 Y46.125 E.1099
G1 X96.354 Y84.132 E1.78049
G1 X36.12 Y133.754 E2.3246
; WIPE_START
M204 S10000
G1 X37.363 Y135.32 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.075 Y133.053 Z9 F30000
G1 X19.28 Y129.695 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X29.98 Y142.687 E.54375
G1 X28.682 Y143.757 E.05409
G1 X23.839 Y137.856 E.24545
G1 X91.48 Y70.215 E3.07604
G1 X91.676 Y70.054 E.00816
G1 X100.982 Y79.36 E.4232
G1 X104.067 Y76.819 E.12851
G1 X145.995 Y34.89 E1.90675
G1 X141.302 Y29.172 E.2379
G1 X133.764 Y35.382 E.31408
G1 X145.72 Y47.339 E.54375
G1 X144.959 Y47.966 E.03173
G1 X142.592 Y45.082 E.11999
G1 X132.548 Y53.356 E.41846
G1 X123.242 Y44.05 E.4232
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.4232
G1 X111.504 Y70.692 E.43837
G1 X102.198 Y61.386 E.4232
G1 X103.455 Y60.351 E.05236
G1 X89.204 Y89.064 F30000
M73 P58 R20
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.154 Y78.722 E.4232
G1 X70.632 Y87.39 E.43837
G1 X79.938 Y96.696 E.4232
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.4232
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.4232
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.394 E.4232
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.369 E.4232
G1 X36.594 Y132.404 E.05236
; WIPE_START
G1 X37.851 Y131.369 E-.61876
G1 X37.588 Y131.106 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X43.827 Y126.709 Z9 F30000
G1 X148.553 Y52.895 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X156.111 Y46.668 E.31489
G1 X164.654 Y57.078 E.43302
G1 X177.059 Y72.194 E.62881
G1 X169.501 Y78.421 E.31489
G1 X148.591 Y52.941 E1.0599
G1 X148.002 Y52.841 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F9547.055
M204 S5000
G1 X156.165 Y46.116 E.31504
M106 S186.15
G1 X156.192 Y46.148 E.00125
G1 X164.957 Y56.829 E.41156
G1 X177.584 Y72.216 E.59287
G1 X177.61 Y72.248 E.00125
M106 S229.5
G1 X169.447 Y78.973 E.31504
M106 S186.15
G1 X169.42 Y78.941 E.00125
G1 X148.04 Y52.887 E1.0039
; WIPE_START
M204 S10000
G1 X149.576 Y51.607 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.737 Y58.005 Z9 F30000
G1 X155.799 Y61.175 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X171.945 Y66.511 E.43845
G1 X165.481 Y72.974 E.29391
G1 X169.549 Y77.93 E.20616
G1 X173.257 Y74.875 E.1545
G1 X150.294 Y51.912 E1.04427
G1 X151.55 Y50.877 E.05236
; WIPE_START
G1 X150.294 Y51.912 E-.61876
G1 X150.557 Y52.175 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X155.081 Y58.322 Z9 F30000
G1 X173.143 Y82.859 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X180.701 Y76.633 E.31489
G1 X184.993 Y81.862 E.21756
G1 X177.435 Y88.089 E.31489
G1 X173.181 Y82.905 E.21563
G1 X172.618 Y82.837 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X172.592 Y82.805 E.00125
M106 S229.5
G1 X180.755 Y76.08 E.31504
M106 S186.15
G1 X180.781 Y76.112 E.00125
G1 X180.97 Y76.342 E.00884
G1 X185.544 Y81.916 E.21479
G1 X177.381 Y88.641 E.31504
G1 X172.656 Y82.884 E.22185
; WIPE_START
M204 S10000
G1 X172.592 Y82.805 E-.0387
G1 X174.057 Y81.598 E-.7213
; WIPE_END
G1 E-.04 F1800
G1 X175.164 Y84.773 Z9 F30000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X174.131 Y83.514 E.05236
G1 X179.911 Y77.734 E.26284
G1 X180.653 Y77.123 E.03092
G1 X184.503 Y81.815 E.19517
G1 X182.142 Y83.76 E.09839
G1 X177.83 Y79.449 E.19607
; WIPE_START
G1 X179.244 Y80.863 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X173.276 Y85.62 Z9 F30000
G1 X66.121 Y171.025 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X68.701 Y174.168 E.13076
G1 X121.164 Y238.097 E2.65934
G1 X111.909 Y245.722 E.38561
G1 X56.866 Y178.65 E2.79009
G1 X66.075 Y171.063 E.38368
G1 X66.175 Y170.473 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X66.202 Y170.505 E.00125
G1 X69.004 Y173.92 E.13157
G1 X121.715 Y238.151 E2.47501
G1 X111.855 Y246.275 E.38055
G1 X56.341 Y178.628 E2.60659
G1 X56.315 Y178.596 E.00125
M106 S229.5
G1 X66.129 Y170.511 E.37876
M106 S186.15
; WIPE_START
M204 S10000
G1 X66.202 Y170.505 E-.02777
G1 X67.424 Y171.994 E-.73223
; WIPE_END
G1 E-.04 F1800
G1 X69.355 Y179.379 Z9 F30000
G1 X74.705 Y199.839 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.764 Y193.072 E.36498
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36498
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36498
G1 X66.073 Y171.515 E.0198
G1 X62.09 Y174.797 E.16597
G1 X99.317 Y212.024 E1.69294
G1 X101.063 Y214.152 E.08851
G1 X93.037 Y222.178 E.36498
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36498
G1 X91.38 Y202.353 E.05236
G1 X119.396 Y236.491 F30000
G1 F8843.478
G1 X118.363 Y235.232 E.05236
G1 X110.337 Y243.258 E.36498
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03148
G1 X105.651 Y237.549 E.32108
G1 X101.687 Y232.718 E.20095
G1 X109.713 Y224.692 E.36498
G1 X110.746 Y225.951 E.05236
; WIPE_START
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X104.647 Y219.023 Z9 F30000
G1 X41.531 Y141.061 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X50.074 Y151.471 E.43302
G1 X62.479 Y166.587 E.62881
G1 X53.224 Y174.211 E.38561
G1 X32.276 Y148.686 E1.06183
G1 X41.485 Y141.099 E.38368
G1 X41.612 Y140.541 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X50.377 Y151.222 E.41156
G1 X63.004 Y166.608 E.59287
G1 X63.03 Y166.64 E.00125
M106 S229.5
G1 X53.17 Y174.764 E.38055
M106 S186.15
G1 X53.143 Y174.732 E.00125
G1 X31.751 Y148.664 E1.00444
G1 X31.725 Y148.632 E.00125
M106 S229.5
G1 X41.571 Y140.52 E.38001
M106 S186.15
; WIPE_START
M204 S10000
G1 X42.842 Y142.064 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X41.525 Y149.582 Z9 F30000
G1 X40.106 Y157.678 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36498
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36498
G1 X53.271 Y173.721 E.17654
G1 X57.516 Y170.224 E.17686
G1 X34.553 Y147.261 E1.04427
G1 X35.81 Y146.225 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X34.553 Y147.261 E-.61877
G1 X34.816 Y147.524 E-.14123
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/75
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
M106 S183.6
G17
G3 Z9 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X37.942 Y136.687 E.12265
G1 X28.686 Y144.311 E.38561
G1 X17.515 Y130.698 E.56628
G1 X141.35 Y28.681 E5.15934
G1 X149.887 Y39.084 E.43273
G1 X152.522 Y42.294 E.13356
G1 X144.964 Y48.521 E.31489
G1 X142.544 Y45.572 E.12265
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.467 Y136.708 E.11237
G1 X38.493 Y136.74 E.00125
M106 S229.5
G1 X28.632 Y144.864 E.38055
M106 S183.6
G1 X28.606 Y144.832 E.00125
G1 X16.963 Y130.645 E.54666
G1 X141.404 Y28.129 E4.80247
G1 X150.19 Y38.835 E.41254
G1 X153.046 Y42.316 E.13412
G1 X153.073 Y42.348 E.00125
M106 S229.5
G1 X144.91 Y49.073 E.31504
M106 S183.6
G1 X144.883 Y49.041 E.00125
G1 X142.49 Y46.125 E.11237
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.364 Y135.32 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X43.059 Y130.238 Z9.2 F30000
G1 X89.204 Y89.064 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.154 Y78.722 E.4232
G1 X70.632 Y87.39 E.43837
G1 X79.938 Y96.696 E.4232
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.4232
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.4232
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.394 E.4232
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.369 E.4232
G1 X36.594 Y132.404 E.05236
G1 X103.455 Y60.351 F30000
G1 F8843.478
G1 X102.198 Y61.386 E.05236
G1 X111.504 Y70.692 E.4232
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.4232
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.4232
G1 X142.592 Y45.082 E.41846
G1 X145.011 Y48.03 E.12265
G1 X145.779 Y47.398 E.03199
G1 X133.764 Y35.382 E.54642
G1 X141.302 Y29.172 E.31408
G1 X145.995 Y34.89 E.2379
G1 X104.067 Y76.819 E1.90675
G1 X100.982 Y79.36 E.12851
G1 X91.676 Y70.054 E.4232
G1 X91.48 Y70.215 E.00816
G1 X23.839 Y137.856 E3.07604
G1 X28.734 Y143.821 E.24811
G1 X30.039 Y142.746 E.05435
G1 X18.023 Y130.731 E.54642
G1 X19.28 Y129.695 E.05236
; WIPE_START
G1 X18.023 Y130.731 E-.61876
G1 X18.286 Y130.993 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X24.83 Y127.065 Z9.2 F30000
G1 X148.501 Y52.831 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X156.059 Y46.604 E.31489
G1 X157.461 Y48.313 E.07109
G1 X177.111 Y72.258 E.99607
G1 X169.553 Y78.485 E.31489
G1 X148.539 Y52.877 E1.06522
G1 X147.949 Y52.777 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F9547.055
M204 S5000
G1 X156.113 Y46.052 E.31504
M106 S183.6
G1 X156.139 Y46.084 E.00125
G1 X157.764 Y48.065 E.0763
G1 X177.636 Y72.28 E.93307
G1 X177.663 Y72.312 E.00125
M106 S229.5
G1 X169.499 Y79.037 E.31504
M106 S183.6
G1 X169.473 Y79.005 E.00125
G1 X147.987 Y52.823 E1.00883
; WIPE_START
M204 S10000
G1 X149.524 Y51.543 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.492 Y50.818 Z9.2 F30000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X150.235 Y51.853 E.05236
G1 X173.316 Y74.934 E1.04962
G1 X169.601 Y77.994 E.15476
G1 X165.481 Y72.974 E.20883
G1 X171.945 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
; WIPE_START
G1 X156.832 Y62.434 E-.61876
G1 X157.095 Y62.171 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X161.772 Y68.202 Z9.2 F30000
G1 X173.09 Y82.795 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X180.648 Y76.568 E.31489
G1 X180.812 Y76.767 E.00827
G1 X184.993 Y81.862 E.21195
G1 X177.435 Y88.089 E.31489
G1 X173.129 Y82.841 E.21829
G1 X172.566 Y82.773 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X172.539 Y82.741 E.00125
M106 S229.5
G1 X180.702 Y76.016 E.31504
M106 S183.6
G1 X180.729 Y76.048 E.00125
M73 P59 R20
G1 X181.115 Y76.518 E.01811
G1 X185.544 Y81.916 E.20799
G1 X177.381 Y88.641 E.31504
G1 X172.604 Y82.82 E.22431
; WIPE_START
M204 S10000
G1 X172.539 Y82.741 E-.03871
G1 X174.004 Y81.534 E-.72129
; WIPE_END
G1 E-.04 F1800
G1 X180.885 Y84.796 Z9.2 F30000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X182.142 Y83.76 E.05236
G1 X177.771 Y79.39 E.19875
G1 X173.58 Y82.843 E.17462
G1 X174.131 Y83.514 E.02794
G1 X180.601 Y77.059 E.29388
G1 X181.568 Y78.237 E.04901
; WIPE_START
G1 X180.601 Y77.059 E-.57921
G1 X180.264 Y77.395 E-.1808
; WIPE_END
G1 E-.04 F1800
G1 X174.36 Y82.232 Z9.2 F30000
G1 X66.069 Y170.961 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X70.327 Y176.15 E.21584
G1 X121.164 Y238.097 E2.57692
G1 X111.909 Y245.722 E.38561
G1 X56.813 Y178.586 E2.79276
G1 X66.022 Y170.999 E.38368
G1 X66.123 Y170.409 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X66.149 Y170.441 E.00125
G1 X70.63 Y175.901 E.21039
G1 X121.715 Y238.151 E2.39866
G1 X111.855 Y246.275 E.38055
G1 X56.289 Y178.564 E2.60905
G1 X56.262 Y178.532 E.00125
M106 S229.5
G1 X66.076 Y170.447 E.37876
M106 S183.6
; WIPE_START
M204 S10000
G1 X66.149 Y170.441 E-.02777
G1 X67.372 Y171.93 E-.73223
; WIPE_END
G1 E-.04 F1800
G1 X72.1 Y177.922 Z9.2 F30000
G1 X91.38 Y202.353 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X92.413 Y203.612 E.05236
G1 X84.388 Y211.638 E.36498
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36498
G1 X99.317 Y212.024 E.08851
G1 X62.031 Y174.738 E1.69562
G1 X66.021 Y171.451 E.16623
G1 X66.464 Y171.991 E.02246
G1 X58.438 Y180.017 E.36498
G1 X67.088 Y190.557 E.43845
G1 X75.114 Y182.532 E.36498
G1 X83.764 Y193.072 E.43845
G1 X75.738 Y201.097 E.36498
G1 X74.705 Y199.839 E.05236
G1 X110.746 Y225.951 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36498
G1 X105.651 Y237.549 E.20095
G1 X112.712 Y244.609 E.32108
G1 X111.956 Y245.232 E.03148
G1 X110.337 Y243.258 E.08209
G1 X118.363 Y235.232 E.36498
G1 X119.396 Y236.491 E.05236
; WIPE_START
G1 X118.363 Y235.232 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X113.293 Y229.567 Z9.2 F30000
G1 X41.479 Y140.997 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X42.881 Y142.706 E.07109
G1 X62.532 Y166.651 E.99607
G1 X53.276 Y174.276 E.38561
G1 X32.223 Y148.622 E1.06715
G1 X41.433 Y141.035 E.38368
G1 X41.559 Y140.477 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X43.184 Y142.457 E.0763
G1 X63.056 Y166.672 E.93307
G1 X63.083 Y166.705 E.00125
M106 S229.5
G1 X53.222 Y174.828 E.38055
M106 S183.6
G1 X53.196 Y174.796 E.00125
G1 X31.699 Y148.6 E1.00937
G1 X31.672 Y148.568 E.00125
M106 S229.5
G1 X41.519 Y140.456 E.38001
M106 S183.6
; WIPE_START
M204 S10000
G1 X42.798 Y141.993 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.231 Y145.882 Z9.2 F30000
G1 X35.751 Y146.167 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X34.494 Y147.202 E.05236
G1 X57.575 Y170.283 E1.04962
G1 X53.324 Y173.785 E.17712
G1 X49.789 Y169.477 E.17921
G1 X57.814 Y161.451 E.36498
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36498
G1 X40.106 Y157.678 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X41.139 Y158.937 E-.61876
G1 X41.402 Y158.674 E-.14125
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/75
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
M106 S175.95
G17
G3 Z9.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X41.393 Y140.892
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X56.525 Y159.331 E.76705
G1 X62.618 Y166.756 E.30884
G1 X53.362 Y174.381 E.38561
G1 X32.137 Y148.517 E1.07589
G1 X41.346 Y140.93 E.38368
G1 X41.507 Y140.413 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X56.828 Y159.083 E.7194
G1 X62.855 Y166.427 E.283
G1 X63.109 Y166.736 E.01191
M106 S229.5
G1 F4066.244
G1 X63.169 Y166.809 E.00282
M106 S175.95
M106 S229.5
G1 F3000
G1 X53.308 Y174.933 E.38055
M106 S175.95
M106 S229.5
G1 F4066.244
G1 X53.248 Y174.86 E.00282
M106 S175.95
G1 F9547.055
G1 X52.995 Y174.55 E.01191
G1 X31.9 Y148.845 E.99048
G1 X31.646 Y148.536 E.01191
M106 S229.5
G1 F4066.227
G1 X31.586 Y148.463 E.00282
M106 S175.95
M106 S229.5
G1 F3000
G1 X41.447 Y140.34 E.38055
M106 S175.95
M106 S229.5
G1 F3372.792
G1 X41.469 Y140.366 E.00104
M106 S175.95
; WIPE_START
M204 S10000
G1 X42.738 Y141.912 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X41.481 Y149.441 Z9.4 F30000
G1 X40.106 Y157.678 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36498
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36498
G1 X53.41 Y173.89 E.18357
G1 X57.672 Y170.379 E.17755
G1 X34.398 Y147.105 E1.0584
G1 X35.655 Y146.07 E.05236
; WIPE_START
G1 X34.398 Y147.105 E-.61876
G1 X34.661 Y147.368 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X40.767 Y151.947 Z9.4 F30000
G1 X65.983 Y170.856 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X67.014 Y172.113 E.05228
G1 X121.164 Y238.097 E2.74485
G1 X111.909 Y245.722 E.38561
G1 X56.727 Y178.481 E2.79712
G1 X65.936 Y170.894 E.38368
G1 X66.097 Y170.377 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X67.317 Y171.864 E.0573
G1 X121.715 Y238.151 E2.55422
G1 X111.855 Y246.275 E.38055
G1 X56.49 Y178.809 E2.59961
G1 X56.236 Y178.5 E.01191
M106 S229.5
G1 F4066.227
G1 X56.176 Y178.427 E.00282
M106 S175.95
M106 S229.5
G1 F3000
M73 P59 R19
G1 X66.037 Y170.304 E.38055
M106 S175.95
M106 S229.5
G1 F3372.722
G1 X66.059 Y170.33 E.00104
M106 S175.95
; WIPE_START
M204 S10000
G1 X67.317 Y171.864 E-.75379
G1 X67.327 Y171.876 E-.00621
; WIPE_END
G1 E-.04 F1800
G1 X69.274 Y179.256 Z9.4 F30000
G1 X74.705 Y199.839 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.764 Y193.072 E.36498
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36498
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36498
G1 X65.935 Y171.346 E.02683
G1 X61.934 Y174.642 E.16666
G1 X99.317 Y212.024 E1.70001
G1 X101.063 Y214.152 E.08851
G1 X93.037 Y222.178 E.36498
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36498
G1 X91.38 Y202.353 E.05236
G1 X119.396 Y236.491 F30000
G1 F8843.478
G1 X118.363 Y235.232 E.05236
G1 X110.337 Y243.258 E.36498
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03148
G1 X105.651 Y237.549 E.32108
G1 X101.687 Y232.718 E.20095
G1 X109.713 Y224.692 E.36498
G1 X110.746 Y225.951 E.05236
; WIPE_START
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X112.563 Y217.986 Z9.4 F30000
G1 X173.004 Y82.69 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X180.562 Y76.463 E.31489
G1 X184.993 Y81.862 E.22459
G1 X177.435 Y88.089 E.31489
G1 X173.042 Y82.736 E.22266
G1 X172.513 Y82.709 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F4066.321
M204 S5000
G1 X172.453 Y82.636 E.00282
M106 S175.95
M106 S229.5
G1 F3000
G1 X180.616 Y75.911 E.31504
M106 S175.95
M106 S229.5
G1 F4066.321
G1 X180.676 Y75.984 E.00282
M106 S175.95
G1 F4110.623
G1 X180.679 Y75.987 E.00011
G1 F9547.055
G1 X180.932 Y76.296 E.01191
G1 X185.544 Y81.916 E.21655
G1 X177.381 Y88.641 E.31504
G1 X172.551 Y82.756 E.22678
; WIPE_START
M204 S10000
G1 X172.453 Y82.636 E-.05883
G1 X173.877 Y81.463 E-.70117
; WIPE_END
G1 E-.04 F1800
G1 X180.947 Y78.587 Z9.4 F30000
G1 X181.627 Y78.31 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X180.594 Y77.051 E.05236
G1 X174.131 Y83.514 E.29391
G1 X173.494 Y82.738 E.03231
G1 X177.675 Y79.293 E.17419
G1 X182.142 Y83.76 E.20314
G1 X180.885 Y84.796 E.05236
; WIPE_START
G1 X182.142 Y83.76 E-.61876
G1 X181.879 Y83.497 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X176.261 Y78.331 Z9.4 F30000
G1 X148.414 Y52.726 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X155.972 Y46.499 E.31489
G1 X171.105 Y64.939 E.76705
G1 X177.198 Y72.363 E.30884
G1 X169.639 Y78.59 E.31489
G1 X148.453 Y52.772 E1.07396
G1 X147.863 Y52.672 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F3000
M204 S5000
G1 X156.026 Y45.947 E.31504
M106 S175.95
M106 S229.5
G1 F4066.244
G1 X156.087 Y46.02 E.00282
M106 S175.95
G1 F9547.055
G1 X156.34 Y46.33 E.01191
G1 X171.408 Y64.69 E.70748
G1 X177.435 Y72.035 E.283
G1 X177.689 Y72.344 E.01191
M106 S229.5
G1 F4066.134
G1 X177.749 Y72.417 E.00282
M106 S175.95
M106 S229.5
G1 F3000
G1 X169.586 Y79.142 E.31504
M106 S175.95
M106 S229.5
G1 F4066.227
G1 X169.525 Y79.069 E.00282
M106 S175.95
G1 F9547.055
G1 X169.272 Y78.76 E.01191
G1 X147.923 Y52.745 E1.00239
M106 S229.5
G1 X147.901 Y52.718 E.00104
M106 S175.95
; WIPE_START
M204 S10000
G1 X149.438 Y51.438 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.612 Y57.828 Z9.4 F30000
G1 X155.799 Y61.175 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X171.945 Y66.511 E.43845
G1 X165.481 Y72.974 E.29391
G1 X169.687 Y78.099 E.21319
G1 X173.412 Y75.031 E.15519
G1 X150.138 Y51.757 E1.0584
G1 X151.395 Y50.721 E.05236
; WIPE_START
G1 X150.138 Y51.757 E-.61876
G1 X150.401 Y52.02 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X144.182 Y56.444 Z9.4 F30000
G1 X35.522 Y133.738 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X38.028 Y136.792 E.12702
G1 X28.772 Y144.416 E.38561
G1 X17.515 Y130.698 E.57065
G1 X141.35 Y28.681 E5.15934
G1 X149.417 Y38.512 E.40893
G1 X152.608 Y42.399 E.16172
G1 X145.05 Y48.626 E.31489
G1 X142.544 Y45.572 E.12702
G1 X98.934 Y81.499 E1.81691
G1 X35.568 Y133.7 E2.64
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.265 Y136.463 E.10292
G1 X38.519 Y136.772 E.01191
M106 S229.5
G1 F4066.227
G1 X38.579 Y136.845 E.00282
M106 S175.95
M106 S229.5
G1 F3000
G1 X28.719 Y144.969 E.38055
M106 S175.95
M106 S229.5
G1 F4066.414
G1 X28.658 Y144.896 E.00282
M106 S175.95
G1 F9547.055
G1 X28.405 Y144.586 E.01191
G1 X16.963 Y130.645 E.53721
G1 X141.404 Y28.129 E4.80247
G1 X149.72 Y38.263 E.39049
G1 X152.845 Y42.071 E.14672
G1 X153.099 Y42.38 E.01191
M106 S229.5
G1 F4066.227
G1 X153.159 Y42.453 E.00282
M106 S175.95
M106 S229.5
G1 F3000
G1 X144.996 Y49.178 E.31504
M106 S175.95
M106 S229.5
G1 F4066.134
G1 X144.936 Y49.105 E.00282
M106 S175.95
G1 F9547.055
G1 X144.682 Y48.796 E.01191
G1 X142.49 Y46.125 E.10292
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.361 Y135.322 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.074 Y133.054 Z9.4 F30000
G1 X19.28 Y129.695 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X30.135 Y142.843 E.55081
G1 X28.82 Y143.926 E.05478
G1 X23.839 Y137.856 E.25248
G1 X91.48 Y70.215 E3.07604
G1 X91.676 Y70.054 E.00816
G1 X100.982 Y79.36 E.4232
G1 X104.067 Y76.819 E.12851
G1 X145.995 Y34.89 E1.90674
G1 X141.302 Y29.172 E.2379
G1 X133.764 Y35.382 E.31408
G1 X145.876 Y47.494 E.55081
G1 X145.098 Y48.135 E.03242
G1 X142.592 Y45.082 E.12702
G1 X132.548 Y53.356 E.41846
G1 X123.242 Y44.05 E.4232
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.4232
G1 X111.504 Y70.692 E.43837
G1 X102.198 Y61.386 E.4232
G1 X103.455 Y60.351 E.05236
G1 X89.204 Y89.064 F30000
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.154 Y78.722 E.4232
G1 X70.632 Y87.39 E.43837
G1 X79.938 Y96.696 E.4232
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.4232
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.4232
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.394 E.4232
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.369 E.4232
G1 X36.594 Y132.404 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X37.851 Y131.369 E-.61876
G1 X37.588 Y131.106 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/75
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
M106 S160.65
G17
G3 Z9.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z9.2
M73 P60 R19
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X38.125 Y136.91 E.13195
G1 X28.87 Y144.535 E.38561
G1 X17.515 Y130.698 E.57558
G1 X141.35 Y28.681 E5.15934
G1 X148.948 Y37.94 E.38513
G1 X152.705 Y42.518 E.19045
G1 X145.147 Y48.744 E.31489
G1 X142.544 Y45.572 E.13195
G1 X100.349 Y80.333 E1.75798
G1 X35.568 Y133.7 E2.69893
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.605 Y136.877 E.11888
M106 S229.5
G1 F3994.766
G1 X38.677 Y136.964 E.00335
M106 S160.65
M106 S229.5
G1 F2760
G1 X28.816 Y145.087 E.38055
M106 S160.65
M106 S229.5
G1 F3994.858
G1 X28.745 Y145.001 E.00335
M106 S160.65
G1 F9547.055
G1 X28.491 Y144.691 E.01191
G1 X16.963 Y130.645 E.54126
G1 X141.404 Y28.129 E4.80247
G1 X149.251 Y37.691 E.36845
G1 X153.185 Y42.485 E.18472
M106 S229.5
G1 F3995.011
G1 X153.256 Y42.572 E.00335
M106 S160.65
M106 S229.5
G1 F2760
G1 X145.093 Y49.297 E.31504
M106 S160.65
M106 S229.5
G1 F3995.179
G1 X145.022 Y49.21 E.00335
M106 S160.65
G1 F9547.055
G1 X144.768 Y48.9 E.01191
G1 X142.49 Y46.125 E.10696
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.365 Y135.319 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X32.052 Y140.799 Z9.6 F30000
G1 X28.919 Y144.03 Z9.6
G1 Z9.2
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X37.575 Y136.899 E.3012
; Slow Down End
; WIPE_START
G1 X36.031 Y138.171 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X41.724 Y133.087 Z9.6 F30000
G1 X112.761 Y69.657 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X111.504 Y70.692 E.05236
G1 X102.198 Y61.386 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X132.548 Y53.356 E.43837
G1 X123.242 Y44.05 E.42319
G1 X133.764 Y35.382 E.43837
G1 X145.723 Y47.341 E.54385
G1 X151.982 Y42.185 E.26076
G1 X145.995 Y34.891 E.30344
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X91.676 Y70.054 E.42319
G1 X91.48 Y70.216 E.00819
G1 X23.839 Y137.856 E3.076
G1 X28.684 Y143.76 E.24556
G1 X29.982 Y142.69 E.0541
G1 X18.023 Y130.731 E.54385
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.395 E.42319
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.42319
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.42319
G1 X70.633 Y87.39 E.43837
G1 X79.938 Y96.696 E.42319
G1 X90.46 Y88.028 E.43837
G1 X81.154 Y78.722 E.42319
G1 X79.898 Y79.758 E.05236
; WIPE_START
G1 X81.154 Y78.722 E-.61876
G1 X81.417 Y78.985 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X88.292 Y75.671 Z9.6 F30000
G1 X145.196 Y48.239 Z9.6
G1 Z9.2
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X152.155 Y42.507 E.24213
; Slow Down End
; WIPE_START
G1 X150.611 Y43.779 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.692 Y51.166 Z9.6 F30000
G1 X148.317 Y52.607 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X155.875 Y46.381 E.31489
G1 X162.57 Y54.539 E.33936
G1 X177.295 Y72.482 E.7464
G1 X169.737 Y78.708 E.31489
G1 X148.355 Y52.654 E1.08383
G1 X147.766 Y52.553 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F2760
M204 S5000
G1 X155.929 Y45.828 E.31504
M106 S160.65
M106 S229.5
G1 F3995.12
G1 X156 Y45.915 E.00335
M106 S160.65
G1 F9547.055
G1 X156.254 Y46.225 E.01191
G1 X162.873 Y54.29 E.31079
G1 X177.775 Y72.449 E.6997
M106 S229.5
G1 F3995.011
G1 X177.846 Y72.536 E.00335
M106 S160.65
M106 S229.5
G1 F2760
G1 X169.683 Y79.261 E.31504
M106 S160.65
M106 S229.5
G1 F3995.103
G1 X169.612 Y79.174 E.00335
M106 S160.65
G1 F9547.055
G1 X169.358 Y78.865 E.01191
G1 X147.837 Y52.64 E1.01048
M106 S229.5
G1 F9300
G1 X147.804 Y52.6 E.00156
M106 S160.65
; WIPE_START
M204 S10000
G1 X149.34 Y51.319 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.821 Y52.656 Z9.6 F30000
G1 Z9.2
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X155.78 Y46.924 E.24214
; Slow Down End
G1 X151.548 Y50.874 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X150.291 Y51.91 E.05236
G1 X173.259 Y74.878 E1.0445
G1 X169.551 Y77.933 E.1545
G1 X165.482 Y72.974 E.20628
G1 X171.944 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
G1 X169.786 Y78.203 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X176.745 Y72.471 E.24214
; Slow Down End
; WIPE_START
G1 X175.201 Y73.743 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X173.282 Y81.13 Z9.6 F30000
G1 X172.907 Y82.571 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X180.465 Y76.345 E.31489
G1 X184.993 Y81.862 E.22952
G1 X177.435 Y88.089 E.31489
G1 X172.945 Y82.618 E.22759
G1 X172.427 Y82.604 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F3995.027
M204 S5000
G1 X172.356 Y82.517 E.00335
M106 S160.65
M106 S229.5
G1 F2760
G1 X180.519 Y75.792 E.31504
M106 S160.65
M106 S229.5
G1 F3995.12
G1 X180.59 Y75.879 E.00335
M106 S160.65
G1 F9547.055
G1 X180.843 Y76.187 E.01185
G1 X185.544 Y81.916 E.22077
G1 X177.381 Y88.641 E.31504
G1 X172.465 Y82.651 E.23083
M204 S10000
G1 X173.411 Y82.62 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X180.369 Y76.888 E.24213
; Slow Down End
G1 X177.828 Y79.446 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X182.142 Y83.76 E.19618
G1 X184.503 Y81.815 E.09839
G1 X180.651 Y77.12 E.19527
G1 X179.937 Y77.709 E.02976
G1 X174.131 Y83.514 E.264
G1 X175.164 Y84.773 E.05236
; WIPE_START
G1 X174.131 Y83.514 E-.61876
G1 X174.394 Y83.251 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X168.452 Y88.042 Z9.6 F30000
G1 X65.885 Y170.737 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X68.802 Y174.291 E.14784
G1 X121.164 Y238.097 E2.65422
G1 X111.909 Y245.722 E.38561
G1 X56.63 Y178.362 E2.80206
G1 X65.839 Y170.775 E.38368
G1 X66.011 Y170.272 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X69.105 Y174.043 E.14529
G1 X121.715 Y238.151 E2.47027
G1 X111.855 Y246.275 E.38055
G1 X56.15 Y178.395 E2.61557
M106 S229.5
G1 F3995.103
G1 X56.078 Y178.308 E.00335
M106 S160.65
M106 S229.5
G1 F2760
G1 X65.939 Y170.185 E.38055
M106 S160.65
M106 S229.5
G1 F3307.89
G1 X65.972 Y170.225 E.00156
M106 S160.65
; WIPE_START
M204 S10000
G1 X67.241 Y171.772 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X60.862 Y175.962 Z9.6 F30000
G1 X57.134 Y178.411 Z9.6
G1 Z9.2
G1 E.8 F1800
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X65.79 Y171.28 E.3012
; Slow Down End
G1 X76.771 Y202.356 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.763 Y193.072 E.36497
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36497
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36497
G1 X66.071 Y171.513 E.01991
G1 X62.087 Y174.795 E.16598
G1 X99.316 Y212.024 E1.69302
G1 X101.063 Y214.152 E.08854
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X91.38 Y202.353 E.05236
G1 X108.68 Y223.434 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36497
G1 X105.652 Y237.55 E.20098
G1 X112.712 Y244.609 E.32105
G1 X111.956 Y245.232 E.03147
G1 X110.337 Y243.258 E.08209
G1 X118.362 Y235.233 E.36497
G1 X119.395 Y236.491 E.05236
; WIPE_START
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X113.293 Y229.567 Z9.6 F30000
G1 X41.295 Y140.773 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X47.99 Y148.931 E.33936
G1 X62.715 Y166.874 E.7464
G1 X53.46 Y174.499 E.38561
G1 X32.04 Y148.398 E1.08576
G1 X41.249 Y140.811 E.38368
G1 X41.421 Y140.308 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X48.293 Y148.683 E.3227
G1 X63.195 Y166.841 E.6997
M106 S229.5
G1 F3995.027
G1 X63.266 Y166.928 E.00335
M106 S160.65
M106 S229.5
G1 F2760
G1 X53.406 Y175.052 E.38055
M106 S160.65
M106 S229.5
G1 F3995.027
G1 X53.334 Y174.965 E.00335
M106 S160.65
G1 F9547.055
G1 X53.081 Y174.655 E.01191
G1 X31.56 Y148.431 E1.01048
M106 S229.5
G1 F3995.011
G1 X31.489 Y148.344 E.00335
M106 S160.65
M106 S229.5
G1 F2760
G1 X41.349 Y140.221 E.38055
M106 S160.65
M106 S229.5
G1 F3307.89
G1 X41.383 Y140.261 E.00156
M106 S160.65
; WIPE_START
M204 S10000
G1 X42.651 Y141.807 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.238 Y145.945 Z9.6 F30000
G1 X35.808 Y146.223 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X34.551 Y147.258 E.05236
G1 X57.519 Y170.226 E1.0445
G1 X53.274 Y173.724 E.17687
G1 X49.789 Y169.477 E.17666
G1 X57.814 Y161.451 E.36497
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36497
G1 X40.106 Y157.678 E.05236
G1 X32.544 Y148.447 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X41.2 Y141.316 E.3012
; Slow Down End
G1 X53.509 Y173.994 F30000
; Slow Down Start
G1 F3000;_EXTRUDE_SET_SPEED
G1 X62.165 Y166.863 E.3012
; Slow Down End
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X60.621 Y168.135 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/75
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
M106 S168.3
G17
G3 Z9.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X41.187 Y140.641
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X61.338 Y165.197 E1.02146
G1 X62.823 Y167.006 E.07528
G1 X53.568 Y174.631 E.38561
G1 X31.932 Y148.266 E1.09674
G1 X41.141 Y140.679 E.38368
G1 X41.323 Y140.189 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X61.641 Y164.948 E.95402
G1 X63.039 Y166.651 E.06561
G1 X63.293 Y166.96 E.01191
M106 S229.5
G1 F3907.269
G1 X63.375 Y167.06 E.00386
M106 S168.3
M106 S229.5
G1 F2520
G1 X53.514 Y175.184 E.38055
M106 S168.3
M106 S229.5
G1 F3907.269
G1 X53.432 Y175.083 E.00386
M106 S168.3
G1 F9547.055
G1 X53.178 Y174.774 E.01191
G1 X31.716 Y148.622 E1.00771
G1 X31.463 Y148.313 E.01191
M106 S229.5
G1 F3907.253
G1 X31.38 Y148.212 E.00386
M106 S168.3
M106 S229.5
G1 F2520
G1 X41.241 Y140.089 E.38055
M106 S168.3
M106 S229.5
G1 F3228.079
G1 X41.285 Y140.143 E.00208
M106 S168.3
; WIPE_START
M204 S10000
G1 X42.554 Y141.689 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.174 Y145.879 Z9.8 F30000
G1 X32.46 Y148.318 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38772
G1 F10440.836
G1 X41.089 Y141.209 E.3045
G1 X40.106 Y157.678 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36497
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36497
G1 X53.36 Y173.829 E.18102
G1 X57.615 Y170.323 E.1773
G1 X34.454 Y147.162 E1.05327
G1 X35.711 Y146.126 E.05236
G1 X53.62 Y174.102 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38771
G1 F10441.139
G1 X62.249 Y166.993 E.3045
; WIPE_START
G1 X60.705 Y168.265 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X65.777 Y170.605 Z9.8 F30000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X121.164 Y238.097 E2.80755
G1 X111.909 Y245.722 E.38561
G1 X56.521 Y178.23 E2.80755
G1 X65.731 Y170.643 E.38368
G1 X65.913 Y170.153 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P61 R19
G1 F9547.055
M204 S5000
G1 X66.04 Y170.307 E.00594
G1 X121.715 Y238.151 E2.6142
G1 X111.855 Y246.275 E.38055
G1 X56.306 Y178.586 E2.60822
G1 X56.052 Y178.277 E.01191
M106 S229.5
G1 F3907.253
G1 X55.97 Y178.176 E.00386
M106 S168.3
M106 S229.5
G1 F2520
G1 X65.831 Y170.053 E.38055
M106 S168.3
M106 S229.5
G1 F3228.079
G1 X65.875 Y170.107 E.00208
M106 S168.3
; WIPE_START
M204 S10000
G1 X66.04 Y170.307 E-.09855
G1 X67.144 Y171.653 E-.66145
; WIPE_END
G1 E-.04 F1800
G1 X60.764 Y175.843 Z9.8 F30000
G1 X57.05 Y178.282 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38771
G1 F10441.139
G1 X65.679 Y171.173 E.3045
G1 X74.705 Y199.839 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.764 Y193.072 E.36497
G1 X92.413 Y203.612 E.43845
G1 X84.388 Y211.638 E.36497
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36497
G1 X99.316 Y212.024 E.08854
G1 X61.991 Y174.698 E1.69741
G1 X65.985 Y171.408 E.16641
G1 X66.464 Y171.991 E.02428
G1 X58.438 Y180.017 E.36497
G1 X67.088 Y190.557 E.43845
G1 X75.114 Y182.532 E.36497
G1 X76.147 Y183.79 E.05236
G1 X119.395 Y236.491 F30000
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.337 Y243.258 E.36497
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03147
G1 X105.652 Y237.55 E.32105
G1 X101.687 Y232.718 E.20098
G1 X109.713 Y224.692 E.36497
G1 X110.746 Y225.951 E.05236
; WIPE_START
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X112.55 Y217.981 Z9.8 F30000
G1 X172.799 Y82.439 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X180.357 Y76.213 E.31489
G1 X184.993 Y81.862 E.23501
G1 X177.435 Y88.089 E.31489
G1 X172.837 Y82.486 E.23308
G1 X172.33 Y82.486 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F3907.269
M204 S5000
G1 X172.247 Y82.385 E.00386
M106 S168.3
M106 S229.5
G1 F2520
G1 X180.411 Y75.66 E.31504
M106 S168.3
M106 S229.5
G1 F3907.436
G1 X180.493 Y75.761 E.00387
M106 S168.3
G1 F9547.055
G1 X180.747 Y76.07 E.01191
G1 X185.544 Y81.916 E.22527
G1 X177.381 Y88.641 E.31504
G1 X172.368 Y82.532 E.2354
M204 S10000
G1 X173.327 Y82.491 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.3877
G1 F10441.441
G1 X180.259 Y76.781 E.24459
G1 X181.627 Y78.31 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X180.594 Y77.051 E.05236
G1 X174.131 Y83.514 E.29391
G1 X173.544 Y82.799 E.02975
G1 X177.731 Y79.35 E.17444
G1 X182.142 Y83.76 E.20057
G1 X180.885 Y84.795 E.05236
; WIPE_START
G1 X182.142 Y83.76 E-.61876
G1 X181.879 Y83.497 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X176.266 Y78.326 Z9.8 F30000
G1 X148.209 Y52.475 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X155.767 Y46.249 E.31489
G1 X175.918 Y70.804 E1.02146
G1 X177.403 Y72.614 E.07528
G1 X169.845 Y78.84 E.31489
G1 X148.247 Y52.522 E1.09481
G1 X147.657 Y52.421 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F2520
M204 S5000
G1 X155.821 Y45.696 E.31504
M106 S168.3
M106 S229.5
G1 F3907.269
G1 X155.903 Y45.797 E.00386
M106 S168.3
G1 F9547.055
G1 X156.157 Y46.106 E.01191
G1 X176.221 Y70.555 E.9421
G1 X177.618 Y72.258 E.06561
G1 X177.872 Y72.567 E.01191
M106 S229.5
G1 F3907.253
G1 X177.955 Y72.668 E.00386
M106 S168.3
M106 S229.5
G1 F2520
G1 X169.791 Y79.393 E.31504
M106 S168.3
M106 S229.5
G1 F3907.253
G1 X169.709 Y79.292 E.00386
M106 S168.3
G1 F9547.055
G1 X169.455 Y78.983 E.01191
G1 X147.994 Y52.831 E1.00771
G1 X147.74 Y52.522 E.01191
M106 S229.5
G1 F7500
G1 X147.696 Y52.468 E.00208
M106 S168.3
; WIPE_START
M204 S10000
G1 X149.232 Y51.187 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.737 Y52.527 Z9.8 F30000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38769
G1 F10441.744
G1 X155.669 Y46.817 E.24458
G1 X155.799 Y61.175 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X171.944 Y66.511 E.43845
G1 X165.482 Y72.974 E.29391
G1 X169.637 Y78.038 E.21064
G1 X173.356 Y74.974 E.15493
G1 X150.195 Y51.813 E1.05327
G1 X151.452 Y50.778 E.05236
G1 X169.897 Y78.311 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.3877
G1 F10441.441
G1 X176.828 Y72.6 E.24459
; WIPE_START
G1 X175.285 Y73.872 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X168.269 Y76.877 Z9.8 F30000
G1 X35.522 Y133.738 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.234 Y137.042 E.13744
G1 X28.978 Y144.667 E.38561
G1 X17.515 Y130.698 E.58107
G1 X141.35 Y28.681 E5.15934
G1 X148.478 Y37.367 E.36134
G1 X152.813 Y42.65 E.21974
G1 X145.255 Y48.876 E.31489
G1 X142.544 Y45.572 E.13745
G1 X101.763 Y79.168 E1.69904
G1 X35.568 Y133.7 E2.75787
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.449 Y136.687 E.11154
G1 X38.703 Y136.996 E.01191
M106 S229.5
G1 F3907.344
G1 X38.785 Y137.096 E.00386
M106 S168.3
M106 S229.5
G1 F2520
G1 X28.924 Y145.219 E.38055
M106 S168.3
M106 S229.5
G1 F3907.269
G1 X28.842 Y145.119 E.00386
M106 S168.3
G1 F9547.055
G1 X28.588 Y144.81 E.01191
G1 X16.963 Y130.645 E.54583
G1 X141.404 Y28.129 E4.80247
G1 X148.781 Y37.119 E.34641
G1 X153.029 Y42.294 E.19942
G1 X153.282 Y42.603 E.01191
M106 S229.5
G1 F3907.253
G1 X153.365 Y42.704 E.00386
M106 S168.3
M106 S229.5
G1 F2520
G1 X145.201 Y49.429 E.31504
M106 S168.3
M106 S229.5
G1 F3907.42
G1 X145.119 Y49.328 E.00386
M106 S168.3
G1 F9547.055
G1 X144.865 Y49.019 E.01191
G1 X142.49 Y46.125 E.11154
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.364 Y135.32 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X32.121 Y140.867 Z9.8 F30000
G1 X29.03 Y144.137 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.3877
G1 F10441.441
G1 X37.659 Y137.029 E.30449
; WIPE_START
G1 X36.115 Y138.301 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X40.686 Y132.188 Z9.8 F30000
G1 X79.898 Y79.758 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X81.154 Y78.722 E.05236
G1 X90.46 Y88.028 E.42319
M73 P61 R18
G1 X79.938 Y96.696 E.43837
G1 X70.633 Y87.39 E.42319
G1 X60.111 Y96.058 E.43837
G1 X69.417 Y105.364 E.42319
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.42319
G1 X39.067 Y113.395 E.43837
G1 X48.373 Y122.7 E.42319
G1 X37.851 Y131.368 E.43837
G1 X28.545 Y122.063 E.42319
G1 X18.023 Y130.731 E.43837
G1 X30.079 Y142.786 E.54824
G1 X28.77 Y143.865 E.05453
G1 X23.839 Y137.856 E.24993
G1 X91.48 Y70.216 E3.076
G1 X91.676 Y70.054 E.00819
G1 X100.982 Y79.36 E.42319
G1 X104.067 Y76.818 E.12855
G1 X145.995 Y34.891 E1.9067
G1 X152.068 Y42.29 E.30781
G1 X145.819 Y47.438 E.26032
G1 X133.764 Y35.382 E.54824
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.42319
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.42319
G1 X102.198 Y61.386 E.43837
G1 X111.504 Y70.692 E.42319
G1 X112.761 Y69.657 E.05236
; WIPE_START
G1 X111.504 Y70.692 E-.61876
G1 X111.241 Y70.429 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X117.646 Y66.278 Z9.8 F30000
G1 X145.307 Y48.347 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38771
G1 F10441.139
G1 X152.238 Y42.636 E.24459
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F10441.139
G1 X150.695 Y43.908 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/75
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
M106 S153
G17
G3 Z9.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X41.022 Y140.44
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X49.924 Y151.287 E.45123
G1 X62.989 Y167.208 E.66227
G1 X53.733 Y174.833 E.38561
G1 X31.766 Y148.065 E1.1135
G1 X40.975 Y140.478 E.38368
G1 X41.215 Y140.057 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X50.227 Y151.038 E.42313
G1 X62.893 Y166.473 E.59475
G1 X63.147 Y166.783 E.01191
G1 F8392.935
G1 X63.401 Y167.092 E.01191
M106 S229.5
G1 F2880
G1 X63.54 Y167.262 E.00654
M106 S153
M106 S229.5
G1 F1440
G1 X53.679 Y175.385 E.38055
M106 S153
M106 S229.5
G1 F2880
G1 X53.54 Y175.215 E.00654
M106 S153
G1 F8392.935
G1 X53.286 Y174.906 E.01191
G1 F9547.055
G1 X53.033 Y174.597 E.01191
G1 X31.862 Y148.799 E.99406
G1 X31.608 Y148.49 E.01191
G1 F8392.935
G1 X31.354 Y148.181 E.01191
M106 S229.5
G1 F2880
G1 X31.215 Y148.011 E.00654
M106 S153
M106 S229.5
G1 F1440
G1 X41.076 Y139.887 E.38055
M106 S153
M106 S229.5
G1 F2818.923
G1 X41.177 Y140.011 E.00476
M106 S153
; WIPE_START
M204 S10000
G1 X42.446 Y141.557 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X36.052 Y145.724 Z10 F30000
G1 X35.602 Y146.017 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X34.345 Y147.053 E.05236
G1 X57.724 Y170.432 E1.06319
G1 X53.457 Y173.947 E.17778
G1 X49.789 Y169.477 E.18596
G1 X57.814 Y161.451 E.36497
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36497
G1 X40.106 Y157.678 E.05236
G1 X32.37 Y148.124 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4949
G1 F7964.955
G1 X40.916 Y141.083 E.39533
G1 X53.792 Y174.227 F30000
G1 F7964.955
G1 X62.339 Y167.187 E.39533
; WIPE_START
G1 X60.795 Y168.459 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-.456 J1.128 P1  F30000
G1 X65.612 Y170.404 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X67.695 Y172.942 E.10559
G1 X121.164 Y238.097 E2.71034
G1 X111.909 Y245.722 E.38561
G1 X56.356 Y178.029 E2.81593
G1 X65.565 Y170.442 E.38368
G1 X65.805 Y170.021 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X67.998 Y172.693 E.10297
G1 X121.715 Y238.151 E2.52225
G1 X111.855 Y246.275 E.38055
G1 X56.452 Y178.763 E2.60139
G1 X56.198 Y178.454 E.01191
G1 F8392.935
G1 X55.944 Y178.145 E.01191
M106 S229.5
G1 F2880
G1 X55.805 Y177.975 E.00654
M106 S153
M106 S229.5
G1 F1440
G1 X65.665 Y169.851 E.38055
M106 S153
M106 S229.5
G1 F2818.923
G1 X65.767 Y169.975 E.00476
M106 S153
; WIPE_START
M204 S10000
G1 X67.036 Y171.521 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X60.641 Y175.688 Z10 F30000
G1 X56.96 Y178.088 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49488
G1 F7965.307
G1 X65.506 Y171.047 E.39531
G1 X91.38 Y202.353 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X92.413 Y203.612 E.05236
G1 X84.388 Y211.638 E.36497
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36497
G1 X99.316 Y212.024 E.08854
G1 X61.882 Y174.589 E1.70237
G1 X65.888 Y171.289 E.1669
G1 X66.464 Y171.991 E.02921
G1 X58.438 Y180.017 E.36497
G1 X67.088 Y190.557 E.43845
G1 X75.114 Y182.532 E.36497
G1 X83.763 Y193.072 E.43845
G1 X75.738 Y201.097 E.36497
G1 X76.771 Y202.356 E.05236
G1 X108.68 Y223.434 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36497
G1 X105.652 Y237.55 E.20098
G1 X112.712 Y244.609 E.32105
G1 X111.956 Y245.232 E.03147
G1 X110.337 Y243.258 E.08209
G1 X118.362 Y235.233 E.36497
G1 X119.395 Y236.491 E.05236
; WIPE_START
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X120.658 Y228.305 Z10 F30000
G1 X172.633 Y82.238 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X180.191 Y76.011 E.31489
G1 X184.993 Y81.862 E.24339
G1 X177.435 Y88.089 E.31489
G1 X172.671 Y82.284 E.24146
G1 X172.221 Y82.354 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F2880
M204 S5000
M73 P62 R18
G1 X172.082 Y82.184 E.00654
M106 S153
M106 S229.5
G1 F1440
G1 X180.245 Y75.459 E.31504
M106 S153
M106 S229.5
G1 F2880
G1 X180.385 Y75.629 E.00654
M106 S153
G1 F5496.197
G1 X180.521 Y75.796 E.00643
G1 F9547.055
G1 X180.775 Y76.105 E.01191
G1 X185.544 Y81.916 E.22393
G1 X177.381 Y88.641 E.31504
G1 X172.259 Y82.4 E.24048
M204 S10000
G1 X173.237 Y82.297 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49487
G1 F7965.483
G1 X180.086 Y76.655 E.31679
G1 X180.885 Y84.795 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X182.142 Y83.76 E.05236
G1 X177.622 Y79.241 E.20553
G1 X173.447 Y82.68 E.17396
G1 X174.131 Y83.514 E.03469
G1 X180.594 Y77.051 E.29391
G1 X181.627 Y78.31 E.05236
; WIPE_START
G1 X180.594 Y77.051 E-.61876
G1 X180.331 Y77.314 E-.14125
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.746 J-.962 P1  F30000
G1 X148.043 Y52.274 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X155.601 Y46.047 E.31489
G1 X164.503 Y56.895 E.45123
G1 X177.569 Y72.815 E.66227
G1 X170.011 Y79.042 E.31489
G1 X148.082 Y52.32 E1.11157
G1 X147.631 Y52.39 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F2880
M204 S5000
G1 X147.492 Y52.22 E.00654
M106 S153
M106 S229.5
G1 F1440
G1 X155.655 Y45.495 E.31504
M106 S153
M106 S229.5
G1 F2880
G1 X155.795 Y45.665 E.00654
M106 S153
G1 F8392.935
G1 X156.048 Y45.974 E.01191
G1 F9547.055
G1 X156.302 Y46.283 E.01191
G1 X164.806 Y56.646 E.3993
G1 X177.473 Y72.081 E.59475
G1 X177.727 Y72.39 E.01191
G1 F8392.935
G1 X177.981 Y72.699 E.01191
M106 S229.5
G1 F2880
G1 X178.12 Y72.869 E.00654
M106 S153
M106 S229.5
G1 F1440
G1 X169.957 Y79.594 E.31504
M106 S153
M106 S229.5
G1 F2880
G1 X169.817 Y79.424 E.00654
M106 S153
G1 F8392.935
G1 X169.564 Y79.115 E.01191
G1 F9547.055
G1 X169.31 Y78.806 E.01191
G1 X147.67 Y52.436 E1.0161
M204 S10000
G1 X148.647 Y52.333 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49488
G1 F7965.307
G1 X155.496 Y46.691 E.3168
G1 X151.343 Y50.669 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X150.086 Y51.704 E.05236
G1 X173.465 Y75.083 E1.06319
G1 X169.734 Y78.156 E.15542
G1 X165.482 Y72.974 E.21558
G1 X171.944 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
G1 X170.07 Y78.437 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49487
G1 F7965.483
G1 X176.918 Y72.795 E.31679
; WIPE_START
G1 X175.375 Y74.066 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X168.354 Y77.062 Z10 F30000
G1 X35.522 Y133.738 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.399 Y137.244 E.14583
G1 X29.144 Y144.869 E.38561
G1 X17.515 Y130.698 E.58946
G1 X141.35 Y28.681 E5.15934
G1 X148.009 Y36.795 E.33754
G1 X152.979 Y42.851 E.25191
G1 X145.421 Y49.078 E.31489
G1 X142.544 Y45.572 E.14583
G1 X103.178 Y78.002 E1.64011
G1 X35.568 Y133.7 E2.8168
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.303 Y136.509 E.10471
G1 X38.557 Y136.819 E.01191
G1 F8392.935
G1 X38.811 Y137.128 E.01191
M106 S229.5
G1 F2880
G1 X38.95 Y137.298 E.00654
M106 S153
M106 S229.5
G1 F1440
G1 X29.09 Y145.421 E.38055
M106 S153
M106 S229.5
G1 F2880
G1 X28.95 Y145.251 E.00654
M106 S153
G1 F8392.935
G1 X28.697 Y144.942 E.01191
G1 F9547.055
G1 X28.443 Y144.633 E.01191
G1 X16.963 Y130.645 E.539
G1 X141.404 Y28.129 E4.80247
G1 X148.312 Y36.547 E.32437
G1 X152.883 Y42.117 E.21463
G1 X153.137 Y42.426 E.01191
G1 F8392.935
G1 X153.391 Y42.735 E.01191
M106 S229.5
G1 F2880
G1 X153.53 Y42.905 E.00654
M106 S153
M106 S229.5
G1 F1440
G1 X145.367 Y49.63 E.31504
M106 S153
M106 S229.5
G1 F2880
G1 X145.227 Y49.46 E.00654
M106 S153
G1 F8392.935
G1 X144.974 Y49.151 E.01191
G1 F9547.055
G1 X144.72 Y48.842 E.01191
G1 X142.49 Y46.125 E.10471
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.362 Y135.321 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X32.217 Y140.959 Z10 F30000
G1 X29.203 Y144.263 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49491
G1 F7964.778
G1 X37.749 Y137.223 E.39534
; WIPE_START
G1 X36.205 Y138.495 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X41.881 Y133.391 Z10 F30000
G1 X112.761 Y69.657 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X111.504 Y70.692 E.05236
G1 X102.198 Y61.386 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X132.548 Y53.356 E.43837
G1 X123.242 Y44.05 E.42319
G1 X133.764 Y35.382 E.43837
G1 X145.928 Y47.547 E.5532
G1 X152.165 Y42.409 E.25984
G1 X145.995 Y34.891 E.31274
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X91.676 Y70.054 E.42319
G1 X91.48 Y70.216 E.00819
G1 X23.839 Y137.856 E3.076
G1 X28.867 Y143.983 E.25486
G1 X30.188 Y142.895 E.05502
G1 X18.023 Y130.731 E.5532
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.395 E.42319
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.42319
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.42319
G1 X70.633 Y87.39 E.43837
G1 X79.938 Y96.696 E.42319
G1 X90.46 Y88.028 E.43837
G1 X81.154 Y78.722 E.42319
G1 X79.898 Y79.758 E.05236
; WIPE_START
G1 X81.154 Y78.722 E-.61876
G1 X81.417 Y78.985 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X88.308 Y75.703 Z10 F30000
G1 X145.48 Y48.473 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49487
G1 F7965.483
G1 X152.328 Y42.831 E.31679
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7965.483
G1 X150.785 Y44.102 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/75
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
M106 S127.5
G17
G3 Z10 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X40.832 Y140.208
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.067 Y140.496 E.01195
G1 X63.179 Y167.439 E1.12081
G1 X53.923 Y175.064 E.38561
G1 X31.576 Y147.833 E1.13276
G1 X40.785 Y140.246 E.38368
G1 X41.05 Y139.856 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X60.538 Y163.604 E.91507
G1 X63.059 Y166.675 E.11834
G1 X63.312 Y166.984 E.01191
G1 F7769.882
G1 X63.566 Y167.293 E.01191
M106 S229.5
G1 F2520
G1 X63.73 Y167.493 E.0077
M106 S127.5
M106 S229.5
G1 F840
G1 X53.869 Y175.616 E.38055
M106 S127.5
M106 S229.5
G1 F2520
G1 X53.705 Y175.417 E.0077
M106 S127.5
G1 F7769.882
G1 X53.452 Y175.107 E.01191
G1 F9547.055
G1 X53.198 Y174.798 E.01191
G1 X31.696 Y148.598 E1.00958
G1 X31.443 Y148.288 E.01191
G1 F7769.882
G1 X31.189 Y147.979 E.01191
M106 S229.5
G1 F2520
G1 X31.025 Y147.779 E.0077
M106 S127.5
M106 S229.5
G1 F840
G1 X40.886 Y139.656 E.38055
M106 S127.5
M106 S229.5
G1 F2285.863
G1 X41.012 Y139.809 E.00591
M106 S127.5
; WIPE_START
M204 S10000
G1 X42.28 Y141.355 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-.666 J-1.019 P1  F30000
G1 X32.271 Y147.901 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.62361
G1 F6199.522
G1 X40.718 Y140.942 E.50201
G1 X40.106 Y157.678 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36497
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36497
G1 X53.566 Y174.079 E.19145
G1 X57.846 Y170.553 E.17832
G1 X34.224 Y146.931 E1.07422
G1 X35.481 Y145.896 E.05236
G1 X53.991 Y174.368 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.62362
G1 F6199.415
G1 X62.438 Y167.41 E.50201
; WIPE_START
G1 X60.894 Y168.681 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-.381 J1.156 P1  F30000
G1 X65.422 Y170.172 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X121.164 Y238.097 E2.82556
G1 X111.909 Y245.722 E.38561
G1 X56.166 Y177.797 E2.82556
G1 X65.375 Y170.21 E.38368
G1 X65.639 Y169.82 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X65.765 Y169.973 E.0059
G1 X121.715 Y238.151 E2.62708
G1 X111.855 Y246.275 E.38055
G1 X56.286 Y178.562 E2.60916
G1 X56.033 Y178.252 E.01191
G1 F7769.882
G1 X55.779 Y177.943 E.01191
M106 S229.5
G1 F2520
G1 X55.615 Y177.743 E.0077
M106 S127.5
M106 S229.5
G1 F840
G1 X65.476 Y169.62 E.38055
M106 S127.5
M106 S229.5
G1 F2285.863
G1 X65.601 Y169.773 E.00591
M106 S127.5
; WIPE_START
M204 S10000
G1 X65.765 Y169.973 E-.09813
G1 X66.87 Y171.319 E-.66187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-.666 J-1.019 P1  F30000
G1 X56.861 Y177.865 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.62362
G1 F6199.415
G1 X65.307 Y170.906 E.50201
G1 X76.771 Y202.356 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.763 Y193.072 E.36497
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36497
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36497
G1 X65.779 Y171.157 E.0347
G1 X61.761 Y174.468 E.16744
G1 X99.316 Y212.024 E1.70788
G1 X101.063 Y214.152 E.08854
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X91.38 Y202.353 E.05236
G1 X119.395 Y236.491 F30000
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.337 Y243.258 E.36497
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03147
G1 X105.652 Y237.55 E.32105
G1 X101.687 Y232.718 E.20098
G1 X109.713 Y224.692 E.36497
G1 X108.68 Y223.434 E.05236
; WIPE_START
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X112.528 Y217.971 Z10.2 F30000
G1 X172.443 Y82.006 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X180.001 Y75.78 E.31489
G1 X184.993 Y81.862 E.25302
G1 X177.435 Y88.089 E.31489
G1 X172.481 Y82.053 E.25109
G1 X172.056 Y82.152 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F2520
M204 S5000
G1 X171.892 Y81.952 E.0077
M106 S127.5
M106 S229.5
G1 F840
G1 X180.055 Y75.227 E.31504
M106 S127.5
M106 S229.5
G1 F2520
G1 X180.219 Y75.427 E.0077
M106 S127.5
G1 F7769.882
G1 X180.473 Y75.737 E.01191
G1 F9547.055
G1 X180.727 Y76.046 E.01191
G1 X185.544 Y81.916 E.22621
G1 X177.381 Y88.641 E.31504
G1 X172.094 Y82.199 E.24825
; WIPE_START
M204 S10000
G1 X171.892 Y81.952 E-.12102
G1 X173.19 Y80.883 E-.63898
; WIPE_END
G1 E-.04 F1800
G1 X173.138 Y82.074 Z10.2 F30000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.62361
G1 F6199.522
G1 X179.887 Y76.514 E.40112
G1 X180.885 Y84.795 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X182.142 Y83.76 E.05236
G1 X177.501 Y79.119 E.21104
G1 X180.359 Y76.765 E.11908
G1 X180.594 Y77.051 E.01192
G1 X174.131 Y83.514 E.29391
G1 X175.164 Y84.773 E.05236
; WIPE_START
G1 X174.131 Y83.514 E-.61877
G1 X174.394 Y83.251 E-.14123
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.927 J-.788 P1  F30000
G1 X147.853 Y52.042 Z10.2
M73 P63 R18
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X155.412 Y45.816 E.31489
G1 X155.647 Y46.103 E.01195
G1 X177.759 Y73.047 E1.12081
G1 X170.2 Y79.273 E.31489
G1 X147.892 Y52.089 E1.13083
G1 X147.466 Y52.188 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F2520
M204 S5000
G1 X147.302 Y51.988 E.0077
M106 S127.5
M106 S229.5
G1 F840
G1 X155.465 Y45.263 E.31504
M106 S127.5
M106 S229.5
G1 F2520
G1 X155.629 Y45.463 E.0077
M106 S127.5
G1 F7769.882
G1 X155.883 Y45.772 E.01191
G1 F9547.055
G1 X156.137 Y46.082 E.01191
G1 X175.118 Y69.211 E.89124
G1 X177.638 Y72.282 E.11834
G1 X177.892 Y72.592 E.01191
G1 F7769.882
G1 X178.146 Y72.901 E.01191
M106 S229.5
G1 F2520
G1 X178.31 Y73.101 E.0077
M106 S127.5
M106 S229.5
G1 F840
G1 X170.147 Y79.826 E.31504
M106 S127.5
M106 S229.5
G1 F2520
G1 X169.983 Y79.626 E.0077
M106 S127.5
G1 F7769.882
G1 X169.729 Y79.317 E.01191
G1 F9547.055
G1 X169.475 Y79.007 E.01191
G1 X147.504 Y52.235 E1.03162
; WIPE_START
M204 S10000
G1 X147.302 Y51.988 E-.12102
G1 X148.6 Y50.919 E-.63898
; WIPE_END
G1 E-.04 F1800
G1 X148.548 Y52.11 Z10.2 F30000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.62362
G1 F6199.415
G1 X155.297 Y46.55 E.40113
G1 X155.799 Y61.175 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X171.944 Y66.511 E.43845
G1 X165.482 Y72.974 E.29391
G1 X169.843 Y78.288 E.22107
G1 X173.586 Y75.204 E.15596
G1 X149.964 Y51.583 E1.07422
G1 X151.221 Y50.547 E.05236
G1 X170.268 Y78.577 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.6236
G1 F6199.628
G1 X177.018 Y73.017 E.40111
; WIPE_START
G1 X175.474 Y74.289 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X168.449 Y77.273 Z10.2 F30000
G1 X35.522 Y133.738 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.589 Y137.475 E.15546
G1 X29.333 Y145.1 E.38561
G1 X17.515 Y130.698 E.59909
G1 X141.35 Y28.681 E5.15934
G1 X147.54 Y36.223 E.31375
G1 X153.169 Y43.083 E.28534
G1 X145.611 Y49.309 E.31489
G1 X142.544 Y45.572 E.15546
G1 X104.592 Y76.837 E1.58117
G1 X35.568 Y133.7 E2.87574
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.469 Y136.711 E.11247
G1 X38.723 Y137.02 E.01191
G1 F7769.882
G1 X38.976 Y137.329 E.01191
M106 S229.5
G1 F2520
G1 X39.14 Y137.529 E.0077
M106 S127.5
M106 S229.5
G1 F840
G1 X29.28 Y145.652 E.38055
M106 S127.5
M106 S229.5
G1 F2520
G1 X29.116 Y145.453 E.0077
M106 S127.5
G1 F7769.882
G1 X28.862 Y145.143 E.01191
G1 F9547.055
G1 X28.608 Y144.834 E.01191
G1 X16.963 Y130.645 E.54677
G1 X141.404 Y28.129 E4.80247
G1 X147.843 Y35.975 E.30233
G1 X153.049 Y42.318 E.24444
G1 X153.302 Y42.628 E.01191
G1 F7769.882
G1 X153.556 Y42.937 E.01191
M106 S229.5
G1 F2520
G1 X153.72 Y43.137 E.0077
M106 S127.5
M106 S229.5
G1 F840
G1 X145.557 Y49.862 E.31504
M106 S127.5
M106 S229.5
G1 F2520
G1 X145.393 Y49.662 E.0077
M106 S127.5
G1 F7769.882
G1 X145.139 Y49.353 E.01191
G1 F9547.055
G1 X144.885 Y49.043 E.01191
G1 X142.49 Y46.125 E.11247
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.364 Y135.32 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X32.333 Y141.06 Z10.2 F30000
G1 X29.401 Y144.404 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.62362
G1 F6199.415
G1 X37.848 Y137.446 E.50201
; WIPE_START
G1 X36.305 Y138.717 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X40.102 Y132.097 Z10.2 F30000
G1 X61.367 Y95.023 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X60.111 Y96.058 E.05236
G1 X69.417 Y105.364 E.42319
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.42319
G1 X39.067 Y113.395 E.43837
G1 X48.373 Y122.7 E.42319
G1 X37.851 Y131.368 E.43837
G1 X28.545 Y122.063 E.42319
G1 X18.023 Y130.731 E.43837
G1 X30.309 Y143.017 E.55872
G1 X28.976 Y144.115 E.05556
G1 X23.839 Y137.856 E.26035
G1 X91.48 Y70.216 E3.076
G1 X91.676 Y70.054 E.00819
G1 X100.982 Y79.36 E.42319
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X152.273 Y42.541 E.31824
G1 X146.05 Y47.668 E.2593
G1 X133.764 Y35.382 E.55872
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.42319
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.42319
G1 X102.198 Y61.386 E.43837
G1 X111.504 Y70.692 E.42319
G1 X112.761 Y69.657 E.05236
; WIPE_START
G1 X111.504 Y70.692 E-.61876
G1 X111.241 Y70.429 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X117.689 Y66.345 Z10.2 F30000
G1 X145.679 Y48.613 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.62358
G1 F6199.842
G1 X152.428 Y43.053 E.4011
; WIPE_START
G1 X150.884 Y44.325 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.748 Y48.864 Z10.2 F30000
G1 X78.682 Y97.732 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X79.938 Y96.696 E.05236
G1 X70.633 Y87.39 E.42319
G1 X81.154 Y78.722 E.43837
G1 X90.46 Y88.028 E.42319
G1 X91.717 Y86.993 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X90.46 Y88.028 E-.61876
G1 X90.197 Y87.765 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/75
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
M106 S109.65
G17
G3 Z10.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
M73 P63 R17
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X38.855 Y137.8 E.16895
G1 X38.895 Y137.849 E.00203
M106 S229.5
G1 X29.64 Y145.473 E.38561
M106 S109.65
G1 X29.6 Y145.424 E.00203
G1 X17.515 Y130.698 E.61258
G1 X141.35 Y28.681 E5.15934
G1 X147.07 Y35.651 E.28995
G1 X153.435 Y43.407 E.32263
G1 X153.475 Y43.456 E.00203
M106 S229.5
G1 X145.917 Y49.682 E.31489
M106 S109.65
G1 X145.877 Y49.634 E.00204
G1 X142.544 Y45.572 E.16895
G1 X106.007 Y75.672 E1.52224
G1 X35.568 Y133.7 E2.93467
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.659 Y136.942 E.12139
G1 X38.913 Y137.252 E.01191
G1 F6459.938
G1 X39.166 Y137.561 E.01191
M106 S229.5
G1 F1800
G1 X39.4 Y137.846 E.01099
M106 S109.65
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S229.5
G1 F600
G1 X39.447 Y137.902 E.00234
G1 X29.586 Y146.026 E.41083
G1 X29.54 Y145.969 E.00234
M106 S109.65
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F1920
G1 X29.306 Y145.684 E.01099
M106 S109.65
G1 F6685.538
G1 X29.052 Y145.375 E.01191
G1 F9547.055
G1 X28.798 Y145.066 E.01191
G1 X16.963 Y130.645 E.55568
G1 X141.404 Y28.129 E4.80247
G1 X147.373 Y35.403 E.28028
G1 X153.238 Y42.55 E.2754
G1 X153.492 Y42.859 E.01191
G1 F6459.938
G1 X153.746 Y43.168 E.01191
M106 S229.5
G1 F1800
G1 X153.98 Y43.454 E.01099
M106 S109.65
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S229.5
G1 F600
G1 X154.026 Y43.51 E.00234
G1 X145.863 Y50.235 E.3401
G1 X145.817 Y50.179 E.00234
M106 S109.65
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F1800
G1 X145.583 Y49.893 E.01099
M106 S109.65
G1 F6459.938
G1 X145.329 Y49.584 E.01191
G1 F9547.055
G1 X145.075 Y49.275 E.01191
G1 X142.49 Y46.125 E.12139
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.366 Y135.318 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X38.327 Y137.793 Z10.4 F30000
G1 Z10
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.44436
G1 F8967.716
G1 X38.072 Y137.483 E.01273
G1 X29.441 Y144.593 E.35463
G1 X29.695 Y144.904 E.01273
G1 X38.281 Y137.831 E.35273
; WIPE_START
G1 X36.737 Y139.103 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.025 Y133.599 Z10.4 F30000
G1 X68.16 Y106.4 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X69.417 Y105.364 E.05236
G1 X60.111 Y96.058 E.42319
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.42319
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.395 E.42319
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
G1 X36.594 Y132.404 E.05236
G1 X69.376 Y88.426 F30000
G1 F8843.478
G1 X70.633 Y87.39 E.05236
G1 X79.938 Y96.696 E.42319
G1 X90.46 Y88.028 E.43837
G1 X81.154 Y78.722 E.42319
G1 X79.898 Y79.758 E.05236
G1 X112.761 Y69.657 F30000
G1 F8843.478
G1 X111.504 Y70.692 E.05236
G1 X102.198 Y61.386 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X132.548 Y53.356 E.43837
G1 X123.242 Y44.05 E.42319
G1 X133.764 Y35.382 E.43837
G1 X146.235 Y47.853 E.56714
G1 X152.439 Y42.742 E.25847
G1 X145.995 Y34.891 E.32662
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12855
G1 X91.676 Y70.054 E.42319
G1 X91.48 Y70.216 E.00819
G1 X23.839 Y137.856 E3.076
G1 X29.141 Y144.317 E.26874
G1 X30.494 Y143.202 E.05638
G1 X18.023 Y130.731 E.56714
G1 X19.28 Y129.695 E.05236
; WIPE_START
G1 X18.023 Y130.731 E-.61876
G1 X18.286 Y130.993 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X24.711 Y126.873 Z10.4 F30000
G1 X145.973 Y49.113 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.444365
G1 F8967.612
G1 X152.907 Y43.401 E.28489
G1 X152.652 Y43.09 E.01273
G1 X145.718 Y48.803 E.28489
G1 X145.934 Y49.067 E.01083
; WIPE_START
G1 X145.718 Y48.803 E-.12975
G1 X146.998 Y47.748 E-.63025
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-1.176 J.313 P1  F30000
G1 X148.281 Y52.563 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X147.587 Y51.718 E.03516
G1 X147.547 Y51.669 E.00203
M106 S229.5
G1 X155.105 Y45.443 E.31489
M106 S109.65
G1 X155.145 Y45.491 E.00203
G1 X156.087 Y46.639 E.04774
G1 X178.025 Y73.371 E1.11201
G1 X178.065 Y73.42 E.00203
M106 S229.5
G1 X170.507 Y79.647 E.31489
M106 S109.65
G1 X170.467 Y79.598 E.00203
G1 X148.319 Y52.61 E1.12265
G1 X147.978 Y52.812 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X147.784 Y52.575 E.00912
G1 X147.53 Y52.266 E.01191
G1 F6685.538
G1 X147.276 Y51.957 E.01191
M106 S229.5
G1 F1920
G1 X147.042 Y51.672 E.01099
M106 S109.65
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S229.5
G1 F600
G1 X146.996 Y51.615 E.00234
G1 X155.159 Y44.89 E.3401
G1 X155.205 Y44.947 E.00234
M106 S109.65
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
M73 P64 R17
G1 F1920
G1 X155.439 Y45.232 E.01099
M106 S109.65
G1 F6685.538
G1 X155.693 Y45.541 E.01191
G1 F9547.055
G1 X155.947 Y45.85 E.01191
G1 X156.39 Y46.39 E.02082
G1 X177.828 Y72.514 E1.00661
G1 X178.082 Y72.823 E.01191
G1 F6459.938
G1 X178.336 Y73.132 E.01191
M106 S229.5
G1 F1800
G1 X178.57 Y73.418 E.01099
M106 S109.65
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S229.5
G1 F600
G1 X178.616 Y73.474 E.00234
G1 X170.453 Y80.199 E.3401
G1 X170.407 Y80.143 E.00234
M106 S109.65
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F1920
G1 X170.173 Y79.857 E.01099
M106 S109.65
G1 F6685.538
G1 X169.919 Y79.548 E.01191
G1 F9547.055
G1 X169.665 Y79.239 E.01191
G1 X148.016 Y52.858 E1.01651
M204 S10000
G1 X148.37 Y52.035 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.44436
G1 F8967.716
G1 X155.304 Y46.322 E.28489
G1 X155.05 Y46.012 E.01273
G1 X148.116 Y51.724 E.28489
G1 X148.332 Y51.988 E.01083
G1 X151.036 Y50.362 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X149.779 Y51.398 E.05236
G1 X173.771 Y75.39 E1.09106
G1 X170.008 Y78.49 E.15679
G1 X165.482 Y72.974 E.22945
G1 X171.944 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
G1 X170.562 Y79.077 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.44436
G1 F8967.723
G1 X177.496 Y73.365 E.28489
G1 X177.242 Y73.054 E.01273
G1 X170.308 Y78.767 E.28489
G1 X170.524 Y79.031 E.01083
; WIPE_START
G1 X170.308 Y78.767 E-.12975
G1 X171.588 Y77.712 E-.63025
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-1.176 J.311 P1  F30000
G1 X172.858 Y82.511 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X172.177 Y81.682 E.03449
G1 X172.137 Y81.633 E.00203
M106 S229.5
G1 X179.695 Y75.407 E.31489
M106 S109.65
G1 X179.735 Y75.456 E.00204
G1 X179.923 Y75.685 E.00953
G1 X184.993 Y81.862 E.25698
G1 X177.435 Y88.089 E.31489
G1 X172.896 Y82.557 E.2301
G1 X172.554 Y82.76 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X172.373 Y82.539 E.0085
G1 X172.12 Y82.23 E.01191
G1 F6685.538
G1 X171.866 Y81.921 E.01191
M106 S229.5
G1 F1920
G1 X171.632 Y81.636 E.01099
M106 S109.65
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S229.5
G1 F600
G1 X171.586 Y81.579 E.00234
G1 X179.749 Y74.854 E.3401
G1 X179.795 Y74.911 E.00234
M106 S109.65
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F1920
G1 X180.029 Y75.196 E.01099
M106 S109.65
G1 F5372.801
G1 X180.226 Y75.436 E.00926
G1 F9547.055
G1 X180.48 Y75.745 E.01191
G1 X185.544 Y81.916 E.23778
G1 X177.381 Y88.641 E.31504
G1 X172.593 Y82.806 E.22484
; WIPE_START
M204 S10000
G1 X172.373 Y82.539 E-.13122
G1 X172.12 Y82.23 E-.152
G1 X171.866 Y81.921 E-.152
G1 X171.632 Y81.636 E-.14022
G1 X171.586 Y81.579 E-.02768
G1 X171.904 Y81.317 E-.15689
; WIPE_END
G1 E-.04 F1800
G1 X172.705 Y81.688 Z10.4 F30000
G1 Z10
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.44436
G1 F8967.716
G1 X172.96 Y81.999 E.01273
G1 X179.894 Y76.286 E.28489
G1 X179.639 Y75.976 E.01273
G1 X172.752 Y81.65 E.28299
G1 X175.164 Y84.773 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X174.131 Y83.514 E.05236
G1 X180.594 Y77.051 E.29391
G1 X180.194 Y76.563 E.0203
G1 X177.316 Y78.934 E.1199
G1 X182.142 Y83.76 E.21946
G1 X180.885 Y84.795 E.05236
; WIPE_START
G1 X182.142 Y83.76 E-.61876
G1 X181.879 Y83.497 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X175.776 Y88.081 Z10.4 F30000
G1 X65.818 Y170.656 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X67.578 Y172.801 E.08922
G1 X121.164 Y238.097 E2.71623
G1 X111.909 Y245.722 E.38561
G1 X55.9 Y177.473 E2.83905
G1 X55.86 Y177.424 E.00203
M106 S229.5
G1 X65.115 Y169.799 E.38561
M106 S109.65
G1 X65.155 Y169.848 E.00203
G1 X65.78 Y170.609 E.03167
G1 X66.121 Y170.407 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X67.882 Y172.552 E.08265
G1 X121.715 Y238.151 E2.52771
G1 X111.855 Y246.275 E.38055
G1 X56.096 Y178.33 E2.61808
G1 X55.843 Y178.021 E.01191
G1 F6459.938
G1 X55.589 Y177.712 E.01191
M106 S229.5
G1 F1800
G1 X55.355 Y177.426 E.01099
M106 S109.65
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S229.5
G1 F600
G1 X55.309 Y177.37 E.00234
G1 X65.169 Y169.247 E.41083
G1 X65.215 Y169.303 E.00234
M106 S109.65
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F1800
G1 X65.45 Y169.588 E.01099
M106 S109.65
G1 F6459.938
G1 X65.703 Y169.897 E.01191
G1 F9547.055
G1 X66.083 Y170.361 E.01785
; WIPE_START
M204 S10000
G1 X67.352 Y171.907 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X65.06 Y170.369 Z10.4 F30000
G1 Z10
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.444365
G1 F8967.604
G1 X56.428 Y177.479 E.35464
G1 X56.683 Y177.79 E.01273
G1 X65.314 Y170.679 E.35464
G1 X65.098 Y170.415 E.01083
G1 X74.705 Y199.839 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.763 Y193.072 E.36497
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36497
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36497
G1 X65.614 Y170.956 E.04309
G1 X61.575 Y174.283 E.16826
G1 X99.316 Y212.024 E1.71631
G1 X101.063 Y214.152 E.08854
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X91.38 Y202.353 E.05236
G1 X108.68 Y223.434 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36497
G1 X105.652 Y237.55 E.20098
G1 X112.712 Y244.609 E.32105
G1 X111.956 Y245.232 E.03147
G1 X110.337 Y243.258 E.08209
G1 X118.362 Y235.233 E.36497
G1 X119.395 Y236.491 E.05236
; WIPE_START
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X113.293 Y229.567 Z10.4 F30000
G1 X41.227 Y140.69 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X41.507 Y141.032 E.0142
G1 X63.445 Y167.764 E1.11201
G1 X63.485 Y167.813 E.00203
M106 S229.5
G1 X54.23 Y175.437 E.38561
M106 S109.65
G1 X54.189 Y175.388 E.00203
G1 X31.31 Y147.509 E1.15974
G1 X31.27 Y147.46 E.00203
M106 S229.5
G1 X40.525 Y139.835 E.38561
M106 S109.65
G1 X40.566 Y139.884 E.00204
G1 X41.189 Y140.644 E.03161
G1 X41.53 Y140.441 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X41.81 Y140.783 E.01316
G1 X63.249 Y166.906 E1.00661
G1 X63.502 Y167.216 E.01191
G1 F6685.538
G1 X63.756 Y167.525 E.01191
M106 S229.5
G1 F1920
G1 X63.99 Y167.81 E.01099
M106 S109.65
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S229.5
G1 F600
G1 X64.036 Y167.866 E.00234
G1 X54.176 Y175.99 E.41083
G1 X54.13 Y175.933 E.00234
M106 S109.65
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F1920
G1 X53.895 Y175.648 E.01099
M106 S109.65
G1 F6685.538
G1 X53.642 Y175.339 E.01191
G1 F9547.055
G1 X53.388 Y175.03 E.01191
G1 X31.506 Y148.366 E1.02742
G1 X31.253 Y148.057 E.01191
G1 F6459.938
G1 X30.999 Y147.748 E.01191
M106 S229.5
G1 F1800
G1 X30.765 Y147.462 E.01099
M106 S109.65
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S229.5
G1 F600
G1 X30.719 Y147.406 E.00234
G1 X40.579 Y139.283 E.41083
G1 X40.626 Y139.339 E.00234
M106 S109.65
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F1920
G1 X40.86 Y139.624 E.01099
M106 S109.65
G1 F6685.538
G1 X41.113 Y139.933 E.01191
G1 F9547.055
G1 X41.492 Y140.395 E.01779
M204 S10000
G1 X40.725 Y140.715 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.444365
G1 F8967.604
G1 X40.47 Y140.405 E.01273
G1 X31.838 Y147.515 E.35464
G1 X32.093 Y147.826 E.01273
G1 X40.678 Y140.753 E.35273
G1 X34.039 Y146.746 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X58.031 Y170.738 E1.09106
G1 X53.731 Y174.281 E.17915
G1 X49.789 Y169.477 E.19983
G1 X57.814 Y161.451 E.36497
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36497
G1 X32.489 Y148.397 E.43845
G1 X34.61 Y146.276 E.09642
G1 X35.866 Y145.241 E.05236
G1 X62.917 Y167.757 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.44436
G1 F8967.716
G1 X62.662 Y167.447 E.01273
G1 X54.03 Y174.558 E.35463
G1 X54.285 Y174.868 E.01273
G1 X62.87 Y167.795 E.35273
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8967.716
G1 X61.327 Y169.067 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/75
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
M106 S124.95
G17
G3 Z10.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X38.654 Y137.554 E.15875
G1 X38.908 Y137.864 E.01286
G1 F6459.938
G1 X39.161 Y138.173 E.01286
M106 S229.5
G1 F1800
G1 X39.404 Y138.469 E.0123
M106 S124.95
; FEATURE: Overhang wall
M106 S229.5
G1 F3000
M204 S5000
G1 X40.017 Y139.215 E.03105
M106 S124.95
; FEATURE: Inner wall
M106 S229.5
G1 F1800
M204 S10000
G1 X40.259 Y139.511 E.0123
M106 S124.95
G1 F6459.938
G1 X40.513 Y139.82 E.01286
G1 F8843.478
G1 X40.767 Y140.129 E.01286
G1 X63.244 Y167.518 E1.13935
G1 X63.498 Y167.828 E.01286
G1 F6685.538
G1 X63.751 Y168.137 E.01286
M106 S229.5
G1 F1920
G1 X63.994 Y168.433 E.0123
M106 S124.95
; FEATURE: Overhang wall
M106 S229.5
G1 F3000
M204 S5000
G1 X64.607 Y169.179 E.03105
M106 S124.95
; FEATURE: Inner wall
M106 S229.5
G1 F1800
M204 S10000
G1 X64.849 Y169.475 E.0123
M106 S124.95
G1 F6459.938
G1 X65.103 Y169.784 E.01286
G1 F8843.478
G1 X65.357 Y170.093 E.01286
G1 X121.164 Y238.097 E2.82885
G1 X111.909 Y245.722 E.38561
G1 X56.101 Y177.718 E2.82885
G1 X55.847 Y177.409 E.01286
G1 F6459.938
G1 X55.594 Y177.1 E.01286
M106 S229.5
G1 F1800
G1 X55.351 Y176.804 E.0123
M106 S124.95
; FEATURE: Overhang wall
M106 S229.5
G1 F3000
M204 S5000
G1 X54.738 Y176.057 E.03105
M106 S124.95
; FEATURE: Inner wall
M106 S229.5
G1 F1920
M204 S10000
G1 X54.496 Y175.762 E.0123
M106 S124.95
G1 F6685.538
G1 X54.242 Y175.452 E.01286
G1 F8843.478
G1 X53.988 Y175.143 E.01286
G1 X31.511 Y147.754 E1.13935
G1 X31.258 Y147.445 E.01286
G1 F6459.938
G1 X31.004 Y147.135 E.01286
M106 S229.5
G1 F1800
G1 X30.761 Y146.84 E.0123
M106 S124.95
; FEATURE: Overhang wall
M106 S229.5
G1 F3000
M204 S5000
G1 X30.149 Y146.093 E.03105
M106 S124.95
; FEATURE: Inner wall
M106 S229.5
G1 F1920
M204 S10000
G1 X29.906 Y145.798 E.0123
M106 S124.95
G1 F6685.538
G1 X29.652 Y145.488 E.01286
G1 F8843.478
G1 X29.398 Y145.179 E.01286
G1 X17.515 Y130.698 E.60238
G1 X141.35 Y28.681 E5.15934
G1 X146.601 Y35.079 E.26615
G1 X153.234 Y43.162 E.33623
G1 X153.487 Y43.471 E.01286
G1 F6459.938
G1 X153.741 Y43.78 E.01286
M106 S229.5
G1 F1800
G1 X153.984 Y44.076 E.0123
M106 S124.95
; FEATURE: Overhang wall
M106 S229.5
G1 F3000
M204 S5000
G1 X154.596 Y44.823 E.03105
M106 S124.95
; FEATURE: Inner wall
M106 S229.5
G1 F1920
M204 S10000
G1 X154.839 Y45.118 E.0123
M106 S124.95
G1 F6685.538
G1 X155.093 Y45.427 E.01286
G1 F8843.478
G1 X155.347 Y45.737 E.01286
G1 X177.823 Y73.126 E1.13935
G1 X178.077 Y73.435 E.01286
G1 F6685.538
G1 X178.331 Y73.744 E.01286
M106 S229.5
G1 F1920
G1 X178.574 Y74.04 E.0123
M106 S124.95
; FEATURE: Overhang wall
M106 S229.5
G1 F3000
M204 S5000
G1 X179.186 Y74.787 E.03105
M106 S124.95
; FEATURE: Inner wall
M106 S229.5
G1 F1920
M204 S10000
G1 X179.429 Y75.082 E.0123
M106 S124.95
G1 F6685.538
G1 X179.683 Y75.391 E.01286
G1 F8843.478
G1 X179.936 Y75.701 E.01286
G1 X184.993 Y81.862 E.25632
G1 X177.435 Y88.089 E.31489
G1 X172.378 Y81.927 E.25632
G1 X172.125 Y81.618 E.01286
G1 F6685.538
G1 X171.871 Y81.309 E.01286
M106 S229.5
G1 F1920
G1 X171.628 Y81.013 E.0123
M106 S124.95
; FEATURE: Overhang wall
M106 S229.5
G1 F3000
M204 S5000
G1 X171.016 Y80.267 E.03105
M106 S124.95
; FEATURE: Inner wall
M106 S229.5
G1 F1800
M204 S10000
G1 X170.773 Y79.971 E.0123
M106 S124.95
G1 F6459.938
G1 X170.519 Y79.662 E.01286
G1 F8843.478
G1 X170.265 Y79.352 E.01286
G1 X147.789 Y51.963 E1.13935
G1 X147.535 Y51.654 E.01286
G1 F6459.938
G1 X147.281 Y51.345 E.01286
M106 S229.5
G1 F1800
G1 X147.038 Y51.049 E.0123
M106 S124.95
; FEATURE: Overhang wall
M106 S229.5
G1 F3000
M204 S5000
G1 X146.426 Y50.302 E.03105
M106 S124.95
; FEATURE: Inner wall
M106 S229.5
G1 F1800
M204 S10000
G1 X146.183 Y50.007 E.0123
M106 S124.95
G1 F6459.938
G1 X145.929 Y49.698 E.01286
G1 F8843.478
G1 X145.676 Y49.388 E.01286
G1 X142.544 Y45.572 E.15875
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X38.965 Y137.316 E.13577
G1 X39.219 Y137.625 E.01191
G1 F6459.938
G1 X39.473 Y137.934 E.01191
M106 S229.5
G1 F1800
G1 X39.707 Y138.219 E.01099
M106 S124.95
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S229.5
G1 F3000
G1 X40.319 Y138.966 E.03105
M106 S124.95
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F1920
G1 X40.553 Y139.251 E.01099
M106 S124.95
G1 F6685.538
G1 X40.807 Y139.56 E.01191
G1 F9547.055
G1 X41.061 Y139.869 E.01191
G1 X63.555 Y167.28 E1.05619
G1 X63.809 Y167.589 E.01191
G1 F6685.538
G1 X64.062 Y167.898 E.01191
M106 S229.5
G1 F1920
G1 X64.297 Y168.183 E.01099
M106 S124.95
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S229.5
G1 F3000
G1 X64.909 Y168.93 E.03105
M106 S124.95
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F1920
G1 X65.143 Y169.215 E.01099
M106 S124.95
G1 F6685.538
G1 X65.397 Y169.524 E.01191
G1 F9547.055
G1 X65.651 Y169.833 E.01191
G1 X121.715 Y238.151 E2.63246
G1 X111.855 Y246.275 E.38055
G1 X55.79 Y177.957 E2.63246
G1 X55.536 Y177.648 E.01191
G1 F6459.938
G1 X55.283 Y177.338 E.01191
M106 S229.5
G1 F1800
G1 X55.048 Y177.053 E.01099
M106 S124.95
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S229.5
G1 F3000
G1 X54.436 Y176.307 E.03105
M106 S124.95
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F1920
G1 X54.202 Y176.021 E.01099
M106 S124.95
G1 F6685.538
G1 X53.948 Y175.712 E.01191
G1 F9547.055
G1 X53.694 Y175.403 E.01191
G1 X31.2 Y147.993 E1.05619
G1 X30.946 Y147.684 E.01191
G1 F6459.938
G1 X30.693 Y147.374 E.01191
M106 S229.5
G1 F1800
G1 X30.459 Y147.089 E.01099
M106 S124.95
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S229.5
G1 F3000
G1 X29.846 Y146.343 E.03105
M106 S124.95
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F1920
G1 X29.612 Y146.057 E.01099
M106 S124.95
G1 F6685.538
G1 X29.358 Y145.748 E.01191
G1 F9547.055
G1 X29.104 Y145.439 E.01191
G1 X16.963 Y130.645 E.57007
G1 X141.404 Y28.129 E4.80247
G1 X146.904 Y34.831 E.25824
G1 X153.545 Y42.923 E.31183
G1 X153.799 Y43.232 E.01191
G1 F6459.938
G1 X154.052 Y43.542 E.01191
M106 S229.5
G1 F1800
G1 X154.286 Y43.827 E.01099
M106 S124.95
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S229.5
G1 F3000
G1 X154.899 Y44.573 E.03105
M106 S124.95
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F1920
G1 X155.133 Y44.859 E.01099
M106 S124.95
G1 F6685.538
G1 X155.387 Y45.168 E.01191
G1 F9547.055
G1 X155.641 Y45.477 E.01191
G1 X178.135 Y72.887 E1.05619
G1 X178.388 Y73.196 E.01191
G1 F6459.938
G1 X178.642 Y73.506 E.01191
M106 S229.5
G1 F1800
G1 X178.876 Y73.791 E.01099
M106 S124.95
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S229.5
G1 F3000
G1 X179.489 Y74.537 E.03105
M106 S124.95
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F1920
G1 X179.723 Y74.823 E.01099
M106 S124.95
G1 F6685.538
G1 X179.977 Y75.132 E.01191
G1 F9547.055
G1 X180.23 Y75.441 E.01191
G1 X185.544 Y81.916 E.24951
G1 X177.381 Y88.641 E.31504
G1 X172.067 Y82.166 E.24951
G1 X171.813 Y81.857 E.01191
G1 F6459.938
G1 X171.56 Y81.548 E.01191
M106 S229.5
G1 F1800
G1 X171.326 Y81.262 E.01099
M106 S124.95
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S229.5
G1 F3000
G1 X170.713 Y80.516 E.03105
M106 S124.95
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F1920
G1 X170.479 Y80.231 E.01099
M106 S124.95
G1 F6685.538
G1 X170.225 Y79.921 E.01191
G1 F9547.055
G1 X169.971 Y79.612 E.01191
G1 X147.477 Y52.202 E1.05619
G1 X147.224 Y51.893 E.01191
G1 F6459.938
G1 X146.97 Y51.584 E.01191
M106 S229.5
G1 F1800
M73 P65 R17
G1 X146.736 Y51.298 E.01099
M106 S124.95
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S229.5
G1 F3000
G1 X146.123 Y50.552 E.03105
M106 S124.95
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S229.5
G1 F1800
G1 X145.889 Y50.267 E.01099
M106 S124.95
G1 F6459.938
G1 X145.635 Y49.957 E.01191
G1 F9547.055
G1 X145.382 Y49.648 E.01191
G1 X142.49 Y46.125 E.13577
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.368 Y135.316 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-1.028 J.652 P1  F30000
G1 X40.704 Y140.579 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42041
M106 S229.5
G1 F3000
G1 X38.309 Y137.66 E.11259
G1 X38.018 Y137.9 E.01126
G1 X40.305 Y140.688 E.10753
G1 X40.014 Y140.928 E.01126
G1 X37.726 Y138.14 E.10753
G1 X37.435 Y138.38 E.01126
G1 X39.723 Y141.168 E.10754
G1 X39.431 Y141.408 E.01126
G1 X37.144 Y138.62 E.10754
G1 X36.852 Y138.86 E.01126
G1 X39.14 Y141.648 E.10754
G1 X38.849 Y141.888 E.01126
G1 X36.561 Y139.1 E.10753
G1 X36.27 Y139.34 E.01126
G1 X38.557 Y142.128 E.10754
G1 X38.266 Y142.368 E.01126
G1 X35.978 Y139.58 E.10754
G1 X35.687 Y139.82 E.01126
G1 X37.975 Y142.608 E.10753
G1 X37.683 Y142.848 E.01126
G1 X35.396 Y140.06 E.10753
G1 X35.104 Y140.3 E.01126
G1 X37.392 Y143.088 E.10753
G1 X37.101 Y143.328 E.01126
G1 X34.813 Y140.54 E.10753
G1 X34.521 Y140.78 E.01126
G1 X36.809 Y143.568 E.10754
G1 X36.518 Y143.808 E.01126
G1 X34.23 Y141.02 E.10753
G1 X33.939 Y141.26 E.01126
G1 X36.226 Y144.048 E.10753
G1 X35.935 Y144.288 E.01126
G1 X33.647 Y141.5 E.10753
G1 X33.356 Y141.74 E.01126
G1 X35.644 Y144.528 E.10753
G1 X35.352 Y144.768 E.01126
G1 X33.065 Y141.98 E.10753
G1 X32.773 Y142.22 E.01126
G1 X35.061 Y145.008 E.10753
G1 X34.77 Y145.248 E.01126
G1 X32.482 Y142.46 E.10754
G1 X32.191 Y142.7 E.01126
G1 X34.478 Y145.488 E.10753
G1 X34.187 Y145.728 E.01126
G1 X31.899 Y142.941 E.10753
G1 X31.608 Y143.181 E.01126
G1 X33.896 Y145.968 E.10753
G1 X33.604 Y146.208 E.01126
G1 X31.317 Y143.421 E.10754
G1 X31.025 Y143.661 E.01126
G1 X33.313 Y146.448 E.10753
G1 X33.022 Y146.688 E.01126
G1 X30.734 Y143.901 E.10753
G1 X30.442 Y144.141 E.01126
G1 X32.73 Y146.928 E.10753
G1 X32.439 Y147.168 E.01126
G1 X30.151 Y144.381 E.10753
G1 X29.86 Y144.621 E.01126
G1 X32.147 Y147.408 E.10753
G1 X31.856 Y147.648 E.01126
G1 X29.461 Y144.73 E.11259
M106 S124.95
; WIPE_START
G1 X30.73 Y146.276 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-.94 J.773 P1  F30000
G1 X42.172 Y160.195 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.164 Y150.911 E.36497
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36497
G1 X53.921 Y174.512 E.20946
G1 X58.244 Y170.951 E.1801
G1 X33.826 Y146.533 E1.11042
G1 X32.116 Y147.942 E.07124
G1 X32.489 Y148.397 E.01891
G1 X36.812 Y144.074 E.19659
G1 X38.069 Y143.038 E.05236
G1 X54.051 Y174.694 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.42041
M106 S229.5
G1 F3000
G1 X56.446 Y177.612 E.11259
G1 X56.737 Y177.372 E.01126
G1 X54.45 Y174.585 E.10753
G1 X54.741 Y174.345 E.01126
G1 X57.029 Y177.132 E.10753
G1 X57.32 Y176.892 E.01126
G1 X55.032 Y174.105 E.10753
G1 X55.324 Y173.865 E.01126
G1 X57.611 Y176.652 E.10753
G1 X57.903 Y176.412 E.01126
G1 X55.615 Y173.625 E.10753
G1 X55.906 Y173.385 E.01126
G1 X58.194 Y176.172 E.10753
G1 X58.485 Y175.932 E.01126
G1 X56.198 Y173.145 E.10753
G1 X56.489 Y172.905 E.01126
G1 X58.777 Y175.692 E.10753
G1 X59.068 Y175.452 E.01126
G1 X56.78 Y172.665 E.10753
G1 X57.072 Y172.424 E.01126
G1 X59.36 Y175.212 E.10753
G1 X59.651 Y174.972 E.01126
G1 X57.363 Y172.184 E.10753
G1 X57.655 Y171.944 E.01126
G1 X59.942 Y174.732 E.10753
G1 X60.234 Y174.492 E.01126
G1 X57.946 Y171.704 E.10753
G1 X58.237 Y171.464 E.01126
G1 X60.525 Y174.252 E.10753
G1 X60.816 Y174.012 E.01126
G1 X58.529 Y171.224 E.10753
G1 X58.82 Y170.984 E.01126
G1 X61.108 Y173.772 E.10753
G1 X61.399 Y173.532 E.01126
G1 X59.111 Y170.744 E.10753
G1 X59.403 Y170.504 E.01126
G1 X61.69 Y173.292 E.10753
G1 X61.982 Y173.052 E.01126
G1 X59.694 Y170.264 E.10753
G1 X59.985 Y170.024 E.01126
G1 X62.273 Y172.812 E.10753
G1 X62.564 Y172.572 E.01126
G1 X60.277 Y169.784 E.10754
G1 X60.568 Y169.544 E.01126
G1 X62.856 Y172.332 E.10753
G1 X63.147 Y172.092 E.01126
G1 X60.859 Y169.304 E.10753
G1 X61.151 Y169.064 E.01126
G1 X63.439 Y171.852 E.10753
G1 X63.73 Y171.612 E.01126
G1 X61.442 Y168.824 E.10754
G1 X61.733 Y168.584 E.01126
G1 X64.021 Y171.372 E.10754
G1 X64.313 Y171.132 E.01126
G1 X62.025 Y168.344 E.10753
G1 X62.316 Y168.104 E.01126
G1 X64.604 Y170.892 E.10753
G1 X64.895 Y170.652 E.01126
G1 X62.608 Y167.864 E.10754
G1 X62.899 Y167.624 E.01126
G1 X65.294 Y170.543 E.11259
M106 S124.95
G1 X74.705 Y199.839 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.763 Y193.072 E.36497
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36497
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.992 E.36497
G1 X65.424 Y170.724 E.05271
G1 X61.363 Y174.07 E.16921
G1 X99.316 Y212.023 E1.72597
G1 X101.063 Y214.152 E.08855
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X91.38 Y202.353 E.05236
G1 X119.395 Y236.491 F30000
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.337 Y243.258 E.36497
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03147
G1 X105.652 Y237.55 E.32105
G1 X101.687 Y232.718 E.20098
G1 X109.713 Y224.692 E.36497
G1 X108.68 Y223.434 E.05236
; WIPE_START
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X107.928 Y217.476 Z10.6 F30000
G1 X79.898 Y79.758 Z10.6
G1 Z10.2
G1 E.8 F1800
G1 F8843.478
G1 X81.154 Y78.722 E.05236
G1 X90.46 Y88.028 E.42319
G1 X79.938 Y96.696 E.43837
G1 X70.633 Y87.39 E.42319
G1 X60.111 Y96.058 E.43837
G1 X69.417 Y105.364 E.42319
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.42319
G1 X39.067 Y113.395 E.43837
G1 X48.373 Y122.7 E.42319
G1 X37.851 Y131.368 E.43837
G1 X28.545 Y122.063 E.42319
G1 X18.023 Y130.731 E.43837
G1 X30.707 Y143.415 E.57681
G1 X29.331 Y144.548 E.05733
G1 X23.839 Y137.856 E.27837
G1 X91.48 Y70.216 E3.076
G1 X91.676 Y70.054 E.00819
G1 X100.982 Y79.36 E.42319
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X152.629 Y42.974 E.33624
G1 X146.448 Y48.066 E.25752
G1 X133.764 Y35.382 E.57681
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.42319
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.42319
G1 X102.198 Y61.386 E.43837
G1 X111.504 Y70.692 E.42319
G1 X112.761 Y69.657 E.05236
; WIPE_START
G1 X111.504 Y70.692 E-.61876
G1 X111.241 Y70.429 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X117.719 Y66.393 Z10.6 F30000
G1 X145.739 Y48.938 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.42303
M106 S229.5
G1 F3000
G1 X148.134 Y51.857 E.11338
G1 X148.428 Y51.615 E.01141
G1 X146.14 Y48.827 E.10828
G1 X146.433 Y48.586 E.01141
G1 X148.721 Y51.373 E.10828
G1 X149.015 Y51.132 E.01141
G1 X146.727 Y48.344 E.10828
G1 X147.02 Y48.102 E.01141
G1 X149.308 Y50.89 E.10828
G1 X149.601 Y50.648 E.01141
G1 X147.314 Y47.86 E.10828
G1 X147.607 Y47.619 E.01141
G1 X149.895 Y50.406 E.10828
G1 X150.188 Y50.165 E.01141
G1 X147.9 Y47.377 E.10828
G1 X148.194 Y47.135 E.01141
G1 X150.481 Y49.923 E.10828
G1 X150.775 Y49.681 E.01141
G1 X148.487 Y46.894 E.10828
G1 X148.78 Y46.652 E.01141
G1 X151.068 Y49.44 E.10828
G1 X151.362 Y49.198 E.01141
G1 X149.074 Y46.41 E.10828
G1 X149.367 Y46.169 E.01141
G1 X151.655 Y48.956 E.10828
G1 X151.948 Y48.715 E.01141
G1 X149.661 Y45.927 E.10828
G1 X149.954 Y45.685 E.01141
G1 X152.242 Y48.473 E.10828
G1 X152.535 Y48.231 E.01141
G1 X150.247 Y45.444 E.10828
G1 X150.541 Y45.202 E.01141
G1 X152.828 Y47.99 E.10828
G1 X153.122 Y47.748 E.01141
G1 X150.834 Y44.96 E.10828
G1 X151.128 Y44.719 E.01141
G1 X153.415 Y47.506 E.10828
G1 X153.709 Y47.265 E.01141
G1 X151.421 Y44.477 E.10828
G1 X151.714 Y44.235 E.01141
G1 X154.002 Y47.023 E.10828
G1 X154.295 Y46.781 E.01141
G1 X152.008 Y43.993 E.10828
G1 X152.301 Y43.752 E.01141
G1 X154.589 Y46.539 E.10828
G1 X154.882 Y46.298 E.01141
G1 X152.594 Y43.51 E.10828
G1 X152.888 Y43.268 E.01141
G1 X155.283 Y46.187 E.11338
M106 S124.95
G1 X155.799 Y61.175 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.2939
G1 X171.944 Y66.511 E.43845
G1 X165.482 Y72.974 E.2939
M73 P65 R16
G1 X170.198 Y78.721 E.23908
G1 X173.984 Y75.602 E.15773
G1 X149.567 Y51.185 E1.11041
G1 X150.823 Y50.15 E.05236
G1 X170.329 Y78.902 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.42303
M106 S229.5
G1 F3000
G1 X172.724 Y81.821 E.11338
G1 X173.018 Y81.579 E.01141
G1 X170.73 Y78.791 E.10828
G1 X171.023 Y78.55 E.01141
G1 X173.311 Y81.337 E.10828
G1 X173.604 Y81.096 E.01141
G1 X171.317 Y78.308 E.10828
G1 X171.61 Y78.066 E.01141
G1 X173.898 Y80.854 E.10828
G1 X174.191 Y80.612 E.01141
G1 X171.903 Y77.825 E.10828
G1 X172.197 Y77.583 E.01141
G1 X174.484 Y80.371 E.10828
G1 X174.778 Y80.129 E.01141
G1 X172.49 Y77.341 E.10828
G1 X172.783 Y77.099 E.01141
G1 X175.071 Y79.887 E.10828
G1 X175.365 Y79.646 E.01141
G1 X173.077 Y76.858 E.10828
G1 X173.37 Y76.616 E.01141
G1 X175.658 Y79.404 E.10828
G1 X175.951 Y79.162 E.01141
G1 X173.664 Y76.374 E.10828
G1 X173.957 Y76.133 E.01141
G1 X176.245 Y78.92 E.10828
G1 X176.538 Y78.679 E.01141
G1 X174.25 Y75.891 E.10828
G1 X174.544 Y75.649 E.01141
G1 X176.831 Y78.437 E.10828
G1 X177.125 Y78.195 E.01141
G1 X174.837 Y75.408 E.10828
G1 X175.131 Y75.166 E.01141
G1 X177.418 Y77.954 E.10828
G1 X177.712 Y77.712 E.01141
G1 X175.424 Y74.924 E.10828
G1 X175.717 Y74.683 E.01141
G1 X178.005 Y77.47 E.10828
G1 X178.298 Y77.229 E.01141
G1 X176.011 Y74.441 E.10828
G1 X176.304 Y74.199 E.01141
G1 X178.592 Y76.987 E.10828
G1 X178.885 Y76.745 E.01141
G1 X176.597 Y73.958 E.10828
G1 X176.891 Y73.716 E.01141
G1 X179.179 Y76.504 E.10828
G1 X179.472 Y76.262 E.01141
G1 X177.184 Y73.474 E.10828
G1 X177.478 Y73.232 E.01141
G1 X179.873 Y76.151 E.11338
M106 S124.95
G1 X180.885 Y84.795 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X182.142 Y83.76 E.05236
G1 X177.103 Y78.721 E.22914
G1 X180.004 Y76.332 E.12085
G1 X180.594 Y77.051 E.02993
G1 X174.131 Y83.514 E.2939
G1 X175.164 Y84.773 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X174.131 Y83.514 E-.61876
G1 X174.394 Y83.251 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/75
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
M106 S178.5
G17
G3 Z10.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X146.131 Y34.507 E.24236
G1 X184.993 Y81.862 E1.96989
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X146.434 Y34.259 E.2362
G1 X185.544 Y81.916 E1.83637
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-1.174 J.319 P1  F30000
G1 X38.654 Y139.957 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42072
G1 F9528.852
G1 X38.415 Y139.665 E.01128
G1 X31.511 Y145.352 E.26693
G1 X31.751 Y145.644 E.01128
G1 X38.608 Y139.995 E.26514
G1 X39.185 Y140.008 F30000
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X38.466 Y139.133 E.03374
G1 X30.98 Y145.3 E.2889
G1 X31.699 Y146.176 E.03374
G1 X39.139 Y140.047 E.28711
G1 X39.715 Y140.06 F30000
G1 F9547.299
G1 X38.518 Y138.602 E.0562
G1 X30.45 Y145.248 E.31136
G1 X31.647 Y146.707 E.0562
G1 X39.669 Y140.098 E.30958
G1 X40.245 Y140.112 F30000
G1 F9547.299
G1 X38.57 Y138.07 E.07866
G1 X29.92 Y145.197 E.33383
G1 X31.595 Y147.238 E.07866
G1 X40.199 Y140.15 E.33204
G1 X41.425 Y141.48 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X40.528 Y140.387 E.04547
G1 X32.489 Y148.397 E.36491
G1 X31.81 Y147.569 E.03443
G1 X33.483 Y146.191 E.06971
G1 X58.587 Y171.294 E1.14161
G1 X54.227 Y174.885 E.18163
G1 X49.789 Y169.477 E.22499
G1 X57.814 Y161.451 E.36497
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36497
G1 X40.106 Y157.678 E.05236
G1 X63.004 Y169.629 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420725
G1 F9528.726
G1 X56.101 Y175.316 E.26694
G1 X56.341 Y175.608 E.01128
G1 X63.244 Y169.921 E.26694
M73 P66 R16
G1 X63.042 Y169.675 E.00948
G1 X63.056 Y169.097 F30000
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X55.57 Y175.264 E.2889
G1 X56.289 Y176.14 E.03374
G1 X63.775 Y169.972 E.2889
G1 X63.094 Y169.143 E.03195
G1 X63.108 Y168.566 F30000
G1 F9547.299
G1 X55.04 Y175.212 E.31136
G1 X56.237 Y176.671 E.0562
G1 X64.305 Y170.024 E.31136
G1 X63.146 Y168.612 E.05441
G1 X63.16 Y168.034 F30000
G1 F9547.299
G1 X54.51 Y175.161 E.33383
G1 X56.185 Y177.202 E.07866
G1 X64.835 Y170.076 E.33383
G1 X63.198 Y168.081 E.07688
G1 X74.081 Y181.273 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.114 Y182.532 E.05236
G1 X67.088 Y190.557 E.36497
G1 X75.738 Y201.097 E.43845
G1 X83.763 Y193.072 E.36497
G1 X92.413 Y203.612 E.43845
G1 X84.388 Y211.638 E.36497
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36497
G1 X99.316 Y212.024 E.08854
G1 X61.02 Y173.727 E1.74158
G1 X65.118 Y170.351 E.17074
G1 X66.464 Y171.991 E.06824
G1 X58.438 Y180.017 E.36497
G1 X59.471 Y181.276 E.05236
G1 X108.68 Y223.434 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36497
G1 X105.652 Y237.55 E.20098
G1 X112.712 Y244.609 E.32105
G1 X111.956 Y245.232 E.03147
G1 X110.337 Y243.258 E.08209
G1 X118.362 Y235.233 E.36497
G1 X119.395 Y236.491 E.05236
; WIPE_START
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X120.802 Y228.357 Z10.8 F30000
G1 X175.164 Y84.773 Z10.8
G1 Z10.4
G1 E.8 F1800
G1 F8843.478
G1 X174.131 Y83.514 E.05236
G1 X180.594 Y77.051 E.29391
G1 X179.697 Y75.959 E.04545
G1 X176.76 Y78.378 E.12238
G1 X182.142 Y83.76 E.24474
G1 X180.885 Y84.795 E.05236
G1 X172.378 Y79.525 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420725
G1 F9528.726
G1 X172.618 Y79.817 E.01128
G1 X177.824 Y75.528 E.2013
G1 X177.584 Y75.236 E.01128
G1 X172.424 Y79.487 E.19951
G1 X171.847 Y79.473 F30000
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X172.566 Y80.349 E.03374
G1 X178.355 Y75.58 E.22339
G1 X177.636 Y74.704 E.03374
G1 X171.894 Y79.435 E.22161
G1 X171.317 Y79.421 F30000
G1 F9547.299
G1 X172.514 Y80.88 E.0562
G1 X178.885 Y75.632 E.24586
G1 X177.688 Y74.173 E.0562
G1 X171.363 Y79.383 E.24407
G1 X170.787 Y79.37 F30000
G1 F9547.299
G1 X172.462 Y81.411 E.07866
G1 X179.415 Y75.683 E.26832
G1 X177.74 Y73.642 E.07866
G1 X170.833 Y79.332 E.26653
G1 X149.215 Y53.152 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X148.182 Y51.894 E.05236
G1 X149.282 Y50.794 E.05001
G1 X149.224 Y50.842 E.00242
G1 X174.327 Y75.945 E1.14161
G1 X170.504 Y79.095 E.15926
G1 X165.482 Y72.974 E.2546
G1 X171.944 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
G1 X148.028 Y49.853 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42072
G1 F9528.852
G1 X153.234 Y45.564 E.2013
G1 X152.994 Y45.272 E.01128
G1 X147.788 Y49.561 E.2013
G1 X147.99 Y49.807 E.00948
G1 X147.976 Y50.385 F30000
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X153.765 Y45.616 E.22339
G1 X153.046 Y44.74 E.03374
G1 X147.257 Y49.509 E.22339
G1 X147.938 Y50.338 E.03195
G1 X147.924 Y50.916 F30000
G1 F9547.299
G1 X154.295 Y45.668 E.24586
G1 X153.098 Y44.209 E.0562
G1 X146.727 Y49.457 E.24586
G1 X147.886 Y50.87 E.05441
G1 X147.872 Y51.447 F30000
G1 F9547.299
G1 X154.825 Y45.719 E.26832
G1 X153.15 Y43.678 E.07866
G1 X146.197 Y49.406 E.26832
G1 X147.834 Y51.401 E.07688
; WIPE_START
G1 X146.566 Y49.855 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.15 Y51.66 Z10.8 F30000
G1 X103.455 Y60.351 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X102.198 Y61.386 E.05236
G1 X111.504 Y70.692 E.42319
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.42319
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.42319
G1 X142.592 Y45.081 E.41846
G1 X145.915 Y49.131 E.16843
G1 X146.791 Y48.409 E.0365
G1 X133.764 Y35.382 E.59241
G1 X141.302 Y29.172 E.31407
G1 X145.995 Y34.891 E.23789
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X91.676 Y70.054 E.42319
G1 X91.48 Y70.216 E.00819
G1 X23.839 Y137.856 E3.076
G1 X29.637 Y144.921 E.29389
G1 X31.05 Y143.758 E.05886
G1 X18.023 Y130.731 E.59241
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.395 E.42319
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.42319
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.42319
G1 X70.633 Y87.39 E.43837
G1 X79.938 Y96.696 E.42319
G1 X90.46 Y88.028 E.43837
G1 X81.154 Y78.722 E.42319
G1 X79.898 Y79.758 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8843.478
G1 X81.154 Y78.722 E-.61876
G1 X81.417 Y78.985 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/75
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
M106 S186.15
G17
G3 Z10.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X145.662 Y33.935 E.21856
G1 X184.993 Y81.862 E1.99369
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X145.965 Y33.687 E.21416
G1 X185.544 Y81.916 E1.85842
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X39.784 Y139.549 Z11 F30000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X39.032 Y138.633 E.03529
G1 X30.382 Y145.759 E.33383
G1 X31.133 Y146.675 E.03529
G1 X39.737 Y139.587 E.33204
G1 X39.234 Y139.495 F30000
; LINE_WIDTH: 0.446815
G1 F8913.208
G1 X38.978 Y139.183 E.01289
G1 X30.931 Y145.813 E.33266
G1 X31.187 Y146.125 E.01289
G1 X39.188 Y139.534 E.33074
G1 X58.847 Y162.71 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X57.814 Y161.451 E.05236
G1 X49.789 Y169.477 E.36497
G1 X54.689 Y175.448 E.2484
G1 X59.104 Y171.811 E.18393
G1 X32.966 Y145.673 E1.18865
G1 X31.348 Y147.006 E.0674
G1 X32.489 Y148.397 E.05784
G1 X40.515 Y140.371 E.36497
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36497
G1 X40.106 Y157.678 E.05236
G1 X63.622 Y168.597 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X54.971 Y175.723 E.33383
G1 X55.723 Y176.639 E.03529
G1 X64.373 Y169.513 E.33383
G1 X63.66 Y168.644 E.03351
G1 X63.568 Y169.147 F30000
; LINE_WIDTH: 0.446815
G1 F8913.208
G1 X55.521 Y175.777 E.33266
G1 X55.777 Y176.089 E.01289
G1 X63.824 Y169.46 E.33266
G1 X63.606 Y169.194 E.01097
G1 X76.771 Y202.356 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.763 Y193.072 E.36497
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36497
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36497
G1 X64.656 Y169.788 E.09165
G1 X60.502 Y173.21 E.17305
G1 X99.316 Y212.024 E1.7651
G1 X101.063 Y214.152 E.08854
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X91.38 Y202.353 E.05236
G1 X119.395 Y236.491 F30000
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.337 Y243.258 E.36497
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03147
G1 X105.652 Y237.55 E.32105
G1 X101.687 Y232.718 E.20098
G1 X109.713 Y224.692 E.36497
G1 X108.68 Y223.434 E.05236
; WIPE_START
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X112.916 Y218.155 Z11 F30000
G1 X180.885 Y84.795 Z11
G1 Z10.6
G1 E.8 F1800
G1 F8843.478
G1 X182.142 Y83.76 E.05236
G1 X176.243 Y77.861 E.26826
G1 X179.236 Y75.396 E.12469
G1 X180.594 Y77.051 E.06887
G1 X174.131 Y83.514 E.29391
G1 X175.164 Y84.773 E.05236
G1 X171.249 Y79.932 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X172 Y80.848 E.03529
G1 X178.953 Y75.121 E.26832
G1 X178.201 Y74.205 E.03529
G1 X171.295 Y79.894 E.26653
G1 X171.798 Y79.986 F30000
; LINE_WIDTH: 0.44682
G1 F8913.097
G1 X172.054 Y80.298 E.01289
G1 X178.404 Y75.067 E.26249
G1 X178.148 Y74.755 E.01289
G1 X171.844 Y79.948 E.26058
G1 X155.67 Y46.68 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X154.646 Y45.432 E.05193
G1 X148.182 Y51.894 E.2939
G1 X147.625 Y51.215 E.02822
G1 X148.706 Y50.325 E.04504
G1 X174.844 Y76.463 E1.18865
G1 X177.987 Y73.874 E.13092
G1 X171.944 Y66.511 E.30628
G1 X165.482 Y72.974 E.29391
G1 X156.832 Y62.434 E.43845
G1 X163.295 Y55.971 E.29391
G1 X162.262 Y54.712 E.05236
G1 X147.411 Y50.884 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X154.363 Y45.157 E.26832
G1 X153.612 Y44.241 E.03529
G1 X146.659 Y49.968 E.26832
G1 X147.372 Y50.838 E.03351
G1 X147.464 Y50.334 F30000
; LINE_WIDTH: 0.44681
G1 F8913.318
G1 X153.814 Y45.103 E.26249
G1 X153.558 Y44.791 E.01289
G1 X147.208 Y50.022 E.26249
G1 X147.426 Y50.288 E.01097
G1 X146.109 Y49.367 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X146.376 Y49.693 E.01356
G1 X147.308 Y48.926 E.0388
G1 X133.764 Y35.382 E.61593
G1 X141.302 Y29.172 E.31407
G1 X145.995 Y34.891 E.23789
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X91.676 Y70.054 E.42319
G1 X23.839 Y137.856 E3.08416
G1 X30.099 Y145.484 E.3173
G1 X31.567 Y144.275 E.06117
G1 X18.023 Y130.731 E.61593
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
G1 X48.373 Y122.7 E.43837
G1 X39.067 Y113.395 E.42319
G1 X49.589 Y104.726 E.43837
G1 X58.895 Y114.032 E.42319
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.42319
G1 X70.633 Y87.39 E.43837
G1 X79.938 Y96.696 E.42319
G1 X90.46 Y88.028 E.43837
G1 X81.154 Y78.722 E.42319
G1 X79.898 Y79.758 E.05236
G1 X133.804 Y52.321 F30000
G1 F8843.478
G1 X132.548 Y53.356 E.05236
G1 X123.242 Y44.05 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X111.504 Y70.692 E.43837
G1 X102.198 Y61.386 E.42319
G1 X103.455 Y60.351 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
M73 P67 R16
G1 X102.198 Y61.386 E-.61876
G1 X102.461 Y61.649 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/75
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
M106 S193.8
G17
G3 Z11 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X145.192 Y33.363 E.19477
G1 X184.993 Y81.862 E2.01748
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X145.495 Y33.114 E.19211
G1 X185.544 Y81.916 E1.88046
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.097 Y133.044 Z11.2 F30000
G1 X19.28 Y129.695 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X99.316 Y212.024 E3.69688
G1 X101.063 Y214.152 E.08854
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X83.763 Y193.072 E.43845
G1 X75.738 Y201.097 E.36497
G1 X67.088 Y190.557 E.43845
G1 X75.114 Y182.532 E.36497
G1 X66.464 Y171.991 E.43845
G1 X58.438 Y180.017 E.36497
G1 X49.789 Y169.477 E.43845
G1 X57.814 Y161.451 E.36497
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36497
G1 X42.172 Y160.195 E.05236
; WIPE_START
G1 X41.139 Y158.937 E-.61876
G1 X41.402 Y158.674 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X43.058 Y151.223 Z11.2 F30000
G1 X49.63 Y121.665 Z11.2
G1 Z10.8
G1 E.8 F1800
G1 F8843.478
G1 X48.373 Y122.7 E.05236
G1 X39.067 Y113.395 E.42319
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
G1 X35.032 Y133.69 E.11743
G1 X40.515 Y140.371 E.2779
G1 X32.489 Y148.397 E.36497
G1 X23.839 Y137.856 E.43845
G1 X91.676 Y70.054 E3.08416
G1 X100.982 Y79.36 E.42319
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X141.302 Y29.172 E.23789
G1 X133.764 Y35.382 E.31407
G1 X182.142 Y83.76 E2.20004
G1 X184.503 Y81.815 E.09839
G1 X180.594 Y77.051 E.19815
G1 X174.131 Y83.514 E.29391
G1 X165.482 Y72.974 E.43845
G1 X171.944 Y66.511 E.29391
G1 X170.911 Y65.252 E.05236
G1 X155.799 Y61.175 F30000
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X154.645 Y45.431 E.43845
G1 X148.182 Y51.894 E.29391
G1 X147.149 Y50.635 E.05236
; WIPE_START
G1 X148.182 Y51.894 E-.61876
G1 X148.445 Y51.631 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X140.952 Y53.083 Z11.2 F30000
G1 X103.455 Y60.351 Z11.2
G1 Z10.8
G1 E.8 F1800
G1 F8843.478
M73 P67 R15
G1 X102.198 Y61.386 E.05236
G1 X111.504 Y70.692 E.42319
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.42319
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.42319
G1 X133.804 Y52.321 E.05236
G1 X91.717 Y86.993 F30000
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.154 Y78.722 E.42319
G1 X70.633 Y87.39 E.43837
G1 X79.938 Y96.696 E.42319
G1 X78.682 Y97.732 E.05236
G1 X48.332 Y105.762 F30000
G1 F8843.478
G1 X49.589 Y104.726 E.05236
G1 X58.895 Y114.032 E.42319
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.42319
G1 X61.367 Y95.023 E.05236
; WIPE_START
G1 X60.111 Y96.058 E-.61876
G1 X60.373 Y96.321 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X63.085 Y103.456 Z11.2 F30000
G1 X108.68 Y223.434 Z11.2
G1 Z10.8
G1 E.8 F1800
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36497
G1 X105.652 Y237.55 E.20098
G1 X112.712 Y244.609 E.32105
G1 X111.956 Y245.232 E.03147
G1 X110.337 Y243.258 E.08209
G1 X118.362 Y235.233 E.36497
G1 X119.395 Y236.491 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/75
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
M106 S191.25
G17
G3 Z11.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X144.723 Y32.791 E.17097
G1 X184.993 Y81.862 E2.04128
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X145.026 Y32.542 E.17007
G1 X185.544 Y81.916 E1.9025
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.097 Y133.044 Z11.4 F30000
G1 X19.28 Y129.695 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X99.316 Y212.024 E3.69688
G1 X101.063 Y214.152 E.08854
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X91.38 Y202.353 E.05236
G1 X66.055 Y189.299 F30000
G1 F8843.478
G1 X67.088 Y190.557 E.05236
G1 X75.114 Y182.532 E.36497
G1 X83.763 Y193.072 E.43845
G1 X75.738 Y201.097 E.36497
G1 X76.771 Y202.356 E.05236
G1 X42.172 Y160.195 F30000
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36497
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36497
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36497
G1 X67.497 Y173.25 E.05236
; WIPE_START
G1 X66.464 Y171.991 E-.61876
G1 X66.201 Y172.254 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X67.462 Y164.727 Z11.4 F30000
G1 X78.682 Y97.732 Z11.4
G1 Z11
G1 E.8 F1800
G1 F8843.478
G1 X79.938 Y96.696 E.05236
G1 X70.633 Y87.39 E.42319
G1 X81.154 Y78.722 E.43837
G1 X90.46 Y88.028 E.42319
G1 X91.717 Y86.993 E.05236
G1 X61.367 Y95.023 F30000
M73 P68 R15
G1 F8843.478
G1 X60.111 Y96.058 E.05236
G1 X69.417 Y105.364 E.42319
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.42319
G1 X48.332 Y105.762 E.05236
G1 X133.804 Y52.321 F30000
G1 F8843.478
G1 X132.548 Y53.356 E.05236
G1 X123.242 Y44.05 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X111.504 Y70.692 E.43837
G1 X102.198 Y61.386 E.42319
G1 X103.455 Y60.351 E.05236
; WIPE_START
G1 X102.198 Y61.386 E-.61876
G1 X102.461 Y61.649 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X109.872 Y59.823 Z11.4 F30000
G1 X147.149 Y50.635 Z11.4
G1 Z11
G1 E.8 F1800
G1 F8843.478
G1 X148.182 Y51.894 E.05236
G1 X154.645 Y45.431 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
G1 X170.911 Y65.252 F30000
G1 F8843.478
G1 X171.944 Y66.511 E.05236
G1 X165.482 Y72.974 E.29391
G1 X174.131 Y83.514 E.43845
G1 X180.594 Y77.051 E.29391
G1 X184.503 Y81.815 E.19815
G1 X182.142 Y83.76 E.09839
G1 X133.764 Y35.382 E2.20004
G1 X141.302 Y29.172 E.31407
G1 X145.995 Y34.891 E.23789
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X91.676 Y70.054 E.42319
G1 X23.839 Y137.856 E3.08416
G1 X32.489 Y148.397 E.43845
G1 X40.515 Y140.371 E.36497
G1 X35.032 Y133.69 E.2779
G1 X37.851 Y131.368 E.11743
G1 X28.545 Y122.063 E.42319
G1 X39.067 Y113.395 E.43837
G1 X48.373 Y122.7 E.42319
G1 X49.63 Y121.665 E.05236
; WIPE_START
G1 X48.373 Y122.7 E-.61876
G1 X48.11 Y122.438 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X52.155 Y128.91 Z11.4 F30000
G1 X119.395 Y236.491 Z11.4
G1 Z11
G1 E.8 F1800
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.337 Y243.258 E.36497
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03147
G1 X105.652 Y237.55 E.32105
G1 X101.687 Y232.718 E.20098
G1 X109.713 Y224.692 E.36497
G1 X108.68 Y223.434 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/75
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
M106 S193.8
G17
G3 Z11.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X144.253 Y32.219 E.14717
G1 X184.993 Y81.862 E2.06507
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X144.556 Y31.97 E.14803
G1 X185.544 Y81.916 E1.92454
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.487 Y129.621 Z11.6 F30000
G1 X49.63 Y121.665 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X48.373 Y122.7 E.05236
G1 X39.067 Y113.395 E.42319
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
G1 X35.032 Y133.69 E.11743
G1 X40.515 Y140.371 E.2779
G1 X32.489 Y148.397 E.36497
G1 X23.839 Y137.856 E.43845
G1 X91.676 Y70.054 E3.08416
G1 X100.982 Y79.36 E.42319
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X141.302 Y29.172 E.23789
G1 X133.764 Y35.382 E.31407
G1 X182.142 Y83.76 E2.20004
G1 X184.503 Y81.815 E.09839
G1 X180.594 Y77.051 E.19815
G1 X174.131 Y83.514 E.29391
G1 X165.482 Y72.974 E.43845
G1 X171.944 Y66.511 E.29391
G1 X170.911 Y65.252 E.05236
G1 X155.799 Y61.175 F30000
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X154.645 Y45.431 E.43845
G1 X148.182 Y51.894 E.29391
G1 X147.149 Y50.635 E.05236
; WIPE_START
G1 X148.182 Y51.894 E-.61876
G1 X148.445 Y51.631 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X140.952 Y53.083 Z11.6 F30000
G1 X103.455 Y60.351 Z11.6
G1 Z11.2
G1 E.8 F1800
G1 F8843.478
G1 X102.198 Y61.386 E.05236
G1 X111.504 Y70.692 E.42319
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.42319
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.42319
G1 X133.804 Y52.321 E.05236
G1 X91.717 Y86.993 F30000
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.154 Y78.722 E.42319
G1 X70.633 Y87.39 E.43837
G1 X79.938 Y96.696 E.42319
G1 X78.682 Y97.732 E.05236
G1 X48.332 Y105.762 F30000
G1 F8843.478
G1 X49.589 Y104.726 E.05236
G1 X58.895 Y114.032 E.42319
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.42319
G1 X61.367 Y95.023 E.05236
; WIPE_START
G1 X60.111 Y96.058 E-.61876
G1 X60.373 Y96.321 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X61.077 Y103.921 Z11.6 F30000
G1 X67.497 Y173.25 Z11.6
G1 Z11.2
G1 E.8 F1800
G1 F8843.478
G1 X66.464 Y171.991 E.05236
G1 X58.438 Y180.017 E.36497
G1 X49.789 Y169.477 E.43845
G1 X57.814 Y161.451 E.36497
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36497
G1 X42.172 Y160.195 E.05236
G1 X76.771 Y202.356 F30000
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.763 Y193.072 E.36497
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36497
G1 X66.055 Y189.299 E.05236
G1 X91.38 Y202.353 F30000
G1 F8843.478
G1 X92.413 Y203.612 E.05236
G1 X84.388 Y211.638 E.36497
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36497
G1 X99.316 Y212.024 E.08854
G1 X18.023 Y130.731 E3.69688
G1 X19.28 Y129.695 E.05236
G1 X108.68 Y223.434 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36497
G1 X105.652 Y237.55 E.20098
G1 X112.712 Y244.609 E.32105
G1 X111.956 Y245.232 E.03147
G1 X110.337 Y243.258 E.08209
G1 X118.362 Y235.233 E.36497
G1 X119.395 Y236.491 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/75
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
M106 S191.25
G17
G3 Z11.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X143.784 Y31.647 E.12338
G1 X184.993 Y81.862 E2.08887
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X144.087 Y31.398 E.12599
G1 X185.544 Y81.916 E1.94659
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.097 Y133.044 Z11.8 F30000
G1 X19.28 Y129.695 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P69 R15
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X99.316 Y212.024 E3.69688
G1 X101.063 Y214.152 E.08854
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X91.38 Y202.353 E.05236
G1 X66.055 Y189.299 F30000
G1 F8843.478
G1 X67.088 Y190.557 E.05236
G1 X75.114 Y182.532 E.36497
G1 X83.763 Y193.072 E.43845
G1 X75.738 Y201.097 E.36497
G1 X76.771 Y202.356 E.05236
G1 X42.172 Y160.195 F30000
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36497
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36497
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36497
G1 X67.497 Y173.25 E.05236
; WIPE_START
G1 X66.464 Y171.991 E-.61876
G1 X66.201 Y172.254 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X67.462 Y164.727 Z11.8 F30000
G1 X78.682 Y97.732 Z11.8
G1 Z11.4
G1 E.8 F1800
G1 F8843.478
G1 X79.938 Y96.696 E.05236
G1 X70.633 Y87.39 E.42319
G1 X81.154 Y78.722 E.43837
G1 X90.46 Y88.028 E.42319
G1 X91.717 Y86.993 E.05236
G1 X61.367 Y95.023 F30000
G1 F8843.478
G1 X60.111 Y96.058 E.05236
G1 X69.417 Y105.364 E.42319
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.42319
G1 X48.332 Y105.762 E.05236
G1 X133.804 Y52.321 F30000
G1 F8843.478
G1 X132.548 Y53.356 E.05236
G1 X123.242 Y44.05 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X111.504 Y70.692 E.43837
G1 X102.198 Y61.386 E.42319
G1 X103.455 Y60.351 E.05236
; WIPE_START
G1 X102.198 Y61.386 E-.61876
G1 X102.461 Y61.649 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X109.872 Y59.823 Z11.8 F30000
G1 X147.149 Y50.635 Z11.8
G1 Z11.4
G1 E.8 F1800
G1 F8843.478
G1 X148.182 Y51.894 E.05236
G1 X154.645 Y45.431 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
G1 X170.911 Y65.252 F30000
G1 F8843.478
G1 X171.944 Y66.511 E.05236
G1 X165.482 Y72.974 E.29391
G1 X174.131 Y83.514 E.43845
G1 X180.594 Y77.051 E.29391
G1 X184.503 Y81.815 E.19815
G1 X182.142 Y83.76 E.09839
G1 X133.764 Y35.382 E2.20004
G1 X141.302 Y29.172 E.31407
G1 X145.995 Y34.891 E.23789
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X91.676 Y70.054 E.42319
G1 X23.839 Y137.856 E3.08416
G1 X32.489 Y148.397 E.43845
G1 X40.515 Y140.371 E.36497
G1 X35.032 Y133.69 E.2779
G1 X37.851 Y131.368 E.11743
G1 X28.545 Y122.063 E.42319
G1 X39.067 Y113.395 E.43837
G1 X48.373 Y122.7 E.42319
G1 X49.63 Y121.665 E.05236
; WIPE_START
G1 X48.373 Y122.7 E-.61876
G1 X48.11 Y122.438 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X52.155 Y128.91 Z11.8 F30000
G1 X119.395 Y236.491 Z11.8
G1 Z11.4
G1 E.8 F1800
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.337 Y243.258 E.36497
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03147
G1 X105.652 Y237.55 E.32105
G1 X101.687 Y232.718 E.20098
G1 X109.713 Y224.692 E.36497
G1 X108.68 Y223.434 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8843.478
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/75
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
M106 S193.8
G17
G3 Z11.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X143.315 Y31.075 E.09958
G1 X184.993 Y81.862 E2.11266
M73 P69 R14
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X143.618 Y30.826 E.10394
G1 X185.544 Y81.916 E1.96863
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.487 Y129.621 Z12 F30000
G1 X49.63 Y121.665 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X48.373 Y122.7 E.05236
G1 X39.067 Y113.395 E.42319
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
G1 X35.032 Y133.69 E.11743
G1 X40.515 Y140.371 E.2779
G1 X32.489 Y148.397 E.36497
G1 X23.839 Y137.856 E.43845
G1 X91.676 Y70.054 E3.08416
G1 X100.982 Y79.36 E.42319
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X141.302 Y29.172 E.23789
G1 X133.764 Y35.382 E.31407
G1 X182.142 Y83.76 E2.20004
G1 X184.503 Y81.815 E.09839
G1 X180.594 Y77.051 E.19815
G1 X174.131 Y83.514 E.29391
G1 X165.482 Y72.974 E.43845
G1 X171.944 Y66.511 E.29391
G1 X170.911 Y65.252 E.05236
G1 X155.799 Y61.175 F30000
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X154.645 Y45.431 E.43845
G1 X148.182 Y51.894 E.29391
G1 X147.149 Y50.635 E.05236
; WIPE_START
G1 X148.182 Y51.894 E-.61876
G1 X148.445 Y51.631 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X140.952 Y53.083 Z12 F30000
G1 X103.455 Y60.351 Z12
G1 Z11.6
G1 E.8 F1800
G1 F8843.478
G1 X102.198 Y61.386 E.05236
G1 X111.504 Y70.692 E.42319
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.42319
M73 P70 R14
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.42319
G1 X133.804 Y52.321 E.05236
G1 X91.717 Y86.993 F30000
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.154 Y78.722 E.42319
G1 X70.633 Y87.39 E.43837
G1 X79.938 Y96.696 E.42319
G1 X78.682 Y97.732 E.05236
G1 X48.332 Y105.762 F30000
G1 F8843.478
G1 X49.589 Y104.726 E.05236
G1 X58.895 Y114.032 E.42319
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.42319
G1 X61.367 Y95.023 E.05236
; WIPE_START
G1 X60.111 Y96.058 E-.61876
G1 X60.373 Y96.321 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X61.077 Y103.921 Z12 F30000
G1 X67.497 Y173.25 Z12
G1 Z11.6
G1 E.8 F1800
G1 F8843.478
G1 X66.464 Y171.991 E.05236
G1 X58.438 Y180.017 E.36497
G1 X49.789 Y169.477 E.43845
G1 X57.814 Y161.451 E.36497
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36497
G1 X42.172 Y160.195 E.05236
G1 X76.771 Y202.356 F30000
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.763 Y193.072 E.36497
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36497
G1 X66.055 Y189.299 E.05236
G1 X91.38 Y202.353 F30000
G1 F8843.478
G1 X92.413 Y203.612 E.05236
G1 X84.388 Y211.638 E.36497
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36497
G1 X99.316 Y212.024 E.08854
G1 X18.023 Y130.731 E3.69688
G1 X19.28 Y129.695 E.05236
G1 X108.68 Y223.434 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36497
G1 X105.652 Y237.55 E.20098
G1 X112.712 Y244.609 E.32105
G1 X111.956 Y245.232 E.03147
G1 X110.337 Y243.258 E.08209
G1 X118.362 Y235.233 E.36497
G1 X119.395 Y236.491 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/75
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
G17
G3 Z12 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X142.845 Y30.503 E.07579
G1 X184.993 Y81.862 E2.13646
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X143.148 Y30.254 E.0819
G1 X185.544 Y81.916 E1.99067
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X38.828 Y142.796 Z12.2 F30000
G1 X42.172 Y160.195 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36497
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36497
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36497
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36497
G1 X75.738 Y201.097 E.43845
G1 X83.763 Y193.072 E.36497
G1 X92.413 Y203.612 E.43845
G1 X84.388 Y211.638 E.36497
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36497
G1 X99.316 Y212.024 E.08854
G1 X18.023 Y130.731 E3.69688
G1 X19.28 Y129.695 E.05236
G1 X61.367 Y95.023 F30000
G1 F8843.478
G1 X60.111 Y96.058 E.05236
G1 X69.417 Y105.364 E.42319
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.42319
G1 X48.332 Y105.762 E.05236
G1 X78.682 Y97.732 F30000
G1 F8843.478
G1 X79.938 Y96.696 E.05236
G1 X70.633 Y87.39 E.42319
G1 X81.154 Y78.722 E.43837
G1 X90.46 Y88.028 E.42319
G1 X91.717 Y86.993 E.05236
G1 X133.804 Y52.321 F30000
G1 F8843.478
G1 X132.548 Y53.356 E.05236
G1 X123.242 Y44.05 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X111.504 Y70.692 E.43837
G1 X102.198 Y61.386 E.42319
G1 X103.455 Y60.351 E.05236
; WIPE_START
G1 X102.198 Y61.386 E-.61876
G1 X102.461 Y61.649 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X109.872 Y59.823 Z12.2 F30000
G1 X147.149 Y50.635 Z12.2
G1 Z11.8
G1 E.8 F1800
G1 F8843.478
G1 X148.182 Y51.894 E.05236
G1 X154.645 Y45.431 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
G1 X170.911 Y65.252 F30000
G1 F8843.478
G1 X171.944 Y66.511 E.05236
G1 X165.482 Y72.974 E.29391
G1 X174.131 Y83.514 E.43845
G1 X180.594 Y77.051 E.29391
G1 X184.503 Y81.815 E.19815
G1 X182.142 Y83.76 E.09839
G1 X133.764 Y35.382 E2.20004
G1 X141.302 Y29.172 E.31407
G1 X145.995 Y34.891 E.23789
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X91.676 Y70.054 E.42319
G1 X23.839 Y137.856 E3.08416
G1 X32.489 Y148.397 E.43845
G1 X40.515 Y140.371 E.36497
G1 X35.032 Y133.69 E.2779
G1 X37.851 Y131.368 E.11743
G1 X28.545 Y122.063 E.42319
G1 X39.067 Y113.395 E.43837
G1 X48.373 Y122.7 E.42319
G1 X49.63 Y121.665 E.05236
; WIPE_START
G1 X48.373 Y122.7 E-.61876
G1 X48.11 Y122.438 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X52.155 Y128.91 Z12.2 F30000
G1 X119.395 Y236.491 Z12.2
G1 Z11.8
G1 E.8 F1800
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.337 Y243.258 E.36497
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03147
G1 X105.652 Y237.55 E.32105
G1 X101.687 Y232.718 E.20098
G1 X109.713 Y224.692 E.36497
G1 X108.68 Y223.434 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/75
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
G17
G3 Z12.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X142.376 Y29.931 E.05199
G1 X184.993 Y81.862 E2.16026
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X142.679 Y29.682 E.05986
G1 X185.544 Y81.916 E2.01271
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.097 Y133.044 Z12.4 F30000
G1 X19.28 Y129.695 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X99.316 Y212.024 E3.69688
G1 X101.063 Y214.152 E.08854
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X83.763 Y193.072 E.43845
G1 X75.738 Y201.097 E.36497
G1 X67.088 Y190.557 E.43845
G1 X75.114 Y182.532 E.36497
G1 X66.464 Y171.991 E.43845
G1 X58.438 Y180.017 E.36497
G1 X49.789 Y169.477 E.43845
G1 X57.814 Y161.451 E.36497
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36497
G1 X42.172 Y160.195 E.05236
; WIPE_START
G1 X41.139 Y158.937 E-.61876
G1 X41.402 Y158.674 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X43.058 Y151.223 Z12.4 F30000
G1 X49.63 Y121.665 Z12.4
G1 Z12
G1 E.8 F1800
M73 P71 R14
G1 F8843.478
G1 X48.373 Y122.7 E.05236
G1 X39.067 Y113.395 E.42319
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
G1 X35.032 Y133.69 E.11743
G1 X40.515 Y140.371 E.2779
G1 X32.489 Y148.397 E.36497
G1 X23.839 Y137.856 E.43845
G1 X91.676 Y70.054 E3.08416
G1 X100.982 Y79.36 E.42319
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X141.302 Y29.172 E.23789
G1 X133.764 Y35.382 E.31407
G1 X182.142 Y83.76 E2.20004
G1 X184.503 Y81.815 E.09839
G1 X180.594 Y77.051 E.19815
G1 X174.131 Y83.514 E.29391
G1 X165.482 Y72.974 E.43845
G1 X171.944 Y66.511 E.29391
G1 X172.977 Y67.77 E.05236
G1 X155.799 Y61.175 F30000
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X154.645 Y45.431 E.43845
G1 X148.182 Y51.894 E.29391
G1 X147.149 Y50.635 E.05236
; WIPE_START
G1 X148.182 Y51.894 E-.61876
G1 X148.445 Y51.631 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X140.952 Y53.083 Z12.4 F30000
G1 X103.455 Y60.351 Z12.4
G1 Z12
G1 E.8 F1800
G1 F8843.478
G1 X102.198 Y61.386 E.05236
G1 X111.504 Y70.692 E.42319
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.42319
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.42319
G1 X133.804 Y52.321 E.05236
G1 X91.717 Y86.993 F30000
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.154 Y78.722 E.42319
G1 X70.633 Y87.39 E.43837
G1 X79.938 Y96.696 E.42319
G1 X78.682 Y97.732 E.05236
G1 X48.332 Y105.762 F30000
G1 F8843.478
G1 X49.589 Y104.726 E.05236
G1 X58.895 Y114.032 E.42319
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.42319
G1 X61.367 Y95.023 E.05236
; WIPE_START
G1 X60.111 Y96.058 E-.61876
G1 X60.373 Y96.321 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X63.085 Y103.456 Z12.4 F30000
G1 X108.68 Y223.434 Z12.4
G1 Z12
G1 E.8 F1800
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36497
G1 X105.652 Y237.55 E.20098
G1 X112.712 Y244.609 E.32105
G1 X111.956 Y245.232 E.03147
G1 X110.337 Y243.258 E.08209
G1 X118.362 Y235.233 E.36497
G1 X119.395 Y236.491 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/75
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
G17
G3 Z12.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X141.906 Y29.359 E.02819
G1 X184.993 Y81.862 E2.18405
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X142.209 Y29.11 E.03782
G1 X185.544 Y81.916 E2.03475
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.097 Y133.044 Z12.6 F30000
G1 X19.28 Y129.695 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X99.316 Y212.024 E3.69688
G1 X101.063 Y214.152 E.08854
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X91.38 Y202.353 E.05236
G1 X66.055 Y189.299 F30000
G1 F8843.478
G1 X67.088 Y190.557 E.05236
G1 X75.114 Y182.532 E.36497
G1 X83.763 Y193.072 E.43845
G1 X75.738 Y201.097 E.36497
G1 X76.771 Y202.356 E.05236
G1 X42.172 Y160.195 F30000
G1 F8843.478
G1 X41.139 Y158.937 E.05236
G1 X49.165 Y150.911 E.36497
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36497
M73 P71 R13
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36497
G1 X67.497 Y173.25 E.05236
G1 X119.395 Y236.491 F30000
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.337 Y243.258 E.36497
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03147
G1 X105.652 Y237.55 E.32105
G1 X101.687 Y232.718 E.20098
G1 X109.713 Y224.692 E.36497
G1 X108.68 Y223.434 E.05236
; WIPE_START
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X109.613 Y217.324 Z12.6 F30000
G1 X112.761 Y69.657 Z12.6
G1 Z12.2
G1 E.8 F1800
G1 F8843.478
G1 X111.504 Y70.692 E.05236
G1 X102.198 Y61.386 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X132.548 Y53.356 E.43837
G1 X123.242 Y44.05 E.42319
G1 X133.764 Y35.382 E.43837
G1 X182.142 Y83.76 E2.20004
G1 X184.503 Y81.815 E.09839
G1 X180.594 Y77.051 E.19815
G1 X174.131 Y83.514 E.29391
G1 X165.482 Y72.974 E.43845
G1 X171.944 Y66.511 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
M73 P72 R13
G1 X148.182 Y51.894 E.43845
G1 X154.645 Y45.431 E.29391
G1 X145.995 Y34.891 E.43845
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X91.676 Y70.054 E.42319
G1 X91.48 Y70.216 E.00819
G1 X23.839 Y137.856 E3.076
G1 X32.489 Y148.397 E.43845
G1 X40.515 Y140.371 E.36497
G1 X35.032 Y133.69 E.2779
G1 X37.851 Y131.368 E.11743
G1 X28.545 Y122.063 E.42319
G1 X39.067 Y113.395 E.43837
G1 X48.373 Y122.7 E.42319
G1 X58.895 Y114.032 E.43837
G1 X49.589 Y104.726 E.42319
G1 X60.111 Y96.058 E.43837
G1 X69.417 Y105.364 E.42319
G1 X79.938 Y96.696 E.43837
G1 X70.633 Y87.39 E.42319
G1 X81.154 Y78.722 E.43837
G1 X90.46 Y88.028 E.42319
G1 X91.717 Y86.993 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X90.46 Y88.028 E-.61876
G1 X90.197 Y87.765 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/75
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
G17
G3 Z12.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X141.437 Y28.787 E.0044
G1 X184.993 Y81.862 E2.20785
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X141.74 Y28.538 E.01578
G1 X185.544 Y81.916 E2.0568
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.487 Y129.621 Z12.8 F30000
G1 X49.63 Y121.665 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X48.373 Y122.7 E.05236
G1 X39.067 Y113.395 E.42319
G1 X28.545 Y122.063 E.43837
G1 X37.851 Y131.368 E.42319
G1 X35.032 Y133.69 E.11743
G1 X40.515 Y140.371 E.2779
G1 X32.489 Y148.397 E.36497
G1 X23.839 Y137.856 E.43845
G1 X91.48 Y70.216 E3.076
G1 X91.676 Y70.054 E.00819
G1 X100.982 Y79.36 E.42319
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X154.645 Y45.431 E.43845
G1 X148.182 Y51.894 E.29391
G1 X156.832 Y62.434 E.43845
G1 X163.295 Y55.971 E.29391
G1 X171.944 Y66.511 E.43845
G1 X165.482 Y72.974 E.29391
G1 X174.131 Y83.514 E.43845
G1 X180.594 Y77.051 E.29391
G1 X184.503 Y81.815 E.19815
G1 X182.142 Y83.76 E.09839
G1 X133.764 Y35.382 E2.20004
G1 X123.242 Y44.05 E.43837
G1 X132.548 Y53.356 E.42319
G1 X122.026 Y62.024 E.43837
G1 X112.72 Y52.718 E.42319
G1 X102.198 Y61.386 E.43837
G1 X111.504 Y70.692 E.42319
G1 X112.761 Y69.657 E.05236
G1 X91.717 Y86.993 F30000
G1 F8843.478
G1 X90.46 Y88.028 E.05236
G1 X81.154 Y78.722 E.42319
G1 X70.633 Y87.39 E.43837
G1 X79.938 Y96.696 E.42319
G1 X78.682 Y97.732 E.05236
G1 X50.846 Y103.691 F30000
G1 F8843.478
G1 X49.589 Y104.726 E.05236
G1 X58.895 Y114.032 E.42319
G1 X69.417 Y105.364 E.43837
G1 X60.111 Y96.058 E.42319
G1 X61.367 Y95.023 E.05236
; WIPE_START
G1 X60.111 Y96.058 E-.61876
G1 X60.373 Y96.321 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X61.077 Y103.921 Z12.8 F30000
G1 X67.497 Y173.25 Z12.8
G1 Z12.4
G1 E.8 F1800
G1 F8843.478
G1 X66.464 Y171.991 E.05236
G1 X58.438 Y180.017 E.36497
G1 X49.789 Y169.477 E.43845
G1 X57.814 Y161.451 E.36497
G1 X49.165 Y150.911 E.43845
G1 X41.139 Y158.937 E.36497
G1 X42.172 Y160.195 E.05236
G1 X76.771 Y202.356 F30000
G1 F8843.478
G1 X75.738 Y201.097 E.05236
G1 X83.763 Y193.072 E.36497
G1 X75.114 Y182.532 E.43845
G1 X67.088 Y190.557 E.36497
G1 X66.055 Y189.299 E.05236
G1 X91.38 Y202.353 F30000
G1 F8843.478
G1 X92.413 Y203.612 E.05236
G1 X84.388 Y211.638 E.36497
G1 X93.037 Y222.178 E.43845
G1 X101.063 Y214.152 E.36497
G1 X99.316 Y212.024 E.08854
G1 X18.023 Y130.731 E3.69688
G1 X19.28 Y129.695 E.05236
G1 X108.68 Y223.434 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.687 Y232.718 E.36497
G1 X105.652 Y237.55 E.20098
G1 X112.712 Y244.609 E.32105
G1 X111.956 Y245.232 E.03147
G1 X110.337 Y243.258 E.08209
G1 X118.362 Y235.233 E.36497
G1 X119.395 Y236.491 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8843.478
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/75
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
G17
G3 Z12.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.909 Y245.722 E.38561
G1 X17.515 Y130.698 E4.78478
G1 X141.35 Y28.681 E5.15934
G1 X143.749 Y31.605 E.12162
G1 X184.993 Y81.862 E2.09063
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.855 Y246.275 E.38055
G1 X16.963 Y130.645 E4.45552
G1 X141.404 Y28.129 E4.80247
G1 X144.052 Y31.356 E.12436
G1 X185.544 Y81.916 E1.94821
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.097 Y133.044 Z13 F30000
G1 X19.28 Y129.695 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X18.023 Y130.731 E.05236
G1 X99.316 Y212.024 E3.69688
G1 X101.063 Y214.152 E.08854
G1 X93.037 Y222.178 E.36497
G1 X84.388 Y211.638 E.43845
G1 X92.413 Y203.612 E.36497
G1 X83.763 Y193.072 E.43845
G1 X75.738 Y201.097 E.36497
G1 X74.705 Y199.839 E.05236
G1 X74.081 Y181.273 F30000
G1 F8843.478
G1 X75.114 Y182.532 E.05236
G1 X67.088 Y190.557 E.36497
G1 X58.438 Y180.017 E.43845
G1 X66.464 Y171.991 E.36497
G1 X57.814 Y161.451 E.43845
G1 X49.789 Y169.477 E.36497
G1 X41.139 Y158.937 E.43845
G1 X49.165 Y150.911 E.36497
G1 X50.197 Y152.17 E.05236
; WIPE_START
G1 X49.165 Y150.911 E-.61876
G1 X48.902 Y151.174 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X50.556 Y143.723 Z13 F30000
G1 X61.367 Y95.023 Z13
G1 Z12.6
G1 E.8 F1800
G1 F8843.478
G1 X60.111 Y96.058 E.05236
G1 X69.417 Y105.364 E.42319
G1 X58.895 Y114.032 E.43837
M73 P73 R13
G1 X49.589 Y104.726 E.42319
G1 X48.332 Y105.762 E.05236
G1 X78.682 Y97.732 F30000
G1 F8843.478
G1 X79.938 Y96.696 E.05236
G1 X70.633 Y87.39 E.42319
G1 X81.154 Y78.722 E.43837
G1 X90.46 Y88.028 E.42319
G1 X91.717 Y86.993 E.05236
G1 X133.804 Y52.321 F30000
G1 F8843.478
G1 X132.548 Y53.356 E.05236
G1 X123.242 Y44.05 E.42319
G1 X112.72 Y52.718 E.43837
G1 X122.026 Y62.024 E.42319
G1 X111.504 Y70.692 E.43837
G1 X102.198 Y61.386 E.42319
G1 X103.455 Y60.351 E.05236
; WIPE_START
G1 X102.198 Y61.386 E-.61876
G1 X102.461 Y61.649 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X109.872 Y59.823 Z13 F30000
G1 X147.149 Y50.635 Z13
G1 Z12.6
G1 E.8 F1800
G1 F8843.478
G1 X148.182 Y51.894 E.05236
G1 X154.645 Y45.431 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
G1 X170.911 Y65.252 F30000
G1 F8843.478
G1 X171.944 Y66.511 E.05236
G1 X165.482 Y72.974 E.29391
G1 X174.131 Y83.514 E.43845
G1 X180.594 Y77.051 E.29391
G1 X184.503 Y81.815 E.19815
G1 X182.142 Y83.76 E.09839
G1 X133.764 Y35.382 E2.20004
G1 X141.302 Y29.172 E.31407
G1 X145.995 Y34.891 E.23789
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X91.676 Y70.054 E.42319
G1 X23.839 Y137.856 E3.08416
G1 X32.489 Y148.397 E.43845
G1 X40.515 Y140.371 E.36497
G1 X35.032 Y133.69 E.2779
G1 X37.851 Y131.368 E.11743
G1 X28.545 Y122.063 E.42319
G1 X39.067 Y113.395 E.43837
G1 X48.373 Y122.7 E.42319
G1 X49.63 Y121.665 E.05236
; WIPE_START
G1 X48.373 Y122.7 E-.61876
G1 X48.11 Y122.438 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X52.155 Y128.91 Z13 F30000
G1 X119.395 Y236.491 Z13
G1 Z12.6
G1 E.8 F1800
G1 F8843.478
G1 X118.362 Y235.233 E.05236
G1 X110.337 Y243.258 E.36497
G1 X111.956 Y245.232 E.08209
G1 X112.712 Y244.609 E.03147
G1 X105.652 Y237.549 E.32105
G1 X101.687 Y232.718 E.20098
G1 X109.713 Y224.692 E.36497
G1 X108.68 Y223.434 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X109.713 Y224.692 E-.61876
G1 X109.45 Y224.955 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/75
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
M106 S196.35
G17
G3 Z13 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.931 Y245.704 E.38468
G1 X19.829 Y133.473 E4.66861
G1 X17.531 Y130.697 E.11586
G1 X141.367 Y28.701 E5.1589
G1 X142.906 Y30.577 E.07803
G1 X184.993 Y81.862 E2.13337
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.877 Y246.256 E.37969
G1 X19.526 Y133.722 E4.33623
G1 X16.979 Y130.645 E.119
G1 X141.421 Y28.149 E4.80212
G1 X143.209 Y30.329 E.08398
G1 X185.544 Y81.916 E1.9878
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.085 Y137.518 Z13.2 F30000
G1 X24.893 Y139.095 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X23.86 Y137.836 E.05236
G1 X91.335 Y70.361 E3.0685
G1 X91.69 Y70.068 E.01479
G1 X100.982 Y79.36 E.42256
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X144.962 Y33.632 E.05236
G1 X155.799 Y61.175 F30000
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X154.645 Y45.431 E.43845
G1 X148.182 Y51.894 E.29391
G1 X147.149 Y50.635 E.05236
G1 X170.911 Y65.252 F30000
G1 F8843.478
G1 X171.944 Y66.511 E.05236
G1 X165.482 Y72.974 E.29391
G1 X174.131 Y83.514 E.43845
G1 X180.594 Y77.051 E.29391
G1 X184.503 Y81.815 E.19815
G1 X182.142 Y83.76 E.09839
G1 X133.782 Y35.4 E2.19922
G1 X123.259 Y44.067 E.43838
G1 X132.548 Y53.356 E.42242
G1 X122.026 Y62.024 E.43837
G1 X112.736 Y52.734 E.42247
G1 X102.213 Y61.401 E.43838
G1 X111.504 Y70.692 E.42251
G1 X112.761 Y69.657 E.05236
M73 P73 R12
G1 X79.91 Y79.771 F30000
G1 F8843.478
G1 X81.167 Y78.735 E.05236
G1 X90.46 Y88.028 E.4226
G1 X79.938 Y96.696 E.43837
G1 X70.644 Y87.402 E.42265
G1 X60.122 Y96.069 E.43838
G1 X69.417 Y105.364 E.42269
G1 X58.895 Y114.032 E.43837
G1 X49.599 Y104.736 E.42274
G1 X39.076 Y113.404 E.43838
G1 X48.373 Y122.7 E.42278
G1 X49.63 Y121.665 E.05236
; WIPE_START
G1 X48.373 Y122.7 E-.61876
G1 X48.11 Y122.438 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X49.818 Y129.876 Z13.2 F30000
G1 X56.781 Y160.193 Z13.2
G1 Z12.8
G1 E.8 F1800
G1 F8843.478
G1 X57.814 Y161.451 E.05236
G1 X49.809 Y169.456 E.36403
G1 X58.459 Y179.996 E.43845
G1 X66.464 Y171.991 E.36403
G1 X75.114 Y182.532 E.43845
G1 X67.109 Y190.537 E.36404
G1 X75.758 Y201.077 E.43845
G1 X83.763 Y193.072 E.36404
G1 X92.413 Y203.612 E.43845
G1 X84.408 Y211.617 E.36404
G1 X93.058 Y222.157 E.43845
G1 X101.063 Y214.152 E.36404
G1 X99.316 Y212.024 E.08854
G1 X18.03 Y130.738 E3.69656
G1 X28.553 Y122.071 E.43838
G1 X37.851 Y131.368 E.42283
G1 X35.032 Y133.69 E.11743
G1 X40.515 Y140.371 E.2779
G1 X32.51 Y148.376 E.36403
G1 X41.16 Y158.916 E.43845
G1 X49.165 Y150.911 E.36403
G1 X48.132 Y149.652 E.05236
G1 X108.68 Y223.434 F30000
G1 F8843.478
G1 X109.713 Y224.692 E.05236
G1 X101.708 Y232.697 E.36404
G1 X105.861 Y237.758 E.21052
G1 X112.712 Y244.609 E.31155
G1 X111.979 Y245.213 E.03054
G1 X110.357 Y243.238 E.08218
G1 X118.362 Y235.233 E.36404
G1 X119.395 Y236.491 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X118.362 Y235.233 E-.61876
G1 X118.1 Y235.495 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/75
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
M106 S150.45
G17
G3 Z13.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.953 Y245.685 E.38375
G1 X22.525 Y136.713 E4.53307
G3 X17.568 Y130.701 I931.212 J-773.002 E.25057
G1 X141.383 Y28.722 E5.15808
G1 X142.063 Y29.55 E.03445
G1 X184.993 Y81.862 E2.17611
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
M73 P74 R12
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.899 Y246.238 E.37882
G1 X22.223 Y136.962 E4.21068
G3 X17.016 Y130.647 I976.903 J-810.833 E.24379
G1 X141.437 Y28.169 E4.80132
G1 X142.366 Y29.301 E.04361
G1 X185.544 Y81.916 E2.0274
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X29.858 Y134.052 Z13.4 F30000
G1 X19.922 Y132.404 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X20.955 Y133.662 E.05236
G1 X99.316 Y212.024 E3.56356
G1 X101.063 Y214.152 E.08854
G1 X93.34 Y221.875 E.3512
G1 X84.691 Y211.334 E.43845
G1 X92.413 Y203.612 E.35119
G1 X83.763 Y193.072 E.43845
G1 X76.041 Y200.794 E.35117
G1 X67.392 Y190.253 E.43845
G1 X75.114 Y182.532 E.35115
G1 X74.081 Y181.273 E.05236
G1 X59.776 Y180.971 F30000
G1 F8843.478
G1 X58.743 Y179.713 E.05236
G1 X66.464 Y171.991 E.35113
G1 X57.814 Y161.451 E.43845
G1 X50.093 Y169.172 E.35111
G1 X41.444 Y158.632 E.43845
G1 X49.165 Y150.911 E.35109
G1 X50.197 Y152.17 E.05236
; WIPE_START
G1 X49.165 Y150.911 E-.61876
G1 X48.902 Y151.174 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X49.09 Y143.544 Z13.4 F30000
G1 X49.63 Y121.665 Z13.4
G1 Z13
G1 E.8 F1800
G1 F8843.478
G1 X48.373 Y122.7 E.05236
G1 X39.35 Y113.677 E.41033
G1 X28.828 Y122.346 E.43837
G1 X37.851 Y131.368 E.41031
G1 X35.032 Y133.69 E.11743
G1 X40.515 Y140.371 E.2779
G1 X32.795 Y148.091 E.35108
G1 X24.145 Y137.55 E.43845
G1 X88.568 Y73.128 E2.92968
G1 X91.957 Y70.335 E.14122
G1 X100.982 Y79.36 E.41041
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X144.962 Y33.632 E.05236
G1 X147.149 Y50.635 F30000
G1 F8843.478
G1 X148.182 Y51.894 E.05236
G1 X154.645 Y45.431 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
; WIPE_START
G1 X156.832 Y62.434 E-.61876
G1 X157.095 Y62.171 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X149.569 Y63.442 Z13.4 F30000
G1 X112.761 Y69.657 Z13.4
G1 Z13
G1 E.8 F1800
G1 F8843.478
G1 X111.504 Y70.692 E.05236
G1 X102.479 Y61.667 E.41042
G1 X113 Y52.999 E.43837
G1 X122.026 Y62.024 E.41044
G1 X132.548 Y53.356 E.43837
G1 X123.522 Y44.33 E.41045
G1 X134.043 Y35.662 E.43837
G1 X182.142 Y83.76 E2.18732
G1 X184.503 Y81.815 E.09839
G1 X180.594 Y77.051 E.19815
G1 X174.131 Y83.514 E.29391
G1 X165.482 Y72.974 E.43845
G1 X171.944 Y66.511 E.29391
G1 X172.977 Y67.77 E.05236
; WIPE_START
G1 X171.944 Y66.511 E-.61876
G1 X171.682 Y66.774 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X164.128 Y67.869 Z13.4 F30000
G1 X80.179 Y80.039 Z13.4
G1 Z13
G1 E.8 F1800
G1 F8843.478
G1 X81.436 Y79.004 E.05236
G1 X90.46 Y88.028 E.41039
G1 X79.938 Y96.696 E.43837
G1 X70.914 Y87.672 E.41038
G1 X60.393 Y96.341 E.43837
G1 X69.417 Y105.364 E.41036
G1 X58.895 Y114.032 E.43837
G1 X49.871 Y105.009 E.41034
G1 X48.615 Y106.044 E.05236
; WIPE_START
G1 X49.871 Y105.009 E-.61876
G1 X50.134 Y105.272 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X53.333 Y112.202 Z13.4 F30000
G1 X113.969 Y243.574 Z13.4
G1 Z13
G1 E.8 F1800
G1 F8843.478
G1 X112.712 Y244.609 E.05236
G1 X108.718 Y240.615 E.18162
G1 X101.989 Y232.416 E.34108
G1 X109.713 Y224.692 E.35122
G1 X118.362 Y235.233 E.43845
G1 X110.639 Y242.956 E.35124
G1 X112.002 Y245.182 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
G1 X18.234 Y130.93 E3.96965
G1 X18.155 Y130.758 E.00509
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.4702
;_EXTRUDE_SET_SPEED
G1 X18.279 Y130.576 E.00742
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.38292
;_EXTRUDE_SET_SPEED
G1 X141.29 Y29.245 E4.28036
; Slow Down End
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X139.746 Y30.517 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/75
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
M106 S178.5
G17
G3 Z13.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X111.976 Y245.667 E.38282
G1 X17.636 Y130.704 E4.78216
G1 X141.4 Y28.742 E5.15645
G1 X184.993 Y81.862 E2.20971
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.922 Y246.219 E.37796
G1 X17.085 Y130.651 E4.45308
G1 X141.454 Y28.19 E4.79979
G1 X141.523 Y28.274 E.00323
G1 X185.544 Y81.916 E2.06699
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.487 Y129.621 Z13.6 F30000
G1 X49.63 Y121.665 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X48.373 Y122.7 E.05236
G1 X39.443 Y113.771 E.40609
G1 X49.965 Y105.103 E.43837
G1 X58.895 Y114.032 E.40609
G1 X69.417 Y105.364 E.43837
G1 X60.487 Y96.434 E.40609
G1 X71.009 Y87.766 E.43837
G1 X79.938 Y96.696 E.40609
G1 X90.46 Y88.028 E.43837
G1 X81.53 Y79.098 E.40609
G1 X80.274 Y80.134 E.05236
; WIPE_START
G1 X81.53 Y79.098 E-.61876
G1 X81.793 Y79.361 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X89.205 Y77.54 Z13.6 F30000
G1 X155.799 Y61.175 Z13.6
G1 Z13.2
G1 E.8 F1800
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X154.645 Y45.431 E.43845
G1 X148.182 Y51.894 E.29391
G1 X147.149 Y50.635 E.05236
G1 X144.962 Y33.632 F30000
M73 P75 R12
G1 F8843.478
G1 X145.995 Y34.891 E.05236
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X92.052 Y70.43 E.40609
G1 X87.587 Y74.109 E.18603
G1 X24.243 Y137.453 E2.88062
G1 X32.897 Y147.989 E.43843
G1 X40.515 Y140.371 E.34642
G1 X35.032 Y133.69 E.2779
G1 X37.851 Y131.368 E.11743
G1 X28.921 Y122.439 E.40609
G1 X18.757 Y130.789 E.42301
G1 X21.904 Y134.611 E.15923
G1 X99.316 Y212.024 E3.5204
G1 X101.063 Y214.152 E.08854
G1 X93.445 Y221.77 E.34642
G1 X92.412 Y220.511 E.05236
G1 X110.745 Y242.85 F30000
G1 F8843.478
G1 X118.362 Y235.233 E.34642
G1 X109.713 Y224.692 E.43845
G1 X102.095 Y232.31 E.34642
G1 X109.793 Y241.691 E.39022
G1 X112.712 Y244.609 E.13272
G1 X113.969 Y243.574 E.05236
G1 X112.033 Y245.078 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.45992
G1 F8633.094
G1 X18.372 Y130.961 E4.86298
; LINE_WIDTH: 0.46568
G1 F8515.47
G1 X18.341 Y130.897 E.00239
; LINE_WIDTH: 0.50008
G1 F7874.705
G1 X18.31 Y130.832 E.00259
; LINE_WIDTH: 0.53448
G1 F7323.623
G1 X18.28 Y130.767 E.00278
; LINE_WIDTH: 0.52865
G1 F7411.525
G1 X18.328 Y130.698 E.00324
; LINE_WIDTH: 0.48259
G1 F8187.959
G1 X18.376 Y130.628 E.00293
; LINE_WIDTH: 0.423957
G1 F9447.909
G1 X18.424 Y130.559 E.00254
G1 X141.299 Y29.343 E4.79163
G1 X172.977 Y67.77 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X171.944 Y66.511 E.05236
G1 X165.482 Y72.974 E.29391
G1 X174.131 Y83.514 E.43845
G1 X180.594 Y77.051 E.29391
G1 X184.503 Y81.815 E.19815
G1 X182.142 Y83.76 E.09839
G1 X134.14 Y35.758 E2.18294
G1 X123.618 Y44.426 E.43837
G1 X132.548 Y53.356 E.40609
G1 X122.026 Y62.024 E.43837
G1 X113.096 Y53.094 E.40609
G1 X102.574 Y61.762 E.43837
G1 X111.504 Y70.692 E.40609
G1 X112.761 Y69.657 E.05236
; WIPE_START
G1 X111.504 Y70.692 E-.61876
G1 X111.241 Y70.429 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X106.674 Y76.545 Z13.6 F30000
G1 X50.197 Y152.17 Z13.6
G1 Z13.2
G1 E.8 F1800
G1 F8843.478
G1 X49.165 Y150.911 E.05236
G1 X41.547 Y158.529 E.34642
G1 X50.197 Y169.069 E.43845
G1 X57.814 Y161.451 E.34642
G1 X66.464 Y171.991 E.43845
G1 X58.846 Y179.609 E.34642
G1 X67.496 Y190.149 E.43845
G1 X75.114 Y182.532 E.34642
G1 X83.763 Y193.072 E.43845
G1 X76.146 Y200.689 E.34642
G1 X84.796 Y211.23 E.43845
G1 X92.413 Y203.612 E.34642
G1 X91.38 Y202.353 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X92.413 Y203.612 E-.61876
G1 X92.15 Y203.875 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/75
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
M106 S175.95
G17
G3 Z13.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X112.035 Y245.618 E.38036
G1 X17.726 Y130.709 E4.78021
G1 X141.444 Y28.796 E5.15431
G1 X142.753 Y30.391 E.06634
G1 X184.993 Y81.862 E2.14113
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X111.981 Y246.171 E.37568
G1 X17.175 Y130.655 E4.45128
G1 X141.498 Y28.244 E4.7978
G1 X143.056 Y30.142 E.07315
G1 X185.544 Y81.916 E1.995
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X29.847 Y136.478 Z13.8 F30000
G1 X24.361 Y137.335 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X86.488 Y75.208 E2.82531
G1 X92.159 Y70.537 E.23624
G1 X100.982 Y79.36 E.40125
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X144.962 Y33.632 E.05236
G1 X147.149 Y50.635 F30000
G1 F8843.478
G1 X148.182 Y51.894 E.05236
G1 X154.645 Y45.431 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X157.865 Y63.693 E.05236
; WIPE_START
G1 X156.832 Y62.434 E-.61876
G1 X157.095 Y62.171 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X149.569 Y63.442 Z13.8 F30000
G1 X112.761 Y69.657 Z13.8
G1 Z13.4
G1 E.8 F1800
G1 F8843.478
G1 X111.504 Y70.692 E.05236
G1 X102.681 Y61.869 E.40123
G1 X113.203 Y53.202 E.43837
M73 P75 R11
G1 X122.026 Y62.024 E.4012
G1 X132.548 Y53.356 E.43837
G1 X123.726 Y44.534 E.40118
G1 X134.248 Y35.867 E.43837
G1 X182.142 Y83.76 E2.178
G1 X184.503 Y81.815 E.09839
G1 X180.594 Y77.051 E.19815
G1 X174.131 Y83.514 E.29391
G1 X165.482 Y72.974 E.43845
G1 X171.944 Y66.511 E.29391
G1 X170.911 Y65.252 E.05236
; WIPE_START
G1 X171.944 Y66.511 E-.61876
G1 X171.682 Y66.774 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X164.415 Y69.108 Z13.8 F30000
G1 X48.812 Y106.242 Z13.8
G1 Z13.4
G1 E.8 F1800
G1 F8843.478
G1 X50.069 Y105.207 E.05236
G1 X58.895 Y114.032 E.40135
G1 X69.417 Y105.364 E.43837
M73 P76 R11
G1 X60.592 Y96.539 E.40133
G1 X71.114 Y87.872 E.43837
G1 X79.938 Y96.696 E.4013
G1 X90.46 Y88.028 E.43837
G1 X81.636 Y79.204 E.40128
G1 X80.379 Y80.24 E.05236
G1 X49.63 Y121.665 F30000
G1 F8843.478
G1 X48.373 Y122.7 E.05236
G1 X39.547 Y113.874 E.40137
G1 X29.024 Y122.542 E.43837
G1 X37.851 Y131.368 E.4014
G1 X35.032 Y133.69 E.11743
G1 X40.515 Y140.371 E.2779
G1 X33.011 Y147.875 E.34124
G1 X41.662 Y158.414 E.43845
G1 X49.165 Y150.911 E.34121
G1 X57.814 Y161.451 E.43845
G1 X50.312 Y168.954 E.34118
G1 X58.962 Y179.493 E.43845
G1 X66.464 Y171.991 E.34115
G1 X67.497 Y173.25 E.05236
G1 X66.58 Y188.774 F30000
G1 F8843.478
G1 X67.613 Y190.033 E.05236
G1 X75.114 Y182.532 E.34112
G1 X83.763 Y193.072 E.43845
G1 X76.263 Y200.572 E.34109
G1 X84.913 Y211.112 E.43845
G1 X92.413 Y203.612 E.34106
G1 X91.38 Y202.353 E.05236
G1 X112.098 Y244.965 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.56221
G1 F6932.543
G1 X18.57 Y131.009 E6.04731
; LINE_WIDTH: 0.58014
G1 F6701.166
G1 X18.533 Y130.933 E.0036
; LINE_WIDTH: 0.61894
G1 F6249.783
G1 X18.495 Y130.856 E.00386
; LINE_WIDTH: 0.65774
G1 F5855.372
G1 X18.458 Y130.78 E.00412
; LINE_WIDTH: 0.656955
G1 F5862.858
G1 X18.502 Y130.718 E.00368
; LINE_WIDTH: 0.616585
G1 F6275.44
G1 X18.545 Y130.656 E.00344
; LINE_WIDTH: 0.576215
G1 F6750.485
G1 X18.589 Y130.594 E.0032
; LINE_WIDTH: 0.516999
G1 F7593.671
G1 X18.633 Y130.532 E.00284
G1 X141.337 Y29.456 E5.95339
G1 X22.106 Y134.588 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X23.139 Y135.846 E.05236
G1 X99.316 Y212.024 E3.46425
G1 X101.063 Y214.152 E.08854
G1 X93.564 Y221.651 E.34103
G1 X102.214 Y232.191 E.43845
G1 X109.713 Y224.692 E.341
G1 X118.362 Y235.233 E.43845
G1 X110.865 Y242.73 E.34097
G1 X112.712 Y244.609 E.08473
G1 X113.969 Y243.574 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8843.478
G1 X112.712 Y244.609 E-.61876
G1 X112.451 Y244.344 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/75
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
M106 S155.55
G17
G3 Z13.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X112.105 Y245.56 E.37743
G1 X25.98 Y140.613 E4.36562
G1 X17.831 Y130.714 E.41232
G1 X28.54 Y121.916 E.44569
G1 X141.497 Y28.86 E4.70612
G1 X142.054 Y29.539 E.02823
G1 X184.993 Y81.862 E2.17657
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X112.051 Y246.113 E.37297
G1 X25.677 Y140.862 E4.05559
G1 X17.28 Y130.66 E.39358
G1 X28.291 Y121.613 E.42449
G1 X141.551 Y28.308 E4.37099
G1 X142.357 Y29.29 E.03785
G1 X185.544 Y81.916 E2.02783
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.003 Y133.373 Z14 F30000
G1 X18.897 Y130.475 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.61396
G1 F6304.287
G1 X141.384 Y29.582 E7.1582
; WIPE_START
G1 X139.84 Y30.853 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.862 Y38.423 Z14 F30000
G1 X112.154 Y245.056 Z14
G1 Z13.6
G1 E.8 F1800
; LINE_WIDTH: 0.35587
G1 F11503.434
G1 X112.056 Y244.937 E.00382
; LINE_WIDTH: 0.370035
G1 F11005.304
G1 X65.36 Y188.048 E1.90177
; LINE_WIDTH: 0.406713
G1 F9895.734
G1 X18.665 Y131.159 E2.11501
G1 X18.386 Y130.768 E.01381
; LINE_WIDTH: 0.449752
G1 F8848.878
G1 X18.423 Y130.738 E.00153
; LINE_WIDTH: 0.498874
G1 F7895.537
G1 X18.46 Y130.708 E.00172
; LINE_WIDTH: 0.547997
G1 F7127.637
G1 X18.496 Y130.677 E.0019
; LINE_WIDTH: 0.531251
G1 F7372.059
G1 X18.897 Y130.475 E.0173
; LINE_WIDTH: 0.601477
G1 F6445.188
G1 X18.879 Y130.538 E.00291
; LINE_WIDTH: 0.561069
G1 F6947.814
G1 X18.861 Y130.602 E.0027
; Slow Down Start
; LINE_WIDTH: 0.520661
G1 F3000;_EXTRUDE_SET_SPEED
G1 X18.842 Y130.665 E.00249
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.477063
;_EXTRUDE_SET_SPEED
G1 X18.839 Y130.679 E.00049
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.430274
;_EXTRUDE_SET_SPEED
G1 X18.835 Y130.693 E.00044
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.383485
;_EXTRUDE_SET_SPEED
G1 X18.831 Y130.706 E.00038
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.453825
;_EXTRUDE_SET_SPEED
G1 X18.857 Y130.79 E.00286
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.412955
;_EXTRUDE_SET_SPEED
G1 X18.884 Y130.874 E.00257
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.355875
;_EXTRUDE_SET_SPEED
G1 X18.91 Y130.958 E.00218
G1 X112.392 Y244.86 E3.6427
G1 X112.367 Y244.881 E.00083
; Slow Down End
; LINE_WIDTH: 0.35165
G1 F11660.675
G1 X112.2 Y245.018 E.00525
G1 X112.031 Y243.856 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X110.998 Y242.597 E.05236
G1 X118.362 Y235.233 E.3349
G1 X109.713 Y224.692 E.43845
G1 X102.348 Y232.057 E.33491
G1 X93.698 Y221.517 E.43845
G1 X101.063 Y214.152 E.33492
G1 X99.316 Y212.024 E.08854
G1 X24.499 Y137.197 E3.4026
G1 X85.212 Y76.484 E2.76101
G1 X92.282 Y70.66 E.29453
G1 X100.982 Y79.36 E.39565
G1 X104.067 Y76.818 E.12854
G1 X145.995 Y34.891 E1.90671
G1 X144.962 Y33.632 E.05236
G1 X155.799 Y61.175 F30000
G1 F8843.478
G1 X156.832 Y62.434 E.05236
G1 X163.295 Y55.971 E.29391
G1 X154.645 Y45.431 E.43845
G1 X148.182 Y51.894 E.29391
G1 X147.149 Y50.635 E.05236
G1 X172.977 Y67.77 F30000
G1 F8843.478
G1 X171.944 Y66.511 E.05236
G1 X165.482 Y72.974 E.29391
G1 X174.131 Y83.514 E.43845
G1 X180.594 Y77.051 E.29391
G1 X184.503 Y81.815 E.19815
G1 X182.142 Y83.76 E.09839
G1 X134.37 Y35.988 E2.17247
G1 X123.848 Y44.656 E.43837
G1 X132.548 Y53.356 E.39563
G1 X122.026 Y62.024 E.43837
G1 X113.326 Y53.324 E.39564
G1 X102.804 Y61.992 E.43837
G1 X111.504 Y70.692 E.39565
G1 X112.761 Y69.657 E.05236
G1 X80.503 Y80.363 F30000
G1 F8843.478
G1 X81.76 Y79.328 E.05236
G1 X90.46 Y88.028 E.39566
G1 X79.938 Y96.696 E.43837
G1 X71.238 Y87.996 E.39567
G1 X60.716 Y96.664 E.43837
G1 X69.417 Y105.364 E.39568
G1 X58.895 Y114.032 E.43837
G1 X50.194 Y105.331 E.39568
G1 X51.45 Y104.296 E.05236
; WIPE_START
G1 X50.194 Y105.331 E-.61876
G1 X50.457 Y105.594 E-.14125
; WIPE_END
G1 E-.04 F1800
G1 X52.798 Y112.859 Z14 F30000
G1 X84.015 Y209.718 Z14
G1 Z13.6
G1 E.8 F1800
G1 F8843.478
G1 X85.048 Y210.977 E.05236
G1 X92.413 Y203.612 E.33493
G1 X83.763 Y193.072 E.43845
G1 X76.398 Y200.437 E.33494
G1 X67.748 Y189.897 E.43845
G1 X75.114 Y182.532 E.33495
G1 X66.464 Y171.991 E.43845
M73 P77 R11
G1 X59.098 Y179.357 E.33495
G1 X50.449 Y168.817 E.43845
G1 X57.814 Y161.451 E.33496
G1 X49.165 Y150.911 E.43845
G1 X41.799 Y158.277 E.33497
G1 X33.149 Y147.737 E.43845
G1 X40.515 Y140.371 E.33498
G1 X35.032 Y133.69 E.2779
G1 X37.851 Y131.368 E.11743
G1 X29.15 Y122.667 E.3957
G1 X39.672 Y113.999 E.43837
G1 X48.373 Y122.7 E.39569
G1 X49.63 Y121.665 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X48.373 Y122.7 E-.61876
G1 X48.11 Y122.438 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/75
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
M106 S140.25
G17
G3 Z14 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X112.175 Y245.502 E.3745
G1 X17.989 Y130.722 E4.7745
G1 X141.549 Y28.924 E5.14803
G1 X184.993 Y81.862 E2.20214
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X112.121 Y246.055 E.37026
G1 X17.438 Y130.668 E4.44599
G1 X141.603 Y28.372 E4.79199
G1 X141.658 Y28.438 E.00256
G1 X185.544 Y81.916 E2.06065
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X32.563 Y129.386 Z14.2 F30000
G1 X28.078 Y123.888 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X29.337 Y122.854 E.05236
G1 X37.851 Y131.368 E.3872
G1 X35.032 Y133.69 E.11743
G1 X40.515 Y140.371 E.2779
G1 X33.354 Y147.532 E.32564
G1 X34.387 Y148.79 E.05236
G1 X56.781 Y160.193 F30000
G1 F8843.478
G1 X57.814 Y161.451 E.05236
G1 X50.654 Y168.612 E.32564
G1 X42.004 Y158.072 E.43845
G1 X49.165 Y150.911 E.32564
G1 X48.132 Y149.652 E.05236
; WIPE_START
G1 X49.165 Y150.911 E-.61876
G1 X48.902 Y151.174 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X49.09 Y143.544 Z14.2 F30000
G1 X49.63 Y121.665 Z14.2
G1 Z13.8
G1 E.8 F1800
G1 F8843.478
G1 X48.373 Y122.7 E.05236
G1 X39.858 Y114.186 E.3872
G1 X50.38 Y105.518 E.43837
G1 X58.895 Y114.032 E.3872
G1 X69.417 Y105.364 E.43837
G1 X60.902 Y96.85 E.3872
G1 X71.424 Y88.182 E.43837
G1 X79.938 Y96.696 E.3872
G1 X90.46 Y88.028 E.43837
G1 X81.946 Y79.514 E.3872
G1 X112.761 Y69.657 F30000
G1 F8843.478
G1 X111.504 Y70.692 E.05236
G1 X102.99 Y62.178 E.3872
G1 X113.511 Y53.51 E.43837
G1 X122.026 Y62.024 E.3872
G1 X132.548 Y53.356 E.43837
G1 X124.033 Y44.842 E.3872
G1 X134.555 Y36.174 E.43837
G1 X182.142 Y83.76 E2.16405
G1 X184.503 Y81.815 E.09839
G1 X180.594 Y77.051 E.19815
G1 X174.131 Y83.514 E.29391
G1 X165.482 Y72.974 E.43845
G1 X171.944 Y66.511 E.29391
G1 X172.977 Y67.77 E.05236
G1 X147.149 Y50.635 F30000
G1 F8843.478
G1 X148.182 Y51.894 E.05236
G1 X154.645 Y45.431 E.29391
G1 X163.295 Y55.971 E.43845
G1 X156.832 Y62.434 E.29391
G1 X155.799 Y61.175 E.05236
G1 X144.962 Y33.632 F30000
G1 F8843.478
G1 X145.995 Y34.891 E.05236
G1 X104.067 Y76.818 E1.90671
G1 X100.982 Y79.36 E.12854
G1 X92.468 Y70.846 E.3872
G1 X83.286 Y78.41 E.38253
G1 X24.7 Y136.996 E2.66428
G1 X26.62 Y139.328 E.09714
G1 X99.316 Y212.024 E3.30591
G1 X101.063 Y214.152 E.08854
G1 X93.902 Y221.313 E.32564
G1 X85.253 Y210.773 E.43845
G1 X92.413 Y203.612 E.32564
G1 X83.763 Y193.072 E.43845
G1 X76.603 Y200.232 E.32564
G1 X67.953 Y189.692 E.43845
G1 X75.114 Y182.532 E.32564
G1 X66.464 Y171.991 E.43845
G1 X59.303 Y179.152 E.32564
G1 X58.27 Y177.893 E.05236
G1 X101.519 Y230.594 F30000
G1 F8843.478
G1 X102.552 Y231.853 E.05236
G1 X109.713 Y224.692 E.32564
G1 X118.362 Y235.233 E.43845
G1 X111.202 Y242.393 E.32564
G1 X112.235 Y243.652 E.05236
G1 X112.481 Y244.724 F30000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.446721
G1 F8915.293
G1 X112.231 Y244.929 E.01031
G1 X112.102 Y244.772 E.00649
; LINE_WIDTH: 0.464465
G1 F8540.013
G1 X65.521 Y188.011 E2.44508
; LINE_WIDTH: 0.494735
G1 F7967.863
G1 X18.939 Y131.25 E2.62065
; LINE_WIDTH: 0.441315
G1 F9036.263
G1 X18.604 Y130.782 E.01812
G1 X19.066 Y130.33 E.02034
; LINE_WIDTH: 0.407299
G1 F9879.831
G1 X141.496 Y29.472 E4.56571
G1 X141.683 Y29.7 E.0085
; Slow Down Start
; LINE_WIDTH: 0.408641
G1 F3000;_EXTRUDE_SET_SPEED
G1 X141.731 Y29.758 E.00218
G1 X19.294 Y130.607 E4.58251
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.419229
;_EXTRUDE_SET_SPEED
G1 X19.286 Y130.614 E.00031
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.455485
;_EXTRUDE_SET_SPEED
G1 X19.278 Y130.621 E.00034
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.447045
;_EXTRUDE_SET_SPEED
G1 X19.164 Y130.837 E.0078
G1 X19.243 Y131 E.0058
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.44258
;_EXTRUDE_SET_SPEED
G1 X112.545 Y244.671 E4.64267
; Slow Down End
; LINE_WIDTH: 0.44933
G1 F8858.05
G1 X112.527 Y244.686 E.00075
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8858.05
G1 X112.545 Y244.671 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/75
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
M106 S102
G17
G3 Z14.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z14
M73 P77 R10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X112.29 Y245.408 E.3697
G1 X26.166 Y140.46 E4.36562
G1 X18.154 Y130.73 E.4053
G1 X28.678 Y122.085 E.43796
G1 X141.635 Y29.029 E4.70613
G1 X184.993 Y81.862 E2.19778
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X112.237 Y245.96 E.36581
G1 X25.863 Y140.709 E4.05559
G1 X17.602 Y130.676 E.38711
G1 X28.429 Y121.782 E.41737
G1 X141.689 Y28.477 E4.371
G1 X185.544 Y81.916 E2.05917
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X32.576 Y129.376 Z14.4 F30000
G1 X28.288 Y124.097 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G2 X29.549 Y123.067 I-118.889 J-146.831 E.05236
G1 X37.583 Y131.101 E.36534
G1 X34.502 Y133.639 E.12836
G1 X40.247 Y140.639 E.2912
G1 X33.588 Y147.298 E.30281
G1 X42.238 Y157.838 E.43845
G1 X48.897 Y151.179 E.30281
G1 X57.546 Y161.719 E.43845
G1 X50.888 Y168.378 E.30281
G1 X59.537 Y178.918 E.43845
G1 X66.196 Y172.259 E.30281
M73 P78 R10
G1 X74.846 Y182.8 E.43845
G1 X68.187 Y189.458 E.30281
G1 X76.837 Y199.998 E.43845
G1 X83.496 Y193.34 E.30281
G1 X92.145 Y203.88 E.43845
G1 X85.487 Y210.539 E.30281
G1 X94.136 Y221.079 E.43845
G1 X100.795 Y214.42 E.30281
G1 X96.596 Y209.303 E.21285
G1 X29.004 Y141.711 E3.07381
G2 X24.929 Y136.767 I-672.198 J549.84 E.20603
G1 X81.083 Y80.613 E2.55367
G1 X82.159 Y79.727 E.0448
G1 X90.192 Y87.76 E.36534
G1 X79.67 Y96.428 E.43837
G1 X71.637 Y88.395 E.36534
G1 X61.115 Y97.063 E.43837
G1 X69.149 Y105.096 E.36534
G1 X58.627 Y113.764 E.43837
G1 X50.593 Y105.731 E.36534
G1 X40.071 Y114.399 E.43837
G1 X48.105 Y122.432 E.36534
G1 X49.362 Y121.397 E.05236
; WIPE_START
G1 X48.105 Y122.432 E-.61876
G1 X47.842 Y122.17 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X54.149 Y117.871 Z14.4 F30000
G1 X149.483 Y52.884 Z14.4
G1 Z14
G1 E.8 F1800
G1 F8843.478
G1 X148.45 Y51.626 E.05236
G1 X154.377 Y45.699 E.26953
G1 X163.027 Y56.239 E.43845
G1 X157.1 Y62.166 E.26953
G1 X165.75 Y72.706 E.43845
G1 X171.676 Y66.779 E.26953
G1 X170.644 Y65.52 E.05236
G1 X173.366 Y81.987 F30000
G1 F8843.478
G1 X174.399 Y83.246 E.05236
G1 X180.326 Y77.319 E.26953
G1 X183.973 Y81.763 E.18485
G1 X181.874 Y83.492 E.08745
G1 X134.768 Y36.386 E2.14218
G1 X124.246 Y45.054 E.43837
G1 X132.28 Y53.088 E.36534
G1 X131.023 Y54.123 E.05236
G1 X144.694 Y33.9 F30000
G1 F8843.478
G1 X145.727 Y35.159 E.05236
G1 X106.841 Y74.045 E1.76839
G1 X100.714 Y79.092 E.25526
G1 X92.681 Y71.059 E.36534
G1 X103.202 Y62.391 E.43837
G1 X111.236 Y70.424 E.36534
G1 X121.758 Y61.756 E.43837
G1 X113.724 Y53.722 E.36534
G1 X112.467 Y54.758 E.05236
G1 X142.04 Y30.096 F30000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.398955
G1 F3000;_EXTRUDE_SET_SPEED
G1 X184.382 Y81.69 E1.87712
G1 X184.445 Y81.809 E.00378
G1 X184.36 Y81.914 E.00378
G1 X177.608 Y87.476 E.24605
G1 X177.489 Y87.539 E.00379
G1 X177.384 Y87.455 E.00379
G1 X142.695 Y45.184 E1.53788
G1 X142.59 Y45.1 E.00379
G1 X142.471 Y45.163 E.00379
G1 X35.135 Y133.587 E3.91118
G1 X35.05 Y133.692 E.00378
G1 X35.113 Y133.811 E.00378
G1 X120.553 Y237.925 E3.78787
G1 X120.616 Y238.044 E.00378
G1 X120.531 Y238.149 E.00378
G1 X113.03 Y244.328 E.27332
; Slow Down End
G1 X112.679 Y244.514 F30000
; LINE_WIDTH: 0.540542
G1 F7234.418
G1 X112.353 Y244.771 E.01633
G1 X24.646 Y137.925 E5.43376
; LINE_WIDTH: 0.521232
G1 F7526.473
G1 X22.858 Y135.743 E.10657
; LINE_WIDTH: 0.480735
G1 F8222.651
G1 X21.07 Y133.562 E.09754
; LINE_WIDTH: 0.446131
G1 F8928.345
G1 X19.281 Y131.381 E.08984
G1 X18.965 Y131.099 E.01351
; LINE_WIDTH: 0.41999
G1 F9547.299
G1 X18.706 Y130.784 E.01214
; LINE_WIDTH: 0.441403
G1 F9034.274
G1 X18.863 Y130.655 E.00639
; LINE_WIDTH: 0.465202
G1 F8525.11
G3 X19.442 Y130.233 I2.807 J3.248 E.02391
; LINE_WIDTH: 0.500498
G1 F7867.517
G1 X141.576 Y29.634 E5.71931
; LINE_WIDTH: 0.476629
G1 F8300.509
G1 X141.624 Y29.693 E.00259
; LINE_WIDTH: 0.439145
G1 F9085.747
G1 X141.672 Y29.751 E.00236
; Slow Down Start
; LINE_WIDTH: 0.451012
G1 F3000;_EXTRUDE_SET_SPEED
G2 X141.835 Y29.912 I.601 J-.444 E.00742
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.453119
;_EXTRUDE_SET_SPEED
G1 X142.04 Y30.096 E.00892
G1 X141.799 Y30.052 E.00795
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.502251
;_EXTRUDE_SET_SPEED
G1 X19.736 Y130.591 E5.73783
; Slow Down End
; Slow Down Start
; LINE_WIDTH: 0.536363
;_EXTRUDE_SET_SPEED
G1 X19.706 Y130.618 E.00157
G1 X19.674 Y131.06 E.01728
G1 X25.033 Y137.61 E.32989
G1 X112.579 Y244.264 E5.37835
; Slow Down End
; LINE_WIDTH: 0.519867
G1 F7548.021
G1 X112.609 Y244.297 E.00167
; LINE_WIDTH: 0.480739
G1 F8222.58
G1 X112.638 Y244.329 E.00153
; LINE_WIDTH: 0.441612
G1 F9029.544
G1 X112.668 Y244.362 E.0014
; LINE_WIDTH: 0.445987
G1 F8931.529
G1 X112.698 Y244.395 E.00141
G1 X112.984 Y244.366 E.00914
; LINE_WIDTH: 0.402484
G1 F10012.133
G1 X112.921 Y244.396 E.00198
; LINE_WIDTH: 0.441612
G1 F9029.544
G1 X112.858 Y244.426 E.0022
; LINE_WIDTH: 0.480739
G1 F8222.58
G1 X112.795 Y244.456 E.00241
; LINE_WIDTH: 0.519867
G1 F7548.021
G1 X112.732 Y244.486 E.00263
G1 X19.305 Y130.792 F30000
; LINE_WIDTH: 0.47928
G1 F8250.069
G2 X19.3 Y130.887 I-.027 J.046 E.00753
G1 X112.469 Y243.418 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X111.436 Y242.159 E.05236
G1 X118.094 Y235.501 E.30281
G1 X109.445 Y224.96 E.43845
G1 X102.786 Y231.619 E.30281
G1 X103.819 Y232.878 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8843.478
G1 X102.786 Y231.619 E-.61876
G1 X103.049 Y231.356 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/75
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
G17
G3 Z14.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
M73 P79 R10
G1 X112.421 Y245.3 E.36427
G1 X18.397 Y130.742 E4.76567
G1 X141.733 Y29.148 E5.13831
G1 X184.993 Y81.862 E2.19284
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X112.367 Y245.853 E.36078
G1 X17.845 Y130.688 E4.43781
G1 X141.787 Y28.595 E4.783
G1 X141.867 Y28.694 E.00379
G1 X185.544 Y81.916 E2.0508
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.561 Y138.714 Z14.6 F30000
G1 X26.928 Y140.531 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40086
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F3000
G1 X142.782 Y31.008 E7.9469
G1 X142.495 Y30.659 E.02253
G1 X26.788 Y140.042 E7.93678
G2 X26.5 Y139.694 I-34.623 J28.368 E.02252
G1 X142.208 Y30.31 E7.93688
G1 X141.921 Y29.96 E.02253
G1 X26.212 Y139.346 E7.93699
G1 X25.923 Y138.998 E.02252
G1 X139.401 Y31.723 E7.78386
G1 X134.296 Y35.929 E.32969
G1 X25.635 Y138.651 E7.45347
G1 X25.347 Y138.303 E.02252
G1 X129.191 Y40.134 E7.12308
G1 X124.086 Y44.34 E.32969
G1 X25.058 Y137.955 E6.79269
G3 X24.771 Y137.606 I24.218 J-20.264 E.02253
G1 X118.981 Y48.545 E6.46224
G1 X113.876 Y52.751 E.32969
G1 X24.485 Y137.256 E6.13169
G1 X24.199 Y136.906 E.02253
G1 X108.771 Y56.956 E5.80114
G1 X103.666 Y61.162 E.32969
G1 X23.913 Y136.556 E5.47059
G1 X23.627 Y136.206 E.02253
G1 X98.561 Y65.367 E5.14005
G1 X93.456 Y69.573 E.32969
G1 X23.34 Y135.856 E4.8095
G1 X23.054 Y135.506 E.02253
G1 X88.351 Y73.778 E4.47895
G1 X83.246 Y77.984 E.32969
G1 X22.768 Y135.156 E4.1484
G1 X22.482 Y134.806 E.02253
G1 X78.141 Y82.19 E3.81785
G1 X73.036 Y86.395 E.32969
G1 X22.196 Y134.456 E3.4873
G1 X21.91 Y134.106 E.02253
G1 X67.931 Y90.601 E3.15675
G1 X62.826 Y94.806 E.32969
G1 X21.624 Y133.756 E2.8262
G1 X21.338 Y133.406 E.02253
G1 X57.721 Y99.012 E2.49565
G1 X52.616 Y103.217 E.32969
G1 X21.052 Y133.056 E2.1651
G1 X20.766 Y132.706 E.02253
G1 X47.511 Y107.423 E1.83455
G1 X42.406 Y111.628 E.32969
G1 X20.48 Y132.356 E1.504
G1 X20.194 Y132.006 E.02253
G1 X37.301 Y115.834 E1.17346
G1 X32.196 Y120.039 E.32969
G1 X19.908 Y131.656 E.84291
G1 X19.622 Y131.306 E.02253
G1 X27.203 Y124.139 E.52003
M73 P79 R9
G2 X22.02 Y128.418 I353.9 J433.916 E.33502
G1 X19.188 Y131.096 E.19426
M106 S102
G1 X112.459 Y244.909 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.382986
; LAYER_HEIGHT: 0.2
G1 F10586.203
M73 P80 R9
G1 X26.507 Y140.178 E3.63951
G3 X18.965 Y130.986 I1290.407 J-1066.434 E.31939
G1 X18.926 Y130.794 E.00527
G1 X21.569 Y128.461 E.0947
G1 X113.542 Y244.16 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40086
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F3000
G1 X120.366 Y237.708 E.46811
G1 X120.08 Y237.359 E.02253
G1 X112.518 Y244.508 E.51872
G1 X112.231 Y244.158 E.02253
G1 X119.793 Y237.01 E.51872
G1 X119.506 Y236.66 E.02253
G1 X111.944 Y243.809 E.51872
G1 X111.657 Y243.46 E.02253
G1 X119.22 Y236.311 E.51872
G1 X118.933 Y235.961 E.02253
G1 X111.371 Y243.11 E.51872
G1 X111.084 Y242.761 E.02253
G1 X118.646 Y235.612 E.51872
G1 X118.359 Y235.263 E.02253
G1 X110.797 Y242.412 E.51872
G1 X110.511 Y242.062 E.02253
G1 X118.073 Y234.913 E.51872
G1 X117.786 Y234.564 E.02253
M73 P81 R9
G1 X110.224 Y241.713 E.51872
G1 X109.937 Y241.363 E.02253
G1 X117.499 Y234.215 E.51872
G1 X117.213 Y233.865 E.02253
G1 X109.65 Y241.014 E.51872
G1 X109.364 Y240.665 E.02253
G1 X116.926 Y233.516 E.51872
G1 X116.639 Y233.166 E.02253
G1 X109.077 Y240.315 E.51872
G1 X108.79 Y239.966 E.02253
G1 X116.352 Y232.817 E.51872
G1 X116.066 Y232.468 E.02253
G1 X108.504 Y239.616 E.51872
G1 X108.217 Y239.267 E.02253
G1 X115.779 Y232.118 E.51872
G1 X115.492 Y231.769 E.02253
G1 X107.93 Y238.918 E.51872
G1 X107.643 Y238.568 E.02253
G1 X115.206 Y231.419 E.51872
G1 X114.919 Y231.07 E.02253
G1 X107.357 Y238.219 E.51872
G1 X107.07 Y237.87 E.02253
G1 X114.632 Y230.721 E.51872
G1 X114.345 Y230.371 E.02253
G1 X106.783 Y237.52 E.51872
G1 X106.496 Y237.171 E.02253
G1 X114.059 Y230.022 E.51872
G1 X113.772 Y229.673 E.02253
G1 X106.21 Y236.821 E.51872
G1 X105.923 Y236.472 E.02253
G1 X113.485 Y229.323 E.51872
G1 X113.198 Y228.974 E.02253
G1 X105.636 Y236.123 E.51872
G1 X105.35 Y235.773 E.02253
G1 X112.912 Y228.624 E.51872
G1 X112.625 Y228.275 E.02253
G1 X105.063 Y235.424 E.51872
G1 X104.776 Y235.074 E.02253
G1 X112.338 Y227.926 E.51872
G1 X112.052 Y227.576 E.02253
G1 X104.489 Y234.725 E.51872
G1 X104.203 Y234.376 E.02253
G1 X111.765 Y227.227 E.51872
G1 X111.478 Y226.877 E.02253
G1 X103.916 Y234.026 E.51872
G1 X103.629 Y233.677 E.02253
G1 X111.191 Y226.528 E.51872
G1 X110.905 Y226.179 E.02253
G1 X103.343 Y233.328 E.51872
G1 X103.056 Y232.978 E.02253
G1 X110.618 Y225.829 E.51872
G1 X110.331 Y225.48 E.02253
G1 X102.769 Y232.629 E.51872
G1 X102.482 Y232.279 E.02253
G1 X110.045 Y225.131 E.51872
G1 X109.758 Y224.781 E.02253
G1 X102.196 Y231.93 E.51872
G1 X101.909 Y231.581 E.02253
G1 X109.471 Y224.432 E.51872
G1 X109.184 Y224.082 E.02253
G1 X101.622 Y231.231 E.51872
G1 X101.336 Y230.882 E.02253
G1 X108.898 Y223.733 E.51872
G1 X108.611 Y223.384 E.02253
G1 X101.049 Y230.532 E.51872
G1 X100.762 Y230.183 E.02253
G1 X108.324 Y223.034 E.51872
G1 X108.038 Y222.685 E.02253
G1 X100.475 Y229.834 E.51872
G1 X100.189 Y229.484 E.02253
G1 X107.751 Y222.335 E.51872
G1 X107.464 Y221.986 E.02253
G1 X99.902 Y229.135 E.51872
G1 X99.615 Y228.786 E.02253
G1 X107.177 Y221.637 E.51872
G1 X106.891 Y221.287 E.02253
G1 X99.328 Y228.436 E.51872
G1 X99.042 Y228.087 E.02253
G1 X106.604 Y220.938 E.51872
G1 X106.317 Y220.589 E.02253
G1 X98.755 Y227.737 E.51872
G1 X98.468 Y227.388 E.02253
G1 X106.03 Y220.239 E.51872
G1 X105.744 Y219.89 E.02253
G1 X98.182 Y227.039 E.51872
G1 X97.895 Y226.689 E.02253
G1 X105.457 Y219.54 E.51872
G1 X105.17 Y219.191 E.02253
G1 X97.608 Y226.34 E.51872
G1 X97.321 Y225.991 E.02253
G1 X104.884 Y218.842 E.51872
G1 X104.597 Y218.492 E.02253
G1 X97.035 Y225.641 E.51872
G1 X96.748 Y225.292 E.02253
G1 X104.31 Y218.143 E.51872
G1 X104.023 Y217.794 E.02253
G1 X96.461 Y224.942 E.51872
G1 X96.175 Y224.593 E.02253
G1 X103.737 Y217.444 E.51872
G1 X103.45 Y217.095 E.02253
G1 X95.888 Y224.244 E.51872
G1 X95.601 Y223.894 E.02253
G1 X103.163 Y216.745 E.51872
G1 X102.877 Y216.396 E.02253
G1 X95.314 Y223.545 E.51872
G1 X95.028 Y223.195 E.02253
G1 X102.59 Y216.047 E.51872
G1 X102.303 Y215.697 E.02253
G1 X94.741 Y222.846 E.51872
G1 X94.454 Y222.497 E.02253
G1 X102.016 Y215.348 E.51872
G1 X101.73 Y214.998 E.02253
G1 X94.168 Y222.147 E.51872
G1 X93.881 Y221.798 E.02253
G1 X101.443 Y214.649 E.51872
M73 P81 R8
G1 X101.156 Y214.3 E.02253
G1 X93.594 Y221.449 E.51872
G1 X93.307 Y221.099 E.02253
G1 X100.87 Y213.95 E.51872
G1 X100.583 Y213.601 E.02253
G1 X93.021 Y220.75 E.51872
G1 X92.734 Y220.4 E.02253
G1 X100.296 Y213.252 E.51872
G1 X100.009 Y212.902 E.02253
G1 X92.447 Y220.051 E.51872
G1 X92.161 Y219.702 E.02253
G1 X99.723 Y212.553 E.51872
G1 X99.436 Y212.203 E.02253
G1 X91.874 Y219.352 E.51872
G1 X91.587 Y219.003 E.02253
G1 X99.149 Y211.854 E.51872
G1 X98.862 Y211.505 E.02253
G1 X91.3 Y218.653 E.51872
G1 X91.014 Y218.304 E.02253
G1 X98.576 Y211.155 E.51872
G1 X98.289 Y210.806 E.02253
G1 X90.727 Y217.955 E.51872
G1 X90.44 Y217.605 E.02253
G1 X98.002 Y210.456 E.51872
G1 X97.716 Y210.107 E.02253
G1 X90.153 Y217.256 E.51872
G1 X89.867 Y216.907 E.02253
G1 X97.429 Y209.758 E.51872
G1 X97.142 Y209.408 E.02253
G1 X89.58 Y216.557 E.51872
G1 X89.293 Y216.208 E.02253
G1 X96.855 Y209.059 E.51872
G1 X96.569 Y208.71 E.02253
G1 X89.007 Y215.858 E.51872
G1 X88.72 Y215.509 E.02253
G1 X96.282 Y208.36 E.51872
G1 X95.995 Y208.011 E.02253
G1 X88.433 Y215.16 E.51872
G1 X88.146 Y214.81 E.02253
G1 X95.709 Y207.661 E.51872
G1 X95.422 Y207.312 E.02253
G1 X87.86 Y214.461 E.51872
G1 X87.573 Y214.111 E.02253
G1 X95.135 Y206.963 E.51872
G1 X94.848 Y206.613 E.02253
G1 X87.286 Y213.762 E.51872
G1 X87 Y213.413 E.02253
G1 X94.562 Y206.264 E.51872
G1 X94.275 Y205.914 E.02253
G1 X86.713 Y213.063 E.51872
G1 X86.426 Y212.714 E.02253
G1 X93.988 Y205.565 E.51872
G1 X93.702 Y205.216 E.02253
G1 X86.139 Y212.365 E.51872
G1 X85.853 Y212.015 E.02253
G1 X93.415 Y204.866 E.51872
G1 X93.128 Y204.517 E.02253
G1 X85.566 Y211.666 E.51872
G1 X85.279 Y211.316 E.02253
G1 X92.841 Y204.168 E.51872
G1 X92.555 Y203.818 E.02253
G1 X84.993 Y210.967 E.51872
G1 X84.706 Y210.618 E.02253
G1 X92.268 Y203.469 E.51872
M73 P82 R8
G1 X91.981 Y203.119 E.02253
G1 X84.419 Y210.268 E.51872
G1 X84.132 Y209.919 E.02253
G1 X91.694 Y202.77 E.51872
G1 X91.408 Y202.421 E.02253
G1 X83.846 Y209.569 E.51872
G1 X83.559 Y209.22 E.02253
G1 X91.121 Y202.071 E.51872
G1 X90.834 Y201.722 E.02253
G1 X83.272 Y208.871 E.51872
G1 X82.985 Y208.521 E.02253
G1 X90.548 Y201.372 E.51872
G1 X90.261 Y201.023 E.02253
G1 X82.699 Y208.172 E.51872
G1 X82.412 Y207.823 E.02253
G1 X89.974 Y200.674 E.51872
G1 X89.687 Y200.324 E.02253
G1 X82.125 Y207.473 E.51872
G1 X81.839 Y207.124 E.02253
G1 X89.401 Y199.975 E.51872
G1 X89.114 Y199.626 E.02253
G1 X81.552 Y206.774 E.51872
G1 X81.265 Y206.425 E.02253
G1 X88.827 Y199.276 E.51872
G1 X88.541 Y198.927 E.02253
G1 X80.978 Y206.076 E.51872
G1 X80.692 Y205.726 E.02253
G1 X88.254 Y198.577 E.51872
G1 X87.967 Y198.228 E.02253
G1 X80.405 Y205.377 E.51872
G1 X80.118 Y205.027 E.02253
G1 X87.68 Y197.879 E.51872
G1 X87.394 Y197.529 E.02253
G1 X79.832 Y204.678 E.51872
G1 X79.545 Y204.329 E.02253
G1 X87.107 Y197.18 E.51872
G1 X86.82 Y196.83 E.02253
G1 X79.258 Y203.979 E.51872
G1 X78.971 Y203.63 E.02253
G1 X86.534 Y196.481 E.51872
G1 X86.247 Y196.132 E.02253
G1 X78.685 Y203.281 E.51872
G1 X78.398 Y202.931 E.02253
G1 X85.96 Y195.782 E.51872
G1 X85.673 Y195.433 E.02253
G1 X78.111 Y202.582 E.51872
G1 X77.825 Y202.232 E.02253
G1 X85.387 Y195.084 E.51872
G1 X85.1 Y194.734 E.02253
G1 X77.538 Y201.883 E.51872
G1 X77.251 Y201.534 E.02253
G1 X84.813 Y194.385 E.51872
G1 X84.526 Y194.035 E.02253
G1 X76.964 Y201.184 E.51872
G1 X76.678 Y200.835 E.02253
G1 X84.24 Y193.686 E.51872
G1 X83.953 Y193.337 E.02253
G1 X76.391 Y200.486 E.51872
G1 X76.104 Y200.136 E.02253
G1 X83.666 Y192.987 E.51872
G1 X83.38 Y192.638 E.02253
G1 X75.817 Y199.787 E.51872
G1 X75.531 Y199.437 E.02253
G1 X83.093 Y192.289 E.51872
G1 X82.806 Y191.939 E.02253
G1 X75.244 Y199.088 E.51872
G1 X74.957 Y198.739 E.02253
G1 X82.519 Y191.59 E.51872
G1 X82.233 Y191.24 E.02253
G1 X74.671 Y198.389 E.51872
G1 X74.384 Y198.04 E.02253
G1 X81.946 Y190.891 E.51872
G1 X81.659 Y190.542 E.02253
G1 X74.097 Y197.69 E.51872
G1 X73.81 Y197.341 E.02253
G1 X81.373 Y190.192 E.51872
G1 X81.086 Y189.843 E.02253
G1 X73.524 Y196.992 E.51872
G1 X73.237 Y196.642 E.02253
G1 X80.799 Y189.493 E.51872
G1 X80.512 Y189.144 E.02253
G1 X72.95 Y196.293 E.51872
G1 X72.664 Y195.944 E.02253
G1 X80.226 Y188.795 E.51872
G1 X79.939 Y188.445 E.02253
G1 X72.377 Y195.594 E.51872
G1 X72.09 Y195.245 E.02253
G1 X79.652 Y188.096 E.51872
G1 X79.366 Y187.747 E.02253
G1 X71.803 Y194.895 E.51872
G1 X71.517 Y194.546 E.02253
G1 X79.079 Y187.397 E.51872
G1 X78.792 Y187.048 E.02253
G1 X71.23 Y194.197 E.51872
G1 X70.943 Y193.847 E.02253
G1 X78.505 Y186.698 E.51872
G1 X78.219 Y186.349 E.02253
G1 X70.657 Y193.498 E.51872
G1 X70.37 Y193.148 E.02253
G1 X77.932 Y186 E.51872
G1 X77.645 Y185.65 E.02253
G1 X70.083 Y192.799 E.51872
G1 X69.796 Y192.45 E.02253
G1 X77.358 Y185.301 E.51872
G1 X77.072 Y184.951 E.02253
G1 X69.51 Y192.1 E.51872
G1 X69.223 Y191.751 E.02253
G1 X76.785 Y184.602 E.51872
G1 X76.498 Y184.253 E.02253
G1 X68.936 Y191.402 E.51872
G1 X68.649 Y191.052 E.02253
G1 X76.212 Y183.903 E.51872
G1 X75.925 Y183.554 E.02253
G1 X68.363 Y190.703 E.51872
G1 X68.076 Y190.353 E.02253
G1 X75.638 Y183.205 E.51872
G1 X75.351 Y182.855 E.02253
G1 X67.789 Y190.004 E.51872
G1 X67.503 Y189.655 E.02253
G1 X75.065 Y182.506 E.51872
G1 X74.778 Y182.156 E.02253
G1 X67.216 Y189.305 E.51872
G1 X66.929 Y188.956 E.02253
G1 X74.491 Y181.807 E.51872
G1 X74.205 Y181.458 E.02253
G1 X66.642 Y188.606 E.51872
G1 X66.356 Y188.257 E.02253
G1 X73.918 Y181.108 E.51872
G1 X73.631 Y180.759 E.02253
G1 X66.069 Y187.908 E.51872
G1 X65.782 Y187.558 E.02253
G1 X73.344 Y180.409 E.51872
G1 X73.058 Y180.06 E.02253
G1 X65.496 Y187.209 E.51872
G1 X65.209 Y186.86 E.02253
G1 X72.771 Y179.711 E.51872
G1 X72.484 Y179.361 E.02253
G1 X64.922 Y186.51 E.51872
G1 X64.635 Y186.161 E.02253
G1 X72.198 Y179.012 E.51872
G1 X71.911 Y178.663 E.02253
G1 X64.349 Y185.811 E.51872
G1 X64.062 Y185.462 E.02253
G1 X71.624 Y178.313 E.51872
G1 X71.337 Y177.964 E.02253
G1 X63.775 Y185.113 E.51872
G1 X63.489 Y184.763 E.02253
G1 X71.051 Y177.614 E.51872
G1 X70.764 Y177.265 E.02253
G1 X63.202 Y184.414 E.51872
G1 X62.915 Y184.064 E.02253
G1 X70.477 Y176.916 E.51872
G1 X70.19 Y176.566 E.02253
G1 X62.628 Y183.715 E.51872
G1 X62.342 Y183.366 E.02253
G1 X69.904 Y176.217 E.51872
G1 X69.617 Y175.867 E.02253
G1 X62.055 Y183.016 E.51872
G1 X61.768 Y182.667 E.02253
G1 X69.33 Y175.518 E.51872
G1 X69.044 Y175.169 E.02253
G1 X61.481 Y182.318 E.51872
G1 X61.195 Y181.968 E.02253
G1 X68.757 Y174.819 E.51872
G1 X68.47 Y174.47 E.02253
G1 X60.908 Y181.619 E.51872
G1 X60.621 Y181.269 E.02253
G1 X68.183 Y174.121 E.51872
G1 X67.897 Y173.771 E.02253
G1 X60.335 Y180.92 E.51872
G1 X60.048 Y180.571 E.02253
G1 X67.61 Y173.422 E.51872
G1 X67.323 Y173.072 E.02253
G1 X59.761 Y180.221 E.51872
G1 X59.474 Y179.872 E.02253
G1 X67.037 Y172.723 E.51872
G1 X66.75 Y172.374 E.02253
G1 X59.188 Y179.522 E.51872
G1 X58.901 Y179.173 E.02253
G1 X66.463 Y172.024 E.51872
G1 X66.176 Y171.675 E.02253
G1 X58.614 Y178.824 E.51872
G1 X58.328 Y178.474 E.02253
G1 X65.89 Y171.325 E.51872
G1 X65.603 Y170.976 E.02253
G1 X58.041 Y178.125 E.51872
G1 X57.754 Y177.776 E.02253
G1 X65.316 Y170.627 E.51872
G1 X65.03 Y170.277 E.02253
G1 X57.467 Y177.426 E.51872
G1 X57.181 Y177.077 E.02253
G1 X64.743 Y169.928 E.51872
G1 X64.456 Y169.579 E.02253
G1 X56.894 Y176.727 E.51872
G1 X56.607 Y176.378 E.02253
G1 X64.169 Y169.229 E.51872
G1 X63.883 Y168.88 E.02253
G1 X56.321 Y176.029 E.51872
G1 X56.034 Y175.679 E.02253
G1 X63.596 Y168.53 E.51872
G1 X63.309 Y168.181 E.02253
G1 X55.747 Y175.33 E.51872
G1 X55.46 Y174.98 E.02253
G1 X63.022 Y167.832 E.51872
G1 X62.736 Y167.482 E.02253
G1 X55.174 Y174.631 E.51872
G1 X54.887 Y174.282 E.02253
G1 X62.449 Y167.133 E.51872
G1 X62.162 Y166.784 E.02253
G1 X54.6 Y173.932 E.51872
G1 X54.313 Y173.583 E.02253
G1 X61.876 Y166.434 E.51872
G1 X61.589 Y166.085 E.02253
G1 X54.027 Y173.234 E.51872
G1 X53.74 Y172.884 E.02253
G1 X61.302 Y165.735 E.51872
G1 X61.015 Y165.386 E.02253
G1 X53.453 Y172.535 E.51872
G1 X53.167 Y172.185 E.02253
G1 X60.729 Y165.037 E.51872
G1 X60.442 Y164.687 E.02253
G1 X52.88 Y171.836 E.51872
G1 X52.593 Y171.487 E.02253
G1 X60.155 Y164.338 E.51872
G1 X59.869 Y163.988 E.02253
G1 X52.306 Y171.137 E.51872
G1 X52.02 Y170.788 E.02253
G1 X59.582 Y163.639 E.51872
G1 X59.295 Y163.29 E.02253
G1 X51.733 Y170.439 E.51872
G1 X51.446 Y170.089 E.02253
G1 X59.008 Y162.94 E.51872
G1 X58.722 Y162.591 E.02253
G1 X51.16 Y169.74 E.51872
G1 X50.873 Y169.39 E.02253
G1 X58.435 Y162.242 E.51872
G1 X58.148 Y161.892 E.02253
G1 X50.586 Y169.041 E.51872
G1 X50.299 Y168.692 E.02253
G1 X57.862 Y161.543 E.51872
G1 X57.575 Y161.193 E.02253
G1 X50.013 Y168.342 E.51872
G1 X49.726 Y167.993 E.02253
G1 X57.288 Y160.844 E.51872
G1 X57.001 Y160.495 E.02253
G1 X49.439 Y167.643 E.51872
G1 X49.153 Y167.294 E.02253
G1 X56.715 Y160.145 E.51872
G1 X56.428 Y159.796 E.02253
G1 X48.866 Y166.945 E.51872
G1 X48.579 Y166.595 E.02253
G1 X56.141 Y159.446 E.51872
G1 X55.854 Y159.097 E.02253
G1 X48.292 Y166.246 E.51872
G1 X48.006 Y165.897 E.02253
G1 X55.568 Y158.748 E.51872
G1 X55.281 Y158.398 E.02253
G1 X47.719 Y165.547 E.51872
G1 X47.432 Y165.198 E.02253
G1 X54.994 Y158.049 E.51872
G1 X54.708 Y157.7 E.02253
G1 X47.145 Y164.848 E.51872
G1 X46.859 Y164.499 E.02253
G1 X54.421 Y157.35 E.51872
G1 X54.134 Y157.001 E.02253
G1 X46.572 Y164.15 E.51872
M73 P83 R8
G1 X46.285 Y163.8 E.02253
G1 X53.847 Y156.651 E.51872
G1 X53.561 Y156.302 E.02253
G1 X45.999 Y163.451 E.51872
G1 X45.712 Y163.101 E.02253
G1 X53.274 Y155.953 E.51872
G1 X52.987 Y155.603 E.02253
G1 X45.425 Y162.752 E.51872
G1 X45.138 Y162.403 E.02253
G1 X52.701 Y155.254 E.51872
G1 X52.414 Y154.904 E.02253
G1 X44.852 Y162.053 E.51872
G1 X44.565 Y161.704 E.02253
G1 X52.127 Y154.555 E.51872
G1 X51.84 Y154.206 E.02253
G1 X44.278 Y161.355 E.51872
G1 X43.992 Y161.005 E.02253
G1 X51.554 Y153.856 E.51872
G1 X51.267 Y153.507 E.02253
G1 X43.705 Y160.656 E.51872
G1 X43.418 Y160.306 E.02253
G1 X50.98 Y153.158 E.51872
G1 X50.694 Y152.808 E.02253
G1 X43.131 Y159.957 E.51872
G1 X42.845 Y159.608 E.02253
G1 X50.407 Y152.459 E.51872
G1 X50.12 Y152.109 E.02253
G1 X42.558 Y159.258 E.51872
G1 X42.271 Y158.909 E.02253
G1 X49.833 Y151.76 E.51872
G1 X49.547 Y151.411 E.02253
G1 X41.985 Y158.559 E.51872
G1 X41.698 Y158.21 E.02253
G1 X49.26 Y151.061 E.51872
G1 X48.973 Y150.712 E.02253
G1 X41.411 Y157.861 E.51872
G1 X41.124 Y157.511 E.02253
G1 X48.686 Y150.362 E.51872
G1 X48.4 Y150.013 E.02253
G1 X40.838 Y157.162 E.51872
G1 X40.551 Y156.813 E.02253
G1 X48.113 Y149.664 E.51872
G1 X47.826 Y149.314 E.02253
G1 X40.264 Y156.463 E.51872
G1 X39.977 Y156.114 E.02253
G1 X47.54 Y148.965 E.51872
G1 X47.253 Y148.616 E.02253
G1 X39.691 Y155.764 E.51872
G1 X39.404 Y155.415 E.02253
G1 X46.966 Y148.266 E.51872
G1 X46.679 Y147.917 E.02253
G1 X39.117 Y155.066 E.51872
G1 X38.831 Y154.716 E.02253
G1 X46.393 Y147.567 E.51872
G1 X46.106 Y147.218 E.02253
G1 X38.544 Y154.367 E.51872
G1 X38.257 Y154.017 E.02253
G1 X45.819 Y146.869 E.51872
G1 X45.533 Y146.519 E.02253
G1 X37.97 Y153.668 E.51872
G1 X37.684 Y153.319 E.02253
G1 X45.246 Y146.17 E.51872
G1 X44.959 Y145.82 E.02253
G1 X37.397 Y152.969 E.51872
G1 X37.11 Y152.62 E.02253
G1 X44.672 Y145.471 E.51872
G1 X44.386 Y145.122 E.02253
G1 X36.824 Y152.271 E.51872
G1 X36.537 Y151.921 E.02253
G1 X44.099 Y144.772 E.51872
G1 X43.812 Y144.423 E.02253
G1 X36.25 Y151.572 E.51872
G1 X35.963 Y151.222 E.02253
G1 X43.526 Y144.074 E.51872
G1 X43.239 Y143.724 E.02253
G1 X35.677 Y150.873 E.51872
G1 X35.39 Y150.524 E.02253
G1 X42.952 Y143.375 E.51872
G1 X42.665 Y143.025 E.02253
G1 X35.103 Y150.174 E.51872
G1 X34.817 Y149.825 E.02253
G1 X42.379 Y142.676 E.51872
G1 X42.092 Y142.327 E.02253
G1 X34.53 Y149.475 E.51872
G1 X34.243 Y149.126 E.02253
G1 X41.805 Y141.977 E.51872
G1 X41.518 Y141.628 E.02253
G1 X33.956 Y148.777 E.51872
G1 X33.67 Y148.427 E.02253
G1 X41.232 Y141.279 E.51872
G1 X40.945 Y140.929 E.02253
G1 X33.383 Y148.078 E.51872
G1 X33.096 Y147.729 E.02253
G1 X40.658 Y140.58 E.51872
G1 X40.372 Y140.23 E.02253
G1 X32.809 Y147.379 E.51872
G1 X32.523 Y147.03 E.02253
G1 X40.085 Y139.881 E.51872
G1 X39.798 Y139.532 E.02253
G1 X32.236 Y146.68 E.51872
G1 X31.949 Y146.331 E.02253
G1 X39.511 Y139.182 E.51872
G1 X39.225 Y138.833 E.02253
G1 X31.663 Y145.982 E.51872
G1 X31.376 Y145.632 E.02253
G1 X38.938 Y138.483 E.51872
G1 X38.651 Y138.134 E.02253
G1 X31.089 Y145.283 E.51872
G1 X30.802 Y144.934 E.02253
G1 X38.365 Y137.785 E.51872
G1 X38.078 Y137.435 E.02253
G1 X30.516 Y144.584 E.51872
G1 X30.229 Y144.235 E.02253
G1 X37.791 Y137.086 E.51872
G1 X37.504 Y136.737 E.02253
G1 X29.942 Y143.885 E.51872
G1 X29.656 Y143.536 E.02253
G1 X37.218 Y136.387 E.51872
G1 X36.931 Y136.038 E.02253
G1 X29.369 Y143.187 E.51872
G1 X29.082 Y142.837 E.02253
G1 X36.644 Y135.688 E.51872
G1 X36.358 Y135.339 E.02253
G1 X28.795 Y142.488 E.51872
G1 X28.509 Y142.138 E.02253
G1 X36.071 Y134.99 E.51872
G1 X35.784 Y134.64 E.02253
G1 X28.222 Y141.789 E.51872
G1 X27.935 Y141.44 E.02253
G1 X35.497 Y134.291 E.51872
G1 X35.211 Y133.941 E.02253
G1 X27.649 Y141.09 E.51872
G1 X27.362 Y140.741 E.02253
G1 X143.068 Y31.358 E7.93678
G1 X143.355 Y31.707 E.02253
G1 X38.713 Y130.63 E7.17781
G1 X43.818 Y126.425 E.32969
G1 X143.642 Y32.057 E6.84731
G1 X143.928 Y32.406 E.02253
G1 X48.923 Y122.219 E6.5168
G1 X54.028 Y118.014 E.32969
G1 X144.215 Y32.755 E6.1863
G1 X144.502 Y33.105 E.02253
G1 X59.133 Y113.808 E5.85579
G1 X64.238 Y109.602 E.32969
G1 X144.789 Y33.454 E5.52529
G1 X145.075 Y33.803 E.02253
G1 X69.343 Y105.397 E5.19478
G1 X74.448 Y101.191 E.32969
G1 X145.362 Y34.153 E4.86428
G1 X145.649 Y34.502 E.02253
G1 X79.553 Y96.986 E4.53377
G1 X84.658 Y92.78 E.32969
G1 X145.935 Y34.852 E4.20327
G1 X146.222 Y35.201 E.02253
G1 X89.763 Y88.575 E3.87277
G1 X94.868 Y84.369 E.32969
G1 X146.509 Y35.55 E3.54226
G1 X146.796 Y35.9 E.02253
G1 X99.973 Y80.164 E3.21176
G1 X105.078 Y75.958 E.32969
G1 X147.082 Y36.249 E2.88125
G1 X147.369 Y36.599 E.02253
G1 X110.183 Y71.752 E2.55075
G1 X115.288 Y67.547 E.32969
G1 X147.656 Y36.948 E2.22024
G1 X147.943 Y37.297 E.02253
G1 X120.393 Y63.341 E1.88974
G1 X125.498 Y59.136 E.32969
G1 X148.229 Y37.647 E1.55923
G1 X148.516 Y37.996 E.02253
G1 X130.603 Y54.93 E1.22873
G1 X135.708 Y50.725 E.32969
G1 X148.803 Y38.345 E.89823
G1 X149.089 Y38.695 E.02253
G1 X140.813 Y46.519 E.56772
G1 X142.595 Y45.051 E.11507
G1 X142.781 Y45.279 E.01467
G1 X149.376 Y39.044 E.45237
G1 X149.663 Y39.394 E.02253
G1 X143.068 Y45.628 E.45237
G1 X143.355 Y45.977 E.02253
G1 X149.95 Y39.743 E.45237
G1 X150.236 Y40.092 E.02253
M73 P83 R7
G1 X143.641 Y46.327 E.45237
G1 X143.928 Y46.676 E.02253
G1 X150.523 Y40.442 E.45237
G1 X150.81 Y40.791 E.02253
G1 X144.215 Y47.026 E.45237
M73 P84 R7
G1 X144.502 Y47.375 E.02253
G1 X151.096 Y41.141 E.45237
G1 X151.383 Y41.49 E.02253
G1 X144.788 Y47.724 E.45237
G1 X145.075 Y48.074 E.02253
G1 X151.67 Y41.839 E.45237
G1 X151.957 Y42.189 E.02253
G1 X145.362 Y48.423 E.45237
G1 X145.648 Y48.773 E.02253
G1 X152.243 Y42.538 E.45237
G1 X152.53 Y42.887 E.02253
G1 X145.935 Y49.122 E.45237
G1 X146.222 Y49.471 E.02253
G1 X152.817 Y43.237 E.45237
G1 X153.103 Y43.586 E.02253
G1 X146.509 Y49.821 E.45237
G1 X146.795 Y50.17 E.02253
G1 X153.39 Y43.936 E.45237
G1 X153.677 Y44.285 E.02253
G1 X147.082 Y50.519 E.45237
G1 X147.369 Y50.869 E.02253
G1 X153.964 Y44.634 E.45237
G1 X154.25 Y44.984 E.02253
G1 X147.656 Y51.218 E.45237
G1 X147.942 Y51.568 E.02253
G1 X154.537 Y45.333 E.45237
G1 X154.824 Y45.683 E.02253
G1 X148.229 Y51.917 E.45237
G1 X148.516 Y52.266 E.02253
G1 X155.111 Y46.032 E.45237
G1 X155.397 Y46.381 E.02253
G1 X148.802 Y52.616 E.45237
G1 X149.089 Y52.965 E.02253
G1 X155.684 Y46.731 E.45237
G1 X155.971 Y47.08 E.02253
G1 X149.376 Y53.315 E.45237
G1 X149.663 Y53.664 E.02253
G1 X156.257 Y47.429 E.45237
G1 X156.544 Y47.779 E.02253
G1 X149.949 Y54.013 E.45237
G1 X150.236 Y54.363 E.02253
G1 X156.831 Y48.128 E.45237
G1 X157.118 Y48.478 E.02253
G1 X150.523 Y54.712 E.45237
G1 X150.809 Y55.061 E.02253
G1 X157.404 Y48.827 E.45237
G1 X157.691 Y49.176 E.02253
G1 X151.096 Y55.411 E.45237
G1 X151.383 Y55.76 E.02253
G1 X157.978 Y49.526 E.45237
M73 P85 R7
G1 X158.264 Y49.875 E.02253
G1 X151.67 Y56.11 E.45237
G1 X151.956 Y56.459 E.02253
G1 X158.551 Y50.225 E.45237
G1 X158.838 Y50.574 E.02253
G1 X152.243 Y56.808 E.45237
G1 X152.53 Y57.158 E.02253
G1 X159.125 Y50.923 E.45237
G1 X159.411 Y51.273 E.02253
G1 X152.816 Y57.507 E.45237
G1 X153.103 Y57.856 E.02253
G1 X159.698 Y51.622 E.45237
G1 X159.985 Y51.971 E.02253
G1 X153.39 Y58.206 E.45237
G1 X153.677 Y58.555 E.02253
G1 X160.271 Y52.321 E.45237
G1 X160.558 Y52.67 E.02253
G1 X153.963 Y58.905 E.45237
G1 X154.25 Y59.254 E.02253
G1 X160.845 Y53.02 E.45237
G1 X161.132 Y53.369 E.02253
G1 X154.537 Y59.603 E.45237
G1 X154.824 Y59.953 E.02253
G1 X161.418 Y53.718 E.45237
G1 X161.705 Y54.068 E.02253
G1 X155.11 Y60.302 E.45237
G1 X155.397 Y60.652 E.02253
G1 X161.992 Y54.417 E.45237
G1 X162.279 Y54.767 E.02253
G1 X155.684 Y61.001 E.45237
G1 X155.97 Y61.35 E.02253
G1 X162.565 Y55.116 E.45237
G1 X162.852 Y55.465 E.02253
G1 X156.257 Y61.7 E.45237
G1 X156.544 Y62.049 E.02253
G1 X163.139 Y55.815 E.45237
G1 X163.425 Y56.164 E.02253
G1 X156.831 Y62.398 E.45237
G1 X157.117 Y62.748 E.02253
G1 X163.712 Y56.513 E.45237
G1 X163.999 Y56.863 E.02253
G1 X157.404 Y63.097 E.45237
G1 X157.691 Y63.447 E.02253
G1 X164.286 Y57.212 E.45237
G1 X164.572 Y57.562 E.02253
G1 X157.977 Y63.796 E.45237
G1 X158.264 Y64.145 E.02253
G1 X164.859 Y57.911 E.45237
G1 X165.146 Y58.26 E.02253
G1 X158.551 Y64.495 E.45237
G1 X158.838 Y64.844 E.02253
G1 X165.432 Y58.61 E.45237
G1 X165.719 Y58.959 E.02253
G1 X159.124 Y65.194 E.45237
G1 X159.411 Y65.543 E.02253
G1 X166.006 Y59.308 E.45237
G1 X166.293 Y59.658 E.02253
G1 X159.698 Y65.892 E.45237
G1 X159.984 Y66.242 E.02253
G1 X166.579 Y60.007 E.45237
G1 X166.866 Y60.357 E.02253
G1 X160.271 Y66.591 E.45237
G1 X160.558 Y66.94 E.02253
G1 X167.153 Y60.706 E.45237
G1 X167.439 Y61.055 E.02253
G1 X160.845 Y67.29 E.45237
G1 X161.131 Y67.639 E.02253
G1 X167.726 Y61.405 E.45237
G1 X168.013 Y61.754 E.02253
G1 X161.418 Y67.989 E.45237
G1 X161.705 Y68.338 E.02253
G1 X168.3 Y62.104 E.45237
G1 X168.586 Y62.453 E.02253
G1 X161.992 Y68.687 E.45237
G1 X162.278 Y69.037 E.02253
G1 X168.873 Y62.802 E.45237
G1 X169.16 Y63.152 E.02253
G1 X162.565 Y69.386 E.45237
G1 X162.852 Y69.736 E.02253
G1 X169.447 Y63.501 E.45237
G1 X169.733 Y63.85 E.02253
G1 X163.138 Y70.085 E.45237
G1 X163.425 Y70.434 E.02253
G1 X170.02 Y64.2 E.45237
G1 X170.307 Y64.549 E.02253
G1 X163.712 Y70.784 E.45237
G1 X163.999 Y71.133 E.02253
G1 X170.593 Y64.899 E.45237
G1 X170.88 Y65.248 E.02253
G1 X164.285 Y71.482 E.45237
G1 X164.572 Y71.832 E.02253
G1 X171.167 Y65.597 E.45237
G1 X171.454 Y65.947 E.02253
G1 X164.859 Y72.181 E.45237
G1 X165.145 Y72.531 E.02253
G1 X171.74 Y66.296 E.45237
G1 X172.027 Y66.646 E.02253
G1 X165.432 Y72.88 E.45237
G1 X165.719 Y73.229 E.02253
G1 X172.314 Y66.995 E.45237
G1 X172.6 Y67.344 E.02253
G1 X166.006 Y73.579 E.45237
G1 X166.292 Y73.928 E.02253
G1 X172.887 Y67.694 E.45237
G1 X173.174 Y68.043 E.02253
G1 X166.579 Y74.278 E.45237
G1 X166.866 Y74.627 E.02253
G1 X173.461 Y68.392 E.45237
G1 X173.747 Y68.742 E.02253
G1 X167.152 Y74.976 E.45237
G1 X167.439 Y75.326 E.02253
G1 X174.034 Y69.091 E.45237
G1 X174.321 Y69.441 E.02253
G1 X167.726 Y75.675 E.45237
G1 X168.013 Y76.024 E.02253
G1 X174.607 Y69.79 E.45237
G1 X174.894 Y70.139 E.02253
G1 X168.299 Y76.374 E.45237
G1 X168.586 Y76.723 E.02253
G1 X175.181 Y70.489 E.45237
G1 X175.468 Y70.838 E.02253
G1 X168.873 Y77.073 E.45237
G1 X169.16 Y77.422 E.02253
G1 X175.754 Y71.188 E.45237
G1 X176.041 Y71.537 E.02253
G1 X169.446 Y77.771 E.45237
G1 X169.733 Y78.121 E.02253
G1 X176.328 Y71.886 E.45237
G1 X176.615 Y72.236 E.02253
G1 X170.02 Y78.47 E.45237
G1 X170.306 Y78.82 E.02253
G1 X176.901 Y72.585 E.45237
G1 X177.188 Y72.934 E.02253
G1 X170.593 Y79.169 E.45237
G1 X170.88 Y79.518 E.02253
G1 X177.475 Y73.284 E.45237
G1 X177.761 Y73.633 E.02253
G1 X171.167 Y79.868 E.45237
G1 X171.453 Y80.217 E.02253
G1 X178.048 Y73.983 E.45237
G1 X178.335 Y74.332 E.02253
G1 X171.74 Y80.566 E.45237
G1 X172.027 Y80.916 E.02253
G1 X178.622 Y74.681 E.45237
G1 X178.908 Y75.031 E.02253
G1 X172.313 Y81.265 E.45237
G1 X172.6 Y81.615 E.02253
G1 X179.195 Y75.38 E.45237
G1 X179.482 Y75.73 E.02253
G1 X172.887 Y81.964 E.45237
G1 X173.174 Y82.313 E.02253
G1 X179.768 Y76.079 E.45237
G1 X180.055 Y76.428 E.02253
G1 X173.46 Y82.663 E.45237
G1 X173.747 Y83.012 E.02253
G1 X180.342 Y76.778 E.45237
G1 X180.629 Y77.127 E.02253
G1 X174.034 Y83.361 E.45237
G1 X174.32 Y83.711 E.02253
G1 X180.915 Y77.476 E.45237
G1 X181.202 Y77.826 E.02253
G1 X174.607 Y84.06 E.45237
G1 X174.894 Y84.41 E.02253
G1 X181.489 Y78.175 E.45237
G1 X181.775 Y78.525 E.02253
G1 X175.181 Y84.759 E.45237
G1 X175.467 Y85.108 E.02253
G1 X182.062 Y78.874 E.45237
G1 X182.349 Y79.223 E.02253
G1 X175.754 Y85.458 E.45237
G1 X176.041 Y85.807 E.02253
G1 X182.636 Y79.573 E.45237
G1 X182.922 Y79.922 E.02253
G1 X176.328 Y86.157 E.45237
G1 X176.614 Y86.506 E.02253
G1 X183.209 Y80.272 E.45237
G1 X183.496 Y80.621 E.02253
G1 X176.901 Y86.855 E.45237
G1 X177.188 Y87.205 E.02253
G1 X183.783 Y80.97 E.45237
G1 X184.069 Y81.32 E.02253
G1 X177.474 Y87.554 E.45237
G1 X177.486 Y87.568 E.00089
G1 X182.388 Y83.529 E.31662
G1 X184.503 Y81.53 E.14509
M106 S102
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X183.05 Y82.904 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/75
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
G17
G3 Z14.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X112.566 Y245.181 E.35823
G1 X18.659 Y130.755 E4.75997
G1 X141.841 Y29.28 E5.13206
G1 X184.993 Y81.862 E2.18735
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X112.512 Y245.733 E.35519
G1 X18.108 Y130.702 E4.43254
G1 X141.895 Y28.727 E4.7772
G1 X185.544 Y81.916 E2.04951
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X30.814 Y139.179 Z14.8 F30000
G1 X27.425 Y141.179 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42064
G1 F9530.869
G1 X125.109 Y43.495 E4.12186
G1 X122.077 Y45.993 E.11719
G1 X27.305 Y140.765 E3.99902
G1 X27.064 Y140.472 E.01132
G1 X119.046 Y48.49 E3.88127
G1 X116.014 Y50.987 E.11719
G1 X26.823 Y140.178 E3.76351
G1 X26.582 Y139.885 E.01132
G1 X112.983 Y53.484 E3.64576
G1 X109.951 Y55.982 E.11719
G1 X26.342 Y139.591 E3.52801
G1 X26.101 Y139.298 E.01132
G1 X106.92 Y58.479 E3.41025
G1 X103.889 Y60.976 E.11719
G1 X25.86 Y139.005 E3.2925
G1 X25.619 Y138.711 E.01132
G1 X100.857 Y63.473 E3.17474
G1 X97.826 Y65.971 E.11719
G1 X25.379 Y138.418 E3.05699
G1 X25.138 Y138.124 E.01132
G1 X94.794 Y68.468 E2.93924
G1 X91.763 Y70.965 E.11719
G1 X24.897 Y137.831 E2.82148
G1 X24.656 Y137.538 E.01132
G1 X88.731 Y73.462 E2.70373
G1 X85.7 Y75.96 E.11719
M73 P85 R6
G1 X24.415 Y137.244 E2.58597
G1 X24.175 Y136.951 E.01132
G1 X82.669 Y78.457 E2.46822
G1 X79.637 Y80.954 E.11719
G1 X23.934 Y136.657 E2.35047
G1 X23.693 Y136.364 E.01132
G1 X76.606 Y83.451 E2.23271
G1 X73.574 Y85.949 E.11719
G1 X23.452 Y136.071 E2.11496
G1 X23.212 Y135.777 E.01132
G1 X70.543 Y88.446 E1.9972
M73 P86 R6
G1 X67.512 Y90.943 E.11719
G1 X22.971 Y135.484 E1.87945
G1 X22.73 Y135.19 E.01132
G1 X64.48 Y93.44 E1.76169
G1 X61.449 Y95.938 E.11719
G1 X22.489 Y134.897 E1.64394
G1 X22.248 Y134.604 E.01132
G1 X58.417 Y98.435 E1.52619
G1 X55.386 Y100.932 E.11719
G1 X22.008 Y134.31 E1.40843
G1 X21.767 Y134.017 E.01132
G1 X52.354 Y103.429 E1.29068
G1 X49.323 Y105.927 E.11719
G1 X21.526 Y133.723 E1.17292
G1 X21.285 Y133.43 E.01132
G1 X46.292 Y108.424 E1.05517
G1 X43.26 Y110.921 E.11719
G1 X21.044 Y133.137 E.93742
G1 X20.804 Y132.843 E.01132
G1 X40.229 Y113.418 E.81966
G1 X37.197 Y115.915 E.11719
G1 X20.563 Y132.55 E.70191
G1 X20.322 Y132.257 E.01132
G1 X34.166 Y118.413 E.58415
G1 X31.134 Y120.91 E.11719
G1 X20.081 Y131.963 E.4664
G1 X19.841 Y131.67 E.01132
G1 X28.103 Y123.407 E.34865
G1 X25.072 Y125.904 E.11719
G1 X19.6 Y131.376 E.23089
G1 X19.359 Y131.083 E.01132
G1 X23.288 Y127.154 E.16578
G1 X116.551 Y241.686 F30000
G1 F9530.869
G1 X120.465 Y237.771 E.16518
G1 X120.225 Y237.478 E.01132
G1 X114.767 Y242.936 E.2303
G1 X112.611 Y244.711 E.08331
G1 X112.542 Y244.627 E.00327
G1 X119.984 Y237.185 E.31402
G1 X119.743 Y236.891 E.01132
G1 X112.301 Y244.333 E.31402
G1 X112.06 Y244.04 E.01132
G1 X119.502 Y236.598 E.31402
G1 X119.261 Y236.304 E.01132
G1 X111.819 Y243.746 E.31402
G1 X111.579 Y243.453 E.01132
G1 X119.021 Y236.011 E.31402
G1 X118.78 Y235.718 E.01132
G1 X111.338 Y243.16 E.31402
G1 X111.097 Y242.866 E.01132
G1 X118.539 Y235.424 E.31402
G1 X118.298 Y235.131 E.01132
G1 X110.856 Y242.573 E.31402
G1 X110.616 Y242.279 E.01132
G1 X118.058 Y234.837 E.31402
G1 X117.817 Y234.544 E.01132
G1 X110.375 Y241.986 E.31402
G1 X110.134 Y241.693 E.01132
G1 X117.576 Y234.251 E.31402
G1 X117.335 Y233.957 E.01132
G1 X109.893 Y241.399 E.31402
G1 X109.652 Y241.106 E.01132
G1 X117.094 Y233.664 E.31402
G1 X116.854 Y233.37 E.01132
G1 X109.412 Y240.812 E.31403
G1 X109.171 Y240.519 E.01132
G1 X116.613 Y233.077 E.31403
G1 X116.372 Y232.784 E.01132
G1 X108.93 Y240.226 E.31403
G1 X108.689 Y239.932 E.01132
G1 X116.131 Y232.49 E.31403
G1 X115.891 Y232.197 E.01132
G1 X108.449 Y239.639 E.31403
G1 X108.208 Y239.345 E.01132
G1 X115.65 Y231.903 E.31403
G1 X115.409 Y231.61 E.01132
G1 X107.967 Y239.052 E.31403
G1 X107.726 Y238.759 E.01132
G1 X115.168 Y231.317 E.31403
G1 X114.927 Y231.023 E.01132
G1 X107.485 Y238.465 E.31403
G1 X107.245 Y238.172 E.01132
G1 X114.687 Y230.73 E.31403
G1 X114.446 Y230.436 E.01132
G1 X107.004 Y237.878 E.31403
G1 X106.763 Y237.585 E.01132
G1 X114.205 Y230.143 E.31403
G1 X113.964 Y229.85 E.01132
G1 X106.522 Y237.292 E.31403
G1 X106.281 Y236.998 E.01132
G1 X113.724 Y229.556 E.31403
G1 X113.483 Y229.263 E.01132
G1 X106.041 Y236.705 E.31403
G1 X105.8 Y236.411 E.01132
G1 X113.242 Y228.969 E.31403
G1 X113.001 Y228.676 E.01132
G1 X105.559 Y236.118 E.31403
G1 X105.318 Y235.825 E.01132
G1 X112.76 Y228.383 E.31403
G1 X112.52 Y228.089 E.01132
G1 X105.078 Y235.531 E.31403
G1 X104.837 Y235.238 E.01132
G1 X112.279 Y227.796 E.31403
G1 X112.038 Y227.502 E.01132
G1 X104.596 Y234.944 E.31403
G1 X104.355 Y234.651 E.01132
G1 X111.797 Y227.209 E.31403
G1 X111.557 Y226.916 E.01132
G1 X104.114 Y234.358 E.31403
G1 X103.874 Y234.064 E.01132
G1 X111.316 Y226.622 E.31403
G1 X111.075 Y226.329 E.01132
G1 X103.633 Y233.771 E.31403
G1 X103.392 Y233.478 E.01132
G1 X110.834 Y226.035 E.31403
G1 X110.593 Y225.742 E.01132
G1 X103.151 Y233.184 E.31403
G1 X102.911 Y232.891 E.01132
G1 X110.353 Y225.449 E.31403
G1 X110.112 Y225.155 E.01132
G1 X102.67 Y232.597 E.31403
G1 X102.429 Y232.304 E.01132
G1 X109.871 Y224.862 E.31403
G1 X109.63 Y224.568 E.01132
G1 X102.188 Y232.011 E.31403
G1 X101.947 Y231.717 E.01132
G1 X109.39 Y224.275 E.31403
G1 X109.149 Y223.982 E.01132
G1 X101.707 Y231.424 E.31403
G1 X101.466 Y231.13 E.01132
G1 X108.908 Y223.688 E.31403
G1 X108.667 Y223.395 E.01132
G1 X101.225 Y230.837 E.31403
G1 X100.984 Y230.544 E.01132
G1 X108.426 Y223.101 E.31403
G1 X108.186 Y222.808 E.01132
G1 X100.743 Y230.25 E.31403
G1 X100.503 Y229.957 E.01132
G1 X107.945 Y222.515 E.31403
G1 X107.704 Y222.221 E.01132
G1 X100.262 Y229.663 E.31403
G1 X100.021 Y229.37 E.01132
G1 X107.463 Y221.928 E.31403
G1 X107.223 Y221.634 E.01132
G1 X99.78 Y229.077 E.31403
G1 X99.54 Y228.783 E.01132
G1 X106.982 Y221.341 E.31403
G1 X106.741 Y221.048 E.01132
G1 X99.299 Y228.49 E.31403
G1 X99.058 Y228.196 E.01132
G1 X106.5 Y220.754 E.31403
G1 X106.259 Y220.461 E.01132
G1 X98.817 Y227.903 E.31404
G1 X98.576 Y227.61 E.01132
G1 X106.019 Y220.167 E.31404
G1 X105.778 Y219.874 E.01132
G1 X98.336 Y227.316 E.31404
G1 X98.095 Y227.023 E.01132
G1 X105.537 Y219.581 E.31404
G1 X105.296 Y219.287 E.01132
G1 X97.854 Y226.729 E.31404
G1 X97.613 Y226.436 E.01132
G1 X105.056 Y218.994 E.31404
G1 X104.815 Y218.7 E.01132
G1 X97.373 Y226.143 E.31404
G1 X97.132 Y225.849 E.01132
G1 X104.574 Y218.407 E.31404
G1 X104.333 Y218.114 E.01132
G1 X96.891 Y225.556 E.31404
G1 X96.65 Y225.262 E.01132
G1 X104.092 Y217.82 E.31404
G1 X103.852 Y217.527 E.01132
G1 X96.409 Y224.969 E.31404
G1 X96.169 Y224.676 E.01132
G1 X103.611 Y217.233 E.31404
G1 X103.37 Y216.94 E.01132
G1 X95.928 Y224.382 E.31404
G1 X95.687 Y224.089 E.01132
G1 X103.129 Y216.647 E.31404
G1 X102.889 Y216.353 E.01132
G1 X95.446 Y223.796 E.31404
G1 X95.205 Y223.502 E.01132
G1 X102.648 Y216.06 E.31404
G1 X102.407 Y215.766 E.01132
G1 X94.965 Y223.209 E.31404
G1 X94.724 Y222.915 E.01132
G1 X102.166 Y215.473 E.31404
G1 X101.925 Y215.18 E.01132
G1 X94.483 Y222.622 E.31404
G1 X94.242 Y222.329 E.01132
G1 X101.685 Y214.886 E.31404
G1 X101.444 Y214.593 E.01132
G1 X94.002 Y222.035 E.31404
G1 X93.761 Y221.742 E.01132
G1 X101.203 Y214.299 E.31404
G1 X100.962 Y214.006 E.01132
G1 X93.52 Y221.448 E.31404
G1 X93.279 Y221.155 E.01132
G1 X100.722 Y213.713 E.31404
G1 X100.481 Y213.419 E.01132
G1 X93.038 Y220.862 E.31404
G1 X92.798 Y220.568 E.01132
G1 X100.24 Y213.126 E.31404
G1 X99.999 Y212.832 E.01132
G1 X92.557 Y220.275 E.31404
G1 X92.316 Y219.981 E.01132
G1 X99.758 Y212.539 E.31404
G1 X99.518 Y212.246 E.01132
G1 X92.075 Y219.688 E.31404
G1 X91.835 Y219.395 E.01132
G1 X99.277 Y211.952 E.31404
G1 X99.036 Y211.659 E.01132
G1 X91.594 Y219.101 E.31404
G1 X91.353 Y218.808 E.01132
G1 X98.795 Y211.365 E.31404
G1 X98.555 Y211.072 E.01132
G1 X91.112 Y218.514 E.31404
G1 X90.871 Y218.221 E.01132
G1 X98.314 Y210.779 E.31404
G1 X98.073 Y210.485 E.01132
G1 X90.631 Y217.928 E.31404
G1 X90.39 Y217.634 E.01132
G1 X97.832 Y210.192 E.31404
G1 X97.592 Y209.898 E.01132
G1 X90.149 Y217.341 E.31404
G1 X89.908 Y217.047 E.01132
G1 X97.351 Y209.605 E.31404
G1 X97.11 Y209.312 E.01132
G1 X89.667 Y216.754 E.31404
G1 X89.427 Y216.461 E.01132
G1 X96.869 Y209.018 E.31404
G1 X96.628 Y208.725 E.01132
G1 X89.186 Y216.167 E.31404
G1 X88.945 Y215.874 E.01132
G1 X96.388 Y208.431 E.31404
G1 X96.147 Y208.138 E.01132
G1 X88.704 Y215.58 E.31404
G1 X88.464 Y215.287 E.01132
G1 X95.906 Y207.845 E.31405
G1 X95.665 Y207.551 E.01132
G1 X88.223 Y214.994 E.31405
G1 X87.982 Y214.7 E.01132
G1 X95.425 Y207.258 E.31405
G1 X95.184 Y206.964 E.01132
G1 X87.741 Y214.407 E.31405
G1 X87.5 Y214.114 E.01132
G1 X94.943 Y206.671 E.31405
G1 X94.702 Y206.378 E.01132
G1 X87.26 Y213.82 E.31405
G1 X87.019 Y213.527 E.01132
G1 X94.461 Y206.084 E.31405
G1 X94.221 Y205.791 E.01132
G1 X86.778 Y213.233 E.31405
G1 X86.537 Y212.94 E.01132
G1 X93.98 Y205.497 E.31405
G1 X93.739 Y205.204 E.01132
G1 X86.297 Y212.647 E.31405
G1 X86.056 Y212.353 E.01132
G1 X93.498 Y204.911 E.31405
G1 X93.258 Y204.617 E.01132
G1 X85.815 Y212.06 E.31405
G1 X85.574 Y211.766 E.01132
G1 X93.017 Y204.324 E.31405
G1 X92.776 Y204.03 E.01132
G1 X85.333 Y211.473 E.31405
G1 X85.093 Y211.18 E.01132
G1 X92.535 Y203.737 E.31405
G1 X92.294 Y203.444 E.01132
G1 X84.852 Y210.886 E.31405
M73 P87 R6
G1 X84.611 Y210.593 E.01132
G1 X92.054 Y203.15 E.31405
G1 X91.813 Y202.857 E.01132
G1 X84.37 Y210.299 E.31405
G1 X84.129 Y210.006 E.01132
G1 X91.572 Y202.563 E.31405
G1 X91.331 Y202.27 E.01132
G1 X83.889 Y209.713 E.31405
G1 X83.648 Y209.419 E.01132
G1 X91.091 Y201.977 E.31405
G1 X90.85 Y201.683 E.01132
G1 X83.407 Y209.126 E.31405
G1 X83.166 Y208.832 E.01132
G1 X90.609 Y201.39 E.31405
G1 X90.368 Y201.096 E.01132
G1 X82.926 Y208.539 E.31405
G1 X82.685 Y208.246 E.01132
G1 X90.127 Y200.803 E.31405
G1 X89.887 Y200.51 E.01132
G1 X82.444 Y207.952 E.31405
G1 X82.203 Y207.659 E.01132
G1 X89.646 Y200.216 E.31405
G1 X89.405 Y199.923 E.01132
G1 X81.962 Y207.365 E.31405
G1 X81.722 Y207.072 E.01132
G1 X89.164 Y199.629 E.31405
G1 X88.924 Y199.336 E.01132
G1 X81.481 Y206.779 E.31405
G1 X81.24 Y206.485 E.01132
G1 X88.683 Y199.043 E.31405
G1 X88.442 Y198.749 E.01132
G1 X80.999 Y206.192 E.31405
G1 X80.759 Y205.898 E.01132
G1 X88.201 Y198.456 E.31405
G1 X87.96 Y198.162 E.01132
G1 X80.518 Y205.605 E.31405
G1 X80.277 Y205.312 E.01132
G1 X87.72 Y197.869 E.31405
G1 X87.479 Y197.576 E.01132
G1 X80.036 Y205.018 E.31405
G1 X79.795 Y204.725 E.01132
G1 X87.238 Y197.282 E.31405
G1 X86.997 Y196.989 E.01132
G1 X79.555 Y204.431 E.31405
G1 X79.314 Y204.138 E.01132
G1 X86.757 Y196.695 E.31405
G1 X86.516 Y196.402 E.01132
G1 X79.073 Y203.845 E.31405
G1 X78.832 Y203.551 E.01132
G1 X86.275 Y196.109 E.31405
G1 X86.034 Y195.815 E.01132
G1 X78.591 Y203.258 E.31405
G1 X78.351 Y202.965 E.01132
G1 X85.793 Y195.522 E.31405
G1 X85.553 Y195.228 E.01132
G1 X78.11 Y202.671 E.31406
G1 X77.869 Y202.378 E.01132
G1 X85.312 Y194.935 E.31406
G1 X85.071 Y194.642 E.01132
G1 X77.628 Y202.084 E.31406
G1 X77.388 Y201.791 E.01132
G1 X84.83 Y194.348 E.31406
G1 X84.59 Y194.055 E.01132
G1 X77.147 Y201.498 E.31406
G1 X76.906 Y201.204 E.01132
G1 X84.349 Y193.761 E.31406
G1 X84.108 Y193.468 E.01132
G1 X76.665 Y200.911 E.31406
G1 X76.424 Y200.617 E.01132
G1 X83.867 Y193.175 E.31406
G1 X83.626 Y192.881 E.01132
G1 X76.184 Y200.324 E.31406
G1 X75.943 Y200.031 E.01132
G1 X83.386 Y192.588 E.31406
G1 X83.145 Y192.294 E.01132
G1 X75.702 Y199.737 E.31406
G1 X75.461 Y199.444 E.01132
G1 X82.904 Y192.001 E.31406
G1 X82.663 Y191.708 E.01132
G1 X75.221 Y199.15 E.31406
G1 X74.98 Y198.857 E.01132
G1 X82.423 Y191.414 E.31406
G1 X82.182 Y191.121 E.01132
G1 X74.739 Y198.564 E.31406
G1 X74.498 Y198.27 E.01132
G1 X81.941 Y190.827 E.31406
G1 X81.7 Y190.534 E.01132
G1 X74.257 Y197.977 E.31406
G1 X74.017 Y197.683 E.01132
G1 X81.459 Y190.241 E.31406
G1 X81.219 Y189.947 E.01132
G1 X73.776 Y197.39 E.31406
G1 X73.535 Y197.097 E.01132
G1 X80.978 Y189.654 E.31406
G1 X80.737 Y189.36 E.01132
G1 X73.294 Y196.803 E.31406
G1 X73.053 Y196.51 E.01132
G1 X80.496 Y189.067 E.31406
G1 X80.256 Y188.774 E.01132
G1 X72.813 Y196.216 E.31406
G1 X72.572 Y195.923 E.01132
G1 X80.015 Y188.48 E.31406
G1 X79.774 Y188.187 E.01132
G1 X72.331 Y195.63 E.31406
G1 X72.09 Y195.336 E.01132
G1 X79.533 Y187.893 E.31406
G1 X79.292 Y187.6 E.01132
G1 X71.85 Y195.043 E.31406
G1 X71.609 Y194.749 E.01132
G1 X79.052 Y187.307 E.31406
G1 X78.811 Y187.013 E.01132
G1 X71.368 Y194.456 E.31406
G1 X71.127 Y194.163 E.01132
G1 X78.57 Y186.72 E.31406
G1 X78.329 Y186.426 E.01132
G1 X70.886 Y193.869 E.31406
G1 X70.646 Y193.576 E.01132
G1 X78.089 Y186.133 E.31406
G1 X77.848 Y185.84 E.01132
G1 X70.405 Y193.283 E.31406
G1 X70.164 Y192.989 E.01132
G1 X77.607 Y185.546 E.31406
G1 X77.366 Y185.253 E.01132
G1 X69.923 Y192.696 E.31406
G1 X69.683 Y192.402 E.01132
G1 X77.125 Y184.959 E.31406
G1 X76.885 Y184.666 E.01132
G1 X69.442 Y192.109 E.31406
G1 X69.201 Y191.816 E.01132
G1 X76.644 Y184.373 E.31406
G1 X76.403 Y184.079 E.01132
G1 X68.96 Y191.522 E.31406
G1 X68.719 Y191.229 E.01132
G1 X76.162 Y183.786 E.31406
G1 X75.922 Y183.492 E.01132
G1 X68.479 Y190.935 E.31406
G1 X68.238 Y190.642 E.01132
G1 X75.681 Y183.199 E.31406
G1 X75.44 Y182.906 E.01132
G1 X67.997 Y190.349 E.31406
G1 X67.756 Y190.055 E.01132
G1 X75.199 Y182.612 E.31406
G1 X74.958 Y182.319 E.01132
G1 X67.515 Y189.762 E.31407
G1 X67.275 Y189.468 E.01132
G1 X74.718 Y182.025 E.31406
G1 X74.477 Y181.732 E.01132
G1 X67.034 Y189.175 E.31407
G1 X66.793 Y188.882 E.01132
G1 X74.236 Y181.439 E.31407
G1 X73.995 Y181.145 E.01132
G1 X66.552 Y188.588 E.31407
G1 X66.312 Y188.295 E.01132
G1 X73.755 Y180.852 E.31407
G1 X73.514 Y180.558 E.01132
G1 X66.071 Y188.001 E.31407
G1 X65.83 Y187.708 E.01132
G1 X73.273 Y180.265 E.31407
G1 X73.032 Y179.972 E.01132
G1 X65.589 Y187.415 E.31407
G1 X65.348 Y187.121 E.01132
G1 X72.791 Y179.678 E.31407
G1 X72.551 Y179.385 E.01132
G1 X65.108 Y186.828 E.31407
G1 X64.867 Y186.534 E.01132
G1 X72.31 Y179.091 E.31407
G1 X72.069 Y178.798 E.01132
G1 X64.626 Y186.241 E.31407
G1 X64.385 Y185.948 E.01132
G1 X71.828 Y178.505 E.31407
G1 X71.588 Y178.211 E.01132
G1 X64.145 Y185.654 E.31407
G1 X63.904 Y185.361 E.01132
G1 X71.347 Y177.918 E.31407
G1 X71.106 Y177.624 E.01132
G1 X63.663 Y185.067 E.31407
G1 X63.422 Y184.774 E.01132
G1 X70.865 Y177.331 E.31407
G1 X70.624 Y177.038 E.01132
G1 X63.181 Y184.481 E.31407
G1 X62.941 Y184.187 E.01132
G1 X70.384 Y176.744 E.31407
G1 X70.143 Y176.451 E.01132
G1 X62.7 Y183.894 E.31407
G1 X62.459 Y183.601 E.01132
G1 X69.902 Y176.157 E.31407
G1 X69.661 Y175.864 E.01132
G1 X62.218 Y183.307 E.31407
G1 X61.977 Y183.014 E.01132
G1 X69.421 Y175.571 E.31407
G1 X69.18 Y175.277 E.01132
G1 X61.737 Y182.72 E.31407
G1 X61.496 Y182.427 E.01132
G1 X68.939 Y174.984 E.31407
G1 X68.698 Y174.69 E.01132
G1 X61.255 Y182.134 E.31407
G1 X61.014 Y181.84 E.01132
G1 X68.457 Y174.397 E.31407
G1 X68.217 Y174.104 E.01132
G1 X60.774 Y181.547 E.31407
G1 X60.533 Y181.253 E.01132
G1 X67.976 Y173.81 E.31407
G1 X67.735 Y173.517 E.01132
G1 X60.292 Y180.96 E.31407
G1 X60.051 Y180.667 E.01132
G1 X67.494 Y173.223 E.31407
G1 X67.254 Y172.93 E.01132
G1 X59.81 Y180.373 E.31407
G1 X59.57 Y180.08 E.01132
G1 X67.013 Y172.637 E.31407
G1 X66.772 Y172.343 E.01132
G1 X59.329 Y179.786 E.31407
G1 X59.088 Y179.493 E.01132
G1 X66.531 Y172.05 E.31407
G1 X66.29 Y171.756 E.01132
G1 X58.847 Y179.2 E.31407
G1 X58.607 Y178.906 E.01132
G1 X66.05 Y171.463 E.31407
G1 X65.809 Y171.17 E.01132
G1 X58.366 Y178.613 E.31407
G1 X58.125 Y178.319 E.01132
G1 X65.568 Y170.876 E.31407
G1 X65.327 Y170.583 E.01132
G1 X57.884 Y178.026 E.31407
G1 X57.643 Y177.733 E.01132
G1 X65.087 Y170.289 E.31407
G1 X64.846 Y169.996 E.01132
G1 X57.403 Y177.439 E.31407
G1 X57.162 Y177.146 E.01132
G1 X64.605 Y169.703 E.31407
G1 X64.364 Y169.409 E.01132
G1 X56.921 Y176.852 E.31407
G1 X56.68 Y176.559 E.01132
G1 X64.123 Y169.116 E.31407
G1 X63.883 Y168.822 E.01132
G1 X56.439 Y176.266 E.31408
G1 X56.199 Y175.972 E.01132
G1 X63.642 Y168.529 E.31408
G1 X63.401 Y168.236 E.01132
G1 X55.958 Y175.679 E.31408
G1 X55.717 Y175.385 E.01132
G1 X63.16 Y167.942 E.31408
G1 X62.92 Y167.649 E.01132
G1 X55.476 Y175.092 E.31408
G1 X55.236 Y174.799 E.01132
G1 X62.679 Y167.355 E.31408
G1 X62.438 Y167.062 E.01132
G1 X54.995 Y174.505 E.31408
G1 X54.754 Y174.212 E.01132
G1 X62.197 Y166.769 E.31408
G1 X61.956 Y166.475 E.01132
G1 X54.513 Y173.918 E.31408
G1 X54.272 Y173.625 E.01132
G1 X61.716 Y166.182 E.31408
G1 X61.475 Y165.888 E.01132
G1 X54.032 Y173.332 E.31408
G1 X53.791 Y173.038 E.01132
G1 X61.234 Y165.595 E.31408
G1 X60.993 Y165.302 E.01132
G1 X53.55 Y172.745 E.31408
G1 X53.309 Y172.452 E.01132
G1 X60.753 Y165.008 E.31408
G1 X60.512 Y164.715 E.01132
G1 X53.069 Y172.158 E.31408
G1 X52.828 Y171.865 E.01132
G1 X60.271 Y164.421 E.31408
G1 X60.03 Y164.128 E.01132
G1 X52.587 Y171.571 E.31408
G1 X52.346 Y171.278 E.01132
G1 X59.79 Y163.835 E.31408
G1 X59.549 Y163.541 E.01132
G1 X52.105 Y170.985 E.31408
G1 X51.865 Y170.691 E.01132
G1 X59.308 Y163.248 E.31408
G1 X59.067 Y162.954 E.01132
G1 X51.624 Y170.398 E.31408
G1 X51.383 Y170.104 E.01132
G1 X58.826 Y162.661 E.31408
G1 X58.586 Y162.368 E.01132
G1 X51.142 Y169.811 E.31408
G1 X50.901 Y169.518 E.01132
G1 X58.345 Y162.074 E.31408
G1 X58.104 Y161.781 E.01132
G1 X50.661 Y169.224 E.31408
G1 X50.42 Y168.931 E.01132
G1 X57.863 Y161.487 E.31408
G1 X57.623 Y161.194 E.01132
G1 X50.179 Y168.637 E.31408
G1 X49.938 Y168.344 E.01132
G1 X57.382 Y160.901 E.31408
G1 X57.141 Y160.607 E.01132
G1 X49.698 Y168.051 E.31408
G1 X49.457 Y167.757 E.01132
G1 X56.9 Y160.314 E.31408
G1 X56.659 Y160.02 E.01132
G1 X49.216 Y167.464 E.31408
G1 X48.975 Y167.17 E.01132
G1 X56.419 Y159.727 E.31408
G1 X56.178 Y159.434 E.01132
G1 X48.734 Y166.877 E.31408
G1 X48.494 Y166.584 E.01132
G1 X55.937 Y159.14 E.31408
G1 X55.696 Y158.847 E.01132
G1 X48.253 Y166.29 E.31408
G1 X48.012 Y165.997 E.01132
G1 X55.456 Y158.553 E.31408
G1 X55.215 Y158.26 E.01132
G1 X47.771 Y165.703 E.31408
G1 X47.531 Y165.41 E.01132
G1 X54.974 Y157.967 E.31408
G1 X54.733 Y157.673 E.01132
G1 X47.29 Y165.117 E.31408
G1 X47.049 Y164.823 E.01132
G1 X54.492 Y157.38 E.31408
G1 X54.252 Y157.086 E.01132
G1 X46.808 Y164.53 E.31408
G1 X46.567 Y164.236 E.01132
G1 X54.011 Y156.793 E.31408
G1 X53.77 Y156.5 E.01132
G1 X46.327 Y163.943 E.31408
G1 X46.086 Y163.65 E.01132
G1 X53.529 Y156.206 E.31409
G1 X53.289 Y155.913 E.01132
G1 X45.845 Y163.356 E.31409
G1 X45.604 Y163.063 E.01132
G1 X53.048 Y155.619 E.31409
G1 X52.807 Y155.326 E.01132
G1 X45.363 Y162.77 E.31409
G1 X45.123 Y162.476 E.01132
G1 X52.566 Y155.033 E.31409
G1 X52.325 Y154.739 E.01132
G1 X44.882 Y162.183 E.31409
G1 X44.641 Y161.889 E.01132
G1 X52.085 Y154.446 E.31409
G1 X51.844 Y154.152 E.01132
G1 X44.4 Y161.596 E.31409
G1 X44.16 Y161.303 E.01132
G1 X51.603 Y153.859 E.31409
G1 X51.362 Y153.566 E.01132
G1 X43.919 Y161.009 E.31409
G1 X43.678 Y160.716 E.01132
G1 X51.122 Y153.272 E.31409
G1 X50.881 Y152.979 E.01132
G1 X43.437 Y160.422 E.31409
G1 X43.196 Y160.129 E.01132
G1 X50.64 Y152.685 E.31409
G1 X50.399 Y152.392 E.01132
G1 X42.956 Y159.836 E.31409
G1 X42.715 Y159.542 E.01132
G1 X50.158 Y152.099 E.31409
G1 X49.918 Y151.805 E.01132
G1 X42.474 Y159.249 E.31409
G1 X42.233 Y158.955 E.01132
G1 X49.677 Y151.512 E.31409
G1 X49.436 Y151.218 E.01132
G1 X41.993 Y158.662 E.31409
G1 X41.752 Y158.369 E.01132
G1 X49.195 Y150.925 E.31409
G1 X48.955 Y150.632 E.01132
G1 X41.511 Y158.075 E.31409
G1 X41.27 Y157.782 E.01132
G1 X48.714 Y150.338 E.31409
G1 X48.473 Y150.045 E.01132
G1 X41.029 Y157.488 E.31409
G1 X40.789 Y157.195 E.01132
G1 X48.232 Y149.751 E.31409
G1 X47.991 Y149.458 E.01132
G1 X40.548 Y156.902 E.31409
G1 X40.307 Y156.608 E.01132
G1 X47.751 Y149.165 E.31409
G1 X47.51 Y148.871 E.01132
G1 X40.066 Y156.315 E.31409
G1 X39.825 Y156.021 E.01132
G1 X47.269 Y148.578 E.31409
G1 X47.028 Y148.284 E.01132
G1 X39.585 Y155.728 E.31409
G1 X39.344 Y155.435 E.01132
G1 X46.788 Y147.991 E.31409
G1 X46.547 Y147.698 E.01132
G1 X39.103 Y155.141 E.31409
G1 X38.862 Y154.848 E.01132
G1 X46.306 Y147.404 E.31409
G1 X46.065 Y147.111 E.01132
G1 X38.622 Y154.554 E.31409
G1 X38.381 Y154.261 E.01132
G1 X45.824 Y146.817 E.31409
G1 X45.584 Y146.524 E.01132
G1 X38.14 Y153.968 E.31409
G1 X37.899 Y153.674 E.01132
G1 X45.343 Y146.231 E.31409
G1 X45.102 Y145.937 E.01132
G1 X37.658 Y153.381 E.31409
G1 X37.418 Y153.088 E.01132
G1 X44.861 Y145.644 E.31409
G1 X44.621 Y145.35 E.01132
G1 X37.177 Y152.794 E.31409
G1 X36.936 Y152.501 E.01132
G1 X44.38 Y145.057 E.31409
G1 X44.139 Y144.764 E.01132
G1 X36.695 Y152.207 E.31409
G1 X36.455 Y151.914 E.01132
G1 X43.898 Y144.47 E.31409
G1 X43.657 Y144.177 E.01132
G1 X36.214 Y151.621 E.31409
G1 X35.973 Y151.327 E.01132
G1 X43.417 Y143.883 E.31409
G1 X43.176 Y143.59 E.01132
G1 X35.732 Y151.034 E.31409
G1 X35.491 Y150.74 E.01132
G1 X42.935 Y143.297 E.3141
G1 X42.694 Y143.003 E.01132
G1 X35.251 Y150.447 E.3141
G1 X35.01 Y150.154 E.01132
G1 X42.454 Y142.71 E.3141
G1 X42.213 Y142.416 E.01132
G1 X34.769 Y149.86 E.3141
G1 X34.528 Y149.567 E.01132
G1 X41.972 Y142.123 E.3141
G1 X41.731 Y141.83 E.01132
G1 X34.287 Y149.273 E.3141
G1 X34.047 Y148.98 E.01132
G1 X41.49 Y141.536 E.3141
G1 X41.25 Y141.243 E.01132
G1 X33.806 Y148.687 E.3141
G1 X33.565 Y148.393 E.01132
G1 X41.009 Y140.949 E.3141
G1 X40.768 Y140.656 E.01132
G1 X33.324 Y148.1 E.3141
G1 X33.084 Y147.806 E.01132
G1 X40.527 Y140.363 E.3141
G1 X40.287 Y140.069 E.01132
G1 X32.843 Y147.513 E.3141
G1 X32.602 Y147.22 E.01132
G1 X40.046 Y139.776 E.3141
G1 X39.805 Y139.482 E.01132
G1 X32.361 Y146.926 E.3141
G1 X32.12 Y146.633 E.01132
G1 X39.564 Y139.189 E.3141
G1 X39.323 Y138.896 E.01132
G1 X31.88 Y146.339 E.3141
G1 X31.639 Y146.046 E.01132
G1 X39.083 Y138.602 E.3141
G1 X38.842 Y138.309 E.01132
G1 X31.398 Y145.753 E.3141
G1 X31.157 Y145.459 E.01132
G1 X38.601 Y138.015 E.3141
G1 X38.36 Y137.722 E.01132
G1 X30.917 Y145.166 E.3141
G1 X30.676 Y144.872 E.01132
G1 X38.12 Y137.429 E.3141
G1 X37.879 Y137.135 E.01132
G1 X30.435 Y144.579 E.3141
G1 X30.194 Y144.286 E.01132
G1 X37.638 Y136.842 E.3141
G1 X37.397 Y136.548 E.01132
G1 X29.953 Y143.992 E.3141
G1 X29.713 Y143.699 E.01132
G1 X37.156 Y136.255 E.3141
G1 X36.916 Y135.962 E.01132
G1 X29.472 Y143.405 E.3141
G1 X29.231 Y143.112 E.01132
G1 X36.675 Y135.668 E.3141
G1 X36.434 Y135.375 E.01132
G1 X28.99 Y142.819 E.3141
G1 X28.749 Y142.525 E.01132
G1 X36.193 Y135.081 E.3141
G1 X35.953 Y134.788 E.01132
G1 X28.509 Y142.232 E.3141
G1 X28.268 Y141.939 E.01132
G1 X35.712 Y134.495 E.3141
G1 X35.471 Y134.201 E.01132
G1 X28.027 Y141.645 E.3141
G1 X27.786 Y141.352 E.01132
G1 X35.23 Y133.908 E.3141
G1 X35.053 Y133.692 E.00831
G1 X37.279 Y131.859 E.08604
G1 X128.14 Y40.998 E3.83397
G1 X131.171 Y38.501 E.11719
G1 X40.311 Y129.361 E3.83395
G1 X43.343 Y126.863 E.11721
G1 X134.203 Y36.004 E3.83393
G1 X137.234 Y33.506 E.11719
G1 X46.375 Y124.366 E3.83391
G1 X49.407 Y121.868 E.11721
G1 X140.266 Y31.009 E3.83389
G1 X141.795 Y29.749 E.05913
G1 X141.915 Y29.894 E.00561
G1 X52.439 Y119.37 E3.77553
G1 X55.471 Y116.873 E.11721
G1 X142.155 Y30.188 E3.65776
G1 X142.396 Y30.481 E.01132
G1 X58.503 Y114.375 E3.53998
G1 X61.534 Y111.877 E.11721
G1 X142.637 Y30.775 E3.42221
G1 X142.878 Y31.068 E.01132
G1 X64.566 Y109.379 E3.30443
G1 X67.598 Y106.882 E.11721
G1 X143.118 Y31.361 E3.18666
G1 X143.359 Y31.655 E.01132
G1 X70.63 Y104.384 E3.06888
G1 X73.662 Y101.886 E.11721
G1 X143.6 Y31.948 E2.95111
G1 X143.841 Y32.242 E.01132
G1 X76.694 Y99.388 E2.83333
G1 X79.726 Y96.891 E.11721
G1 X144.082 Y32.535 E2.71556
G1 X144.322 Y32.828 E.01132
G1 X82.758 Y94.393 E2.59779
G1 X85.79 Y91.895 E.11721
G1 X144.563 Y33.122 E2.48001
G1 X144.804 Y33.415 E.01132
G1 X88.822 Y89.398 E2.36224
G1 X91.854 Y86.9 E.11721
G1 X145.045 Y33.709 E2.24446
G1 X145.285 Y34.002 E.01132
G1 X94.885 Y84.402 E2.12669
G1 X97.917 Y81.904 E.11721
G1 X145.526 Y34.295 E2.00891
G1 X145.767 Y34.589 E.01132
G1 X100.949 Y79.407 E1.89114
G1 X103.981 Y76.909 E.11721
G1 X146.008 Y34.882 E1.77336
G1 X146.249 Y35.176 E.01132
G1 X107.013 Y74.411 E1.65559
G1 X110.045 Y71.913 E.11721
G1 X146.489 Y35.469 E1.53781
G1 X146.73 Y35.762 E.01132
G1 X113.077 Y69.416 E1.42004
G1 X116.109 Y66.918 E.11721
M73 P87 R5
G1 X146.971 Y36.056 E1.30226
G1 X147.212 Y36.349 E.01132
G1 X119.141 Y64.42 E1.18449
G1 X122.173 Y61.922 E.11721
G1 X147.452 Y36.643 E1.06671
G1 X147.693 Y36.936 E.01132
G1 X125.204 Y59.425 E.94894
G1 X128.236 Y56.927 E.11721
G1 X147.934 Y37.229 E.83116
G1 X148.175 Y37.523 E.01132
G1 X131.268 Y54.429 E.71339
M73 P88 R5
G1 X134.3 Y51.932 E.11721
G1 X148.416 Y37.816 E.59561
G1 X148.656 Y38.11 E.01132
G1 X137.332 Y49.434 E.47784
G1 X140.364 Y46.936 E.11721
G1 X148.897 Y38.403 E.36006
G1 X149.138 Y38.696 E.01132
G1 X142.654 Y45.181 E.27361
G1 X142.894 Y45.474 E.01132
G1 X149.379 Y38.99 E.27361
G1 X149.619 Y39.283 E.01132
G1 X143.135 Y45.767 E.27361
G1 X143.376 Y46.061 E.01132
G1 X149.86 Y39.577 E.27361
G1 X150.101 Y39.87 E.01132
G1 X143.617 Y46.354 E.27361
G1 X143.858 Y46.648 E.01132
G1 X150.342 Y40.163 E.27361
G1 X150.583 Y40.457 E.01132
G1 X144.098 Y46.941 E.27361
G1 X144.339 Y47.234 E.01132
G1 X150.823 Y40.75 E.27361
G1 X151.064 Y41.044 E.01132
G1 X144.58 Y47.528 E.27361
G1 X144.821 Y47.821 E.01132
G1 X151.305 Y41.337 E.27361
G1 X151.546 Y41.63 E.01132
G1 X145.061 Y48.115 E.27361
G1 X145.302 Y48.408 E.01132
G1 X151.786 Y41.924 E.27361
G1 X152.027 Y42.217 E.01132
G1 X145.543 Y48.701 E.27361
G1 X145.784 Y48.995 E.01132
G1 X152.268 Y42.511 E.27361
G1 X152.509 Y42.804 E.01132
G1 X146.025 Y49.288 E.27361
G1 X146.265 Y49.582 E.01132
G1 X152.75 Y43.097 E.27361
G1 X152.99 Y43.391 E.01132
G1 X146.506 Y49.875 E.27361
G1 X146.747 Y50.168 E.01132
G1 X153.231 Y43.684 E.27361
G1 X153.472 Y43.978 E.01132
G1 X146.988 Y50.462 E.27361
G1 X147.228 Y50.755 E.01132
G1 X153.713 Y44.271 E.27361
G1 X153.953 Y44.564 E.01132
G1 X147.469 Y51.049 E.27361
G1 X147.71 Y51.342 E.01132
G1 X154.194 Y44.858 E.27361
G1 X154.435 Y45.151 E.01132
G1 X147.951 Y51.635 E.27361
G1 X148.192 Y51.929 E.01132
G1 X154.676 Y45.445 E.27361
G1 X154.917 Y45.738 E.01132
G1 X148.432 Y52.222 E.27361
G1 X148.673 Y52.516 E.01132
G1 X155.157 Y46.031 E.27361
G1 X155.398 Y46.325 E.01132
G1 X148.914 Y52.809 E.27361
G1 X149.155 Y53.102 E.01132
G1 X155.639 Y46.618 E.27361
G1 X155.88 Y46.912 E.01132
G1 X149.395 Y53.396 E.27361
G1 X149.636 Y53.689 E.01132
G1 X156.12 Y47.205 E.27361
G1 X156.361 Y47.498 E.01132
G1 X149.877 Y53.983 E.27361
G1 X150.118 Y54.276 E.01132
G1 X156.602 Y47.792 E.27361
G1 X156.843 Y48.085 E.01132
G1 X150.359 Y54.569 E.27361
G1 X150.599 Y54.863 E.01132
G1 X157.084 Y48.379 E.27361
G1 X157.324 Y48.672 E.01132
G1 X150.84 Y55.156 E.27361
G1 X151.081 Y55.45 E.01132
G1 X157.565 Y48.965 E.27361
G1 X157.806 Y49.259 E.01132
G1 X151.322 Y55.743 E.27361
G1 X151.562 Y56.036 E.01132
G1 X158.047 Y49.552 E.27361
G1 X158.287 Y49.846 E.01132
G1 X151.803 Y56.33 E.27361
G1 X152.044 Y56.623 E.01132
G1 X158.528 Y50.139 E.27361
G1 X158.769 Y50.432 E.01132
G1 X152.285 Y56.917 E.27361
G1 X152.526 Y57.21 E.01132
G1 X159.01 Y50.726 E.27361
G1 X159.251 Y51.019 E.01132
G1 X152.766 Y57.503 E.27361
G1 X153.007 Y57.797 E.01132
G1 X159.491 Y51.313 E.27361
G1 X159.732 Y51.606 E.01132
G1 X153.248 Y58.09 E.27361
G1 X153.489 Y58.384 E.01132
G1 X159.973 Y51.899 E.27361
G1 X160.214 Y52.193 E.01132
G1 X153.729 Y58.677 E.27361
G1 X153.97 Y58.97 E.01132
G1 X160.454 Y52.486 E.27361
G1 X160.695 Y52.78 E.01132
G1 X154.211 Y59.264 E.27361
G1 X154.452 Y59.557 E.01132
G1 X160.936 Y53.073 E.27361
G1 X161.177 Y53.366 E.01132
G1 X154.693 Y59.851 E.27361
G1 X154.933 Y60.144 E.01132
G1 X161.418 Y53.66 E.27361
G1 X161.658 Y53.953 E.01132
G1 X155.174 Y60.437 E.27361
G1 X155.415 Y60.731 E.01132
G1 X161.899 Y54.247 E.27361
G1 X162.14 Y54.54 E.01132
G1 X155.656 Y61.024 E.27361
G1 X155.896 Y61.318 E.01132
G1 X162.381 Y54.833 E.27361
G1 X162.621 Y55.127 E.01132
G1 X156.137 Y61.611 E.27361
G1 X156.378 Y61.904 E.01132
G1 X162.862 Y55.42 E.27361
G1 X163.103 Y55.714 E.01132
G1 X156.619 Y62.198 E.27361
G1 X156.86 Y62.491 E.01132
G1 X163.344 Y56.007 E.27361
G1 X163.585 Y56.3 E.01132
G1 X157.1 Y62.785 E.27361
G1 X157.341 Y63.078 E.01132
G1 X163.825 Y56.594 E.27361
G1 X164.066 Y56.887 E.01132
G1 X157.582 Y63.371 E.27361
G1 X157.823 Y63.665 E.01132
G1 X164.307 Y57.181 E.27361
G1 X164.548 Y57.474 E.01132
G1 X158.063 Y63.958 E.27361
G1 X158.304 Y64.252 E.01132
G1 X164.788 Y57.767 E.27361
G1 X165.029 Y58.061 E.01132
G1 X158.545 Y64.545 E.27361
G1 X158.786 Y64.838 E.01132
G1 X165.27 Y58.354 E.27361
G1 X165.511 Y58.648 E.01132
G1 X159.027 Y65.132 E.27361
G1 X159.267 Y65.425 E.01132
G1 X165.752 Y58.941 E.27361
G1 X165.992 Y59.234 E.01132
G1 X159.508 Y65.719 E.27361
G1 X159.749 Y66.012 E.01132
G1 X166.233 Y59.528 E.27361
G1 X166.474 Y59.821 E.01132
G1 X159.99 Y66.305 E.27361
G1 X160.23 Y66.599 E.01132
G1 X166.715 Y60.115 E.27361
G1 X166.955 Y60.408 E.01132
G1 X160.471 Y66.892 E.27361
G1 X160.712 Y67.186 E.01132
G1 X167.196 Y60.701 E.27361
G1 X167.437 Y60.995 E.01132
G1 X160.953 Y67.479 E.27361
G1 X161.194 Y67.772 E.01132
G1 X167.678 Y61.288 E.27361
G1 X167.918 Y61.582 E.01132
G1 X161.434 Y68.066 E.27361
G1 X161.675 Y68.359 E.01132
G1 X168.159 Y61.875 E.27361
G1 X168.4 Y62.168 E.01132
G1 X161.916 Y68.653 E.27361
G1 X162.157 Y68.946 E.01132
G1 X168.641 Y62.462 E.27361
G1 X168.882 Y62.755 E.01132
G1 X162.397 Y69.239 E.27361
G1 X162.638 Y69.533 E.01132
G1 X169.122 Y63.049 E.27361
G1 X169.363 Y63.342 E.01132
G1 X162.879 Y69.826 E.27361
G1 X163.12 Y70.12 E.01132
G1 X169.604 Y63.635 E.27361
G1 X169.845 Y63.929 E.01132
G1 X163.36 Y70.413 E.27361
G1 X163.601 Y70.706 E.01132
G1 X170.085 Y64.222 E.27361
G1 X170.326 Y64.516 E.01132
G1 X163.842 Y71 E.27361
G1 X164.083 Y71.293 E.01132
G1 X170.567 Y64.809 E.27361
G1 X170.808 Y65.102 E.01132
G1 X164.324 Y71.587 E.27361
G1 X164.564 Y71.88 E.01132
G1 X171.049 Y65.396 E.27361
G1 X171.289 Y65.689 E.01132
G1 X164.805 Y72.173 E.27361
G1 X165.046 Y72.467 E.01132
G1 X171.53 Y65.983 E.27361
G1 X171.771 Y66.276 E.01132
G1 X165.287 Y72.76 E.27361
G1 X165.527 Y73.054 E.01132
G1 X172.012 Y66.569 E.27361
G1 X172.252 Y66.863 E.01132
G1 X165.768 Y73.347 E.27361
G1 X166.009 Y73.64 E.01132
G1 X172.493 Y67.156 E.27361
G1 X172.734 Y67.45 E.01132
G1 X166.25 Y73.934 E.27361
G1 X166.491 Y74.227 E.01132
G1 X172.975 Y67.743 E.27361
G1 X173.216 Y68.036 E.01132
G1 X166.731 Y74.521 E.27361
G1 X166.972 Y74.814 E.01132
G1 X173.456 Y68.33 E.27361
G1 X173.697 Y68.623 E.01132
G1 X167.213 Y75.107 E.27361
G1 X167.454 Y75.401 E.01132
G1 X173.938 Y68.917 E.27361
G1 X174.179 Y69.21 E.01132
G1 X167.694 Y75.694 E.27361
G1 X167.935 Y75.988 E.01132
G1 X174.419 Y69.503 E.27361
G1 X174.66 Y69.797 E.01132
G1 X168.176 Y76.281 E.27361
G1 X168.417 Y76.574 E.01132
G1 X174.901 Y70.09 E.27361
G1 X175.142 Y70.384 E.01132
G1 X168.658 Y76.868 E.27361
G1 X168.898 Y77.161 E.01132
G1 X175.383 Y70.677 E.27361
G1 X175.623 Y70.97 E.01132
G1 X169.139 Y77.455 E.27361
G1 X169.38 Y77.748 E.01132
G1 X175.864 Y71.264 E.27361
G1 X176.105 Y71.557 E.01132
G1 X169.621 Y78.041 E.27361
G1 X169.861 Y78.335 E.01132
G1 X176.346 Y71.851 E.27361
G1 X176.586 Y72.144 E.01132
G1 X170.102 Y78.628 E.27361
G1 X170.343 Y78.922 E.01132
G1 X176.827 Y72.437 E.27361
G1 X177.068 Y72.731 E.01132
G1 X170.584 Y79.215 E.27361
G1 X170.825 Y79.508 E.01132
G1 X177.309 Y73.024 E.27361
G1 X177.55 Y73.318 E.01132
G1 X171.065 Y79.802 E.27361
G1 X171.306 Y80.095 E.01132
G1 X177.79 Y73.611 E.27361
G1 X178.031 Y73.904 E.01132
G1 X171.547 Y80.389 E.27361
G1 X171.788 Y80.682 E.01132
G1 X178.272 Y74.198 E.27361
G1 X178.513 Y74.491 E.01132
G1 X172.028 Y80.975 E.27361
G1 X172.269 Y81.269 E.01132
G1 X178.753 Y74.785 E.27361
G1 X178.994 Y75.078 E.01132
G1 X172.51 Y81.562 E.27361
G1 X172.751 Y81.856 E.01132
G1 X179.235 Y75.371 E.27361
G1 X179.476 Y75.665 E.01132
G1 X172.992 Y82.149 E.27361
G1 X173.232 Y82.442 E.01132
G1 X179.717 Y75.958 E.27361
G1 X179.957 Y76.252 E.01132
G1 X173.473 Y82.736 E.27361
G1 X173.714 Y83.029 E.01132
G1 X180.198 Y76.545 E.27361
G1 X180.439 Y76.838 E.01132
G1 X173.955 Y83.323 E.27361
G1 X174.195 Y83.616 E.01132
G1 X180.68 Y77.132 E.27361
G1 X180.92 Y77.425 E.01132
G1 X174.436 Y83.909 E.27361
G1 X174.677 Y84.203 E.01132
G1 X181.161 Y77.719 E.27361
G1 X181.402 Y78.012 E.01132
G1 X174.918 Y84.496 E.27361
G1 X175.159 Y84.79 E.01132
G1 X181.643 Y78.305 E.27361
G1 X181.884 Y78.599 E.01132
G1 X175.399 Y85.083 E.27361
G1 X175.64 Y85.376 E.01132
G1 X182.124 Y78.892 E.27361
G1 X182.365 Y79.186 E.01132
G1 X175.881 Y85.67 E.27361
G1 X176.122 Y85.963 E.01132
G1 X182.606 Y79.479 E.27361
G1 X182.847 Y79.772 E.01132
G1 X176.362 Y86.257 E.27361
G1 X176.603 Y86.55 E.01132
G1 X183.087 Y80.066 E.27361
G1 X183.328 Y80.359 E.01132
G1 X176.844 Y86.843 E.27361
G1 X177.085 Y87.137 E.01132
G1 X183.569 Y80.653 E.27361
G1 X183.81 Y80.946 E.01132
G1 X177.326 Y87.43 E.27361
G1 X177.481 Y87.619 E.0073
G1 X178.558 Y86.732 E.04165
G1 X184.051 Y81.239 E.23175
G1 X184.291 Y81.533 E.01132
G1 X180.342 Y85.482 E.16663
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9530.869
G1 X181.757 Y84.067 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/75
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
G17
G3 Z14.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X112.787 Y244.999 E.34902
G1 X26.662 Y140.051 E4.36564
G1 X19.02 Y130.773 E.3865
G1 X29.049 Y122.537 E.41731
G1 X142.006 Y29.481 E4.70613
G1 X184.993 Y81.862 E2.17897
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X112.733 Y245.551 E.34665
G1 X26.359 Y140.3 E4.05559
G1 X18.469 Y130.72 E.36969
G1 X28.8 Y122.234 E.39822
G1 X142.06 Y28.929 E4.371
G1 X142.091 Y28.966 E.00142
G1 X185.544 Y81.916 E2.04033
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X41.744 Y141.568 Z15 F30000
G1 X113.235 Y244.417 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42007
G1 F9545.273
G1 X110.48 Y241.662 E.11609
G1 X108.039 Y238.688 E.11461
G1 X113.407 Y244.056 E.22616
G1 X113.7 Y243.815 E.01129
G1 X105.599 Y235.714 E.3413
G1 X103.158 Y232.74 E.11461
G1 X113.992 Y243.574 E.45644
G1 X114.284 Y243.333 E.01129
G1 X100.718 Y229.767 E.57159
G1 X98.277 Y226.793 E.11461
G1 X114.577 Y243.092 E.68673
G1 X114.869 Y242.851 E.01129
G1 X95.837 Y223.819 E.80188
G1 X93.397 Y220.845 E.11461
G1 X115.162 Y242.61 E.91702
G1 X115.454 Y242.369 E.01129
G1 X90.956 Y217.871 E1.03216
G1 X88.516 Y214.898 E.11461
G1 X115.747 Y242.129 E1.14731
G1 X116.039 Y241.888 E.01129
G1 X86.075 Y211.924 E1.26245
G1 X83.635 Y208.95 E.11461
G1 X116.332 Y241.647 E1.3776
G1 X116.624 Y241.406 E.01129
G1 X81.194 Y205.976 E1.49274
G1 X78.754 Y203.002 E.11461
G1 X116.916 Y241.165 E1.60788
G1 X117.209 Y240.924 E.01129
G1 X76.313 Y200.028 E1.72303
G1 X73.873 Y197.055 E.11461
M73 P89 R5
G1 X117.501 Y240.683 E1.83817
G1 X117.794 Y240.442 E.01129
G1 X71.433 Y194.081 E1.95331
G1 X68.992 Y191.107 E.11461
G1 X118.086 Y240.201 E2.06846
G1 X118.379 Y239.96 E.01129
G1 X66.552 Y188.133 E2.1836
G1 X64.111 Y185.159 E.11461
G1 X118.671 Y239.719 E2.29875
G1 X118.964 Y239.478 E.01129
G1 X61.671 Y182.185 E2.41389
G1 X59.23 Y179.212 E.11461
G1 X119.256 Y239.237 E2.52903
G1 X119.548 Y238.997 E.01129
G1 X56.79 Y176.238 E2.64418
G1 X54.349 Y173.264 E.11461
G1 X119.841 Y238.756 E2.75932
G1 X120.133 Y238.515 E.01129
G1 X51.909 Y170.29 E2.87447
G1 X49.468 Y167.316 E.11461
G1 X120.426 Y238.274 E2.98961
G1 X120.695 Y238.052 E.01041
G1 X120.504 Y237.819 E.00897
G1 X47.028 Y164.343 E3.09574
G1 X44.588 Y161.369 E.11461
G1 X118.064 Y234.845 E3.09574
G1 X115.623 Y231.871 E.11461
G1 X42.147 Y158.395 E3.09574
G1 X39.707 Y155.421 E.11461
G1 X113.183 Y228.897 E3.09574
G1 X110.743 Y225.924 E.11461
G1 X37.266 Y152.447 E3.09574
G1 X34.826 Y149.473 E.11461
G1 X108.302 Y222.95 E3.09574
G1 X105.862 Y219.976 E.11461
G1 X32.385 Y146.5 E3.09574
G1 X29.945 Y143.526 E.11461
G1 X103.421 Y217.002 E3.09574
G1 X100.981 Y214.028 E.11461
G1 X27.504 Y140.552 E3.09574
G2 X25.025 Y137.539 I-839.017 J687.944 E.11623
G1 X98.54 Y211.054 E3.09737
G1 X96.1 Y208.081 E.11461
G1 X22.534 Y134.515 E3.09952
G1 X20.042 Y131.49 E.11675
G1 X93.659 Y205.107 E3.10166
G1 X91.219 Y202.133 E.11461
G1 X19.718 Y130.632 E3.01252
G1 X20.011 Y130.391 E.01129
G1 X88.778 Y199.159 E2.89736
G1 X86.338 Y196.185 E.11461
G1 X20.303 Y130.151 E2.7822
G1 X20.596 Y129.91 E.01129
G1 X83.897 Y193.211 E2.66703
G1 X81.457 Y190.238 E.11461
G1 X20.889 Y129.67 E2.55187
G1 X21.182 Y129.429 E.01129
G1 X79.017 Y187.264 E2.43671
G1 X76.576 Y184.29 E.11461
G1 X21.475 Y129.189 E2.32155
G1 X21.768 Y128.948 E.01129
G1 X74.136 Y181.316 E2.20639
G1 X71.695 Y178.342 E.11461
G1 X22.061 Y128.708 E2.09123
G1 X22.353 Y128.467 E.01129
G1 X69.255 Y175.368 E1.97607
G1 X66.814 Y172.395 E.11461
G1 X22.646 Y128.227 E1.8609
G1 X22.939 Y127.986 E.01129
G1 X64.374 Y169.421 E1.74574
G1 X61.933 Y166.447 E.11461
G1 X23.232 Y127.746 E1.63058
G1 X23.525 Y127.505 E.01129
G1 X59.493 Y163.473 E1.51542
G1 X57.052 Y160.499 E.11461
G1 X23.818 Y127.265 E1.40026
G1 X24.111 Y127.024 E.01129
G1 X54.612 Y157.525 E1.2851
G1 X52.171 Y154.552 E.11461
G1 X24.403 Y126.784 E1.16994
G1 X24.696 Y126.543 E.01129
G1 X49.731 Y151.578 E1.05477
G1 X47.291 Y148.604 E.11461
G1 X24.989 Y126.303 E.93961
G1 X25.282 Y126.062 E.01129
G1 X44.85 Y145.63 E.82445
G1 X42.41 Y142.656 E.11461
G1 X25.575 Y125.822 E.70929
G1 X25.868 Y125.581 E.01129
G1 X39.969 Y139.682 E.59413
G1 X37.529 Y136.709 E.11461
G1 X26.161 Y125.341 E.47897
G1 X26.453 Y125.1 E.01129
G1 X35.088 Y133.735 E.36381
G1 X35.053 Y133.692 E.00163
G1 X35.342 Y133.455 E.01113
G1 X26.746 Y124.859 E.36215
G1 X27.039 Y124.619 E.01129
G1 X35.634 Y133.214 E.36213
G1 X35.927 Y132.973 E.01129
G1 X27.332 Y124.378 E.36211
G1 X27.625 Y124.138 E.01129
G1 X36.219 Y132.732 E.3621
G1 X36.512 Y132.491 E.01129
M73 P89 R4
G1 X27.918 Y123.897 E.36208
G1 X28.211 Y123.657 E.01129
G1 X36.804 Y132.25 E.36206
G1 X37.096 Y132.009 E.01129
G1 X28.503 Y123.416 E.36205
G1 X28.796 Y123.176 E.01129
G1 X37.389 Y131.769 E.36203
G1 X37.681 Y131.528 E.01129
G1 X29.089 Y122.935 E.36201
G1 X29.382 Y122.695 E.01129
G1 X37.974 Y131.287 E.362
G1 X38.266 Y131.046 E.01129
G1 X29.674 Y122.454 E.362
G1 X29.967 Y122.213 E.01129
G1 X38.559 Y130.805 E.362
M73 P90 R4
G1 X38.851 Y130.564 E.01129
G1 X30.259 Y121.972 E.362
G1 X30.552 Y121.731 E.01129
G1 X39.144 Y130.323 E.362
G1 X39.436 Y130.082 E.01129
G1 X30.844 Y121.49 E.362
G1 X31.136 Y121.249 E.01129
G1 X39.728 Y129.841 E.362
G1 X40.021 Y129.6 E.01129
G1 X31.429 Y121.008 E.362
G1 X31.721 Y120.767 E.01129
G1 X40.313 Y129.359 E.362
G1 X40.606 Y129.118 E.01129
G1 X32.014 Y120.526 E.362
G1 X32.306 Y120.285 E.01129
G1 X40.898 Y128.877 E.362
G1 X41.191 Y128.637 E.01129
G1 X32.599 Y120.045 E.362
G1 X32.891 Y119.804 E.01129
G1 X41.483 Y128.396 E.362
G1 X41.776 Y128.155 E.01129
G1 X33.184 Y119.563 E.362
G1 X33.476 Y119.322 E.01129
G1 X42.068 Y127.914 E.362
G1 X42.361 Y127.673 E.01129
G1 X33.769 Y119.081 E.362
G1 X34.061 Y118.84 E.01129
G1 X42.653 Y127.432 E.362
G1 X42.945 Y127.191 E.01129
G1 X34.353 Y118.599 E.362
G1 X34.646 Y118.358 E.01129
G1 X43.238 Y126.95 E.362
G1 X43.53 Y126.709 E.01129
G1 X34.938 Y118.117 E.362
G1 X35.231 Y117.876 E.01129
G1 X43.823 Y126.468 E.362
G1 X44.115 Y126.227 E.01129
G1 X35.523 Y117.635 E.362
G1 X35.816 Y117.394 E.01129
G1 X44.408 Y125.986 E.362
G1 X44.7 Y125.745 E.01129
G1 X36.108 Y117.153 E.362
G1 X36.401 Y116.913 E.01129
G1 X44.993 Y125.505 E.362
G1 X45.285 Y125.264 E.01129
G1 X36.693 Y116.672 E.362
G1 X36.985 Y116.431 E.01129
G1 X45.577 Y125.023 E.362
G1 X45.87 Y124.782 E.01129
G1 X37.278 Y116.19 E.362
G1 X37.57 Y115.949 E.01129
G1 X46.162 Y124.541 E.362
G1 X46.455 Y124.3 E.01129
G1 X37.863 Y115.708 E.362
G1 X38.155 Y115.467 E.01129
G1 X46.747 Y124.059 E.362
G1 X47.04 Y123.818 E.01129
G1 X38.448 Y115.226 E.362
G1 X38.74 Y114.985 E.01129
G1 X47.332 Y123.577 E.362
G1 X47.625 Y123.336 E.01129
G1 X39.033 Y114.744 E.362
G1 X39.325 Y114.503 E.01129
G1 X47.917 Y123.095 E.362
G1 X48.209 Y122.854 E.01129
G1 X39.617 Y114.262 E.362
G1 X39.91 Y114.021 E.01129
G1 X48.502 Y122.613 E.362
G1 X48.794 Y122.373 E.01129
G1 X40.202 Y113.781 E.362
G1 X40.495 Y113.54 E.01129
G1 X49.087 Y122.132 E.362
G1 X49.379 Y121.891 E.01129
G1 X40.787 Y113.299 E.362
G1 X41.08 Y113.058 E.01129
G1 X49.672 Y121.65 E.362
G1 X49.964 Y121.409 E.01129
G1 X41.372 Y112.817 E.362
G1 X41.665 Y112.576 E.01129
G1 X50.257 Y121.168 E.362
G1 X50.549 Y120.927 E.01129
G1 X41.957 Y112.335 E.362
G1 X42.25 Y112.094 E.01129
G1 X50.842 Y120.686 E.362
G1 X51.134 Y120.445 E.01129
G1 X42.542 Y111.853 E.362
G1 X42.834 Y111.612 E.01129
G1 X51.426 Y120.204 E.362
G1 X51.719 Y119.963 E.01129
G1 X43.127 Y111.371 E.362
G1 X43.419 Y111.13 E.01129
G1 X52.011 Y119.722 E.362
G1 X52.304 Y119.481 E.01129
G1 X43.712 Y110.889 E.362
G1 X44.004 Y110.649 E.01129
G1 X52.596 Y119.241 E.362
G1 X52.889 Y119 E.01129
G1 X44.297 Y110.408 E.362
G1 X44.589 Y110.167 E.01129
G1 X53.181 Y118.759 E.362
G1 X53.474 Y118.518 E.01129
G1 X44.882 Y109.926 E.362
G1 X45.174 Y109.685 E.01129
G1 X53.766 Y118.277 E.362
G1 X54.058 Y118.036 E.01129
G1 X45.466 Y109.444 E.362
G1 X45.759 Y109.203 E.01129
G1 X54.351 Y117.795 E.362
G1 X54.643 Y117.554 E.01129
G1 X46.051 Y108.962 E.362
G1 X46.344 Y108.721 E.01129
G1 X54.936 Y117.313 E.362
G1 X55.228 Y117.072 E.01129
G1 X46.636 Y108.48 E.362
G1 X46.929 Y108.239 E.01129
G1 X55.521 Y116.831 E.362
G1 X55.813 Y116.59 E.01129
G1 X47.221 Y107.998 E.362
G1 X47.514 Y107.757 E.01129
G1 X56.106 Y116.349 E.362
G1 X56.398 Y116.109 E.01129
G1 X47.806 Y107.517 E.362
G1 X48.098 Y107.276 E.01129
G1 X56.69 Y115.868 E.362
G1 X56.983 Y115.627 E.01129
G1 X48.391 Y107.035 E.362
G1 X48.683 Y106.794 E.01129
G1 X57.275 Y115.386 E.362
G1 X57.568 Y115.145 E.01129
G1 X48.976 Y106.553 E.362
G1 X49.268 Y106.312 E.01129
G1 X57.86 Y114.904 E.362
G1 X58.153 Y114.663 E.01129
G1 X49.561 Y106.071 E.362
G1 X49.853 Y105.83 E.01129
G1 X58.445 Y114.422 E.362
G1 X58.738 Y114.181 E.01129
G1 X50.146 Y105.589 E.362
G1 X50.438 Y105.348 E.01129
G1 X59.03 Y113.94 E.362
G1 X59.322 Y113.699 E.01129
G1 X50.731 Y105.107 E.362
G1 X51.023 Y104.866 E.01129
G1 X59.615 Y113.458 E.362
G1 X59.907 Y113.217 E.01129
G1 X51.315 Y104.625 E.362
G1 X51.608 Y104.385 E.01129
G1 X60.2 Y112.977 E.362
G1 X60.492 Y112.736 E.01129
G1 X51.9 Y104.144 E.362
G1 X52.193 Y103.903 E.01129
G1 X60.785 Y112.495 E.362
G1 X61.077 Y112.254 E.01129
G1 X52.485 Y103.662 E.362
G1 X52.778 Y103.421 E.01129
G1 X61.37 Y112.013 E.362
G1 X61.662 Y111.772 E.01129
G1 X53.07 Y103.18 E.362
G1 X53.363 Y102.939 E.01129
G1 X61.955 Y111.531 E.362
G1 X62.247 Y111.29 E.01129
G1 X53.655 Y102.698 E.362
G1 X53.947 Y102.457 E.01129
G1 X62.539 Y111.049 E.362
G1 X62.832 Y110.808 E.01129
G1 X54.24 Y102.216 E.362
G1 X54.532 Y101.975 E.01129
G1 X63.124 Y110.567 E.362
G1 X63.417 Y110.326 E.01129
G1 X54.825 Y101.734 E.362
G1 X55.117 Y101.493 E.01129
G1 X63.709 Y110.085 E.362
G1 X64.002 Y109.845 E.01129
G1 X55.41 Y101.253 E.362
G1 X55.702 Y101.012 E.01129
G1 X64.294 Y109.604 E.362
G1 X64.587 Y109.363 E.01129
G1 X55.995 Y100.771 E.362
G1 X56.287 Y100.53 E.01129
G1 X64.879 Y109.122 E.362
G1 X65.171 Y108.881 E.01129
G1 X56.579 Y100.289 E.362
G1 X56.872 Y100.048 E.01129
G1 X65.464 Y108.64 E.362
G1 X65.756 Y108.399 E.01129
G1 X57.164 Y99.807 E.362
G1 X57.457 Y99.566 E.01129
G1 X66.049 Y108.158 E.362
G1 X66.341 Y107.917 E.01129
G1 X57.749 Y99.325 E.362
G1 X58.042 Y99.084 E.01129
G1 X66.634 Y107.676 E.362
G1 X66.926 Y107.435 E.01129
G1 X58.334 Y98.843 E.362
G1 X58.627 Y98.602 E.01129
G1 X67.219 Y107.194 E.362
G1 X67.511 Y106.953 E.01129
G1 X58.919 Y98.361 E.362
G1 X59.211 Y98.121 E.01129
G1 X67.803 Y106.713 E.362
G1 X68.096 Y106.472 E.01129
G1 X59.504 Y97.88 E.362
G1 X59.796 Y97.639 E.01129
G1 X68.388 Y106.231 E.362
G1 X68.681 Y105.99 E.01129
G1 X60.089 Y97.398 E.362
G1 X60.381 Y97.157 E.01129
G1 X68.973 Y105.749 E.362
G1 X69.266 Y105.508 E.01129
G1 X60.674 Y96.916 E.362
G1 X60.966 Y96.675 E.01129
G1 X69.558 Y105.267 E.362
G1 X69.851 Y105.026 E.01129
G1 X61.259 Y96.434 E.362
G1 X61.551 Y96.193 E.01129
G1 X70.143 Y104.785 E.362
G1 X70.436 Y104.544 E.01129
G1 X61.844 Y95.952 E.362
G1 X62.136 Y95.711 E.01129
G1 X70.728 Y104.303 E.362
G1 X71.02 Y104.062 E.01129
G1 X62.428 Y95.47 E.362
G1 X62.721 Y95.229 E.01129
G1 X71.313 Y103.821 E.362
G1 X71.605 Y103.581 E.01129
G1 X63.013 Y94.989 E.362
G1 X63.306 Y94.748 E.01129
G1 X71.898 Y103.34 E.362
G1 X72.19 Y103.099 E.01129
G1 X63.598 Y94.507 E.362
G1 X63.891 Y94.266 E.01129
G1 X72.483 Y102.858 E.362
G1 X72.775 Y102.617 E.01129
G1 X64.183 Y94.025 E.362
G1 X64.476 Y93.784 E.01129
G1 X73.068 Y102.376 E.362
G1 X73.36 Y102.135 E.01129
G1 X64.768 Y93.543 E.362
G1 X65.06 Y93.302 E.01129
G1 X73.652 Y101.894 E.362
G1 X73.945 Y101.653 E.01129
G1 X65.353 Y93.061 E.362
G1 X65.645 Y92.82 E.01129
G1 X74.237 Y101.412 E.362
G1 X74.53 Y101.171 E.01129
G1 X65.938 Y92.579 E.362
G1 X66.23 Y92.338 E.01129
G1 X74.822 Y100.93 E.362
G1 X75.115 Y100.689 E.01129
G1 X66.523 Y92.097 E.362
G1 X66.815 Y91.857 E.01129
G1 X75.407 Y100.449 E.362
G1 X75.7 Y100.208 E.01129
G1 X67.108 Y91.616 E.362
G1 X67.4 Y91.375 E.01129
G1 X75.992 Y99.967 E.362
G1 X76.284 Y99.726 E.01129
G1 X67.692 Y91.134 E.362
G1 X67.985 Y90.893 E.01129
G1 X76.577 Y99.485 E.362
G1 X76.869 Y99.244 E.01129
G1 X68.277 Y90.652 E.362
G1 X68.57 Y90.411 E.01129
G1 X77.162 Y99.003 E.362
G1 X77.454 Y98.762 E.01129
G1 X68.862 Y90.17 E.362
G1 X69.155 Y89.929 E.01129
G1 X77.747 Y98.521 E.362
G1 X78.039 Y98.28 E.01129
G1 X69.447 Y89.688 E.362
G1 X69.74 Y89.447 E.01129
G1 X78.332 Y98.039 E.362
G1 X78.624 Y97.798 E.01129
G1 X70.032 Y89.206 E.362
G1 X70.325 Y88.965 E.01129
G1 X78.916 Y97.557 E.362
G1 X79.209 Y97.317 E.01129
G1 X70.617 Y88.725 E.362
G1 X70.909 Y88.484 E.01129
G1 X79.501 Y97.076 E.362
G1 X79.794 Y96.835 E.01129
G1 X71.202 Y88.243 E.362
G1 X71.494 Y88.002 E.01129
G1 X80.086 Y96.594 E.362
G1 X80.379 Y96.353 E.01129
G1 X71.787 Y87.761 E.362
G1 X72.079 Y87.52 E.01129
G1 X80.671 Y96.112 E.362
G1 X80.964 Y95.871 E.01129
G1 X72.372 Y87.279 E.362
G1 X72.664 Y87.038 E.01129
G1 X81.256 Y95.63 E.362
G1 X81.549 Y95.389 E.01129
G1 X72.957 Y86.797 E.362
G1 X73.249 Y86.556 E.01129
G1 X81.841 Y95.148 E.362
G1 X82.133 Y94.907 E.01129
G1 X73.541 Y86.315 E.362
G1 X73.834 Y86.074 E.01129
G1 X82.426 Y94.666 E.362
G1 X82.718 Y94.425 E.01129
G1 X74.126 Y85.833 E.362
G1 X74.419 Y85.593 E.01129
G1 X83.011 Y94.185 E.362
G1 X83.303 Y93.944 E.01129
G1 X74.711 Y85.352 E.362
G1 X75.004 Y85.111 E.01129
G1 X83.596 Y93.703 E.362
G1 X83.888 Y93.462 E.01129
G1 X75.296 Y84.87 E.362
G1 X75.589 Y84.629 E.01129
G1 X84.181 Y93.221 E.362
G1 X84.473 Y92.98 E.01129
G1 X75.881 Y84.388 E.362
G1 X76.173 Y84.147 E.01129
G1 X84.765 Y92.739 E.362
G1 X85.058 Y92.498 E.01129
G1 X76.466 Y83.906 E.362
G1 X76.758 Y83.665 E.01129
G1 X85.35 Y92.257 E.362
G1 X85.643 Y92.016 E.01129
G1 X77.051 Y83.424 E.362
G1 X77.343 Y83.183 E.01129
G1 X85.935 Y91.775 E.362
G1 X86.228 Y91.534 E.01129
G1 X77.636 Y82.942 E.362
G1 X77.928 Y82.702 E.01129
G1 X86.52 Y91.293 E.362
G1 X86.813 Y91.053 E.01129
G1 X78.221 Y82.461 E.362
G1 X78.513 Y82.22 E.01129
G1 X87.105 Y90.812 E.362
G1 X87.397 Y90.571 E.01129
G1 X78.806 Y81.979 E.362
G1 X79.098 Y81.738 E.01129
G1 X87.69 Y90.33 E.362
G1 X87.982 Y90.089 E.01129
G1 X79.39 Y81.497 E.362
G1 X79.683 Y81.256 E.01129
G1 X88.275 Y89.848 E.362
G1 X88.567 Y89.607 E.01129
G1 X79.975 Y81.015 E.362
G1 X80.268 Y80.774 E.01129
G1 X88.86 Y89.366 E.362
G1 X89.152 Y89.125 E.01129
G1 X80.56 Y80.533 E.362
G1 X80.853 Y80.292 E.01129
G1 X89.445 Y88.884 E.362
G1 X89.737 Y88.643 E.01129
G1 X81.145 Y80.051 E.362
G1 X81.438 Y79.81 E.01129
G1 X90.03 Y88.402 E.362
G1 X90.322 Y88.161 E.01129
G1 X81.73 Y79.57 E.362
G1 X82.022 Y79.329 E.01129
G1 X90.614 Y87.921 E.362
G1 X90.907 Y87.68 E.01129
G1 X82.315 Y79.088 E.362
G1 X82.607 Y78.847 E.01129
G1 X91.199 Y87.439 E.362
G1 X91.492 Y87.198 E.01129
G1 X82.9 Y78.606 E.362
G1 X83.192 Y78.365 E.01129
G1 X91.784 Y86.957 E.362
G1 X92.077 Y86.716 E.01129
G1 X83.485 Y78.124 E.362
G1 X83.777 Y77.883 E.01129
G1 X92.369 Y86.475 E.362
G1 X92.662 Y86.234 E.01129
G1 X84.07 Y77.642 E.362
G1 X84.362 Y77.401 E.01129
G1 X92.954 Y85.993 E.362
G1 X93.246 Y85.752 E.01129
G1 X84.654 Y77.16 E.362
G1 X84.947 Y76.919 E.01129
G1 X93.539 Y85.511 E.362
G1 X93.831 Y85.27 E.01129
G1 X85.239 Y76.678 E.362
G1 X85.532 Y76.438 E.01129
G1 X94.124 Y85.029 E.362
G1 X94.416 Y84.789 E.01129
G1 X85.824 Y76.197 E.362
G1 X86.117 Y75.956 E.01129
G1 X94.709 Y84.548 E.362
G1 X95.001 Y84.307 E.01129
G1 X86.409 Y75.715 E.362
G1 X86.702 Y75.474 E.01129
G1 X95.294 Y84.066 E.362
G1 X95.586 Y83.825 E.01129
G1 X86.994 Y75.233 E.362
G1 X87.286 Y74.992 E.01129
G1 X95.878 Y83.584 E.362
G1 X96.171 Y83.343 E.01129
G1 X87.579 Y74.751 E.362
G1 X87.871 Y74.51 E.01129
G1 X96.463 Y83.102 E.362
G1 X96.756 Y82.861 E.01129
G1 X88.164 Y74.269 E.362
G1 X88.456 Y74.028 E.01129
G1 X97.048 Y82.62 E.362
G1 X97.341 Y82.379 E.01129
G1 X88.749 Y73.787 E.362
G1 X89.041 Y73.546 E.01129
G1 X97.633 Y82.138 E.362
G1 X97.926 Y81.898 E.01129
G1 X89.334 Y73.306 E.362
G1 X89.626 Y73.065 E.01129
G1 X98.218 Y81.657 E.362
G1 X98.511 Y81.416 E.01129
G1 X89.919 Y72.824 E.362
G1 X90.211 Y72.583 E.01129
G1 X98.803 Y81.175 E.362
G1 X99.095 Y80.934 E.01129
G1 X90.503 Y72.342 E.362
G1 X90.796 Y72.101 E.01129
G1 X99.388 Y80.693 E.362
G1 X99.68 Y80.452 E.01129
G1 X91.088 Y71.86 E.362
G1 X91.381 Y71.619 E.01129
G1 X99.973 Y80.211 E.362
G1 X100.265 Y79.97 E.01129
G1 X91.673 Y71.378 E.362
G1 X91.966 Y71.137 E.01129
G1 X100.558 Y79.729 E.362
G1 X100.85 Y79.488 E.01129
G1 X92.258 Y70.896 E.362
G1 X92.551 Y70.655 E.01129
G1 X101.143 Y79.247 E.362
G1 X101.435 Y79.006 E.01129
G1 X92.843 Y70.414 E.362
G1 X93.135 Y70.174 E.01129
G1 X101.727 Y78.766 E.362
G1 X102.02 Y78.525 E.01129
G1 X93.428 Y69.933 E.362
G1 X93.72 Y69.692 E.01129
G1 X102.312 Y78.284 E.362
G1 X102.605 Y78.043 E.01129
G1 X94.013 Y69.451 E.362
G1 X94.305 Y69.21 E.01129
G1 X102.897 Y77.802 E.362
G1 X103.19 Y77.561 E.01129
G1 X94.598 Y68.969 E.362
G1 X94.89 Y68.728 E.01129
G1 X103.482 Y77.32 E.362
G1 X103.775 Y77.079 E.01129
G1 X95.183 Y68.487 E.362
G1 X95.475 Y68.246 E.01129
G1 X104.067 Y76.838 E.362
G1 X104.359 Y76.597 E.01129
G1 X95.767 Y68.005 E.362
G1 X96.06 Y67.764 E.01129
G1 X104.652 Y76.356 E.362
G1 X104.944 Y76.115 E.01129
G1 X96.352 Y67.523 E.362
G1 X96.645 Y67.282 E.01129
G1 X105.237 Y75.874 E.362
G1 X105.529 Y75.634 E.01129
G1 X96.937 Y67.042 E.362
G1 X97.23 Y66.801 E.01129
G1 X105.822 Y75.393 E.362
G1 X106.114 Y75.152 E.01129
G1 X97.522 Y66.56 E.362
G1 X97.815 Y66.319 E.01129
G1 X106.407 Y74.911 E.362
G1 X106.699 Y74.67 E.01129
G1 X98.107 Y66.078 E.362
G1 X98.4 Y65.837 E.01129
G1 X106.991 Y74.429 E.362
G1 X107.284 Y74.188 E.01129
G1 X98.692 Y65.596 E.362
G1 X98.984 Y65.355 E.01129
G1 X107.576 Y73.947 E.362
G1 X107.869 Y73.706 E.01129
G1 X99.277 Y65.114 E.362
G1 X99.569 Y64.873 E.01129
G1 X108.161 Y73.465 E.362
G1 X108.454 Y73.224 E.01129
G1 X99.862 Y64.632 E.362
G1 X100.154 Y64.391 E.01129
G1 X108.746 Y72.983 E.362
G1 X109.039 Y72.742 E.01129
G1 X100.447 Y64.15 E.362
G1 X100.739 Y63.91 E.01129
G1 X109.331 Y72.502 E.362
G1 X109.624 Y72.261 E.01129
G1 X101.032 Y63.669 E.362
G1 X101.324 Y63.428 E.01129
G1 X109.916 Y72.02 E.362
G1 X110.208 Y71.779 E.01129
G1 X101.616 Y63.187 E.362
G1 X101.909 Y62.946 E.01129
G1 X110.501 Y71.538 E.362
G1 X110.793 Y71.297 E.01129
G1 X102.201 Y62.705 E.362
G1 X102.494 Y62.464 E.01129
G1 X111.086 Y71.056 E.362
G1 X111.378 Y70.815 E.01129
G1 X102.786 Y62.223 E.362
G1 X103.079 Y61.982 E.01129
G1 X111.671 Y70.574 E.362
G1 X111.963 Y70.333 E.01129
G1 X103.371 Y61.741 E.362
G1 X103.664 Y61.5 E.01129
G1 X112.256 Y70.092 E.362
G1 X112.548 Y69.851 E.01129
G1 X103.956 Y61.259 E.362
G1 X104.248 Y61.018 E.01129
G1 X112.84 Y69.61 E.362
G1 X113.133 Y69.37 E.01129
G1 X104.541 Y60.778 E.362
G1 X104.833 Y60.537 E.01129
G1 X113.425 Y69.129 E.362
G1 X113.718 Y68.888 E.01129
G1 X105.126 Y60.296 E.362
G1 X105.418 Y60.055 E.01129
G1 X114.01 Y68.647 E.362
G1 X114.303 Y68.406 E.01129
G1 X105.711 Y59.814 E.362
G1 X106.003 Y59.573 E.01129
G1 X114.595 Y68.165 E.362
G1 X114.888 Y67.924 E.01129
G1 X106.296 Y59.332 E.362
G1 X106.588 Y59.091 E.01129
G1 X115.18 Y67.683 E.362
G1 X115.472 Y67.442 E.01129
G1 X106.88 Y58.85 E.362
G1 X107.173 Y58.609 E.01129
G1 X115.765 Y67.201 E.362
G1 X116.057 Y66.96 E.01129
G1 X107.465 Y58.368 E.362
G1 X107.758 Y58.127 E.01129
G1 X116.35 Y66.719 E.362
G1 X116.642 Y66.478 E.01129
G1 X108.05 Y57.886 E.362
G1 X108.343 Y57.646 E.01129
G1 X116.935 Y66.238 E.362
G1 X117.227 Y65.997 E.01129
G1 X108.635 Y57.405 E.362
G1 X108.928 Y57.164 E.01129
G1 X117.52 Y65.756 E.362
G1 X117.812 Y65.515 E.01129
G1 X109.22 Y56.923 E.362
G1 X109.513 Y56.682 E.01129
G1 X118.105 Y65.274 E.362
G1 X118.397 Y65.033 E.01129
G1 X109.805 Y56.441 E.362
M73 P91 R4
G1 X110.097 Y56.2 E.01129
G1 X118.689 Y64.792 E.362
G1 X118.982 Y64.551 E.01129
G1 X110.39 Y55.959 E.362
G1 X110.682 Y55.718 E.01129
G1 X119.274 Y64.31 E.362
G1 X119.567 Y64.069 E.01129
G1 X110.975 Y55.477 E.362
G1 X111.267 Y55.236 E.01129
G1 X119.859 Y63.828 E.362
G1 X120.152 Y63.587 E.01129
G1 X111.56 Y54.995 E.362
G1 X111.852 Y54.754 E.01129
G1 X120.444 Y63.346 E.362
G1 X120.737 Y63.106 E.01129
G1 X112.145 Y54.514 E.362
G1 X112.437 Y54.273 E.01129
G1 X121.029 Y62.865 E.362
G1 X121.321 Y62.624 E.01129
G1 X112.729 Y54.032 E.362
G1 X113.022 Y53.791 E.01129
G1 X121.614 Y62.383 E.362
G1 X121.906 Y62.142 E.01129
G1 X113.314 Y53.55 E.362
G1 X113.607 Y53.309 E.01129
G1 X122.199 Y61.901 E.362
G1 X122.491 Y61.66 E.01129
G1 X113.899 Y53.068 E.362
G1 X114.192 Y52.827 E.01129
G1 X122.784 Y61.419 E.362
G1 X123.076 Y61.178 E.01129
G1 X114.484 Y52.586 E.362
G1 X114.777 Y52.345 E.01129
G1 X123.369 Y60.937 E.362
G1 X123.661 Y60.696 E.01129
G1 X115.069 Y52.104 E.362
G1 X115.361 Y51.863 E.01129
G1 X123.953 Y60.455 E.362
G1 X124.246 Y60.214 E.01129
G1 X115.654 Y51.622 E.362
G1 X115.946 Y51.382 E.01129
G1 X124.538 Y59.974 E.362
G1 X124.831 Y59.733 E.01129
G1 X116.239 Y51.141 E.362
G1 X116.531 Y50.9 E.01129
G1 X125.123 Y59.492 E.362
G1 X125.416 Y59.251 E.01129
G1 X116.824 Y50.659 E.362
G1 X117.116 Y50.418 E.01129
G1 X125.708 Y59.01 E.362
G1 X126.001 Y58.769 E.01129
G1 X117.409 Y50.177 E.362
G1 X117.701 Y49.936 E.01129
G1 X126.293 Y58.528 E.362
G1 X126.585 Y58.287 E.01129
G1 X117.994 Y49.695 E.362
G1 X118.286 Y49.454 E.01129
G1 X126.878 Y58.046 E.362
G1 X127.17 Y57.805 E.01129
G1 X118.578 Y49.213 E.362
G1 X118.871 Y48.972 E.01129
G1 X127.463 Y57.564 E.362
G1 X127.755 Y57.323 E.01129
G1 X119.163 Y48.731 E.362
G1 X119.456 Y48.49 E.01129
G1 X128.048 Y57.082 E.362
G1 X128.34 Y56.842 E.01129
G1 X119.748 Y48.25 E.362
G1 X120.041 Y48.009 E.01129
G1 X128.633 Y56.601 E.362
G1 X128.925 Y56.36 E.01129
G1 X120.333 Y47.768 E.362
G1 X120.626 Y47.527 E.01129
G1 X129.218 Y56.119 E.362
G1 X129.51 Y55.878 E.01129
G1 X120.918 Y47.286 E.362
G1 X121.21 Y47.045 E.01129
G1 X129.802 Y55.637 E.362
G1 X130.095 Y55.396 E.01129
G1 X121.503 Y46.804 E.362
G1 X121.795 Y46.563 E.01129
G1 X130.387 Y55.155 E.362
G1 X130.68 Y54.914 E.01129
G1 X122.088 Y46.322 E.362
G1 X122.38 Y46.081 E.01129
G1 X130.972 Y54.673 E.362
G1 X131.265 Y54.432 E.01129
G1 X122.673 Y45.84 E.362
G1 X122.965 Y45.599 E.01129
G1 X131.557 Y54.191 E.362
G1 X131.85 Y53.95 E.01129
G1 X123.258 Y45.358 E.362
G1 X123.55 Y45.118 E.01129
G1 X132.142 Y53.71 E.362
G1 X132.434 Y53.469 E.01129
G1 X123.842 Y44.877 E.362
G1 X124.135 Y44.636 E.01129
G1 X132.727 Y53.228 E.362
G1 X133.019 Y52.987 E.01129
G1 X124.427 Y44.395 E.362
G1 X124.72 Y44.154 E.01129
G1 X133.312 Y52.746 E.362
G1 X133.604 Y52.505 E.01129
G1 X125.012 Y43.913 E.362
G1 X125.305 Y43.672 E.01129
G1 X133.897 Y52.264 E.362
G1 X134.189 Y52.023 E.01129
G1 X125.597 Y43.431 E.362
G1 X125.89 Y43.19 E.01129
G1 X134.482 Y51.782 E.362
G1 X134.774 Y51.541 E.01129
G1 X126.182 Y42.949 E.362
G1 X126.475 Y42.708 E.01129
G1 X135.066 Y51.3 E.362
G1 X135.359 Y51.059 E.01129
G1 X126.767 Y42.467 E.362
G1 X127.059 Y42.226 E.01129
G1 X135.651 Y50.818 E.362
G1 X135.944 Y50.578 E.01129
G1 X127.352 Y41.986 E.362
G1 X127.644 Y41.745 E.01129
G1 X136.236 Y50.337 E.362
G1 X136.529 Y50.096 E.01129
G1 X127.937 Y41.504 E.362
G1 X128.229 Y41.263 E.01129
G1 X136.821 Y49.855 E.362
G1 X137.114 Y49.614 E.01129
G1 X128.522 Y41.022 E.362
G1 X128.814 Y40.781 E.01129
G1 X137.406 Y49.373 E.362
G1 X137.699 Y49.132 E.01129
G1 X129.107 Y40.54 E.362
G1 X129.399 Y40.299 E.01129
G1 X137.991 Y48.891 E.362
G1 X138.283 Y48.65 E.01129
G1 X129.691 Y40.058 E.362
G1 X129.984 Y39.817 E.01129
G1 X138.576 Y48.409 E.362
G1 X138.868 Y48.168 E.01129
G1 X130.276 Y39.576 E.362
G1 X130.569 Y39.335 E.01129
G1 X139.161 Y47.927 E.362
G1 X139.453 Y47.686 E.01129
G1 X130.861 Y39.094 E.362
G1 X131.154 Y38.854 E.01129
G1 X139.746 Y47.446 E.362
G1 X140.038 Y47.205 E.01129
G1 X131.446 Y38.613 E.362
G1 X131.739 Y38.372 E.01129
G1 X140.331 Y46.964 E.362
G1 X140.623 Y46.723 E.01129
G1 X132.031 Y38.131 E.362
G1 X132.323 Y37.89 E.01129
G1 X140.915 Y46.482 E.362
G1 X141.208 Y46.241 E.01129
G1 X132.616 Y37.649 E.362
G1 X132.908 Y37.408 E.01129
G1 X141.5 Y46 E.362
G1 X141.793 Y45.759 E.01129
G1 X133.201 Y37.167 E.362
G1 X133.493 Y36.926 E.01129
G1 X142.085 Y45.518 E.362
G1 X142.378 Y45.277 E.01129
G1 X133.786 Y36.685 E.362
G1 X134.078 Y36.444 E.01129
G1 X181.742 Y84.109 E2.00821
G1 X182.035 Y83.868 E.01129
G1 X134.371 Y36.203 E2.00821
G1 X134.663 Y35.962 E.01129
G1 X182.327 Y83.627 E2.00821
G1 X182.62 Y83.386 E.01129
G1 X134.955 Y35.722 E2.00821
G1 X135.248 Y35.481 E.01129
G1 X182.912 Y83.145 E2.00821
G1 X183.205 Y82.904 E.01129
G1 X135.54 Y35.24 E2.00821
G1 X135.833 Y34.999 E.01129
G1 X183.497 Y82.663 E2.00821
G1 X183.79 Y82.422 E.01129
G1 X136.125 Y34.758 E2.00821
G1 X136.418 Y34.517 E.01129
G1 X184.082 Y82.181 E2.00821
G1 X184.374 Y81.94 E.01129
G1 X136.71 Y34.276 E2.00821
G1 X137.003 Y34.035 E.01129
G1 X183.335 Y80.368 E1.9521
G1 X180.895 Y77.394 E.11461
G1 X137.295 Y33.794 E1.83696
G1 X137.588 Y33.553 E.01129
G1 X178.454 Y74.42 E1.72181
G1 X176.014 Y71.446 E.11461
G1 X137.88 Y33.312 E1.60667
G1 X138.172 Y33.071 E.01129
G1 X173.573 Y68.472 E1.49152
G1 X171.133 Y65.498 E.11461
G1 X138.465 Y32.83 E1.37638
G1 X138.757 Y32.59 E.01129
G1 X168.692 Y62.525 E1.26124
G1 X166.252 Y59.551 E.11461
G1 X139.05 Y32.349 E1.14609
G1 X139.342 Y32.108 E.01129
G1 X163.811 Y56.577 E1.03095
G1 X161.371 Y53.603 E.11461
G1 X139.635 Y31.867 E.9158
G1 X139.927 Y31.626 E.01129
G1 X158.93 Y50.629 E.80066
G1 X156.49 Y47.655 E.11461
G1 X140.22 Y31.385 E.68552
G1 X140.512 Y31.144 E.01129
G1 X154.05 Y44.682 E.57037
G1 X151.609 Y41.708 E.11461
G1 X140.804 Y30.903 E.45523
G1 X141.097 Y30.662 E.01129
G1 X149.169 Y38.734 E.34008
G1 X146.728 Y35.76 E.11461
G1 X141.389 Y30.421 E.22494
G1 X141.682 Y30.18 E.01129
G1 X145.512 Y34.01 E.16136
G1 X181.57 Y84.47 F30000
G1 F9545.273
G1 X144.358 Y47.258 E1.56784
G1 X146.799 Y50.232 E.11461
G1 X181.157 Y84.59 E1.44761
G1 X180.865 Y84.831 E.01129
G1 X149.239 Y53.206 E1.33247
G1 X151.68 Y56.179 E.11461
G1 X180.573 Y85.072 E1.21733
G1 X180.28 Y85.313 E.01129
G1 X154.12 Y59.153 E1.10218
G1 X156.561 Y62.127 E.11461
G1 X179.988 Y85.554 E.98704
G1 X179.695 Y85.795 E.01129
G1 X159.001 Y65.101 E.87189
G1 X161.442 Y68.075 E.11461
G1 X179.403 Y86.036 E.75675
G1 X179.11 Y86.277 E.01129
G1 X163.882 Y71.049 E.64161
G1 X166.322 Y74.022 E.11461
G1 X178.818 Y86.518 E.52646
G1 X178.525 Y86.759 E.01129
G1 X168.763 Y76.996 E.41132
G1 X171.203 Y79.97 E.11461
G1 X178.233 Y87 E.29618
G1 X177.941 Y87.241 E.01129
G1 X173.644 Y82.944 E.18103
G1 X176.084 Y85.918 E.11461
G1 X177.769 Y87.602 E.07097
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9545.273
G1 X176.354 Y86.188 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/75
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
G17
G3 Z15 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X35.522 Y133.738
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X121.164 Y238.097 E4.34115
G1 X113.041 Y244.789 E.33843
G1 X26.916 Y139.841 E4.36564
G3 X19.498 Y130.797 I633.414 J-527.112 E.37615
G3 X29.239 Y122.769 I673.324 J807.046 E.40592
G1 X142.196 Y29.713 E4.70615
G1 X184.993 Y81.862 E2.16934
G1 X177.435 Y88.089 E.31489
G1 X142.544 Y45.572 E1.76862
G1 X35.568 Y133.7 E4.45691
G1 X36.073 Y133.792 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X112.987 Y245.342 E.33684
G1 X26.613 Y140.091 E4.05559
G1 X24.749 Y137.842 E.087
G1 X18.947 Y130.743 E.27308
G3 X28.99 Y122.466 I693.913 J831.644 E.38765
G1 X142.25 Y29.16 E4.37101
G1 X185.544 Y81.916 E2.03283
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.125 E1.63828
G1 X36.12 Y133.754 E4.1051
M204 S10000
G1 X35.494 Y133.961 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42001
G1 F9546.792
G1 X28.369 Y141.086 E.30014
G1 X28.609 Y141.379 E.01129
G1 X35.613 Y134.375 E.29506
G1 X35.854 Y134.668 E.01129
G1 X28.849 Y141.672 E.29506
G1 X29.09 Y141.965 E.01129
G1 X36.094 Y134.961 E.29506
G1 X36.335 Y135.253 E.01129
G1 X29.33 Y142.258 E.29506
G1 X29.571 Y142.551 E.01129
G1 X36.575 Y135.546 E.29506
G1 X36.815 Y135.839 E.01129
G1 X29.811 Y142.844 E.29506
G1 X30.051 Y143.137 E.01129
G1 X37.056 Y136.132 E.29506
G1 X37.296 Y136.425 E.01129
G1 X30.292 Y143.429 E.29506
G1 X30.532 Y143.722 E.01129
G1 X37.536 Y136.718 E.29506
G1 X37.777 Y137.011 E.01129
G1 X30.772 Y144.015 E.29506
G1 X31.013 Y144.308 E.01129
G1 X38.017 Y137.304 E.29506
G1 X38.258 Y137.597 E.01129
G1 X31.253 Y144.601 E.29506
G1 X31.494 Y144.894 E.01129
G1 X38.498 Y137.89 E.29506
G1 X38.738 Y138.183 E.01129
G1 X31.734 Y145.187 E.29506
G1 X31.974 Y145.48 E.01129
G1 X38.979 Y138.475 E.29506
G1 X39.219 Y138.768 E.01129
M73 P91 R3
G1 X32.215 Y145.773 E.29506
G1 X32.455 Y146.066 E.01129
G1 X39.459 Y139.061 E.29506
G1 X39.7 Y139.354 E.01129
G1 X32.695 Y146.359 E.29506
G1 X32.936 Y146.651 E.01129
G1 X39.94 Y139.647 E.29506
G1 X40.181 Y139.94 E.01129
M73 P92 R3
G1 X33.176 Y146.944 E.29506
G1 X33.417 Y147.237 E.01129
G1 X40.421 Y140.233 E.29506
G1 X40.661 Y140.526 E.01129
G1 X33.657 Y147.53 E.29506
G1 X33.897 Y147.823 E.01129
G1 X40.902 Y140.819 E.29506
G1 X41.142 Y141.112 E.01129
G1 X34.138 Y148.116 E.29506
G1 X34.378 Y148.409 E.01129
G1 X41.382 Y141.405 E.29506
G1 X41.623 Y141.698 E.01129
G1 X34.618 Y148.702 E.29506
G1 X34.859 Y148.995 E.01129
G1 X41.863 Y141.99 E.29506
G1 X42.104 Y142.283 E.01129
G1 X35.099 Y149.288 E.29506
G1 X35.34 Y149.581 E.01129
G1 X42.344 Y142.576 E.29506
G1 X42.584 Y142.869 E.01129
G1 X35.58 Y149.873 E.29506
G1 X35.82 Y150.166 E.01129
G1 X42.825 Y143.162 E.29506
G1 X43.065 Y143.455 E.01129
G1 X36.061 Y150.459 E.29506
G1 X36.301 Y150.752 E.01129
G1 X43.305 Y143.748 E.29506
G1 X43.546 Y144.041 E.01129
G1 X36.541 Y151.045 E.29506
G1 X36.782 Y151.338 E.01129
G1 X43.786 Y144.334 E.29506
G1 X44.027 Y144.627 E.01129
G1 X37.022 Y151.631 E.29506
G1 X37.263 Y151.924 E.01129
G1 X44.267 Y144.92 E.29506
G1 X44.507 Y145.212 E.01129
G1 X37.503 Y152.217 E.29506
G1 X37.743 Y152.51 E.01129
G1 X44.748 Y145.505 E.29506
G1 X44.988 Y145.798 E.01129
G1 X37.984 Y152.803 E.29506
G1 X38.224 Y153.095 E.01129
G1 X45.228 Y146.091 E.29506
G1 X45.469 Y146.384 E.01129
G1 X38.464 Y153.388 E.29506
G1 X38.705 Y153.681 E.01129
G1 X45.709 Y146.677 E.29506
G1 X45.95 Y146.97 E.01129
G1 X38.945 Y153.974 E.29506
G1 X39.186 Y154.267 E.01129
G1 X46.19 Y147.263 E.29506
G1 X46.43 Y147.556 E.01129
G1 X39.426 Y154.56 E.29506
G1 X39.666 Y154.853 E.01129
G1 X46.671 Y147.849 E.29506
G1 X46.911 Y148.142 E.01129
G1 X39.907 Y155.146 E.29506
G1 X40.147 Y155.439 E.01129
G1 X47.151 Y148.434 E.29506
G1 X47.392 Y148.727 E.01129
G1 X40.387 Y155.732 E.29506
G1 X40.628 Y156.025 E.01129
G1 X47.632 Y149.02 E.29506
G1 X47.873 Y149.313 E.01129
G1 X40.868 Y156.317 E.29506
G1 X41.109 Y156.61 E.01129
G1 X48.113 Y149.606 E.29506
G1 X48.353 Y149.899 E.01129
G1 X41.349 Y156.903 E.29506
G1 X41.589 Y157.196 E.01129
G1 X48.594 Y150.192 E.29506
G1 X48.834 Y150.485 E.01129
G1 X41.83 Y157.489 E.29506
G1 X42.07 Y157.782 E.01129
G1 X49.074 Y150.778 E.29506
G1 X49.315 Y151.071 E.01129
G1 X42.31 Y158.075 E.29506
G1 X42.551 Y158.368 E.01129
G1 X49.555 Y151.364 E.29506
G1 X49.796 Y151.656 E.01129
G1 X42.791 Y158.661 E.29506
G1 X43.032 Y158.954 E.01129
G1 X50.036 Y151.949 E.29506
G1 X50.276 Y152.242 E.01129
G1 X43.272 Y159.247 E.29506
G1 X43.512 Y159.539 E.01129
G1 X50.517 Y152.535 E.29506
G1 X50.757 Y152.828 E.01129
G1 X43.753 Y159.832 E.29506
G1 X43.993 Y160.125 E.01129
G1 X50.997 Y153.121 E.29506
G1 X51.238 Y153.414 E.01129
G1 X44.233 Y160.418 E.29506
G1 X44.474 Y160.711 E.01129
G1 X51.478 Y153.707 E.29506
G1 X51.719 Y154 E.01129
G1 X44.714 Y161.004 E.29506
G1 X44.955 Y161.297 E.01129
G1 X51.959 Y154.293 E.29506
G1 X52.199 Y154.586 E.01129
G1 X45.195 Y161.59 E.29506
G1 X45.435 Y161.883 E.01129
G1 X52.44 Y154.878 E.29506
G1 X52.68 Y155.171 E.01129
G1 X45.676 Y162.176 E.29506
G1 X45.916 Y162.469 E.01129
G1 X52.92 Y155.464 E.29506
G1 X53.161 Y155.757 E.01129
G1 X46.156 Y162.762 E.29506
G1 X46.397 Y163.054 E.01129
G1 X53.401 Y156.05 E.29506
G1 X53.642 Y156.343 E.01129
G1 X46.637 Y163.347 E.29506
G1 X46.878 Y163.64 E.01129
G1 X53.882 Y156.636 E.29506
G1 X54.122 Y156.929 E.01129
G1 X47.118 Y163.933 E.29506
G1 X47.358 Y164.226 E.01129
G1 X54.363 Y157.222 E.29506
G1 X54.603 Y157.515 E.01129
G1 X47.599 Y164.519 E.29506
G1 X47.839 Y164.812 E.01129
G1 X54.843 Y157.808 E.29506
G1 X55.084 Y158.1 E.01129
G1 X48.079 Y165.105 E.29506
G1 X48.32 Y165.398 E.01129
G1 X55.324 Y158.393 E.29506
G1 X55.565 Y158.686 E.01129
G1 X48.56 Y165.691 E.29506
G1 X48.801 Y165.984 E.01129
G1 X55.805 Y158.979 E.29506
G1 X56.045 Y159.272 E.01129
G1 X49.041 Y166.276 E.29506
G1 X49.281 Y166.569 E.01129
G1 X56.286 Y159.565 E.29506
G1 X56.526 Y159.858 E.01129
G1 X49.522 Y166.862 E.29506
G1 X49.762 Y167.155 E.01129
G1 X56.766 Y160.151 E.29506
G1 X57.007 Y160.444 E.01129
G1 X50.002 Y167.448 E.29506
G1 X50.243 Y167.741 E.01129
G1 X57.247 Y160.737 E.29506
G1 X57.488 Y161.03 E.01129
G1 X50.483 Y168.034 E.29506
G1 X50.724 Y168.327 E.01129
G1 X57.728 Y161.322 E.29506
G1 X57.968 Y161.615 E.01129
G1 X50.964 Y168.62 E.29506
G1 X51.204 Y168.913 E.01129
G1 X58.209 Y161.908 E.29506
G1 X58.449 Y162.201 E.01129
G1 X51.445 Y169.206 E.29506
G1 X51.685 Y169.498 E.01129
G1 X58.689 Y162.494 E.29506
G1 X58.93 Y162.787 E.01129
G1 X51.925 Y169.791 E.29506
G1 X52.166 Y170.084 E.01129
G1 X59.17 Y163.08 E.29506
G1 X59.411 Y163.373 E.01129
G1 X52.406 Y170.377 E.29506
G1 X52.647 Y170.67 E.01129
G1 X59.651 Y163.666 E.29506
G1 X59.891 Y163.959 E.01129
G1 X52.887 Y170.963 E.29506
G1 X53.127 Y171.256 E.01129
G1 X60.132 Y164.252 E.29506
G1 X60.372 Y164.545 E.01129
G1 X53.368 Y171.549 E.29506
G1 X53.608 Y171.842 E.01129
G1 X60.612 Y164.837 E.29506
G1 X60.853 Y165.13 E.01129
G1 X53.849 Y172.135 E.29506
G1 X54.089 Y172.428 E.01129
G1 X61.093 Y165.423 E.29506
G1 X61.334 Y165.716 E.01129
G1 X54.329 Y172.72 E.29506
G1 X54.57 Y173.013 E.01129
G1 X61.574 Y166.009 E.29506
G1 X61.814 Y166.302 E.01129
G1 X54.81 Y173.306 E.29506
G1 X55.05 Y173.599 E.01129
G1 X62.055 Y166.595 E.29506
G1 X62.295 Y166.888 E.01129
G1 X55.291 Y173.892 E.29506
G1 X55.531 Y174.185 E.01129
G1 X62.535 Y167.181 E.29506
G1 X62.776 Y167.474 E.01129
G1 X55.771 Y174.478 E.29506
G1 X56.012 Y174.771 E.01129
G1 X63.016 Y167.767 E.29506
G1 X63.257 Y168.059 E.01129
G1 X56.252 Y175.064 E.29506
G1 X56.493 Y175.357 E.01129
G1 X63.497 Y168.352 E.29506
G1 X63.737 Y168.645 E.01129
G1 X56.733 Y175.65 E.29506
G1 X56.973 Y175.942 E.01129
G1 X63.978 Y168.938 E.29506
G1 X64.218 Y169.231 E.01129
G1 X57.214 Y176.235 E.29506
G1 X57.454 Y176.528 E.01129
G1 X64.458 Y169.524 E.29506
G1 X64.699 Y169.817 E.01129
G1 X57.695 Y176.821 E.29506
G1 X57.935 Y177.114 E.01129
G1 X64.939 Y170.11 E.29506
G1 X65.18 Y170.403 E.01129
G1 X58.175 Y177.407 E.29506
G1 X58.416 Y177.7 E.01129
G1 X65.42 Y170.696 E.29506
G1 X65.66 Y170.989 E.01129
G1 X58.656 Y177.993 E.29506
G1 X58.896 Y178.286 E.01129
G1 X65.901 Y171.281 E.29506
G1 X66.141 Y171.574 E.01129
G1 X59.137 Y178.579 E.29506
G1 X59.377 Y178.872 E.01129
G1 X66.381 Y171.867 E.29506
G1 X66.622 Y172.16 E.01129
G1 X59.618 Y179.164 E.29506
G1 X59.858 Y179.457 E.01129
G1 X66.862 Y172.453 E.29506
G1 X67.103 Y172.746 E.01129
G1 X60.098 Y179.75 E.29506
G1 X60.339 Y180.043 E.01129
G1 X67.343 Y173.039 E.29506
G1 X67.583 Y173.332 E.01129
G1 X60.579 Y180.336 E.29506
G1 X60.819 Y180.629 E.01129
G1 X67.824 Y173.625 E.29506
G1 X68.064 Y173.918 E.01129
G1 X61.06 Y180.922 E.29506
G1 X61.3 Y181.215 E.01129
G1 X68.304 Y174.211 E.29506
G1 X68.545 Y174.503 E.01129
G1 X61.541 Y181.508 E.29506
G1 X61.781 Y181.801 E.01129
G1 X68.785 Y174.796 E.29506
G1 X69.026 Y175.089 E.01129
G1 X62.021 Y182.094 E.29506
G1 X62.262 Y182.387 E.01129
G1 X69.266 Y175.382 E.29506
G1 X69.506 Y175.675 E.01129
G1 X62.502 Y182.679 E.29506
G1 X62.742 Y182.972 E.01129
G1 X69.747 Y175.968 E.29506
G1 X69.987 Y176.261 E.01129
G1 X62.983 Y183.265 E.29506
G1 X63.223 Y183.558 E.01129
G1 X70.227 Y176.554 E.29506
G1 X70.468 Y176.847 E.01129
G1 X63.464 Y183.851 E.29506
G1 X63.704 Y184.144 E.01129
G1 X70.708 Y177.14 E.29506
G1 X70.949 Y177.433 E.01129
G1 X63.944 Y184.437 E.29506
G1 X64.185 Y184.73 E.01129
G1 X71.189 Y177.725 E.29506
G1 X71.429 Y178.018 E.01129
G1 X64.425 Y185.023 E.29506
G1 X64.665 Y185.316 E.01129
G1 X71.67 Y178.311 E.29506
G1 X71.91 Y178.604 E.01129
G1 X64.906 Y185.609 E.29506
G1 X65.146 Y185.901 E.01129
G1 X72.15 Y178.897 E.29506
G1 X72.391 Y179.19 E.01129
G1 X65.387 Y186.194 E.29506
G1 X65.627 Y186.487 E.01129
G1 X72.631 Y179.483 E.29506
G1 X72.872 Y179.776 E.01129
G1 X65.867 Y186.78 E.29506
G1 X66.108 Y187.073 E.01129
G1 X73.112 Y180.069 E.29506
G1 X73.352 Y180.362 E.01129
G1 X66.348 Y187.366 E.29506
G1 X66.588 Y187.659 E.01129
G1 X73.593 Y180.655 E.29506
G1 X73.833 Y180.947 E.01129
G1 X66.829 Y187.952 E.29506
G1 X67.069 Y188.245 E.01129
G1 X74.073 Y181.24 E.29506
G1 X74.314 Y181.533 E.01129
G1 X67.31 Y188.538 E.29506
G1 X67.55 Y188.831 E.01129
G1 X74.554 Y181.826 E.29506
G1 X74.795 Y182.119 E.01129
G1 X67.79 Y189.123 E.29506
G1 X68.031 Y189.416 E.01129
G1 X75.035 Y182.412 E.29506
G1 X75.275 Y182.705 E.01129
G1 X68.271 Y189.709 E.29506
G1 X68.511 Y190.002 E.01129
G1 X75.516 Y182.998 E.29506
G1 X75.756 Y183.291 E.01129
G1 X68.752 Y190.295 E.29506
G1 X68.992 Y190.588 E.01129
G1 X75.996 Y183.584 E.29506
G1 X76.237 Y183.877 E.01129
G1 X69.233 Y190.881 E.29506
G1 X69.473 Y191.174 E.01129
G1 X76.477 Y184.169 E.29506
G1 X76.718 Y184.462 E.01129
G1 X69.713 Y191.467 E.29506
G1 X69.954 Y191.76 E.01129
G1 X76.958 Y184.755 E.29506
G1 X77.198 Y185.048 E.01129
G1 X70.194 Y192.053 E.29506
G1 X70.434 Y192.345 E.01129
G1 X77.439 Y185.341 E.29506
G1 X77.679 Y185.634 E.01129
G1 X70.675 Y192.638 E.29506
G1 X70.915 Y192.931 E.01129
G1 X77.919 Y185.927 E.29506
G1 X78.16 Y186.22 E.01129
G1 X71.156 Y193.224 E.29506
G1 X71.396 Y193.517 E.01129
G1 X78.4 Y186.513 E.29506
G1 X78.641 Y186.806 E.01129
G1 X71.636 Y193.81 E.29506
G1 X71.877 Y194.103 E.01129
G1 X78.881 Y187.099 E.29506
G1 X79.121 Y187.392 E.01129
G1 X72.117 Y194.396 E.29506
G1 X72.357 Y194.689 E.01129
G1 X79.362 Y187.684 E.29506
G1 X79.602 Y187.977 E.01129
G1 X72.598 Y194.982 E.29506
G1 X72.838 Y195.275 E.01129
G1 X79.842 Y188.27 E.29506
G1 X80.083 Y188.563 E.01129
G1 X73.079 Y195.567 E.29506
G1 X73.319 Y195.86 E.01129
G1 X80.323 Y188.856 E.29506
G1 X80.564 Y189.149 E.01129
G1 X73.559 Y196.153 E.29506
G1 X73.8 Y196.446 E.01129
G1 X80.804 Y189.442 E.29506
G1 X81.044 Y189.735 E.01129
G1 X74.04 Y196.739 E.29506
G1 X74.28 Y197.032 E.01129
G1 X81.285 Y190.028 E.29506
G1 X81.525 Y190.321 E.01129
G1 X74.521 Y197.325 E.29506
G1 X74.761 Y197.618 E.01129
G1 X81.765 Y190.614 E.29506
G1 X82.006 Y190.906 E.01129
G1 X75.002 Y197.911 E.29506
G1 X75.242 Y198.204 E.01129
G1 X82.246 Y191.199 E.29506
G1 X82.487 Y191.492 E.01129
G1 X75.482 Y198.497 E.29506
G1 X75.723 Y198.789 E.01129
G1 X82.727 Y191.785 E.29506
G1 X82.967 Y192.078 E.01129
G1 X75.963 Y199.082 E.29506
G1 X76.203 Y199.375 E.01129
G1 X83.208 Y192.371 E.29506
G1 X83.448 Y192.664 E.01129
G1 X76.444 Y199.668 E.29506
G1 X76.684 Y199.961 E.01129
G1 X83.688 Y192.957 E.29506
G1 X83.929 Y193.25 E.01129
G1 X76.925 Y200.254 E.29506
G1 X77.165 Y200.547 E.01129
G1 X84.169 Y193.543 E.29506
G1 X84.41 Y193.836 E.01129
G1 X77.405 Y200.84 E.29506
G1 X77.646 Y201.133 E.01129
G1 X84.65 Y194.128 E.29506
G1 X84.89 Y194.421 E.01129
G1 X77.886 Y201.426 E.29506
G1 X78.126 Y201.719 E.01129
G1 X85.131 Y194.714 E.29506
G1 X85.371 Y195.007 E.01129
G1 X78.367 Y202.011 E.29506
G1 X78.607 Y202.304 E.01129
G1 X85.611 Y195.3 E.29506
G1 X85.852 Y195.593 E.01129
G1 X78.848 Y202.597 E.29506
G1 X79.088 Y202.89 E.01129
G1 X86.092 Y195.886 E.29506
G1 X86.333 Y196.179 E.01129
G1 X79.328 Y203.183 E.29506
G1 X79.569 Y203.476 E.01129
G1 X86.573 Y196.472 E.29506
G1 X86.813 Y196.765 E.01129
G1 X79.809 Y203.769 E.29506
G1 X80.049 Y204.062 E.01129
G1 X87.054 Y197.058 E.29506
G1 X87.294 Y197.35 E.01129
G1 X80.29 Y204.355 E.29506
G1 X80.53 Y204.648 E.01129
G1 X87.534 Y197.643 E.29506
G1 X87.775 Y197.936 E.01129
G1 X80.771 Y204.941 E.29506
G1 X81.011 Y205.234 E.01129
G1 X88.015 Y198.229 E.29506
G1 X88.256 Y198.522 E.01129
G1 X81.251 Y205.526 E.29506
G1 X81.492 Y205.819 E.01129
G1 X88.496 Y198.815 E.29506
G1 X88.736 Y199.108 E.01129
G1 X81.732 Y206.112 E.29506
G1 X81.972 Y206.405 E.01129
G1 X88.977 Y199.401 E.29506
G1 X89.217 Y199.694 E.01129
G1 X82.213 Y206.698 E.29506
G1 X82.453 Y206.991 E.01129
G1 X89.457 Y199.987 E.29506
G1 X89.698 Y200.28 E.01129
G1 X82.694 Y207.284 E.29506
G1 X82.934 Y207.577 E.01129
G1 X89.938 Y200.572 E.29506
G1 X90.179 Y200.865 E.01129
G1 X83.174 Y207.87 E.29506
G1 X83.415 Y208.163 E.01129
G1 X90.419 Y201.158 E.29506
G1 X90.659 Y201.451 E.01129
G1 X83.655 Y208.456 E.29506
G1 X83.895 Y208.748 E.01129
G1 X90.9 Y201.744 E.29506
G1 X91.14 Y202.037 E.01129
G1 X84.136 Y209.041 E.29506
G1 X84.376 Y209.334 E.01129
G1 X91.381 Y202.33 E.29506
G1 X91.621 Y202.623 E.01129
G1 X84.617 Y209.627 E.29506
G1 X84.857 Y209.92 E.01129
G1 X91.861 Y202.916 E.29506
G1 X92.102 Y203.209 E.01129
G1 X85.097 Y210.213 E.29506
G1 X85.338 Y210.506 E.01129
G1 X92.342 Y203.502 E.29506
G1 X92.582 Y203.794 E.01129
G1 X85.578 Y210.799 E.29506
G1 X85.818 Y211.092 E.01129
G1 X92.823 Y204.087 E.29506
G1 X93.063 Y204.38 E.01129
G1 X86.059 Y211.385 E.29506
G1 X86.299 Y211.678 E.01129
G1 X93.303 Y204.673 E.29506
G1 X93.544 Y204.966 E.01129
G1 X86.54 Y211.97 E.29506
G1 X86.78 Y212.263 E.01129
G1 X93.784 Y205.259 E.29506
G1 X94.025 Y205.552 E.01129
G1 X87.02 Y212.556 E.29506
G1 X87.261 Y212.849 E.01129
G1 X94.265 Y205.845 E.29506
G1 X94.505 Y206.138 E.01129
G1 X87.501 Y213.142 E.29506
G1 X87.741 Y213.435 E.01129
G1 X94.746 Y206.431 E.29506
G1 X94.986 Y206.724 E.01129
G1 X87.982 Y213.728 E.29506
G1 X88.222 Y214.021 E.01129
G1 X95.227 Y207.017 E.29506
G1 X95.467 Y207.309 E.01129
G1 X88.463 Y214.314 E.29506
G1 X88.703 Y214.607 E.01129
G1 X95.707 Y207.602 E.29506
G1 X95.948 Y207.895 E.01129
G1 X88.943 Y214.9 E.29506
G1 X89.184 Y215.192 E.01129
G1 X96.188 Y208.188 E.29506
G1 X96.428 Y208.481 E.01129
G1 X89.424 Y215.485 E.29506
G1 X89.664 Y215.778 E.01129
G1 X96.669 Y208.774 E.29506
G1 X96.909 Y209.067 E.01129
G1 X89.905 Y216.071 E.29506
G1 X90.145 Y216.364 E.01129
G1 X97.15 Y209.36 E.29506
G1 X97.39 Y209.653 E.01129
G1 X90.386 Y216.657 E.29506
G1 X90.626 Y216.95 E.01129
G1 X97.63 Y209.946 E.29506
G1 X97.871 Y210.239 E.01129
G1 X90.866 Y217.243 E.29506
G1 X91.107 Y217.536 E.01129
G1 X98.111 Y210.531 E.29506
G1 X98.351 Y210.824 E.01129
G1 X91.347 Y217.829 E.29506
G1 X91.587 Y218.122 E.01129
G1 X98.592 Y211.117 E.29506
G1 X98.832 Y211.41 E.01129
G1 X91.828 Y218.414 E.29506
G1 X92.068 Y218.707 E.01129
G1 X99.073 Y211.703 E.29506
G1 X99.313 Y211.996 E.01129
G1 X92.309 Y219 E.29506
G1 X92.549 Y219.293 E.01129
G1 X99.553 Y212.289 E.29506
G1 X99.794 Y212.582 E.01129
G1 X92.789 Y219.586 E.29506
G1 X93.03 Y219.879 E.01129
G1 X100.034 Y212.875 E.29506
G1 X100.274 Y213.168 E.01129
G1 X93.27 Y220.172 E.29506
G1 X93.51 Y220.465 E.01129
G1 X100.515 Y213.461 E.29506
G1 X100.755 Y213.753 E.01129
G1 X93.751 Y220.758 E.29506
G1 X93.991 Y221.051 E.01129
G1 X100.996 Y214.046 E.29506
G1 X101.236 Y214.339 E.01129
G1 X94.232 Y221.344 E.29506
G1 X94.472 Y221.636 E.01129
G1 X101.476 Y214.632 E.29506
G1 X101.717 Y214.925 E.01129
G1 X94.712 Y221.929 E.29506
G1 X94.953 Y222.222 E.01129
G1 X101.957 Y215.218 E.29506
G1 X102.197 Y215.511 E.01129
G1 X95.193 Y222.515 E.29506
G1 X95.433 Y222.808 E.01129
G1 X102.438 Y215.804 E.29506
G1 X102.678 Y216.097 E.01129
G1 X95.674 Y223.101 E.29506
G1 X95.914 Y223.394 E.01129
G1 X102.919 Y216.39 E.29506
G1 X103.159 Y216.683 E.01129
G1 X96.155 Y223.687 E.29506
G1 X96.395 Y223.98 E.01129
G1 X103.399 Y216.975 E.29506
G1 X103.64 Y217.268 E.01129
G1 X96.635 Y224.273 E.29506
G1 X96.876 Y224.566 E.01129
G1 X103.88 Y217.561 E.29506
G1 X104.12 Y217.854 E.01129
G1 X97.116 Y224.859 E.29506
G1 X97.356 Y225.151 E.01129
G1 X104.361 Y218.147 E.29506
G1 X104.601 Y218.44 E.01129
G1 X97.597 Y225.444 E.29506
G1 X97.837 Y225.737 E.01129
G1 X104.842 Y218.733 E.29506
G1 X105.082 Y219.026 E.01129
G1 X98.078 Y226.03 E.29506
G1 X98.318 Y226.323 E.01129
G1 X105.322 Y219.319 E.29506
G1 X105.563 Y219.612 E.01129
G1 X98.558 Y226.616 E.29506
G1 X98.799 Y226.909 E.01129
G1 X105.803 Y219.905 E.29506
G1 X106.043 Y220.197 E.01129
G1 X99.039 Y227.202 E.29506
G1 X99.279 Y227.495 E.01129
G1 X106.284 Y220.49 E.29506
G1 X106.524 Y220.783 E.01129
G1 X99.52 Y227.788 E.29506
G1 X99.76 Y228.081 E.01129
G1 X106.765 Y221.076 E.29506
G1 X107.005 Y221.369 E.01129
G1 X100.001 Y228.373 E.29506
G1 X100.241 Y228.666 E.01129
G1 X107.245 Y221.662 E.29506
G1 X107.486 Y221.955 E.01129
G1 X100.481 Y228.959 E.29506
G1 X100.722 Y229.252 E.01129
G1 X107.726 Y222.248 E.29506
G1 X107.966 Y222.541 E.01129
G1 X100.962 Y229.545 E.29506
G1 X101.202 Y229.838 E.01129
G1 X108.207 Y222.834 E.29506
G1 X108.447 Y223.127 E.01129
G1 X101.443 Y230.131 E.29506
G1 X101.683 Y230.424 E.01129
G1 X108.688 Y223.419 E.29506
G1 X108.928 Y223.712 E.01129
G1 X101.924 Y230.717 E.29506
G1 X102.164 Y231.01 E.01129
G1 X109.168 Y224.005 E.29506
G1 X109.409 Y224.298 E.01129
G1 X102.404 Y231.303 E.29506
G1 X102.645 Y231.595 E.01129
G1 X109.649 Y224.591 E.29506
G1 X109.889 Y224.884 E.01129
G1 X102.885 Y231.888 E.29506
G1 X103.125 Y232.181 E.01129
G1 X110.13 Y225.177 E.29506
G1 X110.37 Y225.47 E.01129
G1 X103.366 Y232.474 E.29506
G1 X103.606 Y232.767 E.01129
G1 X110.611 Y225.763 E.29506
G1 X110.851 Y226.056 E.01129
G1 X103.847 Y233.06 E.29506
G1 X104.087 Y233.353 E.01129
G1 X111.091 Y226.349 E.29506
G1 X111.332 Y226.641 E.01129
G1 X104.327 Y233.646 E.29506
G1 X104.568 Y233.939 E.01129
G1 X111.572 Y226.934 E.29506
G1 X111.812 Y227.227 E.01129
G1 X104.808 Y234.232 E.29506
G1 X105.048 Y234.525 E.01129
G1 X112.053 Y227.52 E.29506
G1 X112.293 Y227.813 E.01129
G1 X105.289 Y234.817 E.29506
G1 X105.529 Y235.11 E.01129
G1 X112.534 Y228.106 E.29506
G1 X112.774 Y228.399 E.01129
G1 X105.77 Y235.403 E.29506
G1 X106.01 Y235.696 E.01129
G1 X113.014 Y228.692 E.29506
G1 X113.255 Y228.985 E.01129
G1 X106.25 Y235.989 E.29506
G1 X106.491 Y236.282 E.01129
G1 X113.495 Y229.278 E.29506
M73 P93 R3
G1 X113.735 Y229.571 E.01129
G1 X106.731 Y236.575 E.29506
G1 X106.971 Y236.868 E.01129
G1 X113.976 Y229.864 E.29506
G1 X114.216 Y230.156 E.01129
G1 X107.212 Y237.161 E.29506
G1 X107.452 Y237.454 E.01129
G1 X114.457 Y230.449 E.29506
G1 X114.697 Y230.742 E.01129
G1 X107.693 Y237.747 E.29506
G1 X107.933 Y238.039 E.01129
G1 X114.937 Y231.035 E.29506
G1 X115.178 Y231.328 E.01129
G1 X108.173 Y238.332 E.29506
G1 X108.414 Y238.625 E.01129
G1 X115.418 Y231.621 E.29506
G1 X115.658 Y231.914 E.01129
G1 X108.654 Y238.918 E.29506
G1 X108.894 Y239.211 E.01129
G1 X115.899 Y232.207 E.29506
G1 X116.139 Y232.5 E.01129
G1 X109.135 Y239.504 E.29506
G1 X109.375 Y239.797 E.01129
G1 X116.38 Y232.793 E.29506
G1 X116.62 Y233.086 E.01129
G1 X109.616 Y240.09 E.29506
G1 X109.856 Y240.383 E.01129
G1 X116.86 Y233.378 E.29506
G1 X117.101 Y233.671 E.01129
G1 X110.096 Y240.676 E.29506
G1 X110.337 Y240.969 E.01129
G1 X117.341 Y233.964 E.29506
G1 X117.581 Y234.257 E.01129
G1 X110.577 Y241.261 E.29506
G1 X110.817 Y241.554 E.01129
G1 X117.822 Y234.55 E.29506
G1 X118.062 Y234.843 E.01129
G1 X111.058 Y241.847 E.29506
G1 X111.298 Y242.14 E.01129
G1 X118.303 Y235.136 E.29506
G1 X118.543 Y235.429 E.01129
G1 X111.539 Y242.433 E.29506
G1 X111.779 Y242.726 E.01129
G1 X118.783 Y235.722 E.29506
G1 X119.024 Y236.015 E.01129
G1 X112.019 Y243.019 E.29506
G1 X112.26 Y243.312 E.01129
G1 X119.264 Y236.308 E.29506
G1 X119.504 Y236.6 E.01129
G1 X112.5 Y243.605 E.29506
G1 X112.74 Y243.898 E.01129
G1 X119.745 Y236.893 E.29506
G1 X119.985 Y237.186 E.01129
G1 X112.981 Y244.191 E.29506
G1 X113.087 Y244.32 E.00498
G1 X114.779 Y242.925 E.06532
G1 X120.226 Y237.479 E.22943
G1 X120.466 Y237.772 E.01129
G1 X116.558 Y241.68 E.16461
G1 X20.076 Y131.247 F30000
G1 F9546.792
G1 X22.936 Y128.387 E.12047
G1 X26.013 Y125.843 E.11892
G1 X20.437 Y131.42 E.23491
G1 X20.677 Y131.713 E.01129
G1 X28.976 Y123.413 E.34964
G2 X31.984 Y120.939 I-286.218 J-350.974 E.11601
G1 X20.916 Y132.007 E.46623
G1 X21.156 Y132.3 E.01129
G1 X35.011 Y118.445 E.58363
G1 X38.038 Y115.952 E.11682
G1 X21.396 Y132.593 E.70104
G1 X21.636 Y132.887 E.01129
G1 X41.065 Y113.458 E.81844
G1 X44.091 Y110.965 E.11682
G1 X21.876 Y133.18 E.93585
G1 X22.116 Y133.474 E.01129
G1 X47.118 Y108.471 E1.05325
G1 X50.145 Y105.978 E.11682
G1 X22.355 Y133.767 E1.17066
G1 X22.595 Y134.061 E.01129
G1 X53.172 Y103.484 E1.28806
G1 X56.199 Y100.99 E.11682
G1 X22.835 Y134.354 E1.40547
G1 X23.075 Y134.648 E.01129
G1 X59.226 Y98.497 E1.52288
G1 X62.253 Y96.003 E.11682
G1 X23.315 Y134.941 E1.64028
G1 X23.555 Y135.234 E.01129
G1 X65.279 Y93.51 E1.75769
G1 X68.306 Y91.016 E.11682
G1 X23.794 Y135.528 E1.87509
G1 X24.034 Y135.821 E.01129
G1 X71.333 Y88.523 E1.9925
G1 X74.36 Y86.029 E.11682
G1 X24.274 Y136.115 E2.1099
G1 X24.514 Y136.408 E.01129
G1 X77.387 Y83.535 E2.22731
G1 X80.414 Y81.042 E.11682
G1 X24.754 Y136.702 E2.34471
G1 X24.994 Y136.995 E.01129
G1 X83.441 Y78.548 E2.46212
G1 X86.467 Y76.055 E.11682
G1 X25.233 Y137.289 E2.57952
G2 X25.475 Y137.581 I20.593 J-16.752 E.01128
G1 X89.494 Y73.561 E2.69687
G1 X92.521 Y71.068 E.11682
G1 X25.716 Y137.872 E2.8142
G1 X25.958 Y138.164 E.01128
G1 X95.548 Y68.574 E2.93152
G1 X98.575 Y66.08 E.11682
G1 X26.2 Y138.455 E3.04885
G1 X26.442 Y138.747 E.01128
G1 X101.602 Y63.587 E3.16617
G1 X104.629 Y61.093 E.11682
G1 X26.683 Y139.039 E3.2835
G1 X26.925 Y139.33 E.01128
G1 X107.655 Y58.6 E3.40082
G1 X110.682 Y56.106 E.11682
G1 X27.167 Y139.622 E3.51815
G1 X27.407 Y139.914 E.01129
G1 X113.709 Y53.613 E3.63553
G1 X116.736 Y51.119 E.11682
G1 X27.648 Y140.207 E3.75291
G1 X27.888 Y140.5 E.01129
G1 X119.763 Y48.626 E3.8703
G1 X122.79 Y46.132 E.11682
G1 X28.008 Y140.914 E3.99276
; WIPE_START
G1 X29.422 Y139.5 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X34.993 Y134.282 Z15.2 F30000
G1 X37.829 Y131.626 Z15.2
G1 Z14.8
G1 E.8 F1800
G1 F9546.792
G1 X125.816 Y43.638 E3.70653
G1 X128.843 Y41.145 E.11682
G1 X42.104 Y127.884 E3.65397
G1 X45.131 Y125.391 E.11682
G1 X131.87 Y38.651 E3.65397
G1 X134.897 Y36.158 E.11682
G1 X48.158 Y122.897 E3.65397
G1 X51.184 Y120.404 E.11682
G1 X137.924 Y33.664 E3.65397
G1 X140.951 Y31.171 E.11682
G1 X54.211 Y117.91 E3.65397
G1 X57.238 Y115.417 E.11682
G1 X142.296 Y30.359 E3.58312
G1 X142.536 Y30.652 E.01129
G1 X60.265 Y112.923 E3.46573
G1 X63.292 Y110.429 E.11682
G1 X142.776 Y30.945 E3.34835
G1 X143.017 Y31.238 E.01129
G1 X66.319 Y107.936 E3.23097
G1 X69.345 Y105.442 E.11682
G1 X143.257 Y31.531 E3.11359
G1 X143.498 Y31.823 E.01129
G1 X72.372 Y102.949 E2.99621
G1 X75.399 Y100.455 E.11682
G1 X143.738 Y32.116 E2.87882
G1 X143.978 Y32.409 E.01129
G1 X78.426 Y97.962 E2.76144
G1 X81.453 Y95.468 E.11682
G1 X144.219 Y32.702 E2.64406
G1 X144.459 Y32.995 E.01129
G1 X84.48 Y92.974 E2.52668
G1 X87.507 Y90.481 E.11682
G1 X144.699 Y33.288 E2.40929
G1 X144.94 Y33.581 E.01129
G1 X90.533 Y87.987 E2.29191
G1 X93.56 Y85.494 E.11682
G1 X145.18 Y33.874 E2.17453
G1 X145.421 Y34.167 E.01129
G1 X96.587 Y83 E2.05715
G1 X99.614 Y80.507 E.11682
G1 X145.661 Y34.46 E1.93976
G1 X145.901 Y34.753 E.01129
G1 X102.641 Y78.013 E1.82238
G1 X105.668 Y75.519 E.11682
G1 X146.142 Y35.045 E1.705
G1 X146.382 Y35.338 E.01129
G1 X108.695 Y73.026 E1.58762
G1 X111.721 Y70.532 E.11682
G1 X146.622 Y35.631 E1.47024
G1 X146.863 Y35.924 E.01129
G1 X114.748 Y68.039 E1.35285
G1 X117.775 Y65.545 E.11682
G1 X147.103 Y36.217 E1.23547
G1 X147.344 Y36.51 E.01129
G1 X120.802 Y63.052 E1.11809
G1 X123.829 Y60.558 E.11682
G1 X147.584 Y36.803 E1.00071
G1 X147.824 Y37.096 E.01129
G1 X126.856 Y58.065 E.88332
G1 X129.882 Y55.571 E.11682
G1 X148.065 Y37.389 E.76594
G1 X148.305 Y37.682 E.01129
G1 X132.909 Y53.077 E.64856
G1 X135.936 Y50.584 E.11682
G1 X148.545 Y37.975 E.53118
G1 X148.786 Y38.267 E.01129
G1 X138.963 Y48.09 E.41379
M73 P93 R2
G1 X141.99 Y45.597 E.11682
G1 X149.026 Y38.56 E.29641
G1 X149.267 Y38.853 E.01129
G1 X142.782 Y45.337 E.27315
M73 P94 R2
G1 X143.023 Y45.63 E.01129
G1 X149.507 Y39.146 E.27315
G1 X149.747 Y39.439 E.01129
G1 X143.263 Y45.923 E.27315
G1 X143.504 Y46.216 E.01129
G1 X149.988 Y39.732 E.27315
G1 X150.228 Y40.025 E.01129
G1 X143.744 Y46.509 E.27315
G1 X143.984 Y46.802 E.01129
G1 X150.468 Y40.318 E.27315
G1 X150.709 Y40.611 E.01129
G1 X144.225 Y47.095 E.27315
G1 X144.465 Y47.388 E.01129
G1 X150.949 Y40.904 E.27315
G1 X151.19 Y41.197 E.01129
G1 X144.705 Y47.681 E.27315
G1 X144.946 Y47.974 E.01129
G1 X151.43 Y41.489 E.27315
G1 X151.67 Y41.782 E.01129
G1 X145.186 Y48.267 E.27315
G1 X145.427 Y48.559 E.01129
G1 X151.911 Y42.075 E.27315
G1 X152.151 Y42.368 E.01129
G1 X145.667 Y48.852 E.27315
G1 X145.907 Y49.145 E.01129
G1 X152.391 Y42.661 E.27315
G1 X152.632 Y42.954 E.01129
G1 X146.148 Y49.438 E.27315
G1 X146.388 Y49.731 E.01129
G1 X152.872 Y43.247 E.27315
G1 X153.113 Y43.54 E.01129
G1 X146.628 Y50.024 E.27315
G1 X146.869 Y50.317 E.01129
G1 X153.353 Y43.833 E.27315
G1 X153.593 Y44.126 E.01129
G1 X147.109 Y50.61 E.27315
G1 X147.35 Y50.903 E.01129
G1 X153.834 Y44.419 E.27315
G1 X154.074 Y44.711 E.01129
G1 X147.59 Y51.196 E.27315
G1 X147.83 Y51.489 E.01129
G1 X154.314 Y45.004 E.27315
G1 X154.555 Y45.297 E.01129
G1 X148.071 Y51.782 E.27315
G1 X148.311 Y52.074 E.01129
G1 X154.795 Y45.59 E.27315
G1 X155.036 Y45.883 E.01129
G1 X148.551 Y52.367 E.27315
G1 X148.792 Y52.66 E.01129
G1 X155.276 Y46.176 E.27315
G1 X155.516 Y46.469 E.01129
G1 X149.032 Y52.953 E.27315
G1 X149.273 Y53.246 E.01129
G1 X155.757 Y46.762 E.27315
G1 X155.997 Y47.055 E.01129
G1 X149.513 Y53.539 E.27315
G1 X149.753 Y53.832 E.01129
G1 X156.237 Y47.348 E.27315
G1 X156.478 Y47.641 E.01129
G1 X149.994 Y54.125 E.27315
G1 X150.234 Y54.418 E.01129
G1 X156.718 Y47.933 E.27315
G1 X156.959 Y48.226 E.01129
G1 X150.474 Y54.711 E.27315
G1 X150.715 Y55.004 E.01129
G1 X157.199 Y48.519 E.27315
G1 X157.439 Y48.812 E.01129
G1 X150.955 Y55.296 E.27315
G1 X151.196 Y55.589 E.01129
G1 X157.68 Y49.105 E.27315
G1 X157.92 Y49.398 E.01129
G1 X151.436 Y55.882 E.27315
G1 X151.676 Y56.175 E.01129
G1 X158.16 Y49.691 E.27315
G1 X158.401 Y49.984 E.01129
G1 X151.917 Y56.468 E.27315
G1 X152.157 Y56.761 E.01129
G1 X158.641 Y50.277 E.27315
G1 X158.882 Y50.57 E.01129
G1 X152.397 Y57.054 E.27315
G1 X152.638 Y57.347 E.01129
G1 X159.122 Y50.863 E.27315
G1 X159.362 Y51.156 E.01129
G1 X152.878 Y57.64 E.27315
G1 X153.119 Y57.933 E.01129
G1 X159.603 Y51.448 E.27315
G1 X159.843 Y51.741 E.01129
G1 X153.359 Y58.226 E.27315
G1 X153.599 Y58.518 E.01129
G1 X160.084 Y52.034 E.27315
G1 X160.324 Y52.327 E.01129
G1 X153.84 Y58.811 E.27315
G1 X154.08 Y59.104 E.01129
G1 X160.564 Y52.62 E.27315
G1 X160.805 Y52.913 E.01129
G1 X154.32 Y59.397 E.27315
G1 X154.561 Y59.69 E.01129
G1 X161.045 Y53.206 E.27315
G1 X161.285 Y53.499 E.01129
G1 X154.801 Y59.983 E.27315
G1 X155.042 Y60.276 E.01129
G1 X161.526 Y53.792 E.27315
G1 X161.766 Y54.085 E.01129
G1 X155.282 Y60.569 E.27315
G1 X155.522 Y60.862 E.01129
G1 X162.007 Y54.378 E.27315
G1 X162.247 Y54.67 E.01129
G1 X155.763 Y61.155 E.27315
G1 X156.003 Y61.448 E.01129
G1 X162.487 Y54.963 E.27315
G1 X162.728 Y55.256 E.01129
G1 X156.243 Y61.74 E.27315
G1 X156.484 Y62.033 E.01129
G1 X162.968 Y55.549 E.27315
G1 X163.208 Y55.842 E.01129
G1 X156.724 Y62.326 E.27315
G1 X156.965 Y62.619 E.01129
G1 X163.449 Y56.135 E.27315
G1 X163.689 Y56.428 E.01129
G1 X157.205 Y62.912 E.27315
G1 X157.445 Y63.205 E.01129
G1 X163.93 Y56.721 E.27315
G1 X164.17 Y57.014 E.01129
G1 X157.686 Y63.498 E.27315
G1 X157.926 Y63.791 E.01129
G1 X164.41 Y57.307 E.27315
G1 X164.651 Y57.6 E.01129
G1 X158.166 Y64.084 E.27315
G1 X158.407 Y64.377 E.01129
G1 X164.891 Y57.892 E.27315
G1 X165.131 Y58.185 E.01129
G1 X158.647 Y64.67 E.27315
G1 X158.888 Y64.962 E.01129
G1 X165.372 Y58.478 E.27315
G1 X165.612 Y58.771 E.01129
G1 X159.128 Y65.255 E.27315
G1 X159.368 Y65.548 E.01129
G1 X165.853 Y59.064 E.27315
G1 X166.093 Y59.357 E.01129
G1 X159.609 Y65.841 E.27315
G1 X159.849 Y66.134 E.01129
G1 X166.333 Y59.65 E.27315
G1 X166.574 Y59.943 E.01129
G1 X160.089 Y66.427 E.27315
G1 X160.33 Y66.72 E.01129
G1 X166.814 Y60.236 E.27315
G1 X167.054 Y60.529 E.01129
G1 X160.57 Y67.013 E.27315
G1 X160.811 Y67.306 E.01129
G1 X167.295 Y60.822 E.27315
G1 X167.535 Y61.114 E.01129
G1 X161.051 Y67.599 E.27315
G1 X161.291 Y67.892 E.01129
G1 X167.776 Y61.407 E.27315
G1 X168.016 Y61.7 E.01129
G1 X161.532 Y68.184 E.27315
G1 X161.772 Y68.477 E.01129
G1 X168.256 Y61.993 E.27315
G1 X168.497 Y62.286 E.01129
G1 X162.012 Y68.77 E.27315
G1 X162.253 Y69.063 E.01129
G1 X168.737 Y62.579 E.27315
G1 X168.977 Y62.872 E.01129
G1 X162.493 Y69.356 E.27315
G1 X162.734 Y69.649 E.01129
G1 X169.218 Y63.165 E.27315
G1 X169.458 Y63.458 E.01129
G1 X162.974 Y69.942 E.27315
G1 X163.214 Y70.235 E.01129
G1 X169.699 Y63.751 E.27315
G1 X169.939 Y64.044 E.01129
G1 X163.455 Y70.528 E.27315
G1 X163.695 Y70.821 E.01129
G1 X170.179 Y64.336 E.27315
G1 X170.42 Y64.629 E.01129
G1 X163.935 Y71.114 E.27315
G1 X164.176 Y71.407 E.01129
G1 X170.66 Y64.922 E.27315
G1 X170.9 Y65.215 E.01129
G1 X164.416 Y71.699 E.27315
G1 X164.657 Y71.992 E.01129
G1 X171.141 Y65.508 E.27315
G1 X171.381 Y65.801 E.01129
G1 X164.897 Y72.285 E.27315
G1 X165.137 Y72.578 E.01129
G1 X171.622 Y66.094 E.27315
G1 X171.862 Y66.387 E.01129
G1 X165.378 Y72.871 E.27315
G1 X165.618 Y73.164 E.01129
G1 X172.102 Y66.68 E.27315
G1 X172.343 Y66.973 E.01129
G1 X165.858 Y73.457 E.27315
G1 X166.099 Y73.75 E.01129
G1 X172.583 Y67.266 E.27315
G1 X172.823 Y67.558 E.01129
G1 X166.339 Y74.043 E.27315
G1 X166.58 Y74.336 E.01129
G1 X173.064 Y67.851 E.27315
G1 X173.304 Y68.144 E.01129
G1 X166.82 Y74.629 E.27315
G1 X167.06 Y74.921 E.01129
G1 X173.545 Y68.437 E.27315
G1 X173.785 Y68.73 E.01129
G1 X167.301 Y75.214 E.27315
G1 X167.541 Y75.507 E.01129
G1 X174.025 Y69.023 E.27315
G1 X174.266 Y69.316 E.01129
G1 X167.781 Y75.8 E.27315
G1 X168.022 Y76.093 E.01129
G1 X174.506 Y69.609 E.27315
G1 X174.746 Y69.902 E.01129
G1 X168.262 Y76.386 E.27315
G1 X168.503 Y76.679 E.01129
G1 X174.987 Y70.195 E.27315
G1 X175.227 Y70.488 E.01129
G1 X168.743 Y76.972 E.27315
G1 X168.983 Y77.265 E.01129
G1 X175.468 Y70.78 E.27315
G1 X175.708 Y71.073 E.01129
G1 X169.224 Y77.558 E.27315
G1 X169.464 Y77.851 E.01129
G1 X175.948 Y71.366 E.27315
G1 X176.189 Y71.659 E.01129
G1 X169.704 Y78.143 E.27315
G1 X169.945 Y78.436 E.01129
G1 X176.429 Y71.952 E.27315
G1 X176.669 Y72.245 E.01129
G1 X170.185 Y78.729 E.27315
G1 X170.426 Y79.022 E.01129
G1 X176.91 Y72.538 E.27315
G1 X177.15 Y72.831 E.01129
G1 X170.666 Y79.315 E.27315
G1 X170.906 Y79.608 E.01129
G1 X177.391 Y73.124 E.27315
G1 X177.631 Y73.417 E.01129
G1 X171.147 Y79.901 E.27315
G1 X171.387 Y80.194 E.01129
G1 X177.871 Y73.71 E.27315
G1 X178.112 Y74.003 E.01129
G1 X171.627 Y80.487 E.27315
G1 X171.868 Y80.78 E.01129
G1 X178.352 Y74.295 E.27315
G1 X178.592 Y74.588 E.01129
G1 X172.108 Y81.073 E.27315
G1 X172.349 Y81.365 E.01129
G1 X178.833 Y74.881 E.27315
G1 X179.073 Y75.174 E.01129
G1 X172.589 Y81.658 E.27315
G1 X172.829 Y81.951 E.01129
G1 X179.314 Y75.467 E.27315
G1 X179.554 Y75.76 E.01129
G1 X173.07 Y82.244 E.27315
G1 X173.31 Y82.537 E.01129
G1 X179.794 Y76.053 E.27315
G1 X180.035 Y76.346 E.01129
G1 X173.55 Y82.83 E.27315
G1 X173.791 Y83.123 E.01129
G1 X180.275 Y76.639 E.27315
G1 X180.515 Y76.932 E.01129
G1 X174.031 Y83.416 E.27315
G1 X174.272 Y83.709 E.01129
G1 X180.756 Y77.225 E.27315
G1 X180.996 Y77.517 E.01129
G1 X174.512 Y84.002 E.27315
G1 X174.752 Y84.295 E.01129
G1 X181.237 Y77.81 E.27315
G1 X181.477 Y78.103 E.01129
G1 X174.993 Y84.587 E.27315
G1 X175.233 Y84.88 E.01129
G1 X181.717 Y78.396 E.27315
G1 X181.958 Y78.689 E.01129
G1 X175.473 Y85.173 E.27315
G1 X175.714 Y85.466 E.01129
G1 X182.198 Y78.982 E.27315
G1 X182.438 Y79.275 E.01129
G1 X175.954 Y85.759 E.27315
G1 X176.195 Y86.052 E.01129
G1 X182.679 Y79.568 E.27315
G1 X182.919 Y79.861 E.01129
G1 X176.435 Y86.345 E.27315
G1 X176.675 Y86.638 E.01129
G1 X183.16 Y80.154 E.27315
G1 X183.4 Y80.447 E.01129
G1 X176.916 Y86.931 E.27315
G1 X177.156 Y87.224 E.01129
G1 X183.64 Y80.739 E.27315
G1 X183.881 Y81.032 E.01129
G1 X177.396 Y87.517 E.27315
G1 X177.481 Y87.619 E.00396
G1 X179.446 Y86.001 E.07584
G1 X184.121 Y81.325 E.19695
G1 X184.361 Y81.618 E.01129
G1 X181.225 Y84.755 E.13213
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9546.792
G1 X182.639 Y83.341 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/75
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
G17
G3 Z15.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 136
G1 X36.073 Y133.792
G1 Z15
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9547.055
M204 S5000
G1 X121.715 Y238.151 E4.02123
G1 X113.397 Y245.004 E.32103
G1 X25.936 Y138.441 E4.10635
G1 X19.693 Y130.78 E.29436
G1 X27.878 Y123.997 E.31666
G1 X142.557 Y29.533 E4.42554
G1 X142.62 Y29.61 E.00296
G1 X185.544 Y81.916 E2.01549
G1 X177.381 Y88.641 E.31504
G1 X142.49 Y46.124 E1.63828
G1 X36.12 Y133.754 E4.1051
; WIPE_START
M204 S10000
G1 X37.388 Y135.3 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.774 Y129.893 Z15.4 F30000
G1 X142.16 Y30.129 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X145.6 Y33.569 E.14491
; WIPE_START
M204 S10000
G1 X144.186 Y32.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.04 Y36.542 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X141.868 Y30.37 E.26001
G1 X141.575 Y30.611
G1 X150.48 Y39.515 E.37511
; WIPE_START
M204 S10000
G1 X149.066 Y38.101 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X152.92 Y42.489 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X141.283 Y30.851 E.49021
G1 X140.99 Y31.092
G1 X155.36 Y45.462 E.60531
; WIPE_START
M204 S10000
G1 X153.946 Y44.047 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.8 Y48.435 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X140.698 Y31.333 E.72041
G1 X140.406 Y31.574
G1 X160.24 Y51.408 E.8355
; WIPE_START
M204 S10000
G1 X158.825 Y49.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X162.68 Y54.381 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X140.113 Y31.815 E.9506
G1 X139.821 Y32.056
G1 X165.12 Y57.354 E1.0657
; WIPE_START
M204 S10000
G1 X163.705 Y55.94 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X167.559 Y60.328 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X139.528 Y32.297 E1.1808
G1 X139.236 Y32.537
G1 X169.999 Y63.301 E1.2959
; WIPE_START
M204 S10000
G1 X168.585 Y61.887 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X172.439 Y66.274 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X138.944 Y32.778 E1.411
G1 X138.651 Y33.019
G1 X174.879 Y69.247 E1.5261
; WIPE_START
M204 S10000
G1 X173.465 Y67.833 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X177.319 Y72.22 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X138.359 Y33.26 E1.64119
G1 X138.066 Y33.501
G1 X179.759 Y75.194 E1.75629
; WIPE_START
M204 S10000
G1 X178.345 Y73.779 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X182.199 Y78.167 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X137.774 Y33.742 E1.87139
G1 X137.482 Y33.983
G1 X184.639 Y81.14 E1.98649
G1 X185.034 Y82.068
G1 X137.189 Y34.223 E2.01544
G1 X136.897 Y34.464
G1 X184.741 Y82.309 E2.01544
G1 X184.449 Y82.55
G1 X136.604 Y34.705 E2.01544
G1 X136.312 Y34.946
G1 X184.157 Y82.791 E2.01544
G1 X183.864 Y83.032
G1 X136.02 Y35.187 E2.01544
G1 X135.727 Y35.428
G1 X183.572 Y83.272 E2.01544
G1 X183.28 Y83.513
G1 X135.435 Y35.669 E2.01544
G1 X135.142 Y35.909
G1 X182.987 Y83.754 E2.01544
G1 X182.695 Y83.995
G1 X134.85 Y36.15 E2.01544
G1 X134.558 Y36.391
G1 X182.402 Y84.236 E2.01544
G1 X182.11 Y84.477
M73 P95 R2
G1 X134.265 Y36.632 E2.01544
G1 X133.973 Y36.873
G1 X181.818 Y84.718 E2.01544
G1 X181.525 Y84.959
G1 X143.065 Y46.499 E1.6201
; WIPE_START
M204 S10000
G1 X144.48 Y47.913 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X145.505 Y49.472 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X181.233 Y85.199 E1.50501
G1 X180.94 Y85.44
G1 X147.945 Y52.445 E1.38991
; WIPE_START
M204 S10000
G1 X149.359 Y53.859 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.385 Y55.418 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X180.648 Y85.681 E1.27481
G1 X180.356 Y85.922
G1 X152.825 Y58.391 E1.15972
; WIPE_START
M204 S10000
G1 X154.239 Y59.806 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.265 Y61.365 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X180.063 Y86.163 E1.04462
G1 X179.771 Y86.404
G1 X157.705 Y64.338 E.92952
; WIPE_START
M204 S10000
G1 X159.119 Y65.752 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X160.145 Y67.311 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X179.478 Y86.645 E.81443
G1 X179.186 Y86.886
G1 X162.585 Y70.284 E.69933
; WIPE_START
M204 S10000
G1 X163.999 Y71.698 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X165.025 Y73.257 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X178.894 Y87.126 E.58423
G1 X178.601 Y87.367
G1 X167.464 Y76.23 E.46914
; WIPE_START
M204 S10000
G1 X168.879 Y77.645 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X169.904 Y79.204 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X178.309 Y87.608 E.35404
G1 X178.017 Y87.849
G1 X172.344 Y82.177 E.23894
; WIPE_START
M204 S10000
G1 X173.759 Y83.591 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X174.784 Y85.15 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X177.724 Y88.09 E.12385
; WIPE_START
M204 S10000
G1 X176.31 Y86.676 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X171.435 Y80.803 Z15.4 F30000
G1 X142.453 Y45.886 Z15.4
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X133.68 Y37.114 E.36954
G1 X133.388 Y37.355
G1 X142.161 Y46.127 E.36954
G1 X141.868 Y46.368
G1 X133.096 Y37.595 E.36954
G1 X132.803 Y37.836
G1 X141.576 Y46.609 E.36954
G1 X141.283 Y46.85
G1 X132.511 Y38.077 E.36954
G1 X132.218 Y38.318
G1 X140.991 Y47.091 E.36954
G1 X140.699 Y47.332
G1 X131.926 Y38.559 E.36954
G1 X131.634 Y38.8
G1 X140.406 Y47.572 E.36955
G1 X140.114 Y47.813
G1 X131.341 Y39.041 E.36955
G1 X131.049 Y39.281
G1 X139.821 Y48.054 E.36955
G1 X139.529 Y48.295
G1 X130.756 Y39.522 E.36955
G1 X130.464 Y39.763
G1 X139.237 Y48.536 E.36955
G1 X138.944 Y48.777
G1 X130.172 Y40.004 E.36955
G1 X129.879 Y40.245
G1 X138.652 Y49.018 E.36955
G1 X138.36 Y49.258
G1 X129.587 Y40.486 E.36955
G1 X129.294 Y40.727
G1 X138.067 Y49.499 E.36955
G1 X137.775 Y49.74
G1 X129.002 Y40.967 E.36955
G1 X128.71 Y41.208
G1 X137.482 Y49.981 E.36955
G1 X137.19 Y50.222
G1 X128.417 Y41.449 E.36955
G1 X128.125 Y41.69
G1 X136.898 Y50.463 E.36955
G1 X136.605 Y50.704
G1 X127.832 Y41.931 E.36955
G1 X127.54 Y42.172
G1 X136.313 Y50.945 E.36955
G1 X136.02 Y51.185
G1 X127.248 Y42.413 E.36955
G1 X126.955 Y42.653
G1 X135.728 Y51.426 E.36956
G1 X135.436 Y51.667
G1 X126.663 Y42.894 E.36956
G1 X126.37 Y43.135
G1 X135.143 Y51.908 E.36956
G1 X134.851 Y52.149
G1 X126.078 Y43.376 E.36956
G1 X125.786 Y43.617
G1 X134.559 Y52.39 E.36956
G1 X134.266 Y52.631
G1 X125.493 Y43.858 E.36956
G1 X125.201 Y44.099
G1 X133.974 Y52.872 E.36956
G1 X133.681 Y53.112
G1 X124.908 Y44.339 E.36956
G1 X124.616 Y44.58
G1 X133.389 Y53.353 E.36956
G1 X133.097 Y53.594
G1 X124.324 Y44.821 E.36956
G1 X124.031 Y45.062
G1 X132.804 Y53.835 E.36956
G1 X132.512 Y54.076
G1 X123.739 Y45.303 E.36956
G1 X123.446 Y45.544
G1 X132.219 Y54.317 E.36956
G1 X131.927 Y54.558
G1 X123.154 Y45.785 E.36956
G1 X122.862 Y46.025
G1 X131.635 Y54.799 E.36956
G1 X131.342 Y55.039
G1 X122.569 Y46.266 E.36956
G1 X122.277 Y46.507
G1 X131.05 Y55.28 E.36956
G1 X130.758 Y55.521
G1 X121.984 Y46.748 E.36957
G1 X121.692 Y46.989
G1 X130.465 Y55.762 E.36957
G1 X130.173 Y56.003
G1 X121.4 Y47.23 E.36957
G1 X121.107 Y47.471
G1 X129.88 Y56.244 E.36957
G1 X129.588 Y56.485
G1 X120.815 Y47.711 E.36957
G1 X120.522 Y47.952
G1 X129.296 Y56.726 E.36957
G1 X129.003 Y56.966
G1 X120.23 Y48.193 E.36957
G1 X119.938 Y48.434
G1 X128.711 Y57.207 E.36957
G1 X128.418 Y57.448
G1 X119.645 Y48.675 E.36957
G1 X119.353 Y48.916
G1 X128.126 Y57.689 E.36957
G1 X127.834 Y57.93
G1 X119.06 Y49.157 E.36957
G1 X118.768 Y49.397
G1 X127.541 Y58.171 E.36957
G1 X127.249 Y58.412
G1 X118.476 Y49.638 E.36957
G1 X118.183 Y49.879
G1 X126.956 Y58.652 E.36957
G1 X126.664 Y58.893
G1 X117.891 Y50.12 E.36957
G1 X117.598 Y50.361
G1 X126.372 Y59.134 E.36957
G1 X126.079 Y59.375
G1 X117.306 Y50.602 E.36957
G1 X117.014 Y50.843
G1 X125.787 Y59.616 E.36958
G1 X125.495 Y59.857
G1 X116.721 Y51.083 E.36958
G1 X116.429 Y51.324
G1 X125.202 Y60.098 E.36958
G1 X124.91 Y60.339
G1 X116.136 Y51.565 E.36958
G1 X115.844 Y51.806
G1 X124.617 Y60.579 E.36958
G1 X124.325 Y60.82
G1 X115.552 Y52.047 E.36958
G1 X115.259 Y52.288
G1 X124.033 Y61.061 E.36958
G1 X123.74 Y61.302
G1 X114.967 Y52.529 E.36958
G1 X114.674 Y52.769
G1 X123.448 Y61.543 E.36958
G1 X123.155 Y61.784
G1 X114.382 Y53.01 E.36958
G1 X114.09 Y53.251
G1 X122.863 Y62.025 E.36958
G1 X122.571 Y62.266
G1 X113.797 Y53.492 E.36958
G1 X113.505 Y53.733
G1 X122.278 Y62.506 E.36958
G1 X121.986 Y62.747
G1 X113.212 Y53.974 E.36958
G1 X112.92 Y54.215
G1 X121.694 Y62.988 E.36958
G1 X121.401 Y63.229
G1 X112.628 Y54.455 E.36958
G1 X112.335 Y54.696
G1 X121.109 Y63.47 E.36959
G1 X120.816 Y63.711
G1 X112.043 Y54.937 E.36959
G1 X111.75 Y55.178
G1 X120.524 Y63.952 E.36959
G1 X120.232 Y64.193
G1 X111.458 Y55.419 E.36959
G1 X111.166 Y55.66
G1 X119.939 Y64.433 E.36959
G1 X119.647 Y64.674
G1 X110.873 Y55.901 E.36959
G1 X110.581 Y56.141
G1 X119.354 Y64.915 E.36959
G1 X119.062 Y65.156
G1 X110.288 Y56.382 E.36959
G1 X109.996 Y56.623
G1 X118.77 Y65.397 E.36959
G1 X118.477 Y65.638
G1 X109.704 Y56.864 E.36959
G1 X109.411 Y57.105
G1 X118.185 Y65.879 E.36959
G1 X117.893 Y66.12
G1 X109.119 Y57.346 E.36959
G1 X108.826 Y57.587
G1 X117.6 Y66.36 E.36959
G1 X117.308 Y66.601
G1 X108.534 Y57.827 E.36959
G1 X108.242 Y58.068
G1 X117.015 Y66.842 E.36959
G1 X116.723 Y67.083
G1 X107.949 Y58.309 E.36959
G1 X107.657 Y58.55
G1 X116.431 Y67.324 E.36959
G1 X116.138 Y67.565
G1 X107.364 Y58.791 E.3696
G1 X107.072 Y59.032
G1 X115.846 Y67.806 E.3696
G1 X115.553 Y68.046
G1 X106.78 Y59.273 E.3696
G1 X106.487 Y59.513
G1 X115.261 Y68.287 E.3696
G1 X114.969 Y68.528
G1 X106.195 Y59.754 E.3696
G1 X105.902 Y59.995
G1 X114.676 Y68.769 E.3696
G1 X114.384 Y69.01
G1 X105.61 Y60.236 E.3696
G1 X105.318 Y60.477
G1 X114.092 Y69.251 E.3696
G1 X113.799 Y69.492
G1 X105.025 Y60.718 E.3696
G1 X104.733 Y60.959
G1 X113.507 Y69.733 E.3696
G1 X113.214 Y69.973
G1 X104.44 Y61.199 E.3696
G1 X104.148 Y61.44
G1 X112.922 Y70.214 E.3696
G1 X112.63 Y70.455
G1 X103.856 Y61.681 E.3696
G1 X103.563 Y61.922
G1 X112.337 Y70.696 E.3696
G1 X112.045 Y70.937
G1 X103.271 Y62.163 E.3696
M73 P95 R1
G1 X102.978 Y62.404
G1 X111.752 Y71.178 E.3696
G1 X111.46 Y71.419
G1 X102.686 Y62.645 E.3696
G1 X102.394 Y62.885
G1 X111.168 Y71.66 E.36961
G1 X110.875 Y71.9
G1 X102.101 Y63.126 E.36961
G1 X101.809 Y63.367
G1 X110.583 Y72.141 E.36961
G1 X110.291 Y72.382
G1 X101.516 Y63.608 E.36961
G1 X101.224 Y63.849
G1 X109.998 Y72.623 E.36961
G1 X109.706 Y72.864
G1 X100.932 Y64.09 E.36961
M73 P96 R1
G1 X100.639 Y64.331
G1 X109.413 Y73.105 E.36961
G1 X109.121 Y73.346
G1 X100.347 Y64.571 E.36961
G1 X100.054 Y64.812
G1 X108.829 Y73.587 E.36961
G1 X108.536 Y73.827
G1 X99.762 Y65.053 E.36961
G1 X99.47 Y65.294
G1 X108.244 Y74.068 E.36961
G1 X107.951 Y74.309
G1 X99.177 Y65.535 E.36961
G1 X98.885 Y65.776
G1 X107.659 Y74.55 E.36961
G1 X107.367 Y74.791
G1 X98.592 Y66.017 E.36961
G1 X98.3 Y66.257
G1 X107.074 Y75.032 E.36961
G1 X106.782 Y75.273
G1 X98.008 Y66.498 E.36961
G1 X97.715 Y66.739
G1 X106.489 Y75.514 E.36962
G1 X106.197 Y75.754
G1 X97.423 Y66.98 E.36962
G1 X97.13 Y67.221
G1 X105.905 Y75.995 E.36962
G1 X105.612 Y76.236
G1 X96.838 Y67.462 E.36962
G1 X96.546 Y67.703
G1 X105.32 Y76.477 E.36962
G1 X105.028 Y76.718
G1 X96.253 Y67.943 E.36962
G1 X95.961 Y68.184
G1 X104.735 Y76.959 E.36962
G1 X104.443 Y77.2
G1 X95.668 Y68.425 E.36962
G1 X95.376 Y68.666
G1 X104.15 Y77.44 E.36962
G1 X103.858 Y77.681
G1 X95.084 Y68.907 E.36962
G1 X94.791 Y69.148
G1 X103.566 Y77.922 E.36962
G1 X103.273 Y78.163
G1 X94.499 Y69.389 E.36962
G1 X94.206 Y69.629
G1 X102.981 Y78.404 E.36962
G1 X102.688 Y78.645
G1 X93.914 Y69.87 E.36962
G1 X93.622 Y70.111
G1 X102.396 Y78.886 E.36962
G1 X102.104 Y79.127
G1 X93.329 Y70.352 E.36962
G1 X93.037 Y70.593
G1 X101.811 Y79.367 E.36962
G1 X101.519 Y79.608
G1 X92.744 Y70.834 E.36963
G1 X92.452 Y71.075
G1 X101.227 Y79.849 E.36963
G1 X100.934 Y80.09
G1 X92.16 Y71.315 E.36963
G1 X91.867 Y71.556
G1 X100.642 Y80.331 E.36963
G1 X100.349 Y80.572
G1 X91.575 Y71.797 E.36963
G1 X91.282 Y72.038
G1 X100.057 Y80.813 E.36963
G1 X99.765 Y81.054
G1 X90.99 Y72.279 E.36963
G1 X90.698 Y72.52
G1 X99.472 Y81.294 E.36963
G1 X99.18 Y81.535
G1 X90.405 Y72.761 E.36963
G1 X90.113 Y73.001
G1 X98.887 Y81.776 E.36963
G1 X98.595 Y82.017
G1 X89.82 Y73.242 E.36963
G1 X89.528 Y73.483
G1 X98.303 Y82.258 E.36963
G1 X98.01 Y82.499
G1 X89.236 Y73.724 E.36963
G1 X88.943 Y73.965
G1 X97.718 Y82.74 E.36963
G1 X97.426 Y82.981
G1 X88.651 Y74.206 E.36963
G1 X88.358 Y74.447
G1 X97.133 Y83.221 E.36963
G1 X96.841 Y83.462
G1 X88.066 Y74.687 E.36963
G1 X87.774 Y74.928
G1 X96.548 Y83.703 E.36964
G1 X96.256 Y83.944
G1 X87.481 Y75.169 E.36964
G1 X87.189 Y75.41
G1 X95.964 Y84.185 E.36964
G1 X95.671 Y84.426
G1 X86.896 Y75.651 E.36964
G1 X86.604 Y75.892
G1 X95.379 Y84.667 E.36964
G1 X95.086 Y84.908
G1 X86.312 Y76.133 E.36964
G1 X86.019 Y76.373
G1 X94.794 Y85.148 E.36964
G1 X94.502 Y85.389
G1 X85.727 Y76.614 E.36964
G1 X85.434 Y76.855
G1 X94.209 Y85.63 E.36964
G1 X93.917 Y85.871
G1 X85.142 Y77.096 E.36964
G1 X84.85 Y77.337
G1 X93.625 Y86.112 E.36964
G1 X93.332 Y86.353
G1 X84.557 Y77.578 E.36964
G1 X84.265 Y77.819
G1 X93.04 Y86.594 E.36964
G1 X92.747 Y86.834
G1 X83.972 Y78.059 E.36964
G1 X83.68 Y78.3
G1 X92.455 Y87.075 E.36964
G1 X92.163 Y87.316
G1 X83.388 Y78.541 E.36964
G1 X83.095 Y78.782
G1 X91.87 Y87.557 E.36965
G1 X91.578 Y87.798
G1 X82.803 Y79.023 E.36965
G1 X82.51 Y79.264
G1 X91.285 Y88.039 E.36965
G1 X90.993 Y88.28
G1 X82.218 Y79.505 E.36965
G1 X81.926 Y79.745
G1 X90.701 Y88.521 E.36965
G1 X90.408 Y88.761
G1 X81.633 Y79.986 E.36965
G1 X81.341 Y80.227
G1 X90.116 Y89.002 E.36965
G1 X89.824 Y89.243
G1 X81.048 Y80.468 E.36965
G1 X80.756 Y80.709
G1 X89.531 Y89.484 E.36965
G1 X89.239 Y89.725
G1 X80.464 Y80.95 E.36965
G1 X80.171 Y81.191
G1 X88.946 Y89.966 E.36965
G1 X88.654 Y90.207
G1 X79.879 Y81.431 E.36965
G1 X79.586 Y81.672
G1 X88.362 Y90.448 E.36965
G1 X88.069 Y90.688
G1 X79.294 Y81.913 E.36965
G1 X79.002 Y82.154
G1 X87.777 Y90.929 E.36965
G1 X87.484 Y91.17
G1 X78.709 Y82.395 E.36965
G1 X78.417 Y82.636
G1 X87.192 Y91.411 E.36966
G1 X86.9 Y91.652
G1 X78.124 Y82.877 E.36966
G1 X77.832 Y83.117
G1 X86.607 Y91.893 E.36966
G1 X86.315 Y92.134
G1 X77.54 Y83.358 E.36966
G1 X77.247 Y83.599
G1 X86.022 Y92.375 E.36966
G1 X85.73 Y92.615
G1 X76.955 Y83.84 E.36966
G1 X76.662 Y84.081
G1 X85.438 Y92.856 E.36966
G1 X85.145 Y93.097
G1 X76.37 Y84.322 E.36966
G1 X76.078 Y84.563
G1 X84.853 Y93.338 E.36966
G1 X84.561 Y93.579
G1 X75.785 Y84.803 E.36966
G1 X75.493 Y85.044
G1 X84.268 Y93.82 E.36966
G1 X83.976 Y94.061
G1 X75.2 Y85.285 E.36966
G1 X74.908 Y85.526
G1 X83.683 Y94.302 E.36966
G1 X83.391 Y94.542
G1 X74.616 Y85.767 E.36966
G1 X74.323 Y86.008
G1 X83.099 Y94.783 E.36966
G1 X82.806 Y95.024
G1 X74.031 Y86.249 E.36966
G1 X73.738 Y86.489
G1 X82.514 Y95.265 E.36966
G1 X82.221 Y95.506
G1 X73.446 Y86.73 E.36967
G1 X73.154 Y86.971
G1 X81.929 Y95.747 E.36967
G1 X81.637 Y95.988
G1 X72.861 Y87.212 E.36967
G1 X72.569 Y87.453
G1 X81.344 Y96.228 E.36967
G1 X81.052 Y96.469
G1 X72.276 Y87.694 E.36967
G1 X71.984 Y87.935
G1 X80.76 Y96.71 E.36967
G1 X80.467 Y96.951
G1 X71.692 Y88.175 E.36967
G1 X71.399 Y88.416
G1 X80.175 Y97.192 E.36967
G1 X79.882 Y97.433
G1 X71.107 Y88.657 E.36967
G1 X70.814 Y88.898
G1 X79.59 Y97.674 E.36967
G1 X79.298 Y97.915
G1 X70.522 Y89.139 E.36967
G1 X70.23 Y89.38
G1 X79.005 Y98.155 E.36967
G1 X78.713 Y98.396
G1 X69.937 Y89.621 E.36967
G1 X69.645 Y89.861
G1 X78.42 Y98.637 E.36967
G1 X78.128 Y98.878
G1 X69.352 Y90.102 E.36967
G1 X69.06 Y90.343
G1 X77.836 Y99.119 E.36967
G1 X77.543 Y99.36
G1 X68.768 Y90.584 E.36967
G1 X68.475 Y90.825
G1 X77.251 Y99.601 E.36968
G1 X76.959 Y99.842
G1 X68.183 Y91.066 E.36968
G1 X67.89 Y91.307
G1 X76.666 Y100.082 E.36968
G1 X76.374 Y100.323
G1 X67.598 Y91.547 E.36968
G1 X67.306 Y91.788
G1 X76.081 Y100.564 E.36968
G1 X75.789 Y100.805
G1 X67.013 Y92.029 E.36968
G1 X66.721 Y92.27
G1 X75.497 Y101.046 E.36968
G1 X75.204 Y101.287
G1 X66.428 Y92.511 E.36968
G1 X66.136 Y92.752
G1 X74.912 Y101.528 E.36968
G1 X74.619 Y101.769
G1 X65.844 Y92.993 E.36968
G1 X65.551 Y93.233
G1 X74.327 Y102.009 E.36968
G1 X74.035 Y102.25
G1 X65.259 Y93.474 E.36968
G1 X64.966 Y93.715
G1 X73.742 Y102.491 E.36968
G1 X73.45 Y102.732
G1 X64.674 Y93.956 E.36968
G1 X64.382 Y94.197
G1 X73.158 Y102.973 E.36968
G1 X72.865 Y103.214
G1 X64.089 Y94.438 E.36968
G1 X63.797 Y94.679
G1 X72.573 Y103.455 E.36968
G1 X72.28 Y103.696
G1 X63.504 Y94.92 E.36969
G1 X63.212 Y95.16
G1 X71.988 Y103.936 E.36969
G1 X71.696 Y104.177
G1 X62.92 Y95.401 E.36969
G1 X62.627 Y95.642
G1 X71.403 Y104.418 E.36969
G1 X71.111 Y104.659
G1 X62.335 Y95.883 E.36969
G1 X62.042 Y96.124
G1 X70.818 Y104.9 E.36969
G1 X70.526 Y105.141
G1 X61.75 Y96.365 E.36969
G1 X61.458 Y96.606
G1 X70.234 Y105.382 E.36969
G1 X69.941 Y105.622
G1 X61.165 Y96.846 E.36969
G1 X60.873 Y97.087
G1 X69.649 Y105.863 E.36969
G1 X69.357 Y106.104
G1 X60.58 Y97.328 E.36969
G1 X60.288 Y97.569
G1 X69.064 Y106.345 E.36969
G1 X68.772 Y106.586
G1 X59.996 Y97.81 E.36969
G1 X59.703 Y98.051
G1 X68.479 Y106.827 E.36969
G1 X68.187 Y107.068
G1 X59.411 Y98.292 E.36969
G1 X59.118 Y98.532
G1 X67.895 Y107.309 E.36969
G1 X67.602 Y107.549
G1 X58.826 Y98.773 E.3697
G1 X58.534 Y99.014
G1 X67.31 Y107.79 E.3697
G1 X67.017 Y108.031
G1 X58.241 Y99.255 E.3697
G1 X57.949 Y99.496
G1 X66.725 Y108.272 E.3697
G1 X66.433 Y108.513
G1 X57.656 Y99.737 E.3697
G1 X57.364 Y99.978
G1 X66.14 Y108.754 E.3697
G1 X65.848 Y108.995
G1 X57.072 Y100.218 E.3697
G1 X56.779 Y100.459
G1 X65.555 Y109.236 E.3697
G1 X65.263 Y109.476
G1 X56.487 Y100.7 E.3697
G1 X56.194 Y100.941
G1 X64.971 Y109.717 E.3697
G1 X64.678 Y109.958
G1 X55.902 Y101.182 E.3697
G1 X55.61 Y101.423
G1 X64.386 Y110.199 E.3697
G1 X64.094 Y110.44
G1 X55.317 Y101.664 E.3697
G1 X55.025 Y101.904
G1 X63.801 Y110.681 E.3697
G1 X63.509 Y110.922
G1 X54.732 Y102.145 E.3697
G1 X54.44 Y102.386
G1 X63.216 Y111.163 E.3697
G1 X62.924 Y111.403
G1 X54.148 Y102.627 E.36971
G1 X53.855 Y102.868
G1 X62.632 Y111.644 E.36971
G1 X62.339 Y111.885
G1 X53.563 Y103.109 E.36971
G1 X53.27 Y103.35
G1 X62.047 Y112.126 E.36971
G1 X61.754 Y112.367
G1 X52.978 Y103.59 E.36971
G1 X52.686 Y103.831
G1 X61.462 Y112.608 E.36971
G1 X61.17 Y112.849
G1 X52.393 Y104.072 E.36971
G1 X52.101 Y104.313
G1 X60.877 Y113.09 E.36971
G1 X60.585 Y113.33
G1 X51.808 Y104.554 E.36971
G1 X51.516 Y104.795
G1 X60.293 Y113.571 E.36971
G1 X60 Y113.812
G1 X51.224 Y105.036 E.36971
G1 X50.931 Y105.276
G1 X59.708 Y114.053 E.36971
G1 X59.415 Y114.294
G1 X50.639 Y105.517 E.36971
G1 X50.346 Y105.758
G1 X59.123 Y114.535 E.36971
G1 X58.831 Y114.776
G1 X50.054 Y105.999 E.36971
G1 X49.762 Y106.24
G1 X58.538 Y115.016 E.36971
M73 P97 R1
G1 X58.246 Y115.257
G1 X49.469 Y106.481 E.36971
G1 X49.177 Y106.722
G1 X57.953 Y115.498 E.36972
G1 X57.661 Y115.739
G1 X48.884 Y106.962 E.36972
G1 X48.592 Y107.203
G1 X57.369 Y115.98 E.36972
G1 X57.076 Y116.221
G1 X48.3 Y107.444 E.36972
G1 X48.007 Y107.685
G1 X56.784 Y116.462 E.36972
G1 X56.492 Y116.703
G1 X47.715 Y107.926 E.36972
G1 X47.422 Y108.167
G1 X56.199 Y116.943 E.36972
G1 X55.907 Y117.184
G1 X47.13 Y108.408 E.36972
G1 X46.838 Y108.648
G1 X55.614 Y117.425 E.36972
G1 X55.322 Y117.666
G1 X46.545 Y108.889 E.36972
G1 X46.253 Y109.13
G1 X55.03 Y117.907 E.36972
G1 X54.737 Y118.148
G1 X45.96 Y109.371 E.36972
G1 X45.668 Y109.612
G1 X54.445 Y118.389 E.36972
G1 X54.152 Y118.63
G1 X45.376 Y109.853 E.36972
G1 X45.083 Y110.094
G1 X53.86 Y118.87 E.36972
G1 X53.568 Y119.111
G1 X44.791 Y110.334 E.36972
G1 X44.498 Y110.575
G1 X53.275 Y119.352 E.36972
G1 X52.983 Y119.593
G1 X44.206 Y110.816 E.36973
G1 X43.914 Y111.057
G1 X52.691 Y119.834 E.36973
G1 X52.398 Y120.075
G1 X43.621 Y111.298 E.36973
G1 X43.329 Y111.539
G1 X52.106 Y120.316 E.36973
G1 X51.813 Y120.557
G1 X43.036 Y111.78 E.36973
G1 X42.744 Y112.02
G1 X51.521 Y120.797 E.36973
G1 X51.229 Y121.038
G1 X42.452 Y112.261 E.36973
G1 X42.159 Y112.502
G1 X50.936 Y121.279 E.36973
G1 X50.644 Y121.52
G1 X41.867 Y112.743 E.36973
G1 X41.574 Y112.984
G1 X50.351 Y121.761 E.36973
G1 X50.059 Y122.002
G1 X41.282 Y113.225 E.36973
G1 X40.99 Y113.466
G1 X49.767 Y122.243 E.36973
G1 X49.474 Y122.483
G1 X40.697 Y113.706 E.36973
G1 X40.405 Y113.947
G1 X49.182 Y122.724 E.36973
G1 X48.889 Y122.965
G1 X40.112 Y114.188 E.36973
G1 X39.82 Y114.429
G1 X48.597 Y123.206 E.36973
G1 X48.305 Y123.447
G1 X39.528 Y114.67 E.36973
G1 X39.235 Y114.911
G1 X48.012 Y123.688 E.36974
G1 X47.72 Y123.929
G1 X38.943 Y115.152 E.36974
G1 X38.65 Y115.392
G1 X47.428 Y124.17 E.36974
G1 X47.135 Y124.41
G1 X38.358 Y115.633 E.36974
G1 X38.066 Y115.874
G1 X46.843 Y124.651 E.36974
G1 X46.55 Y124.892
G1 X37.773 Y116.115 E.36974
G1 X37.481 Y116.356
G1 X46.258 Y125.133 E.36974
G1 X45.966 Y125.374
G1 X37.188 Y116.597 E.36974
G1 X36.896 Y116.838
G1 X45.673 Y125.615 E.36974
G1 X45.381 Y125.856
G1 X36.604 Y117.078 E.36974
G1 X36.311 Y117.319
G1 X45.088 Y126.097 E.36974
G1 X44.796 Y126.337
G1 X36.019 Y117.56 E.36974
G1 X35.726 Y117.801
G1 X44.504 Y126.578 E.36974
G1 X44.211 Y126.819
G1 X35.434 Y118.042 E.36974
G1 X35.142 Y118.283
G1 X43.919 Y127.06 E.36974
G1 X43.627 Y127.301
G1 X34.849 Y118.524 E.36974
G1 X34.557 Y118.764
G1 X43.334 Y127.542 E.36975
G1 X43.042 Y127.783
G1 X34.264 Y119.005 E.36975
G1 X33.972 Y119.246
G1 X42.749 Y128.024 E.36975
G1 X42.457 Y128.264
G1 X33.68 Y119.487 E.36975
G1 X33.387 Y119.728
G1 X42.165 Y128.505 E.36975
G1 X41.872 Y128.746
G1 X33.095 Y119.969 E.36975
G1 X32.802 Y120.21
G1 X41.58 Y128.987 E.36975
G1 X41.287 Y129.228
G1 X32.51 Y120.45 E.36975
G1 X32.218 Y120.691
G1 X40.995 Y129.469 E.36975
G1 X40.703 Y129.71
G1 X31.925 Y120.932 E.36975
G1 X31.633 Y121.173
G1 X40.41 Y129.951 E.36975
G1 X40.118 Y130.191
G1 X31.34 Y121.414 E.36975
G1 X31.048 Y121.655
G1 X39.826 Y130.432 E.36975
G1 X39.533 Y130.673
G1 X30.756 Y121.896 E.36975
G1 X30.463 Y122.136
G1 X39.241 Y130.914 E.36975
G1 X38.948 Y131.155
G1 X30.171 Y122.377 E.36975
G1 X29.878 Y122.618
G1 X38.656 Y131.396 E.36975
G1 X38.364 Y131.637
G1 X29.586 Y122.859 E.36976
G1 X29.294 Y123.1
G1 X38.071 Y131.878 E.36976
G1 X37.779 Y132.118
G1 X29.001 Y123.341 E.36976
G1 X28.709 Y123.582
G1 X37.486 Y132.359 E.36976
G1 X37.194 Y132.6
G1 X28.416 Y123.822 E.36976
G1 X28.124 Y124.063
G1 X36.902 Y132.841 E.36976
G1 X36.609 Y133.082
G1 X27.832 Y124.305 E.36974
G1 X27.54 Y124.546
G1 X36.317 Y133.323 E.3697
G1 X36.025 Y133.564
G1 X27.249 Y124.788 E.36967
G1 X26.957 Y125.03
G1 X36.196 Y134.268 E.38918
; WIPE_START
M204 S10000
G1 X34.782 Y132.854 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X38.636 Y137.242 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X26.666 Y125.271 E.50424
G1 X26.374 Y125.513
G1 X41.076 Y140.215 E.61931
; WIPE_START
M204 S10000
G1 X39.662 Y138.801 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X43.516 Y143.188 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X26.082 Y125.755 E.73438
G1 X25.791 Y125.996
G1 X45.956 Y146.161 E.84944
; WIPE_START
M204 S10000
G1 X44.542 Y144.747 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X48.396 Y149.134 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X25.499 Y126.238 E.96451
G1 X25.208 Y126.48
G1 X50.836 Y152.108 E1.07957
; WIPE_START
M204 S10000
G1 X49.422 Y150.693 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X53.276 Y155.081 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X24.916 Y126.721 E1.19464
G1 X24.624 Y126.963
G1 X55.716 Y158.054 E1.3097
; WIPE_START
M204 S10000
G1 X54.301 Y156.64 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X58.156 Y161.027 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X24.333 Y127.205 E1.42477
G1 X24.041 Y127.446
G1 X60.596 Y164.001 E1.53984
; WIPE_START
M204 S10000
G1 X59.181 Y162.586 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X63.036 Y166.974 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X23.75 Y127.688 E1.6549
G1 X23.458 Y127.929
G1 X65.476 Y169.947 E1.76997
; WIPE_START
M204 S10000
G1 X64.061 Y168.533 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X67.915 Y172.92 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X23.166 Y128.171 E1.88503
G1 X22.875 Y128.413
G1 X70.355 Y175.893 E2.0001
; WIPE_START
M204 S10000
G1 X68.941 Y174.479 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X72.795 Y178.867 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X22.583 Y128.654 E2.11517
G1 X22.292 Y128.896
G1 X75.235 Y181.84 E2.23023
; WIPE_START
M204 S10000
G1 X73.821 Y180.426 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X77.675 Y184.813 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X22 Y129.138 E2.3453
G1 X21.708 Y129.379
G1 X80.115 Y187.786 E2.46036
; WIPE_START
M204 S10000
G1 X78.701 Y186.372 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X82.555 Y190.759 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X21.417 Y129.621 E2.57543
G1 X21.125 Y129.863
G1 X84.995 Y193.733 E2.6905
; WIPE_START
M204 S10000
G1 X83.581 Y192.318 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.435 Y196.706 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X20.834 Y130.104 E2.80556
G1 X20.542 Y130.346
G1 X89.875 Y199.679 E2.92063
; WIPE_START
M204 S10000
G1 X88.461 Y198.265 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X92.315 Y202.652 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X20.25 Y130.588 E3.03569
G1 X20.182 Y131.053
G1 X94.755 Y205.626 E3.14134
; WIPE_START
M204 S10000
G1 X93.341 Y204.211 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X97.195 Y208.599 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X22.53 Y133.934 E3.14524
; WIPE_START
M204 S10000
G1 X23.944 Y135.348 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X24.877 Y136.814 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X99.635 Y211.572 E3.14913
; WIPE_START
M204 S10000
G1 X98.221 Y210.158 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.075 Y214.545 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X27.27 Y139.74 E3.15112
; WIPE_START
M204 S10000
G1 X28.684 Y141.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X29.712 Y142.715 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X104.515 Y217.518 E3.15105
; WIPE_START
M204 S10000
G1 X103.101 Y216.104 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X106.955 Y220.492 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X32.154 Y145.69 E3.15097
; WIPE_START
M204 S10000
G1 X33.568 Y147.105 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X34.595 Y148.665 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X109.395 Y223.465 E3.1509
; WIPE_START
M204 S10000
G1 X107.981 Y222.051 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.835 Y226.438 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
M73 P98 R0
G1 X37.037 Y151.64 E3.15083
; WIPE_START
M204 S10000
G1 X38.451 Y153.054 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X39.479 Y154.615 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X114.275 Y229.411 E3.15076
; WIPE_START
M204 S10000
G1 X112.861 Y227.997 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X116.715 Y232.385 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X41.92 Y157.59 E3.15068
; WIPE_START
M204 S10000
G1 X43.335 Y159.004 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X44.362 Y160.565 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X119.155 Y235.358 E3.15061
; WIPE_START
M204 S10000
G1 X117.74 Y233.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X121.403 Y238.14 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X46.804 Y163.54 E3.14248
; WIPE_START
M204 S10000
G1 X48.218 Y164.954 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X49.245 Y166.515 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X121.111 Y238.38 E3.02731
G1 X120.818 Y238.621
G1 X51.687 Y169.49 E2.91213
; WIPE_START
M204 S10000
G1 X53.101 Y170.904 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X54.129 Y172.465 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X120.526 Y238.862 E2.79696
G1 X120.234 Y239.103
G1 X56.57 Y175.44 E2.68179
; WIPE_START
M204 S10000
G1 X57.985 Y176.854 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X59.012 Y178.415 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X119.941 Y239.344 E2.56662
G1 X119.649 Y239.585
G1 X61.454 Y181.39 E2.45145
; WIPE_START
M204 S10000
G1 X62.868 Y182.804 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X63.895 Y184.365 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X119.357 Y239.826 E2.33628
G1 X119.064 Y240.067
G1 X66.337 Y187.34 E2.2211
; WIPE_START
M204 S10000
G1 X67.751 Y188.754 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X68.779 Y190.314 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X118.772 Y240.307 E2.10593
G1 X118.479 Y240.548
G1 X71.22 Y193.289 E1.99076
; WIPE_START
M204 S10000
G1 X72.635 Y194.704 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X73.662 Y196.264 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X118.187 Y240.789 E1.87559
G1 X117.895 Y241.03
G1 X76.104 Y199.239 E1.76042
; WIPE_START
M204 S10000
G1 X77.518 Y200.654 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X78.546 Y202.214 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X117.602 Y241.271 E1.64525
G1 X117.31 Y241.512
G1 X80.987 Y205.189 E1.53008
; WIPE_START
M204 S10000
G1 X82.401 Y206.603 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X83.429 Y208.164 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X117.017 Y241.753 E1.4149
G1 X116.725 Y241.994
G1 X85.871 Y211.139 E1.29973
; WIPE_START
M204 S10000
G1 X87.285 Y212.553 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.312 Y214.114 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X116.433 Y242.234 E1.18456
G1 X116.14 Y242.475
G1 X90.754 Y217.089 E1.06939
; WIPE_START
M204 S10000
G1 X92.168 Y218.503 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X93.196 Y220.064 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X115.848 Y242.716 E.95422
G1 X115.556 Y242.957
G1 X95.637 Y223.039 E.83905
; WIPE_START
M204 S10000
G1 X97.052 Y224.453 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.079 Y226.014 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X115.263 Y243.198 E.72388
G1 X114.971 Y243.439
G1 X100.521 Y228.989 E.6087
; WIPE_START
M204 S10000
G1 X101.935 Y230.403 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.962 Y231.964 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X114.678 Y243.68 E.49353
G1 X114.386 Y243.921
G1 X105.404 Y234.939 E.37836
; WIPE_START
M204 S10000
G1 X106.818 Y236.353 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.846 Y237.914 Z15.4 F30000
G1 Z15
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X114.094 Y244.161 E.26319
G1 X113.801 Y244.402
G1 X110.287 Y240.888 E.14802
; WIPE_START
M204 S10000
G1 X111.702 Y242.303 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X112.867 Y234.76 Z15.4 F30000
G1 X144.221 Y31.893 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112952
G1 F15000
G1 X143.859 Y31.493 E.00298
; LINE_WIDTH: 0.162506
G1 X143.497 Y31.094 E.00509
; LINE_WIDTH: 0.21206
G1 X143.136 Y30.695 E.0072
; LINE_WIDTH: 0.261613
G1 X142.774 Y30.296 E.00931
; LINE_WIDTH: 0.311167
G1 F13420.479
G1 X142.412 Y29.897 E.01141
; WIPE_START
G1 X142.774 Y30.296 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X146.661 Y34.866 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107168
G1 F15000
G1 X146.381 Y34.557 E.00212
; LINE_WIDTH: 0.145153
G1 X146.1 Y34.247 E.00337
; LINE_WIDTH: 0.183139
G1 X145.82 Y33.938 E.00462
; LINE_WIDTH: 0.221124
G1 X145.54 Y33.629 E.00587
; WIPE_START
G1 X145.82 Y33.938 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.101 Y37.839 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107165
G1 F15000
G1 X148.821 Y37.53 E.00212
; LINE_WIDTH: 0.145144
G1 X148.54 Y37.221 E.00337
; LINE_WIDTH: 0.183123
G1 X148.26 Y36.911 E.00462
; LINE_WIDTH: 0.221102
G1 X147.98 Y36.602 E.00587
; WIPE_START
G1 X148.26 Y36.911 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.541 Y40.812 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.104947
G1 F15000
G1 X151.306 Y40.553 E.00171
; LINE_WIDTH: 0.138491
G1 X151.072 Y40.295 E.00264
; LINE_WIDTH: 0.172035
G1 X150.837 Y40.036 E.00356
; LINE_WIDTH: 0.201634
G1 X150.628 Y39.806 E.00389
; LINE_WIDTH: 0.227281
G1 X150.42 Y39.575 E.00452
; WIPE_START
G1 X150.628 Y39.806 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.981 Y43.785 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107851
G1 F15000
G1 X153.704 Y43.48 E.00211
; LINE_WIDTH: 0.147203
G1 X153.427 Y43.174 E.0034
; LINE_WIDTH: 0.185166
G1 X153.143 Y42.862 E.00475
; LINE_WIDTH: 0.221774
G1 X152.86 Y42.549 E.00597
; WIPE_START
G1 X153.143 Y42.862 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X156.421 Y46.759 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107166
G1 F15000
G1 X156.14 Y46.449 E.00212
; LINE_WIDTH: 0.145149
G1 X155.86 Y46.14 E.00337
; LINE_WIDTH: 0.183131
G1 X155.58 Y45.831 E.00462
; LINE_WIDTH: 0.221113
G1 X155.3 Y45.522 E.00587
; WIPE_START
G1 X155.58 Y45.831 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X158.861 Y49.732 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.105929
G1 F15000
G1 X158.61 Y49.455 E.00186
; LINE_WIDTH: 0.141437
G1 X158.359 Y49.179 E.0029
; LINE_WIDTH: 0.17941
G1 X158.05 Y48.837 E.00498
; LINE_WIDTH: 0.219863
G1 X157.74 Y48.495 E.00645
; WIPE_START
G1 X158.05 Y48.837 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X161.301 Y52.705 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.0899971
G1 F15000
G1 X161.26 Y52.661 E.00022
; LINE_WIDTH: 0.116523
G1 X160.9 Y52.263 E.00312
; LINE_WIDTH: 0.16595
G1 X160.54 Y51.866 E.00521
; LINE_WIDTH: 0.215377
G1 X160.18 Y51.468 E.00731
; WIPE_START
G1 X160.54 Y51.866 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X163.74 Y55.678 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107165
G1 F15000
G1 X163.46 Y55.369 E.00212
; LINE_WIDTH: 0.145143
G1 X163.18 Y55.06 E.00337
; LINE_WIDTH: 0.183122
G1 X162.9 Y54.751 E.00462
; LINE_WIDTH: 0.221101
G1 X162.62 Y54.441 E.00587
; WIPE_START
G1 X162.9 Y54.751 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X166.18 Y58.651 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.106693
G1 F15000
G1 X165.919 Y58.363 E.00196
; LINE_WIDTH: 0.143729
G1 X165.658 Y58.075 E.00309
; LINE_WIDTH: 0.18172
G1 X165.359 Y57.745 E.00489
; LINE_WIDTH: 0.220643
G1 X165.059 Y57.415 E.00626
; WIPE_START
G1 X165.359 Y57.745 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X168.62 Y61.625 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.0979126
G1 F15000
G1 X168.472 Y61.461 E.00096
; LINE_WIDTH: 0.129711
G1 X168.148 Y61.103 E.00331
; LINE_WIDTH: 0.173863
G1 X167.824 Y60.745 E.00499
; LINE_WIDTH: 0.218014
G1 X167.499 Y60.388 E.00668
; WIPE_START
G1 X167.824 Y60.745 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X171.06 Y64.598 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107165
G1 F15000
G1 X170.78 Y64.289 E.00212
; LINE_WIDTH: 0.145143
G1 X170.5 Y63.979 E.00337
; LINE_WIDTH: 0.183122
G1 X170.22 Y63.67 E.00462
; LINE_WIDTH: 0.2211
G1 X169.939 Y63.361 E.00587
; WIPE_START
G1 X170.22 Y63.67 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X173.5 Y67.571 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107165
G1 F15000
G1 X173.22 Y67.262 E.00212
; LINE_WIDTH: 0.145143
G1 X172.94 Y66.953 E.00337
; LINE_WIDTH: 0.183122
G1 X172.659 Y66.643 E.00462
; LINE_WIDTH: 0.221101
G1 X172.379 Y66.334 E.00587
; WIPE_START
G1 X172.659 Y66.643 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X175.94 Y70.544 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107166
G1 F15000
G1 X175.66 Y70.235 E.00212
; LINE_WIDTH: 0.145149
G1 X175.38 Y69.926 E.00337
; LINE_WIDTH: 0.183131
G1 X175.099 Y69.617 E.00462
; LINE_WIDTH: 0.221113
G1 X174.819 Y69.307 E.00587
; WIPE_START
G1 X175.099 Y69.617 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.38 Y73.517 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107165
G1 F15000
G1 X178.1 Y73.208 E.00212
; LINE_WIDTH: 0.145143
G1 X177.82 Y72.899 E.00337
; LINE_WIDTH: 0.183122
G1 X177.539 Y72.59 E.00462
; LINE_WIDTH: 0.2211
G1 X177.259 Y72.281 E.00587
; WIPE_START
G1 X177.539 Y72.59 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X180.82 Y76.491 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107165
G1 F15000
G1 X180.54 Y76.181 E.00212
; LINE_WIDTH: 0.145143
G1 X180.26 Y75.872 E.00337
; LINE_WIDTH: 0.183122
G1 X179.979 Y75.563 E.00462
; LINE_WIDTH: 0.221101
G1 X179.699 Y75.254 E.00587
; WIPE_START
G1 X179.979 Y75.563 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X183.26 Y79.464 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107168
G1 F15000
G1 X182.98 Y79.155 E.00212
; LINE_WIDTH: 0.145153
G1 X182.7 Y78.845 E.00337
; LINE_WIDTH: 0.183139
G1 X182.419 Y78.536 E.00462
; LINE_WIDTH: 0.221124
G1 X182.139 Y78.227 E.00587
; WIPE_START
G1 X182.419 Y78.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X185.237 Y81.925 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.125701
G1 F15000
G1 X185.173 Y81.819 E.00081
; LINE_WIDTH: 0.100681
G1 X185.109 Y81.714 E.00056
; WIPE_START
G1 X185.173 Y81.819 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X179.342 Y86.744 Z15.4 F30000
G1 X177.499 Y88.3 Z15.4
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.247287
G1 F15000
G1 X177.165 Y87.931 E.00803
; LINE_WIDTH: 0.201826
G1 X176.831 Y87.563 E.00624
; LINE_WIDTH: 0.156366
G1 X176.497 Y87.195 E.00446
; LINE_WIDTH: 0.110905
G1 X176.163 Y86.826 E.00267
; WIPE_START
G1 X176.497 Y87.195 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X174.844 Y85.09 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221111
G1 F15000
G1 X174.564 Y84.781 E.00587
; LINE_WIDTH: 0.183129
G1 X174.284 Y84.471 E.00462
; LINE_WIDTH: 0.145147
G1 X174.004 Y84.162 E.00337
; LINE_WIDTH: 0.107166
G1 X173.723 Y83.853 E.00212
; WIPE_START
G1 X174.004 Y84.162 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X172.404 Y82.117 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221124
G1 F15000
G1 X172.124 Y81.807 E.00587
; LINE_WIDTH: 0.183138
G1 X171.844 Y81.498 E.00462
; LINE_WIDTH: 0.145153
G1 X171.564 Y81.189 E.00337
; LINE_WIDTH: 0.107168
G1 X171.283 Y80.88 E.00212
; WIPE_START
G1 X171.564 Y81.189 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X169.964 Y79.143 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221114
G1 F15000
G1 X169.684 Y78.834 E.00587
; LINE_WIDTH: 0.183131
G1 X169.404 Y78.525 E.00462
; LINE_WIDTH: 0.145149
G1 X169.124 Y78.216 E.00337
; LINE_WIDTH: 0.107166
G1 X168.844 Y77.907 E.00212
; WIPE_START
G1 X169.124 Y78.216 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X167.525 Y76.17 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221124
G1 F15000
G1 X167.244 Y75.861 E.00587
; LINE_WIDTH: 0.183138
G1 X166.964 Y75.552 E.00462
; LINE_WIDTH: 0.145153
G1 X166.684 Y75.243 E.00337
; LINE_WIDTH: 0.107168
G1 X166.404 Y74.934 E.00212
; WIPE_START
G1 X166.684 Y75.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X165.085 Y73.197 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221113
G1 F15000
G1 X164.804 Y72.888 E.00587
; LINE_WIDTH: 0.183131
G1 X164.524 Y72.579 E.00462
; LINE_WIDTH: 0.145149
G1 X164.244 Y72.27 E.00337
; LINE_WIDTH: 0.107166
G1 X163.964 Y71.96 E.00212
; WIPE_START
G1 X164.244 Y72.27 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X162.645 Y70.224 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221124
G1 F15000
G1 X162.365 Y69.915 E.00587
; LINE_WIDTH: 0.183139
G1 X162.084 Y69.606 E.00462
; LINE_WIDTH: 0.145153
G1 X161.804 Y69.296 E.00337
; LINE_WIDTH: 0.107168
G1 X161.524 Y68.987 E.00212
; WIPE_START
G1 X161.804 Y69.296 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X160.205 Y67.251 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221124
G1 F15000
G1 X159.925 Y66.942 E.00587
; LINE_WIDTH: 0.183138
G1 X159.644 Y66.632 E.00462
; LINE_WIDTH: 0.145153
G1 X159.364 Y66.323 E.00337
; LINE_WIDTH: 0.107168
G1 X159.084 Y66.014 E.00212
; WIPE_START
G1 X159.364 Y66.323 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.765 Y64.278 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221114
G1 F15000
G1 X157.485 Y63.968 E.00587
; LINE_WIDTH: 0.183131
G1 X157.204 Y63.659 E.00462
; LINE_WIDTH: 0.145149
G1 X156.924 Y63.35 E.00337
; LINE_WIDTH: 0.107166
G1 X156.644 Y63.041 E.00212
; WIPE_START
G1 X156.924 Y63.35 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.325 Y61.304 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221114
G1 F15000
G1 X155.045 Y60.995 E.00587
; LINE_WIDTH: 0.183131
G1 X154.765 Y60.686 E.00462
; LINE_WIDTH: 0.145149
G1 X154.484 Y60.377 E.00337
; LINE_WIDTH: 0.107166
G1 X154.204 Y60.068 E.00212
; WIPE_START
G1 X154.484 Y60.377 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X152.885 Y58.331 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221101
G1 F15000
G1 X152.605 Y58.022 E.00587
; LINE_WIDTH: 0.183122
G1 X152.325 Y57.713 E.00462
; LINE_WIDTH: 0.145143
G1 X152.044 Y57.404 E.00337
; LINE_WIDTH: 0.107165
G1 X151.764 Y57.095 E.00212
; WIPE_START
G1 X152.044 Y57.404 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.445 Y55.358 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221113
G1 F15000
G1 X150.165 Y55.049 E.00587
; LINE_WIDTH: 0.183131
G1 X149.885 Y54.74 E.00462
; LINE_WIDTH: 0.145149
G1 X149.605 Y54.431 E.00337
; LINE_WIDTH: 0.107166
G1 X149.324 Y54.121 E.00212
; WIPE_START
G1 X149.605 Y54.431 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.005 Y52.385 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221113
G1 F15000
G1 X147.725 Y52.076 E.00587
; LINE_WIDTH: 0.183131
G1 X147.445 Y51.767 E.00462
; LINE_WIDTH: 0.145149
G1 X147.165 Y51.457 E.00337
; LINE_WIDTH: 0.107166
G1 X146.884 Y51.148 E.00212
; WIPE_START
G1 X147.165 Y51.457 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X145.565 Y49.412 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221114
G1 F15000
G1 X145.285 Y49.103 E.00587
; LINE_WIDTH: 0.183131
G1 X145.005 Y48.793 E.00462
; LINE_WIDTH: 0.145149
G1 X144.725 Y48.484 E.00337
; LINE_WIDTH: 0.107166
G1 X144.444 Y48.175 E.00212
; WIPE_START
G1 X144.725 Y48.484 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X143.125 Y46.439 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.222809
G1 F15000
G1 X142.834 Y46.117 E.00616
; LINE_WIDTH: 0.188245
G1 X142.543 Y45.796 E.00498
; WIPE_START
G1 X142.834 Y46.117 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.011 Y51.051 Z15.4 F30000
G1 X37.257 Y135.565 Z15.4
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107166
G1 F15000
G1 X36.977 Y135.256 E.00212
; LINE_WIDTH: 0.145149
G1 X36.696 Y134.947 E.00337
; LINE_WIDTH: 0.183131
G1 X36.416 Y134.638 E.00462
; LINE_WIDTH: 0.221114
G1 X36.136 Y134.328 E.00587
; WIPE_START
G1 X36.416 Y134.638 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X39.697 Y138.538 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107164
G1 F15000
G1 X39.417 Y138.229 E.00212
; LINE_WIDTH: 0.145143
G1 X39.136 Y137.92 E.00337
; LINE_WIDTH: 0.183122
G1 X38.856 Y137.611 E.00462
; LINE_WIDTH: 0.2211
G1 X38.576 Y137.302 E.00587
; WIPE_START
G1 X38.856 Y137.611 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X42.137 Y141.512 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107166
G1 F15000
G1 X41.856 Y141.202 E.00212
; LINE_WIDTH: 0.145149
G1 X41.576 Y140.893 E.00337
; LINE_WIDTH: 0.183131
G1 X41.296 Y140.584 E.00462
; LINE_WIDTH: 0.221114
G1 X41.016 Y140.275 E.00587
; WIPE_START
G1 X41.296 Y140.584 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X44.577 Y144.485 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107166
G1 F15000
G1 X44.296 Y144.176 E.00212
; LINE_WIDTH: 0.145149
G1 X44.016 Y143.866 E.00337
; LINE_WIDTH: 0.183131
G1 X43.736 Y143.557 E.00462
; LINE_WIDTH: 0.221114
G1 X43.456 Y143.248 E.00587
; WIPE_START
G1 X43.736 Y143.557 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X47.017 Y147.458 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107164
G1 F15000
G1 X46.736 Y147.149 E.00212
; LINE_WIDTH: 0.145143
G1 X46.456 Y146.84 E.00337
; LINE_WIDTH: 0.183122
G1 X46.176 Y146.53 E.00462
; LINE_WIDTH: 0.2211
G1 X45.896 Y146.221 E.00587
; WIPE_START
G1 X46.176 Y146.53 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X49.457 Y150.431 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107164
G1 F15000
G1 X49.176 Y150.122 E.00212
; LINE_WIDTH: 0.145143
G1 X48.896 Y149.813 E.00337
; LINE_WIDTH: 0.183122
G1 X48.616 Y149.504 E.00462
; LINE_WIDTH: 0.2211
G1 X48.336 Y149.195 E.00587
; WIPE_START
G1 X48.616 Y149.504 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X51.897 Y153.404 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107164
G1 F15000
G1 X51.616 Y153.095 E.00212
; LINE_WIDTH: 0.145143
G1 X51.336 Y152.786 E.00337
; LINE_WIDTH: 0.183122
G1 X51.056 Y152.477 E.00462
; LINE_WIDTH: 0.2211
G1 X50.776 Y152.168 E.00587
; WIPE_START
G1 X51.056 Y152.477 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X54.337 Y156.378 Z15.4 F30000
G1 Z15
M73 P99 R0
G1 E.8 F1800
; LINE_WIDTH: 0.107168
G1 F15000
G1 X54.056 Y156.069 E.00212
; LINE_WIDTH: 0.145154
G1 X53.776 Y155.759 E.00337
; LINE_WIDTH: 0.183139
G1 X53.496 Y155.45 E.00462
; LINE_WIDTH: 0.221125
G1 X53.216 Y155.141 E.00587
; WIPE_START
G1 X53.496 Y155.45 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X56.777 Y159.351 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107168
G1 F15000
G1 X56.496 Y159.042 E.00212
; LINE_WIDTH: 0.145154
G1 X56.216 Y158.733 E.00337
; LINE_WIDTH: 0.183139
G1 X55.936 Y158.423 E.00462
; LINE_WIDTH: 0.221125
G1 X55.656 Y158.114 E.00587
; WIPE_START
G1 X55.936 Y158.423 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X59.216 Y162.324 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.112052
G1 F15000
G1 X58.875 Y161.947 E.00278
; LINE_WIDTH: 0.153293
G1 X58.615 Y161.66 E.00337
; LINE_WIDTH: 0.188012
G1 X58.355 Y161.374 E.00443
; LINE_WIDTH: 0.222731
G1 X58.096 Y161.087 E.00549
; WIPE_START
G1 X58.355 Y161.374 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X61.656 Y165.297 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107165
G1 F15000
G1 X61.376 Y164.988 E.00212
; LINE_WIDTH: 0.145143
G1 X61.096 Y164.679 E.00337
; LINE_WIDTH: 0.183122
G1 X60.816 Y164.37 E.00462
; LINE_WIDTH: 0.221101
G1 X60.535 Y164.061 E.00587
; WIPE_START
G1 X60.816 Y164.37 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X64.096 Y168.271 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107166
G1 F15000
G1 X63.816 Y167.961 E.00212
; LINE_WIDTH: 0.145149
G1 X63.536 Y167.652 E.00337
; LINE_WIDTH: 0.183131
G1 X63.256 Y167.343 E.00462
; LINE_WIDTH: 0.221114
G1 X62.975 Y167.034 E.00587
; WIPE_START
G1 X63.256 Y167.343 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X66.536 Y171.244 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107165
G1 F15000
G1 X66.256 Y170.935 E.00212
; LINE_WIDTH: 0.145143
G1 X65.976 Y170.625 E.00337
; LINE_WIDTH: 0.183122
G1 X65.696 Y170.316 E.00462
; LINE_WIDTH: 0.2211
G1 X65.415 Y170.007 E.00587
; WIPE_START
G1 X65.696 Y170.316 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X68.976 Y174.217 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.111618
G1 F15000
G1 X68.64 Y173.846 E.00271
; LINE_WIDTH: 0.152562
G1 X68.379 Y173.558 E.00337
; LINE_WIDTH: 0.187573
G1 X68.117 Y173.269 E.00445
; LINE_WIDTH: 0.222585
G1 X67.855 Y172.98 E.00553
; WIPE_START
G1 X68.117 Y173.269 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X71.416 Y177.19 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107165
G1 F15000
G1 X71.136 Y176.881 E.00212
; LINE_WIDTH: 0.145144
G1 X70.856 Y176.572 E.00337
; LINE_WIDTH: 0.183122
G1 X70.576 Y176.263 E.00462
; LINE_WIDTH: 0.221101
G1 X70.295 Y175.953 E.00587
; WIPE_START
G1 X70.576 Y176.263 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X73.856 Y180.163 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107166
G1 F15000
G1 X73.576 Y179.854 E.00212
; LINE_WIDTH: 0.145149
G1 X73.296 Y179.545 E.00337
; LINE_WIDTH: 0.183131
G1 X73.016 Y179.236 E.00462
; LINE_WIDTH: 0.221114
G1 X72.735 Y178.927 E.00587
; WIPE_START
G1 X73.016 Y179.236 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X76.296 Y183.137 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107168
G1 F15000
G1 X76.016 Y182.828 E.00212
; LINE_WIDTH: 0.145154
G1 X75.736 Y182.518 E.00337
; LINE_WIDTH: 0.183139
G1 X75.456 Y182.209 E.00462
; LINE_WIDTH: 0.221125
G1 X75.175 Y181.9 E.00587
; WIPE_START
G1 X75.456 Y182.209 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X78.736 Y186.11 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107165
G1 F15000
G1 X78.456 Y185.801 E.00212
; LINE_WIDTH: 0.145143
G1 X78.176 Y185.492 E.00337
; LINE_WIDTH: 0.183122
G1 X77.895 Y185.182 E.00462
; LINE_WIDTH: 0.221101
G1 X77.615 Y184.873 E.00587
; WIPE_START
G1 X77.895 Y185.182 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.176 Y189.083 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107165
G1 F15000
G1 X80.896 Y188.774 E.00212
; LINE_WIDTH: 0.145144
G1 X80.616 Y188.465 E.00337
; LINE_WIDTH: 0.183122
G1 X80.335 Y188.156 E.00462
; LINE_WIDTH: 0.221101
G1 X80.055 Y187.846 E.00587
; WIPE_START
G1 X80.335 Y188.156 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X83.616 Y192.056 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107164
G1 F15000
G1 X83.336 Y191.747 E.00212
; LINE_WIDTH: 0.145143
G1 X83.056 Y191.438 E.00337
; LINE_WIDTH: 0.183122
G1 X82.775 Y191.129 E.00462
; LINE_WIDTH: 0.2211
G1 X82.495 Y190.82 E.00587
; WIPE_START
G1 X82.775 Y191.129 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X86.056 Y195.03 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107165
G1 F15000
G1 X85.776 Y194.72 E.00212
; LINE_WIDTH: 0.145143
G1 X85.496 Y194.411 E.00337
; LINE_WIDTH: 0.183122
G1 X85.215 Y194.102 E.00462
; LINE_WIDTH: 0.221101
G1 X84.935 Y193.793 E.00587
; WIPE_START
G1 X85.215 Y194.102 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.496 Y198.003 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107168
G1 F15000
G1 X88.216 Y197.694 E.00212
; LINE_WIDTH: 0.145153
G1 X87.936 Y197.384 E.00337
; LINE_WIDTH: 0.183139
G1 X87.655 Y197.075 E.00462
; LINE_WIDTH: 0.221124
G1 X87.375 Y196.766 E.00587
; WIPE_START
G1 X87.655 Y197.075 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X90.936 Y200.976 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107168
G1 F15000
G1 X90.656 Y200.667 E.00212
; LINE_WIDTH: 0.145154
G1 X90.376 Y200.358 E.00337
; LINE_WIDTH: 0.183139
G1 X90.095 Y200.048 E.00462
; LINE_WIDTH: 0.221125
G1 X89.815 Y199.739 E.00587
; WIPE_START
G1 X90.095 Y200.048 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X93.376 Y203.949 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107166
G1 F15000
G1 X93.096 Y203.64 E.00212
; LINE_WIDTH: 0.145149
G1 X92.815 Y203.331 E.00337
; LINE_WIDTH: 0.183131
G1 X92.535 Y203.022 E.00462
; LINE_WIDTH: 0.221113
G1 X92.255 Y202.712 E.00587
; WIPE_START
G1 X92.535 Y203.022 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.816 Y206.922 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107168
G1 F15000
G1 X95.536 Y206.613 E.00212
; LINE_WIDTH: 0.145153
G1 X95.255 Y206.304 E.00337
; LINE_WIDTH: 0.183139
G1 X94.975 Y205.995 E.00462
; LINE_WIDTH: 0.221124
G1 X94.695 Y205.686 E.00587
; WIPE_START
G1 X94.975 Y205.995 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.256 Y209.896 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107165
G1 F15000
G1 X97.976 Y209.586 E.00212
; LINE_WIDTH: 0.145143
G1 X97.695 Y209.277 E.00337
; LINE_WIDTH: 0.183122
G1 X97.415 Y208.968 E.00462
; LINE_WIDTH: 0.221101
G1 X97.135 Y208.659 E.00587
; WIPE_START
G1 X97.415 Y208.968 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X100.696 Y212.869 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107168
G1 F15000
G1 X100.416 Y212.56 E.00212
; LINE_WIDTH: 0.145154
G1 X100.135 Y212.25 E.00337
; LINE_WIDTH: 0.183139
G1 X99.855 Y211.941 E.00462
; LINE_WIDTH: 0.221125
G1 X99.575 Y211.632 E.00587
; WIPE_START
G1 X99.855 Y211.941 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X103.136 Y215.842 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.110084
G1 F15000
G1 X102.821 Y215.494 E.00249
; LINE_WIDTH: 0.150016
G1 X102.552 Y215.198 E.00338
; LINE_WIDTH: 0.186046
G1 X102.283 Y214.902 E.00452
; LINE_WIDTH: 0.222075
G1 X102.015 Y214.605 E.00566
; WIPE_START
G1 X102.283 Y214.902 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.576 Y218.815 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107165
G1 F15000
G1 X105.295 Y218.506 E.00212
; LINE_WIDTH: 0.145143
G1 X105.015 Y218.197 E.00337
; LINE_WIDTH: 0.183122
G1 X104.735 Y217.888 E.00462
; LINE_WIDTH: 0.221101
G1 X104.455 Y217.579 E.00587
; WIPE_START
G1 X104.735 Y217.888 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.016 Y221.789 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107168
G1 F15000
G1 X107.735 Y221.479 E.00212
; LINE_WIDTH: 0.145153
G1 X107.455 Y221.17 E.00337
; LINE_WIDTH: 0.183139
G1 X107.175 Y220.861 E.00462
; LINE_WIDTH: 0.221124
G1 X106.895 Y220.552 E.00587
; WIPE_START
G1 X107.175 Y220.861 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X110.456 Y224.762 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107168
G1 F15000
G1 X110.175 Y224.453 E.00212
; LINE_WIDTH: 0.145153
G1 X109.895 Y224.143 E.00337
; LINE_WIDTH: 0.183139
G1 X109.615 Y223.834 E.00462
; LINE_WIDTH: 0.221124
G1 X109.335 Y223.525 E.00587
; WIPE_START
G1 X109.615 Y223.834 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X112.896 Y227.735 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107168
G1 F15000
G1 X112.615 Y227.426 E.00212
; LINE_WIDTH: 0.145153
G1 X112.335 Y227.117 E.00337
; LINE_WIDTH: 0.183139
G1 X112.055 Y226.807 E.00462
; LINE_WIDTH: 0.221124
G1 X111.775 Y226.498 E.00587
; WIPE_START
G1 X112.055 Y226.807 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.336 Y230.708 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107166
G1 F15000
G1 X115.055 Y230.399 E.00212
; LINE_WIDTH: 0.145148
G1 X114.775 Y230.09 E.00337
; LINE_WIDTH: 0.183129
G1 X114.495 Y229.781 E.00462
; LINE_WIDTH: 0.221111
G1 X114.215 Y229.471 E.00587
; WIPE_START
G1 X114.495 Y229.781 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.776 Y233.681 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107165
G1 F15000
G1 X117.495 Y233.372 E.00212
; LINE_WIDTH: 0.145143
G1 X117.215 Y233.063 E.00337
; LINE_WIDTH: 0.183122
G1 X116.935 Y232.754 E.00462
; LINE_WIDTH: 0.221101
G1 X116.655 Y232.445 E.00587
; WIPE_START
G1 X116.935 Y232.754 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.216 Y236.655 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.107168
G1 F15000
G1 X119.935 Y236.345 E.00212
; LINE_WIDTH: 0.145153
G1 X119.655 Y236.036 E.00337
; LINE_WIDTH: 0.183139
G1 X119.375 Y235.727 E.00462
; LINE_WIDTH: 0.221124
G1 X119.095 Y235.418 E.00587
; WIPE_START
G1 X119.375 Y235.727 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.196 Y242.114 Z15.4 F30000
G1 X113.545 Y244.638 Z15.4
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.323953
G1 F12809.915
G1 X113.232 Y244.292 E.01035
; LINE_WIDTH: 0.281084
G1 F15000
G1 X112.919 Y243.947 E.00877
; LINE_WIDTH: 0.238215
G1 X112.606 Y243.602 E.00719
; LINE_WIDTH: 0.195347
G1 X112.293 Y243.256 E.00561
; LINE_WIDTH: 0.152478
G1 X111.98 Y242.911 E.00403
; LINE_WIDTH: 0.10961
G1 X111.667 Y242.566 E.00245
; WIPE_START
G1 X111.98 Y242.911 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X110.348 Y240.828 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221114
G1 F15000
G1 X110.067 Y240.519 E.00588
; LINE_WIDTH: 0.183131
G1 X109.787 Y240.21 E.00462
; LINE_WIDTH: 0.145149
G1 X109.506 Y239.9 E.00337
; LINE_WIDTH: 0.107166
G1 X109.226 Y239.591 E.00212
; WIPE_START
G1 X109.506 Y239.9 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.906 Y237.853 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X107.625 Y237.544 E.00588
; LINE_WIDTH: 0.18313
G1 X107.345 Y237.235 E.00462
; LINE_WIDTH: 0.145148
G1 X107.065 Y236.925 E.00337
; LINE_WIDTH: 0.107166
G1 X106.784 Y236.616 E.00212
; WIPE_START
G1 X107.065 Y236.925 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.464 Y234.878 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X105.184 Y234.569 E.00588
; LINE_WIDTH: 0.18313
G1 X104.903 Y234.26 E.00462
; LINE_WIDTH: 0.145148
G1 X104.623 Y233.95 E.00337
; LINE_WIDTH: 0.107166
G1 X104.342 Y233.641 E.00212
; WIPE_START
G1 X104.623 Y233.95 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X103.022 Y231.904 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X102.742 Y231.594 E.00588
; LINE_WIDTH: 0.18313
G1 X102.462 Y231.285 E.00462
; LINE_WIDTH: 0.145148
G1 X102.181 Y230.975 E.00337
; LINE_WIDTH: 0.107166
G1 X101.901 Y230.666 E.00212
; WIPE_START
G1 X102.181 Y230.975 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X100.581 Y228.929 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X100.3 Y228.619 E.00588
; LINE_WIDTH: 0.18313
G1 X100.02 Y228.31 E.00462
; LINE_WIDTH: 0.145148
G1 X99.74 Y228 E.00337
; LINE_WIDTH: 0.107166
G1 X99.459 Y227.691 E.00212
; WIPE_START
G1 X99.74 Y228 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.139 Y225.954 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221122
G1 F15000
G1 X97.859 Y225.644 E.00588
; LINE_WIDTH: 0.183137
G1 X97.578 Y225.335 E.00463
; LINE_WIDTH: 0.145152
G1 X97.298 Y225.025 E.00337
; LINE_WIDTH: 0.107168
G1 X97.017 Y224.716 E.00212
; WIPE_START
G1 X97.298 Y225.025 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.697 Y222.979 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X95.417 Y222.669 E.00588
; LINE_WIDTH: 0.18313
G1 X95.137 Y222.36 E.00462
; LINE_WIDTH: 0.145148
G1 X94.856 Y222.051 E.00337
; LINE_WIDTH: 0.107166
G1 X94.576 Y221.741 E.00212
; WIPE_START
G1 X94.856 Y222.051 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X93.256 Y220.004 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X92.975 Y219.694 E.00588
; LINE_WIDTH: 0.18313
G1 X92.695 Y219.385 E.00462
; LINE_WIDTH: 0.145148
G1 X92.414 Y219.076 E.00337
; LINE_WIDTH: 0.107166
G1 X92.134 Y218.766 E.00212
; WIPE_START
G1 X92.414 Y219.076 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X90.814 Y217.029 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X90.534 Y216.719 E.00588
; LINE_WIDTH: 0.18313
G1 X90.253 Y216.41 E.00462
; LINE_WIDTH: 0.145148
G1 X89.973 Y216.101 E.00337
; LINE_WIDTH: 0.107166
G1 X89.692 Y215.791 E.00212
; WIPE_START
G1 X89.973 Y216.101 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.372 Y214.054 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X88.092 Y213.744 E.00588
; LINE_WIDTH: 0.18313
G1 X87.812 Y213.435 E.00462
; LINE_WIDTH: 0.145148
G1 X87.531 Y213.126 E.00337
; LINE_WIDTH: 0.107166
G1 X87.251 Y212.816 E.00212
; WIPE_START
G1 X87.531 Y213.126 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X85.931 Y211.079 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221122
G1 F15000
G1 X85.65 Y210.77 E.00588
; LINE_WIDTH: 0.183137
G1 X85.37 Y210.46 E.00463
; LINE_WIDTH: 0.145152
G1 X85.089 Y210.151 E.00337
; LINE_WIDTH: 0.107168
G1 X84.809 Y209.841 E.00212
; WIPE_START
G1 X85.089 Y210.151 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X83.489 Y208.104 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221111
G1 F15000
G1 X83.209 Y207.795 E.00588
; LINE_WIDTH: 0.18313
G1 X82.928 Y207.485 E.00462
; LINE_WIDTH: 0.145148
G1 X82.648 Y207.176 E.00337
; LINE_WIDTH: 0.107166
G1 X82.367 Y206.867 E.00212
; WIPE_START
G1 X82.648 Y207.176 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.047 Y205.129 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.2211
G1 F15000
G1 X80.767 Y204.82 E.00588
; LINE_WIDTH: 0.183122
G1 X80.487 Y204.51 E.00462
; LINE_WIDTH: 0.145143
G1 X80.206 Y204.201 E.00337
; LINE_WIDTH: 0.107164
G1 X79.926 Y203.892 E.00212
; WIPE_START
G1 X80.206 Y204.201 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X78.606 Y202.154 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X78.325 Y201.845 E.00588
; LINE_WIDTH: 0.18313
G1 X78.045 Y201.535 E.00462
; LINE_WIDTH: 0.145148
G1 X77.764 Y201.226 E.00337
; LINE_WIDTH: 0.107166
G1 X77.484 Y200.917 E.00212
; WIPE_START
G1 X77.764 Y201.226 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X76.164 Y199.179 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X75.884 Y198.87 E.00588
; LINE_WIDTH: 0.18313
G1 X75.603 Y198.56 E.00462
; LINE_WIDTH: 0.145148
G1 X75.323 Y198.251 E.00337
; LINE_WIDTH: 0.107166
G1 X75.042 Y197.942 E.00212
; WIPE_START
G1 X75.323 Y198.251 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X73.722 Y196.204 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.2211
G1 F15000
G1 X73.442 Y195.895 E.00588
; LINE_WIDTH: 0.183122
G1 X73.161 Y195.586 E.00462
; LINE_WIDTH: 0.145143
G1 X72.881 Y195.276 E.00337
; LINE_WIDTH: 0.107164
G1 X72.601 Y194.967 E.00212
; WIPE_START
G1 X72.881 Y195.276 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X71.281 Y193.229 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221111
G1 F15000
G1 X71 Y192.92 E.00588
; LINE_WIDTH: 0.18313
G1 X70.72 Y192.611 E.00462
; LINE_WIDTH: 0.145148
G1 X70.439 Y192.301 E.00337
; LINE_WIDTH: 0.107166
G1 X70.159 Y191.992 E.00212
; WIPE_START
G1 X70.439 Y192.301 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X68.839 Y190.254 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X68.558 Y189.945 E.00588
; LINE_WIDTH: 0.18313
G1 X68.278 Y189.636 E.00462
; LINE_WIDTH: 0.145148
G1 X67.998 Y189.326 E.00337
; LINE_WIDTH: 0.107166
G1 X67.717 Y189.017 E.00212
; WIPE_START
G1 X67.998 Y189.326 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X66.397 Y187.279 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X66.117 Y186.97 E.00588
; LINE_WIDTH: 0.18313
G1 X65.836 Y186.661 E.00462
; LINE_WIDTH: 0.145148
G1 X65.556 Y186.351 E.00337
; LINE_WIDTH: 0.107166
G1 X65.276 Y186.042 E.00212
; WIPE_START
G1 X65.556 Y186.351 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X63.956 Y184.304 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X63.675 Y183.995 E.00588
; LINE_WIDTH: 0.18313
G1 X63.395 Y183.686 E.00462
; LINE_WIDTH: 0.145148
G1 X63.114 Y183.376 E.00337
; LINE_WIDTH: 0.107166
G1 X62.834 Y183.067 E.00212
; WIPE_START
G1 X63.114 Y183.376 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X61.514 Y181.33 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X61.233 Y181.02 E.00588
; LINE_WIDTH: 0.18313
G1 X60.953 Y180.711 E.00462
; LINE_WIDTH: 0.145148
G1 X60.673 Y180.401 E.00337
; LINE_WIDTH: 0.107166
G1 X60.392 Y180.092 E.00212
; WIPE_START
G1 X60.673 Y180.401 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X59.072 Y178.355 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X58.792 Y178.045 E.00588
; LINE_WIDTH: 0.18313
G1 X58.511 Y177.736 E.00462
; LINE_WIDTH: 0.145148
G1 X58.231 Y177.426 E.00337
; LINE_WIDTH: 0.107166
G1 X57.951 Y177.117 E.00212
; WIPE_START
G1 X58.231 Y177.426 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X56.63 Y175.38 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X56.35 Y175.07 E.00588
; LINE_WIDTH: 0.18313
G1 X56.07 Y174.761 E.00462
; LINE_WIDTH: 0.145148
G1 X55.789 Y174.452 E.00337
; LINE_WIDTH: 0.107166
G1 X55.509 Y174.142 E.00212
; WIPE_START
G1 X55.789 Y174.452 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X54.189 Y172.405 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X53.908 Y172.095 E.00588
; LINE_WIDTH: 0.18313
G1 X53.628 Y171.786 E.00462
; LINE_WIDTH: 0.145148
G1 X53.348 Y171.477 E.00337
; LINE_WIDTH: 0.107166
G1 X53.067 Y171.167 E.00212
; WIPE_START
G1 X53.348 Y171.477 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X51.747 Y169.43 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X51.467 Y169.12 E.00588
; LINE_WIDTH: 0.18313
G1 X51.186 Y168.811 E.00462
; LINE_WIDTH: 0.145148
G1 X50.906 Y168.502 E.00337
; LINE_WIDTH: 0.107166
G1 X50.625 Y168.192 E.00212
; WIPE_START
G1 X50.906 Y168.502 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X49.305 Y166.455 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221101
G1 F15000
G1 X49.025 Y166.145 E.00588
; LINE_WIDTH: 0.183122
G1 X48.745 Y165.836 E.00462
; LINE_WIDTH: 0.145143
G1 X48.464 Y165.527 E.00337
; LINE_WIDTH: 0.107165
G1 X48.184 Y165.217 E.00212
; WIPE_START
G1 X48.464 Y165.527 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X46.864 Y163.48 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221111
G1 F15000
G1 X46.583 Y163.171 E.00588
; LINE_WIDTH: 0.18313
G1 X46.303 Y162.861 E.00462
; LINE_WIDTH: 0.145148
G1 X46.023 Y162.552 E.00337
; LINE_WIDTH: 0.107166
G1 X45.742 Y162.242 E.00212
; WIPE_START
G1 X46.023 Y162.552 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X44.422 Y160.505 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X44.142 Y160.196 E.00588
; LINE_WIDTH: 0.18313
G1 X43.861 Y159.886 E.00462
; LINE_WIDTH: 0.145148
G1 X43.581 Y159.577 E.00337
; LINE_WIDTH: 0.107166
G1 X43.3 Y159.267 E.00212
; WIPE_START
G1 X43.581 Y159.577 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X41.98 Y157.53 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X41.7 Y157.221 E.00588
; LINE_WIDTH: 0.18313
G1 X41.42 Y156.911 E.00462
; LINE_WIDTH: 0.145148
G1 X41.139 Y156.602 E.00337
; LINE_WIDTH: 0.107166
G1 X40.859 Y156.293 E.00212
; WIPE_START
G1 X41.139 Y156.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X39.539 Y154.555 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X39.258 Y154.246 E.00588
; LINE_WIDTH: 0.18313
G1 X38.978 Y153.936 E.00462
; LINE_WIDTH: 0.145148
G1 X38.697 Y153.627 E.00337
; LINE_WIDTH: 0.107166
G1 X38.417 Y153.318 E.00212
; WIPE_START
G1 X38.697 Y153.627 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X37.097 Y151.58 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X36.817 Y151.271 E.00588
; LINE_WIDTH: 0.18313
G1 X36.536 Y150.961 E.00462
; LINE_WIDTH: 0.145148
G1 X36.256 Y150.652 E.00337
; LINE_WIDTH: 0.107166
G1 X35.975 Y150.343 E.00212
; WIPE_START
G1 X36.256 Y150.652 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X34.655 Y148.605 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221101
G1 F15000
G1 X34.375 Y148.296 E.00588
; LINE_WIDTH: 0.183122
G1 X34.095 Y147.986 E.00462
; LINE_WIDTH: 0.145144
G1 X33.814 Y147.677 E.00337
; LINE_WIDTH: 0.107165
G1 X33.534 Y147.368 E.00212
; WIPE_START
G1 X33.814 Y147.677 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X32.214 Y145.63 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221112
G1 F15000
G1 X31.933 Y145.321 E.00588
; LINE_WIDTH: 0.18313
G1 X31.653 Y145.012 E.00462
; LINE_WIDTH: 0.145148
G1 X31.372 Y144.702 E.00337
; LINE_WIDTH: 0.107166
G1 X31.092 Y144.393 E.00212
; WIPE_START
G1 X31.372 Y144.702 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X29.772 Y142.655 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221111
G1 F15000
G1 X29.492 Y142.346 E.00588
; LINE_WIDTH: 0.18313
G1 X29.211 Y142.037 E.00462
; LINE_WIDTH: 0.145148
G1 X28.931 Y141.727 E.00337
; LINE_WIDTH: 0.107166
G1 X28.65 Y141.418 E.00212
; WIPE_START
G1 X28.931 Y141.727 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X27.33 Y139.68 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.221111
G1 F15000
G1 X27.05 Y139.371 E.00588
; LINE_WIDTH: 0.18313
G1 X26.769 Y139.062 E.00462
; LINE_WIDTH: 0.145148
G1 X26.489 Y138.752 E.00337
; LINE_WIDTH: 0.107166
G1 X26.209 Y138.443 E.00212
; WIPE_START
G1 X26.489 Y138.752 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X24.938 Y136.754 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.220794
G1 F15000
G1 X24.667 Y136.455 E.00567
; LINE_WIDTH: 0.182899
G1 X24.397 Y136.156 E.00446
; LINE_WIDTH: 0.145004
G1 X24.127 Y135.857 E.00325
; LINE_WIDTH: 0.107109
G1 X23.856 Y135.557 E.00204
; WIPE_START
G1 X24.127 Y135.857 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X22.59 Y133.874 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.220794
G1 F15000
G1 X22.32 Y133.574 E.00567
; LINE_WIDTH: 0.182899
G1 X22.049 Y133.275 E.00446
; LINE_WIDTH: 0.145004
G1 X21.779 Y132.976 E.00325
; LINE_WIDTH: 0.107109
G1 X21.509 Y132.677 E.00204
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X21.779 Y132.976 E-.76
; WIPE_END
G1 E-.04 F1800
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z15.5 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
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

M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z115 F600
    G1 Z113

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

