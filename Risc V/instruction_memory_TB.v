module instruction_memory_TB();
reg [31:0]A_TB  ;
wire  [31:0] Instr_TB;
instruction_memory  dut2 (.A(A_TB),.Instr(Instr_TB));

initial begin
A_TB=32'd5;
#10;

A_TB=32'd7;
#10;

end

endmodule