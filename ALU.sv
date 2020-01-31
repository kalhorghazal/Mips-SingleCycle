module ALU_32bit( input [31:0] In1 ,In2 , input [3:0] ALU_Sel ,output [63:0] Out, output Zero);
  
    reg [63:0] ALU_Result;
    reg temp_zero;
        
    always @(*)
    begin
        case(ALU_Sel)
        4'b0000: // Addition - Immediate Addition - store word - Load word
           ALU_Result = In1 + In2; 
           
        4'b0001: // Subtraction
           ALU_Result = In1 - In2;
           
        4'b0010: // Multiplication
           ALU_Result = In1 * In2;
           
          4'b0011: //  Logical and 
           ALU_Result = In1 & In2;
           
          4'b0100: //  Logical or
           ALU_Result = In1 | In2;
           
          4'b0101: //  Logical xor 
           ALU_Result = In1 ^ In2;
           
          4'b0110: //  Set on less than - Immediate 
           ALU_Result = ( In1 < In2 ) ? 32'd1 : 32'd0;
           
          4'b0111: //  Branch equal
           temp_zero = ( In1 == In2 ) ? 1'd1 : 1'd0  ;
           
          4'b1000: //  Branch not equal
           temp_zero =  ( In1 == In2 ) ? 1'd0 : 1'd1;


          default: ALU_Result = 32'bx ; 
        endcase
    end
    
    assign Out = ALU_Result; // ALU out
   assign Zero = temp_zero; // zero flag


endmodule
