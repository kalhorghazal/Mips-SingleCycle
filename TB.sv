`timescale 1ns/1ns
module TB();
  
  reg clk = 0;
  reg rst = 0;
  
  reg [31:0] Inst_mem_data[0:1023];
  
  MIPS mips(clk, rst, Inst_mem_data);
  
  initial begin
        forever #100 clk = ~clk;
    end
  

   initial begin
//Instructions
Inst_mem_data [0]={6'b000000, 5'b00000, 5'b00000, 5'b00001, 5'b00000, 6'b000000};//add R1, R0, R0
Inst_mem_data [4]=32'b0;//LOOP
Inst_mem_data [8]={6'b000010, 5'b00000, 5'b00101, 16'b01010};//slti R5, R1, 10
Inst_mem_data [12]={6'b000101, 5'b00101, 5'b00000, 16'b111};//beq R5, R0, EXIT
Inst_mem_data [16]={6'b000011, 5'b00001, 5'b01010, 16'b1111101000};//lw R10, 1000(R1)
Inst_mem_data [20]={6'b000011, 5'b00001, 5'b01011, 16'b11111010000};//lw R11, 2000(R1)
Inst_mem_data [24]={6'b000000, 5'b01010, 5'b01011, 5'b01100, 5'b00000, 6'b000000};//add R12, R10, R11
Inst_mem_data [28]={6'b000100, 5'b00001, 5'b01100, 16'b101110111000};//sw R12, 3000(R1)
Inst_mem_data [32]={6'b000001, 5'b00001, 5'b00001, 16'b100};//addi R1, R1, 4
Inst_mem_data [36]={6'b001001, 26'b1};//jump LOOP
Inst_mem_data [40]=32'b0;//EXIT:

    
    clk = 0;
      rst = 0;
      #220
      rst = 1;
      #110
      rst =0;
      #20000
      $stop;
  end

endmodule
