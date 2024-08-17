module main_memory_tb();
reg clk=0;
reg [31:0]data_in;
reg [9:0]address;
reg mem_write,waring;
wire done;
wire [31:0]read_value;


main_memory MM(.clk(clk),.data_in(data_in),.address(address),.mem_write(mem_write)
,.waring(waring),.done(done),.read_value(read_value));

always #5 clk=~clk;

initial begin
data_in=32'd50;
address=10'b0000_0000_00;
mem_write=1'b1;
waring=1'b0;
#10;
address=10'b0000_0000_01;
data_in=32'd60;
#10;
address=10'b0000_0000_11;
data_in=32'd70;
#10;
address=10'b0000_0001_00;
data_in=32'd80;
#10;
address=10'b0000_0001_01;
data_in=32'd90;
#10;
mem_write=1'b0;
waring=1'b1;
address=10'b0000_0000_11;
#10;
end


endmodule