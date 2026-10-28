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


module dataMemTB;
    reg clock;
    reg memWrite;
    reg [15:0] address;
    reg [15:0] writeData;
    wire [15:0] readData;

    dataMem dut(.clock(clock), .memWrite(memWrite), .address(address),.writeData(writeData),.readData(readData));


    initial clock = 0;
    always #5 clock = ~clock; //flip the bit every 5 ns


    initial begin
        memWrite=1;
        address = 4;
        writeData = 100;
        #10
        address = 6;
        writeData = 200;
        #10
        address = 6;
        #10
        address = 8;
    end
endmodule
