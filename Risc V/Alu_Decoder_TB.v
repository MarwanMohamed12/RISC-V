module Alu_Decoder_TB();
reg [1:0]ALUOp_TB  ;
reg [2:0]funct3_TB  ;
reg funct7_TB  ;
reg Op5_TB ;
wire  [2:0] ALUControl_TB;
Alu_Decoder  dut (.ALUOp(ALUOp_TB),.funct3(funct3_TB),.funct7(funct7_TB),.Op5(Op5_TB),.ALUControl(ALUControl_TB));

initial begin
{ALUOp_TB,funct3_TB,Op5_TB,funct7_TB}=7'b0001011;
#10;
{ALUOp_TB,funct3_TB,Op5_TB,funct7_TB}=7'b0001111;
#10;
{ALUOp_TB,funct3_TB,Op5_TB,funct7_TB}=7'b0101011;
#10;
{ALUOp_TB,funct3_TB,Op5_TB,funct7_TB}=7'b1000011;
#10;
{ALUOp_TB,funct3_TB,Op5_TB,funct7_TB}=7'b1000001;
#10;
{ALUOp_TB,funct3_TB,Op5_TB,funct7_TB}=7'b1000010;
#10;
{ALUOp_TB,funct3_TB,Op5_TB,funct7_TB}=7'b1000000;
#10;
{ALUOp_TB,funct3_TB,Op5_TB,funct7_TB}=7'b1001010;
#10;
{ALUOp_TB,funct3_TB,Op5_TB,funct7_TB}=7'b1011010;
#10;
{ALUOp_TB,funct3_TB,Op5_TB,funct7_TB}=7'b1011110;
#10;
end


endmodule