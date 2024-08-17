module instruction_memory 
(input [7:0]A,
output reg [31:0] Instr
);

reg [31:0] mem [0:255];

initial begin 
/*
mem[0]=32'h00500113; //addi x2, x0, 5
mem[1]=32'h00C00193; //addi x3, x0, 12
mem[2]=32'hff718393; //addi x7, x3, -9
mem[3]=32'h0023E233; //or x4, x7, x2
mem[4]=32'h0041F2B3; //and x5, x3, x4
mem[5]=32'h004282B3; //add x5, x5, x4
mem[6]=32'h02728863; //beq x5, x7, end
mem[7]=32'h0041A233; //slt x4, x3, x4
mem[8]=32'h00020463; //beq x4, x0, around
mem[9]=32'h00000293; //addi x5, x0, 0
mem[10]=32'h0023A233; //around: slt x4, x7, x2
mem[11]=32'h005203B3; //add x7, x4, x5
mem[12]=32'h402383B3; //sub x7, x7, x2
mem[13]=32'h0471AA23; //sw x7, 84(x3)
mem[14]=32'h06002103; //lw x2, 96(x0)
mem[15]=32'h005104B3; //add x9, x2, x5
mem[16]=32'h008001EF; //jal x3, end
mem[17]=32'h00100113; //addi x2, x0, 1
mem[18]=32'h00910133; //end: add x2, x2, x9
mem[19]=32'h0221A023; //sw x2, 0x20(x3)
mem[20]=32'h00210063; //done: beq x2, x2, done
*/

mem[0]  = 32'b00000000101000000000000010010011;  // addi x1, x0, 10
mem[1]  = 32'b00000001010000000000000100010011;  // addi x2, x0, 20
mem[2]  = 32'b00000010100000000000000110010011;  // addi x3, x0, 40
mem[3]  = 32'b00000101000000000000001000010011;  // addi x4, x0, 80
mem[4]  = 32'b00001010000000000000001010010011;  // addi x5, x0, 160
mem[5]  = 32'b00000000000100000010000000100011;  // sw x1, 0(x0)
mem[6]  = 32'b00000000000100000010000010100011;  // sw x1, 1(x0)
mem[7]  = 32'b00000000001000000010001000100011;  // sw x2, 4(x0)
mem[8]  = 32'b00000000001100000010010000100011;  // sw x3, 8(x0)
mem[9]  = 32'b00000000010000000010011000100011;  // sw x4, 12(x0)
mem[10] = 32'b00000000010100000010011000100011;  // sw x5, 12(x0)
mem[11] = 32'b00000000000000000010010100000011;  // lw x10, 0(x0)
mem[12] = 32'b00000000010000000010010110000011;  // lw x11, 4(x0)
mem[13] = 32'b00000000100000000010011000000011;  // lw x12, 8(x0)
mem[14] = 32'b00000000110000000010011010000011;  // lw x13, 12(x0)
mem[15] = 32'b00000000010000000010010110000011;  // lw x11, 4(x0)
mem[16] = 32'b00000000000100000010000100100011;  // sw x1,  2(x0)
mem[17] = 32'b00000000001000000010010100000011;  // lw x10, 0(x0)

end 

always@*
begin
Instr=mem[A];
end

endmodule
