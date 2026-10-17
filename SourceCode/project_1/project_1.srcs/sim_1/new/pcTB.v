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


module pcTB;
    reg clock;
    reg [15:0] update;
    wire [15:0] newVal;

    pc dut (.clock(clock), .update(update), .newVal(newVal));


    initial clock =0;
    always #5 clock = ~clock;//flip the bit every 5 ns

    initial begin
        update = 2;
        #3
        update = 4;
        #5
        update = 8;
        #10
        update = 16;
        #10
        update = 4;

    end
endmodule
