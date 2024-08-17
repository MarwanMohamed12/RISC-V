module mux2_4(
input [1:0]sel,
input [31:0]in1,in2,in3,
output reg [31:0]out1
);

always@*
begin
if(sel==2'b00)
out1=in1;
else if(sel==2'b01)
out1=in2;
else if(2'b10)
out1=in3;
else 
out1=2'bxx;

end


endmodule

