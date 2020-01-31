module Data_Memory (input [31:0] Address, Write_data , input Mem_read , Mem_write , output reg [31:0] Mem_read_value) ;

  reg [31:0] Mem_data [0:4095];
  
  integer i;
    initial begin
        Mem_data[1000] = 32'b0;  
        for(i=1004;i<1040;i=i+4)  
            Mem_data[i] = i - 1000;  
    end
    
    integer j;
    initial begin
        Mem_data[2000] = 32'b0;  
        for(j=2004; j<2040;j=j+4)  
            Mem_data[j] = j - 2000;  
    end
  
  always @(Address, Write_data , Mem_read , Mem_write) begin
   if( Mem_read )
      Mem_read_value = Mem_data[Address];
    else
      Mem_read_value = Mem_read_value;
  
  end

  always @(Address, Write_data , Mem_read , Mem_write)begin

    if( Mem_write )
     Mem_data[Address] <= Write_data;
     
    else
     Mem_data[Address] <= Mem_data[Address];

  end

endmodule
