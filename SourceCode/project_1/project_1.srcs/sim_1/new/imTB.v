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


module imTB;
    reg [15:0] a;
    wire [15:0] b;

    im dut(.a(a), .b(b));



    initial begin
        //double addresses because we get rid of last bit so we divide by 2
        a = 0;
        #5
        a = 2;
        #5
        a = 20;
        #5
        a = 126;
        #5
        a = 4;

    end
endmodule
