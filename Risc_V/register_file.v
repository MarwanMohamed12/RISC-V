module register_file(
input [4:0]a1,a2,a3,
input [31:0]wd3,
input clk,WE3,
output reg [31:0]rd1,rd2
);
reg [31:0] reg_mem [0:31];
integer i;
initial begin
for(i=0;i<32;i=i+1)
reg_mem[i]=32'b0;
end

always@(posedge clk)
begin 
if(WE3)
reg_mem[a3]<=wd3;
else
reg_mem[a3]<=reg_mem[a3];
end 

always@*
begin
rd1=reg_mem[a1];
rd2=reg_mem[a2];
end


endmodule 
