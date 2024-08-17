module control_unit_TB();
reg [6:0]Op_TB  ;
reg [2:0]funct3_TB  ;
reg funct7_TB ;
reg zero_TB ;
wire PCSrc_TB;
wire [1:0]ResultSrc_TB;
wire MemWrite_TB;
wire  [2:0] ALUControl_TB;
wire ALUSrc_TB;
wire  [1:0] ImmSrc_TB;
wire RegWrite_TB;
control_unit  dut (.Op(Op_TB),.funct3(funct3_TB),.funct7(funct7_TB),.zero(zero_TB),.PCSrc(PCSrc_TB),.ResultSrc(ResultSrc_TB),.MemWrite(MemWrite_TB),.ALUControl(ALUControl_TB),.ALUSrc(ALUSrc_TB),.ImmSrc(ImmSrc_TB),.RegWrite(RegWrite_TB));

initial begin
Op_TB=7'b0000011;
funct3_TB=3'b101;
funct7_TB=1;
zero_TB=0;
#5
Op_TB=7'b0100011;
funct3_TB=3'b110;
funct7_TB=1;
#5
Op_TB=7'b0110011;
#5
funct3_TB=3'b111;
funct7_TB=0;
Op_TB=7'b1100011;
#5
Op_TB=7'b0010011;
#5
Op_TB=7'b1101111;
#5
Op_TB=7'b1111111;
#5;

end

endmodule