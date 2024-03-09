`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 07:38:42 PM
// Design Name: 
// Module Name: DataMem
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


module DataMem(MemRead, MemWrite, addr, write_data, read_data);
input MemRead;
input MemWrite;
input[8:0] addr;
input[31:0] write_data;
output reg[31:0] read_data;
reg[31:0] mem[127:0];
wire[6:0] address;
assign address = addr[8:2];
always @(*)
    begin
    if(MemWrite == 1'b1)
        begin
            mem[address] = write_data;
        end
    else if(MemRead == 1'b1)
        begin
           read_data = mem[address];
        end
     end   
endmodule
