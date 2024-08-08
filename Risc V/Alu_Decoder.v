module Alu_Decoder 
(input [1:0]ALUOp,
input [2:0]funct3,
input funct7,
input Op5,
output reg [2:0] ALUControl
);


always@*
begin
casex({ALUOp,funct3,Op5,funct7})
7'b00_xxx_xx:ALUControl=3'b000;
7'b01_xxx_xx:ALUControl=3'b001;
7'b10_000_00:ALUControl=3'b000;
7'b10_000_01:ALUControl=3'b000;
7'b10_000_10:ALUControl=3'b000;
7'b10_000_11:ALUControl=3'b001;
7'b10_010_xx:ALUControl=3'b101;
7'b10_110_xx:ALUControl=3'b011;
7'b10_111_xx:ALUControl=3'b010;
default:ALUControl=3'b000;

endcase

end



endmodule
