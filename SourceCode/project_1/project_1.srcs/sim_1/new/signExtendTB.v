`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2026 06:21:43 PM
// Design Name: 
// Module Name: signExtendTB
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


module signExtendTB;
    reg[3:0] a;
    wire [15:0] b;

    signExtend dut (.a(a), .b(b));

    initial begin
        a = 0; 
        #5
        a=1;
        #5
        a=7;
        #5
        a=-7;
        #5
        a=-1;
    end

endmodule
