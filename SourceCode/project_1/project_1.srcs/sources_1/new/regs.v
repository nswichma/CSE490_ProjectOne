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


module regs(
    input clock,
    input regWrite,
    input [3:0] readReg1,
    input [3:0] readReg2,
    input [3:0] writeReg,
    input [15:0] writeData,
    output [15:0] readData1,
    output [15:0] readData2
    );

    reg [15:0] registers [0:15]; //16 bit registers and there are 16 of them

    inital begin
        assign registers[0] = 0; //let the first register be $zero register 
    end
    
    assign readData1 = registers[readReg1] //read info from register 1
    assign readData2 = registers[readReg2] //read info from register 2

    always @(posedge clock) begin //we clock because this means end of instruction
        if(regWrite == 1 && writeReg != 0)
            registers[writeReg] <= writeData;
    end
endmodule
