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


module alu(
    input [15:0] a,
    input [15:0] b,
    input [3:0] ctrl,
    output [15:0] result,
    output flag
    );


    always @(*) begin
        if (ctrl ==0) begin
            result=a+b;
        end
        else if (ctrl==1) begin
            result=a-b;
        end
        else if (ctrl==2) begin
            result=a<<b[3:0];
        end
        else if (ctrl==3) begin
            result = a&b;
        end
        else begin
            result = 0;
        end
    end
endmodule
