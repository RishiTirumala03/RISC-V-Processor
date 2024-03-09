`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 09:46:40 PM
// Design Name: 
// Module Name: FlipFlop
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


module FlipFlop(
   input  clk , reset,
   input  [7:0] d,
   output [7:0] q
   );
reg[7:0] q;
always @(posedge clk)
   begin
   if(reset == 1)
        q = 8'b00000000;
   else
        q = d; 
    
   end
endmodule
