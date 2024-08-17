module Data_path 
(input clk,Reset,
input [31:0] Instr,
input [31:0] ReadData,
input        RegWrite,
input [1:0]  ImmSrc,
input        ALUSrc,
input [2:0]  ALUControl,
input [1:0]  ResultSrc,
input        PCSrc,
output       Zero,
input stall,
output [31:0] ALUResult,
output [31:0]WriteData,
output [31:0]PC
);
wire [31:0]Result,RD1,RD2,ImmExt,SrcB,PCPlus4,PCNext,PCNext2,PCTarget;

register_file regFile (.a1(Instr[19:15]),.a2(Instr[24:20]),.a3(Instr[11:7]),.wd3(Result),.rd1(RD1),.rd2(RD2),.WE3(RegWrite),.clk(clk));

mux2_1 mux1(.in1(RD2),.in2(ImmExt),.sel(ALUSrc),.out1(SrcB));

alu alu1(.SrcA(RD1),.SrcB(SrcB),.ALUControl(ALUControl),.ALUResult(ALUResult),.zero(Zero));

sign_extension SI(.instr(Instr[31:7]),.immSrc(ImmSrc),.immExt(ImmExt));

adder adder1(.a(PC),.b(32'd4),.c(PCPlus4));

adder adder2(.a(PC),.b(ImmExt),.c(PCTarget));

pc pc1(.pc_next(PCNext2),.clk(clk),.reset(Reset),.pc(PC));

mux2_1 mux2(.in1(PCPlus4),.in2(PCTarget),.sel(PCSrc),.out1(PCNext));

mux2_4 mux3(.in1(ALUResult),.in2(ReadData),.in3(PCPlus4),.sel(ResultSrc),.out1(Result));

mux2_1 mux4(.in1(PCNext),.in2(PC),.sel(stall),.out1(PCNext2));

assign WriteData=RD2;




endmodule
