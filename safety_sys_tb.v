`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Madeline Grassi
// 
// Create Date: 09/25/2026 03:33:24 PM
// Design Name: 
// Module Name: safety_sys_tb
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


module safety_sys_tb;
    reg SB, DOOR, KEY, BRK, PARK, HOOD, BAT_OK, AIB_OK, TMP_OK, PASS_OCC, SB_P, TRUNK, PBRK, SRV;
    wire START_PERMIT, CHIME, WARN_PRI2, WARN_PRI1, SEAT_WARN, DOOR_WARN, HOOD_WARN, TRUNK_WARN, BAT_WARN, AIRBAG_WARN, TEMP_WARN;
    

    safety_sys DUT (
        .SB(SB),
        .DOOR(DOOR),
        .KEY(KEY),
        .BRK(BRK),
        .PARK(PARK),
        .HOOD(HOOD),
        .BAT_OK(BAT_OK),
        .AIB_OK(AIB_OK),
        .TMP_OK(TMP_OK),
        .PASS_OCC(PASS_OCC),
        .SB_P(SB_P),
        .TRUNK(TRUNK),
        .PBRK(PBRK),
        .SRV(SRV),
        
        .START_PERMIT(START_PERMIT),
        .CHIME(CHIME),
        .WARN_PRI2(WARN_PRI2),
        .WARN_PRI1(WARN_PRI1),
        .SEAT_WARN(SEAT_WARN),
        .DOOR_WARN(DOOR_WARN),
        .HOOD_WARN(HOOD_WARN),
        .TRUNK_WARN(TRUNK_WARN),
        .BAT_WARN(BAT_WARN),
        .AIRBAG_WARN(AIRBAG_WARN),
        .TEMP_WARN(TEMP_WARN)
    );
    
    initial begin
        SB = 1'b0; DOOR = 1'b1; KEY = 1'b0; BRK = 1'b0; PARK = 1'b0; HOOD = 1'b1; BAT_OK = 1'b1; AIB_OK = 1'b1; TMP_OK = 1'b1; PASS_OCC = 1'b1; SB_P = 1'b1; TRUNK = 1'b1; PBRK = 1'b0; SRV = 1'b0; #20;
        //$display("Door    Hood    Trunk    |    D    S    S");
        //$monitor("%b    %b    %b    |    %b    %b    %b", A, B, Cin, S, cath, q);
        $display("Door    |    Door_Warn");
        $monitor("%b    |    %b", DOOR, DOOR_WARN);
        DOOR = 1'b0; #20;
        
        $display("Hood    |    Hood_Warn");
        $monitor("%b    |    %b", HOOD, HOOD_WARN);
        HOOD = 1'b0; DOOR = 1'b1; #20;
                
        $display("Tmp_Ok    |    Temp_Warn");
        $monitor("%b    |    %b", TMP_OK, TEMP_WARN);
        TMP_OK = 1'b0; KEY = 1'b1; HOOD = 1'b1; #20;
        
        BAT_OK = 1'b0; AIB_OK = 1'b0; TMP_OK = 1'b1; #20;
        
        BAT_OK = 1'b1; AIB_OK = 1'b1; #20;        
        
        BRK = 1'b0; PBRK = 1'b1; PARK = 1'b1; PBRK = 1'b1; #20;
        
        KEY = 1'b0; #20;
        
        
        
        //$display("Trunk_Warn    Park    PBRK    Door_Warn|    D    S    S");
        //$monitor("%b    %b    %b    |    %b    %b    %b", A, B, Cin, S, cath, q);
        
        
        
        $finish;
    end

endmodule
