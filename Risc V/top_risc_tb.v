module top_risc_tb();
reg clk=0,reset;

Top_risc last(.clk(clk),.reset(reset));

always #0.5 clk=~clk;
initial begin
reset=1'b1;
#1;
reset=1'b0;


end



endmodule
