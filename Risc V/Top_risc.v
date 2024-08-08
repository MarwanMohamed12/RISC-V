module Top_risc(
input clk,reset
);

wire [31:0]Instr,read_data,ALUResult,WriteData,PC;
wire zero,RegSrc,PCSrc,ALUSrc,RegWrite,MemWrite,MemRead,stall;
wire [1:0]ResultSrc,ImmSrc;
wire [2:0]ALUControl;

control_unit CU(.Op(Instr[6:0]),.funct3(Instr[14:12]),.funct7(Instr[30]),.zero(zero),.PCSrc(PCSrc),.ResultSrc(ResultSrc),.MemWrite(MemWrite),.ALUControl(ALUControl),
.ALUSrc(ALUSrc),.ImmSrc(ImmSrc),.RegWrite(RegWrite),.MemRead(MemRead));

Data_path DB1(.clk(clk),.Reset(reset),.Instr(Instr),.ReadData(read_data),
.RegWrite(RegWrite),.ImmSrc(ImmSrc),.ALUSrc(ALUSrc),.ALUControl(ALUControl),.ResultSrc(ResultSrc),
.PCSrc(PCSrc),.Zero(zero),.ALUResult(ALUResult),.WriteData(WriteData),.PC(PC),.stall(stall));

instruction_memory IM(.A(PC[9:2]),.Instr(Instr));

//data_memory DM(.clk(clk),.we(MemWrite),.wd(WriteData),.A(ALUResult[7:0]),.rd(read_data));

Top TC(.clk(clk),.reset(reset),.mem_read(MemRead),.mem_write(MemWrite),.WordAddress(ALUResult[9:0]),.DataIn(WriteData),.stall(stall),.DataOut(read_data));



endmodule
