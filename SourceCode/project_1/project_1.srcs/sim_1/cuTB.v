`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2026 06:21:43 PM
// Design Name: 
// Module Name: signExtendTB
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


module cuTB;
    reg [3:0] opcode;
    reg [3:0] func;

    wire regWrite, aluSrc,memWrite,memToReg,beq,bne,jump;
    wire[3:0] aluCtrl;

    cu dut (.opcode(opcode), .func(func), .regWrite(regWrite), .aluSrc(aluSrc),
            .aluCtrl(aluCtrl), .memWrite(memWrite), .memToReg(memToReg), .beq(beq),
            .bne(bne), .jump(jump));

    initial begin
        opcode=0;
        func=0;
        #5;
        func =1;
        #5;
        func =2;
        #5;
        func =3;
        #5;
        opcode =1;
        func =5;
        #5;
        opcode =2;
        func =5;
        #5;
        opcode =3;
        func =3;
        #5;
        opcode =4;
        func =2;
        #5;
        opcode =5;
        func =2;
        #5;
        opcode =6;
        func =2;
    end

endmodule
