ECE128 Lab 4 - Vehicle Safety Interlock & Warning System
Names: Madeline Grassi, Guranaad Kaur
Date: 09/25/2026

Project description: This project/lab implements a vehicle safety interlock and warning system in Verilog using combinational logic. 

The design takes 14 sensor inputs (e.g. seatbelt, door, key, brake, and battery sensors) and produces 11 outputs. These include START_PERMIT, CHIME, two priority warnings, and individual warning lights. The safety_sys module design was simulated in Vivado and implemented using a Basys 3 FPGA board.

Instructions for simulation:
1. Open Vivado and create a new project.
2. Add the design file safety_sys.v into the project, where it is labeled "Sources".
3. Add the testbench safety_sys_tb.v where it is labeled "Simulation Sources".
4. Run the simulation and select "Run Behavioral Simulation" when prompted.
5. A waveform will be generated and appear on screen. Check the 11 outputs to make sure they match the expected values from the truth tables considering the testbench sensor inputs.

Instructions for FPGA implementation:
1. Once the above is done, create a constraints file and assign the 14 inputs (SB, DOOR, KEY, BRK, PARK, HOOD, BAT_OK, AIB_OK, TMP_OK, PASS_OCC, SB_P, TRUNK, PBRK, SRV) to SW15-SW2 and the 11 outputs (START_PERMIT, CHIME, WARN_PRI2, WARN_PRI1, SEAT_WARN, DOOR_WARN, HOOD_WARN, TRUNK_WARN, BAT_WARN, AIRBAG_WARN, TEMP_WARN) to LED15-LED5.
2. In Vivado, run the Synthesis, then Implementation, then generate the bitstream.
3. Connect the Basys 3 board provided during lab using USB, then open the Hardware Manager.
4. Click "Program Device" and select the .bit file.
5. Once the programming is complete, the board will stop blinking and produce the expected output according to the input signals. Test by toggling the input switches and confirming the correct warning LEDs light up.
