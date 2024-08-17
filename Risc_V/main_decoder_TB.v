module main_decoder_TB();
reg [6:0]op_TB  ;
wire MemWrite_TB;
wire ALUSrc_TB;
wire RegWrite_TB;
wire [1:0] ResultSrc_TB;
wire [1:0] ImmSrc_TB;
wire [1:0] ALUOp_TB;
wire Branch_TB;
wire Jump_TB;
main_decoder  dut (.op(op_TB),.MemWrite(MemWrite_TB),.ALUSrc(ALUSrc_TB),.RegWrite(RegWrite_TB),.ResultSrc(ResultSrc_TB),.ImmSrc(ImmSrc_TB),.ALUOp(ALUOp_TB),.Branch(Branch_TB),.Jump(Jump_TB));

initial begin
op_TB=7'b0000011;
#10;
op_TB=7'b0100011;
#10;

op_TB=7'b0110011;
#10;

op_TB=7'b1100011;
#10;

op_TB=7'b0010011;
#10;

op_TB=7'b1101111;
#10;

op_TB=7'b1101111;
#10;

end

endmodule