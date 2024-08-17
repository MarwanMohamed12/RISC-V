module main_decoder(
input [6:0]op,
output reg MemWrite,
output reg MemRead,
output reg ALUSrc,
output reg RegWrite,
output reg [1:0] ResultSrc,
output reg [1:0] ImmSrc,
output reg [1:0] ALUOp,
output reg Branch,
output reg Jump
);


always@*
begin
case(op)
7'b0000011:
begin
MemRead=1'b1;
MemWrite=1'b0;
ImmSrc=2'b00;
ALUSrc=1'b1;
ResultSrc=2'b01;
ALUOp=2'b00;
Branch=0;
Jump=0;
RegWrite=1'b1;
end
7'b0100011:// sw
begin
MemRead=1'b0;
MemWrite=1'b1;
ImmSrc=2'b01;
ALUSrc=1'b1;
ResultSrc=2'b00;
ALUOp=2'b00;
Branch=0;
Jump=0;
RegWrite=1'b0;
end
7'b0110011://    r_type
begin
MemRead=1'b0;
MemWrite=1'b0;
ImmSrc=2'b00;
ALUSrc=1'b0;
ResultSrc=2'b00;
ALUOp=2'b10;
Branch=0;
Jump=0;
RegWrite=1'b1;
end
7'b1100011://beq
begin
MemRead=1'b0;
MemWrite=1'b0;
ImmSrc=2'b10;
ALUSrc=1'b0;
ResultSrc=2'b00;
ALUOp=2'b01;
Branch=1;
Jump=0;
RegWrite=1'b0;


end
7'b0010011://I_type
begin
MemRead=1'b0;
MemWrite=1'b0;
ImmSrc=2'b00;
ALUSrc=1'b1;
ResultSrc=2'b00;
ALUOp=2'b10;
Branch=0;
Jump=0;
RegWrite=1'b1;
end

7'b1101111://jal
begin
MemRead=1'b0;
MemWrite=1'b0;
ImmSrc=2'b11;
ALUSrc=1'b0;
ResultSrc=2'b10;
ALUOp=2'b00;
Branch=0;
Jump=1;
RegWrite=1'b1;
end
default:
begin
MemRead=1'b0;
MemWrite=1'b0;
ImmSrc=2'b00;
ALUSrc=1'b0;
ResultSrc=2'b00;
ALUOp=2'b00;
Branch=0;
Jump=0;
RegWrite=1'b0;
end
endcase 


end


endmodule
