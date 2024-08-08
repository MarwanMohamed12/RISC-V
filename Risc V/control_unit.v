module control_unit 
(input [6:0]Op,
input [2:0]funct3,
input funct7,
input zero,
output PCSrc,
output [1:0]ResultSrc,
output MemWrite,
output [2:0] ALUControl,
output ALUSrc,
output [1:0] ImmSrc,
output RegWrite,
output MemRead
);
wire jump_t,Branch_t,Z_B;
wire [1:0] ALUOp_t;
main_decoder dut1(.op(Op),.ResultSrc(ResultSrc),.MemWrite(MemWrite),.MemRead(MemRead),.ALUSrc(ALUSrc),.ImmSrc(ImmSrc),.RegWrite(RegWrite),.ALUOp(ALUOp_t)
,.Jump(jump_t),.Branch(Branch_t));

Alu_Decoder dut2(.funct3(funct3),.funct7(funct7),.ALUOp(ALUOp_t),.Op5(Op[5]),.ALUControl(ALUControl));

assign Z_B=zero&Branch_t;
assign PCSrc= jump_t | Z_B;

endmodule
