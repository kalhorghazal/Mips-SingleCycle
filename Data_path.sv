`timescale 1ns/1ns
module Data_path (input clk , reset , MemtoReg , Reg_Write , Mem_Read, Mem_Write  , Branch , ALUsrc ,  ld ,input [1:0] regDst ,   writeDst , Jump , input[3:0] ALUOperation, output [5:0]func, opcode, input reg [31:0] instMem[0:1023]);
  wire [31:0] adrToPC, PC_out, PC_inc_out, Extend_data, instruction, WritetoReg_data,
    high_out, low_out, write_data, Read_data1, Read_data2, Operand_data2, branch_data
    , Mem_read_value , shifted_ext , adr_inc_out , concated;
    wire [63:0] ALU_result;
    wire Zero;
    wire [4:0] write_reg;
    wire [27:0] shifted_inst;
    
      
  
  
  PC my_PC(clk , reset, adrToPC , PC_out);
  
  PC_inc my_PCinc(PC_out, PC_inc_out);
  
  Sign_extend my_SE(instruction[15:0] , Extend_data);
 
  Instruction_memory my_InstrcMem(instMem, PC_out , instruction);
 
  Mux4to1_32bit my_mux4_32( WritetoReg_data , PC_inc_out, high_out , low_out , writeDst , write_data);
 
  Mux3to1_5bit my_mux3_5( instruction[20:16] , instruction[15:11], 5'b11111, regDst , write_reg);
 
  Register_file my_RF(clk , reset ,  instruction[25:21] , instruction[20:16] , write_reg , write_data , Reg_Write , Read_data1 ,Read_data2);
 
  Mux2to1_32bit my_mux2_32( Read_data2 ,Extend_data , ALUsrc , Operand_data2);
 
  Shl2_32 my_shl2(Extend_data , shifted_ext);
 
  address_inc my_inc_adr( PC_inc_out, shifted_ext , adr_inc_out);
  
  assign can_branch = Zero & Branch;
  
  Mux2to1_32bit my3_mux2_32( PC_inc_out , adr_inc_out ,can_branch , branch_data);
  
  Shl2_26 my2_shl2( instruction[25:0] , shifted_inst);
  
  assign concated = {PC_inc_out[31:28], shifted_inst};
  
  Mux3to1_32bit my2_mux3_32( branch_data , concated, Read_data1 , Jump, adrToPC);
 
  ALU_32bit my_ALU(Read_data1, Operand_data2 , ALUOperation , ALU_result, Zero);

  REG32 High(reset, clk, ld, ALU_result[63:32], high_out);

  REG32 Low(reset, clk, ld, ALU_result[31:0], low_out);
  
  Data_Memory my_DataMem( ALU_result[31:0], Read_data2 ,  Mem_Read , Mem_Write , Mem_read_value) ;
  
  Mux2to1_32bit my2_mux2_32( ALU_result[31:0] , Mem_read_value ,MemtoReg , WritetoReg_data);
  
  assign func = instruction[5:0];
  assign opcode = instruction[31:26];
  
 endmodule
