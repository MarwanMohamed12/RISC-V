module mux2_1(
input sel,
input [31:0]in1,in2,
output reg [31:0]out1
);

always@*
begin
if(sel)
out1=in2;
else
out1=in1;
end

endmodule

