module mux2_1_cash(
input sel,
input [127:0]in1,in2,
output reg [127:0]out1
);

always@*
begin
if(sel)
out1=in2;
else
out1=in1;
end

endmodule

