`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 09:30:23 PM
// Design Name: 
// Module Name: data_path
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


module data_path #(
        parameter PC_W = 8,
        parameter INS_W = 32,
        parameter RF_ADDRESS = 5,
        parameter DATA_W = 32,
        parameter DM_ADDRESS = 9,
        parameter ALU_CC_W = 4
    )(
        input clk,
        input reset,
        input reg_write,
        input mem2reg,
        input alu_src,
        input mem_write,
        input mem_read,
        input [ALU_CC_W-1:0] alu_cc,
        output [6:0] opcode,
        output [6:0] funct7,
        output [2:0] funct3,
        output [DATA_W-1:0] alu_result
    );
wire[7:0] PCPlus4;
wire[7:0]  PC;
wire[31:0] Instruction;
wire[31:0] Reg1;
wire[31:0] Reg2;
wire[31:0] ExtImm;
wire[31:0] ALU_Result;
wire[31:0] WriteBack_Data;
wire[31:0] DataMem_read;
wire[31:0] SrcB;
wire carry_out;
wire overflow;
wire zero;
wire[4:0] ins1 = Instruction[19:15];
wire[4:0] ins2 = Instruction[24:20];
wire[4:0] ins3 = Instruction[11:7];
wire[8:0] alu8 = ALU_Result[8:0];
assign funct7 = Instruction[31:25];
assign funct3 = Instruction[14:12];
assign opcode = Instruction[6:0];
assign alu_result = ALU_Result;
assign PCPlus4 = PC + 4;
FlipFlop flipflop(.clk(clk),.reset(reset),.d(PCPlus4),.q(PC));
alu_32 alu(.A_in(Reg1),.B_in(SrcB),.ALU_Sel(alu_cc),.ALU_Out(ALU_Result),.Carry_Out(carry_out),.Zero(zero),.Overflow(overflow));
RegFile regfile(.clk(clk),.reset(reset),.rg_wrt_en(reg_write),.rg_wrt_addr(ins3),.rg_rd_addr1(ins1),.rg_rd_addr2(ins2),.rg_wrt_data(WriteBack_Data),.rg_rd_data1(Reg1),.rg_rd_data2(Reg2));
ImmGen immgen(.InstCode(Instruction),.ImmOut(ExtImm));
InstMem Instr_Mem(.addr(PC),.instruction(Instruction));
DataMem datamem(.MemRead(mem_read),.MemWrite(mem_write),.addr(alu8),.write_data(Reg2),.read_data(DataMem_read));
MUX21 Mux1(.D1(Reg2),.D2(ExtImm),.S(alu_src),.Y(SrcB));
MUX21 Mux2(.D1(ALU_Result),.D2(DataMem_read),.S(mem2reg),.Y(WriteBack_Data));
endmodule