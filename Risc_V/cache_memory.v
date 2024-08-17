module cache_memory(
input clk,reset,
input [9:0]address,
input [127:0]data_in,
input hit_or_miss,cu_to_mem_write,cu_to_cash_read,ok,
output reg [31:0]read_data,
output  [3:0]Tag_v
);
//we increase one bit for valid bit 
reg [131:0]mem[0:31];


integer i=0;
wire[4:0]stored;

assign Tag_v=mem[address[6:2]][131:128];
assign stored=address[6:2];
always@(posedge clk or posedge reset)
begin

if(reset)
begin
for(i=0;i<32;i=i+1)
mem[i][131:128]<=4'b0;
end

else 
// for write
begin 
	 //indication that main has finished to let counter =0

	if(cu_to_mem_write &hit_or_miss) //hit
	begin

		   case(address[1:0])
		   2'b00:mem[stored][31:0]<=data_in[31:0];
		   2'b01:mem[stored][63:32]<=data_in[31:0];
		   2'b10:mem[stored][95:64]<=data_in[31:0];
		   2'b11:mem[stored][127:96]<=data_in[31:0];
		   endcase
	end
/////////////reading /////////////
	else if(cu_to_cash_read&hit_or_miss==0)
		begin
		   
		    // store block from cash
			mem[stored][127:0]<=data_in;
		   	mem[stored][128]<=1'b1;
		        mem[stored][131:129]<=address[9:7];
		   
		end
	 
	
	  
end
		
		 
end
always@*
begin 
// we always extract the wanted data 
if(cu_to_cash_read)
	begin 
	 case(address[1:0])
		 2'b00:read_data=mem[stored][31:0];
		 2'b01:read_data=mem[stored][63:32];
		 2'b10:read_data=mem[stored][95:64];
		 2'b11:read_data=mem[stored][127:96];
	 endcase
	end


end

endmodule
