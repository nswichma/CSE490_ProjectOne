`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2026 05:32:37 PM
// Design Name: 
// Module Name: regsTB
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


module regsTB;

    reg clock;
    reg regWrite;
    reg [3:0] readReg1;
    reg [3:0] readReg2;
    reg [3:0] writeReg;
    reg [15:0] writeData;
    wire [15:0] readData1;
    wire [15:0] readData2;

    regs dut (
        .clock(clock), .regWrite(regWrite), .readReg1(readReg1), .readReg2(readReg2),
        .writeReg(writeReg), .writeData(writeData), .readData1(readData1), .readData2(readData2)
    );


    initial clock = 0;
    always #5 clock = ~clock; //flip the bit every 5 ns

    initial begin
        //write 100 into reg 15
        regWrite = 1; 
        writeReg = 15; 
        writeData = 100; 
        readReg1 = 1; 
        readReg2 =2;

        #10
        //write 20 into reg 2
        writeReg = 2;
        writeData = 20;

        #10
        //make sure we don't write anything into reg 1
        regWrite =0;
        writeReg = 1;
        writeData = 200;
        readReg1 = 1;

        #10
        //make sure we don't touch zero register
        regWrite =1;
        writeReg = 0;
        readReg1 = 0;

        #10
        //make sure we write to reg 1
        writeReg = 1;
        writeData = 200;
        readReg1 = 1;

        #10
        readReg1 =15;
        readReg2 =0;
        //read the value out of reg 15 and 0

    end

endmodule
