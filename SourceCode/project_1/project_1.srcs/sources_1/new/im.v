`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2026 08:19:49 PM
// Design Name: 
// Module Name: alu
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


module im(
    input [15:0] a,
    output [15:0] b
    );

    reg [15:0] memory [0:63]; //64 memory locations with each one being 16 bits
    assign b = memory[a[6:1]]; //ignore the last bit because instruction is always even

    initial begin
        //fill it with random values to test it
        memory[0] = 2017;

        memory[1] = 2022;

        memory[10] = 4017;

        memory[63] = 2920;
    end

endmodule
