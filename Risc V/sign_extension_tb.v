module sign_extension_tb();
reg [31:7]instr;
reg [1:0]immSrc;
wire [31:0]immExt;

sign_extension SE(.instr(instr),.immSrc(immSrc),.immExt(immExt));

initial begin
instr=32'habcdefab;
immSrc=2'b00;
#10;
immSrc=2'b01;
#10;
immSrc=2'b10;
#10;
immSrc=2'b11;
#10;
end

endmodule
