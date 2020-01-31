module controller (input [5:0] opcode , output reg MemtoReg , Reg_Write , Mem_Read , Mem_Write ,  Branch , ALUsrc , ld ,output reg [1:0] regDst ,  writeDst , Jump , output reg  [2:0] ALUOp);

  always @ (*)
	begin 
		{MemtoReg , Reg_Write , Mem_Read , Branch , ALUsrc , ld, regDst , writeDst , Mem_Write ,  Jump , ALUOp} = 16'b0;

		case (opcode)
		0: begin //R_type
			{regDst, Reg_Write, ALUsrc, MemtoReg, writeDst, Jump} = 9'b011000000;
			ALUOp = 3'b101;
			
			end

		1: begin //addi
			{regDst, Reg_Write, ALUsrc, MemtoReg, writeDst, Jump} = 9'b001100000;
			ALUOp = 3'b000;
			end
			
		2: begin //slti
			{regDst, Reg_Write, ALUsrc, MemtoReg, writeDst, Jump} = 9'b001100000;
			ALUOp = 3'b011;
			end	
			
		3: begin //LW
			{regDst, MemtoReg, Reg_Write, Mem_Read, ALUsrc, writeDst, Jump} = 10'b0011110000;
			ALUOp = 3'b000;
			end	
				 
		4:begin //SW
			{ALUsrc, Mem_Write ,Jump} = 4'b1100;
			ALUOp = 3'b000;
			end
			
		5:begin //Branch
			{Branch, Jump} = 3'b100;
			ALUOp = 3'b001;
			end	
			
		6:begin //Branch n
			{Branch, Jump} = 3'b100;
			ALUOp = 3'b010;
			end	
			
		7:begin //mflo 20-16 destination
			{Reg_Write, regDst, writeDst, Jump} = 7'b1001100;
			end	
			
    8:begin //mfhi
			{Reg_Write, regDst, writeDst, Jump} = 7'b1001000;
			end	
			
		9:begin //jump
			{Jump} = 2'b01;
			end	
			
		10:begin //jal
			{Reg_Write, regDst, writeDst, Jump} = 7'b1100101;
			end
			
		11:begin //jr
			{Jump} = 2'b10;
			end		
			
		12:begin //mult
			{ALUsrc, ld, regDst, Jump} = 6'b010100;
			ALUOp = 3'b100;
			end	
		endcase
	end

endmodule 
