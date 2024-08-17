module Top(
input clk,reset,mem_read,mem_write,
input [9:0]WordAddress,
input [31:0]DataIn,
output stall,
output [31:0]DataOut
);
wire [127:0]Readx,data_in_t;
wire [3:0]Tag_v;
wire hit_or_miss_t,cu_to_mem_write_t,cu_to_cash_read_t;
wire check_hit_read,check_write,done,warings;
wire [9:0]sent_address_t;
mux2_1_cash MX1(.in1(Readx),.in2({96'b0,DataIn}),.sel(hit_or_miss_t),.out1(data_in_t));

//mux2_1 MX2(.in1(Readx),.in2(DataIn),.sel(hit_or_miss_t),.out1(data_in_t));

cache_memory CM (.clk(clk),.reset(reset),.address(WordAddress),.data_in(data_in_t),.hit_or_miss(hit_or_miss_t),
.cu_to_mem_write(cu_to_mem_write_t),.cu_to_cash_read(mem_read),.read_data(DataOut),.Tag_v(Tag_v));

main_memory MM(.clk(clk),.data_in(DataIn),.address(WordAddress),.cu_to_mem_write(mem_write),
.waring(warings),.read_value(Readx),.done(done));

controller CU(.clk(clk),.reset(reset),.mem_read(mem_read),.mem_write(mem_write),.address(WordAddress),.Tag_v(Tag_v),.done(done),
.hit_or_miss(hit_or_miss_t),.stall(stall),.wiring(warings),.cu_to_mem_write(cu_to_mem_write_t),.cu_to_cash_read(cu_to_cash_read_t));



endmodule 
