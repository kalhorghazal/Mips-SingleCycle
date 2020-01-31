`timescale 1ns/1ns
module MIPS(input clk, rst, input reg [31:0] instMem[0:1023]);

wire MemtoReg, Reg_Write, Mem_Read, Mem_Write ,  Branch, ALUsrc, ld;
wire [1:0] regDst, writeDst, Jump;
wire [2:0] ALUOp;
wire [3:0] ALUOperation;
wire [5:0] func, opcode;

Data_path DP(clk , rst , MemtoReg , Reg_Write , Mem_Read, Mem_Write , Branch , ALUsrc ,  ld , regDst ,   writeDst , Jump , ALUOperation, func, opcode, instMem);
controller CU(opcode , MemtoReg , Reg_Write , Mem_Read ,Mem_Write ,  Branch , ALUsrc , ld , regDst ,  writeDst , Jump , ALUOp);
ALU_control ALU_CU(func , ALUOp , ALUOperation);

endmodule
