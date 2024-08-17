module pc_tb();
reg [31:0]pc_next;
reg clk=0;
reg reset;
wire [31:0]pc;

pc pc1(.pc_next(pc_next),.reset(reset),.clk(clk),.pc(pc));

always #5 clk=~clk;

initial begin
reset=1;
#10;
reset=0; 
pc_next=25;
#10;
pc_next=36;
#10;


end 


endmodule
