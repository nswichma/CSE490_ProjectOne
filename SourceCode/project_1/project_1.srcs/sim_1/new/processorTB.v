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


module processorTB;

    reg clock;
    wire [15:0] pcOut;
    wire [15:0] instruction;
    
    processor dut(.clock(clock), .pcOut(pcOut), .instruction(instruction));

    initial clock = 0;
    always #5 clock = ~clock; //flip the bit every 5 ns

    initial begin
        #200; //give every instruction time to run
        $display(dut.registerFile.registers[1]);
        $display(dut.registerFile.registers[2]);
        $display(dut.registerFile.registers[3]);
        $display(dut.registerFile.registers[4]);
        $display(dut.registerFile.registers[5]);
        $display(dut.registerFile.registers[6]);
        $display(dut.registerFile.registers[7]);
    end

endmodule
