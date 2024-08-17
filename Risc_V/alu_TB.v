module alu_TB();
reg [31:0]SrcA_TB  ;
reg [31:0]SrcB_TB  ;
reg [2:0]ALUControl_TB  ;
wire  [31:0] ALUResult_TB;
wire zero;
alu  dut (.SrcA(SrcA_TB),.SrcB(SrcB_TB),.ALUControl(ALUControl_TB),.ALUResult(ALUResult_TB),.zero(zero));


initial begin
SrcA_TB=32'd10 ;
SrcB_TB=32'd50 ;
ALUControl_TB=3'b000;
#10;
ALUControl_TB=3'b001;
#10;
ALUControl_TB=3'b010;
#10;
ALUControl_TB=3'b011;
#10;
ALUControl_TB=3'b101;
#10;

end

endmodule