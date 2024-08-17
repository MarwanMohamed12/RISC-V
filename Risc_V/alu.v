module alu 
(input [31:0]SrcA,
input [31:0]SrcB,
input [2:0]ALUControl,
output reg [31:0] ALUResult,
output reg zero
);


always@*
begin
case(ALUControl)
3'b000:ALUResult<=SrcA+SrcB;
3'b001:ALUResult<=SrcA-SrcB;
3'b010:ALUResult<=SrcA&SrcB;
3'b011:ALUResult<=SrcA|SrcB;
3'b101:ALUResult<=SrcA<SrcB;
default:ALUResult<=ALUResult;
endcase 
if(ALUResult==0)
zero=1;
else
zero=0;
end

endmodule
