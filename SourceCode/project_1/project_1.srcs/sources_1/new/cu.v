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


module cu(
    input [3:0] opcode,
    input [3:0] func,
    output reg regWrite,
    output reg aluSrc,
    output reg [3:0] aluCtrl,
    output reg memWrite,
    output reg memToReg,
    output reg beq,
    output reg bne,
    output reg jump
);

always @(*) begin
    //make sure everything off

    regWrite = 0;
    aluSrc = 0;
    aluCtrl = 0;
    memWrite=0;
    memToReg=0;
    beq=0;
    bne =0;
    jump = 0;

    if (opcode == 0) begin  //r-type codes
        regWrite = 1;
        aluCtrl = func;
    end
    else if (opcode ==1) begin //lw
        regWrite = 1;
        aluSrc=1;
        memToReg=1;
    end
    else if (opcode==2) begin //sw
        aluSrc =1;
        memWrite=1;
    end
    else if (opcode==3) begin //addi
        regWrite = 1;
        aluSrc=1;
    end
    else if (opcode==4) begin //beq
        aluCtrl = 1;
        beq = 1;
    end
    else if (opcode==5) begin //bne
        aluCtrl = 1;
        bne = 1;
    end
    else if (opcode==6) begin //jmp
        jump = 1;
    end
end

endmodule