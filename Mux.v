`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 10:06:09 PM
// Design Name: 
// Module Name: Mux
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


module MUX21(
D1, D2, S, Y
    );
input S;
input D1;
input D2;
output Y;
wire[31:0] D1;
wire[31:0] D2;
wire[31:0] Y;
assign Y = (S==1'b0)?D1:
(S==1'b1)?D2:
D1;
endmodule
