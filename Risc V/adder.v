module adder(
input [31:0]a,b,	
output reg [31:0]c
);

always@*
begin
c=a+b;
end

endmodule 
