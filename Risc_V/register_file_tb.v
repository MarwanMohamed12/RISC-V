module register_file_tb();

reg [4:0]a1,a2,a3;
reg [31:0]wd3;
reg clk=0,WE3;
wire [31:0]rd1,rd2;

register_file RF1(.a1(a1),.a2(a2),.a3(a3),.wd3(wd3),.clk(clk),
		  .WE3(WE3),.rd1(rd1),.rd2(rd2));

integer i;
always #5 clk=~clk;

initial begin
a1=5'b11001;
a2=5'b01010;
WE3=1'b0;
#20;
a3=5'b11111;
wd3=32'hffffabab;
#10;

end

endmodule
