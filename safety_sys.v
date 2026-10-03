`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Madeline Grassi
// 
// Create Date: 09/25/2026 01:29:33 PM
// Design Name: 
// Module Name: safety_sys
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module safety_sys(
    input SB, DOOR, KEY, BRK, PARK, HOOD, BAT_OK, AIB_OK, TMP_OK, PASS_OCC, SB_P, TRUNK, PBRK, SRV,
    output START_PERMIT, CHIME, WARN_PRI2, WARN_PRI1, SEAT_WARN, DOOR_WARN, HOOD_WARN, TRUNK_WARN, BAT_WARN, AIRBAG_WARN, TEMP_WARN


    );
    
    //assign Sum = A^B^Cin;
    //assign Cout = B&Cin|A&Cin|A&B;
    //simple outputs
    assign DOOR_WARN = !DOOR;
    assign HOOD_WARN = !HOOD;
    assign TRUNK_WARN = !TRUNK;
    assign BAT_WARN = !BAT_OK;
    assign AIRBAG_WARN = !AIB_OK;
    assign TEMP_WARN = !TMP_OK;
    
    //seat warn
    assign SEAT_WARN = (KEY & !SB_P & PASS_OCC) | (KEY & !SB);
    
    //start permit
    assign START_PERMIT = (BRK & PBRK & PARK & KEY) | SRV;
    
    //chime
    assign CHIME = WARN_PRI1 & KEY;
    
    //warn pri1
    assign WARN_PRI1 = SEAT_WARN | AIRBAG_WARN | TEMP_WARN;
    
    //warn pri2
    assign WARN_PRI2 = TRUNK_WARN | PARK | PBRK | DOOR_WARN | HOOD_WARN | BAT_WARN;
    
    
    
    
    
    
    
endmodule
