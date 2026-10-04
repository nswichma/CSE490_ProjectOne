`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2026 01:06:42 PM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb(

    reg [15:0] a;
    reg [15:0] b;
    reg [3:0] ctrl;
    wire [15:0] result;
    wire flag

    alu dut (.a(a), .b(b), .ctrl(ctrl), .result(result), .flag(flag))

    );

    initial begin
        a = 10;
        b=2;

        ctrl = 0; //expect 12 flag should be 0
        ctrl =1; // expect 8 flag should be 0
        ctrl =2; // expect 40 flag should be 0
        ctrl =3; // expect 2 flag should be 0

        b  =10;

        ctrl =1; //expect 0 and flag should be 1

    end
endmodule
