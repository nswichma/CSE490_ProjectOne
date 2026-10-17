`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2026 06:19:52 PM
// Design Name: 
// Module Name: signExtend
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


module signExtend(
    input [3:0] a,
    output reg [15:0] b
    );

    always @(*) begin
        if(a[3] ==1)
            b = {12'hFFF, a}; //if the highest bit is 1 then we need to make sure we extend the 1 through
        else
            b = {12'h000, a};//other wise fill it with 0s
    end

endmodule
