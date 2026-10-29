`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2026 07:34:50 PM
// Design Name: 
// Module Name: processor
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


module processor(
    input clock,
    output [15:0] pcOut,
    output [15:0] instruction
    );

    // wires you already had
    wire [15:0] newPC;
    wire [15:0] PC;

    // data wires
    wire [15:0] pcPlus2, target, offset;
    wire [15:0] readData1, readData2, writeBack;
    wire [15:0] imm4, imm12, imm4Shifted, imm12Shifted;
    wire [15:0] aluB, aluResult, memData;
    wire zero;

    // control wires
    wire regWrite, aluSrc, memWrite, memToReg, beq, bne, jump;
    wire [3:0] aluCtrl;
    wire branchTaken, takeTarget;

    assign pcOut = PC;

    // make sure to shift my immediates
    assign imm4Shifted  = {imm4[14:0], 1'b0};
    assign imm12Shifted = {imm12[14:0], 1'b0};

    // branch logic
    assign branchTaken = (beq & zero) | (bne & ~zero); //checks if beq or bne are true
    assign takeTarget  = branchTaken | jump; //decides if pc should go to target address instead of PC+2
    
    // fetch
    pc programCounter (.clock(clock), .update(newPC), .newVal(PC));
    adder pcAdder (.a(PC), .b(2), .result(pcPlus2));
    im instrMem (.a(PC), .b(instruction));

    // control: opcode is bits 15-12, function code is bits 3-0
    cu control (.opcode(instruction[15:12]), .func(instruction[3:0]),
                .regWrite(regWrite), .aluSrc(aluSrc), .aluCtrl(aluCtrl),
                .memWrite(memWrite), .memToReg(memToReg),
                .beq(beq), .bne(bne), .jump(jump));

    // registers: read 1 = rs (7-4), read 2 = rt/rd (11-8), write = rt/rd (11-8)
    regs registerFile (.clock(clock), .regWrite(regWrite),
                       .readReg1(instruction[7:4]), .readReg2(instruction[11:8]),
                       .writeReg(instruction[11:8]), .writeData(writeBack),
                       .readData1(readData1), .readData2(readData2));

    // immediates
    signExtend se4 (.a(instruction[3:0]), .b(imm4));
    signExtend12 se12 (.a(instruction[11:0]), .b(imm12));

    // ALU: a = rs value, b = rt/rd value or the immediate
    mux aluSrcMux (.a(readData2), .b(imm4), .choose(aluSrc), .out(aluB));
    alu mainAlu (.a(readData1), .b(aluB), .ctrl(aluCtrl),
                 .result(aluResult), .flag(zero));

    // data memory and write-back
    dataMem dm (.clock(clock), .memWrite(memWrite), .address(aluResult),
                .writeData(readData2), .readData(memData));
    mux writeBackMux (.a(aluResult), .b(memData), .choose(memToReg), .out(writeBack));

    // branch / jump target and next PC
    mux offsetMux (.a(imm4Shifted), .b(imm12Shifted), .choose(jump), .out(offset));
    adder targetAdder (.a(pcPlus2), .b(offset), .result(target));
    mux pcMux (.a(pcPlus2), .b(target), .choose(takeTarget), .out(newPC));

endmodule
