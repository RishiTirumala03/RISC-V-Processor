`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 09:37:34 PM
// Design Name: 
// Module Name: RegFile
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


module RegFile(
clk, reset, rg_wrt_en,
rg_wrt_addr,
rg_rd_addr1,
rg_rd_addr2,
rg_wrt_data,
rg_rd_data1,
rg_rd_data2
);
input[4:0] rg_rd_addr1, rg_rd_addr2, rg_wrt_addr;
input[31:0] rg_wrt_data;
input reset = 1'b0; 
input clk, rg_wrt_en;
output [31:0] rg_rd_data1, rg_rd_data2;
integer i = 0;
reg[31:0] regfile[0:31];
assign rg_rd_data1 = regfile[rg_rd_addr1];
assign rg_rd_data2 = regfile[rg_rd_addr2];
always @ (reset or posedge clk)
    begin
    if(reset)
        begin
        for(i = 0;i<32;i = i + 1)
            begin
            regfile[i] = 32'h00000000;
            end 
        end
    else if(rg_wrt_en)
        begin
        regfile[rg_wrt_addr] = rg_wrt_data;
        end
    end
endmodule
