`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2026 04:08:51 PM
// Design Name: 
// Module Name: pcTB
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


module muxTB;
    reg [15:0] a;
    reg [15:0] b;
    reg choose;
    wire [15:0] out;

    mux dut (.a(a), .b(b), .choose(choose), .out(out));

    initial begin

        a = 10;
        b=20;
        choose = 0;
        #5

        choose = 1;
        #5
        a=30;
        choose = 0;
    end
endmodule
