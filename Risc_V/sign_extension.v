module sign_extension(
input [31:7]instr,
input [1:0]immSrc,
output reg [31:0]immExt
);

always@*
begin
case(immSrc)
2'b00:immExt={{20{instr[31]}},instr[31:20]};
2'b01:immExt={{20{instr[31]}},instr[31:25],instr[11:7]};
2'b10:immExt={{20{instr[31]}},instr[7],instr[30:25],instr[11:8],1'b0};
2'b11:immExt={{12{instr[31]}},instr[19:12],instr[20],instr[30:21],1'b0};
endcase


end

endmodule 
