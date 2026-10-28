`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2026 05:15:07 PM
// Design Name: 
// Module Name: regs
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


module dataMem(
    input clock,
    input memWrite,
    input [15:0] address,
    input [15:0] writeData,
    output [15:0] readData
    );

    reg [15:0] memory [0:63]; //16 bit blocks and there are 64 of them

    
    assign readData = memory[address[6:1]]

    always @(posedge clock) begin //we clock because this means end of instruction
        if(memWrite)
            memory[address[6:1]] <= writeData;
    end
endmodule
