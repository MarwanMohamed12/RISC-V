module controller(
input clk,mem_read,mem_write,reset,
input [9:0]address,
input done,
input [3:0]Tag_v,
output reg hit_or_miss,stall,wiring,cu_to_mem_write,cu_to_cash_read
);

localparam [1:0]IDLE=2'b00,READ=2'b01,WRITING=2'b10;
reg [1:0]present_state,next_state;
reg ok;
//reg [4:0]stored=address[6:2];
reg hits ;
 
always@(negedge clk or posedge reset)
begin
  if(reset)
    begin 
     next_state<=IDLE;
     present_state<=IDLE;   
     stall<=0;
    end
  else
    present_state<=next_state;
end


////////////////////////

always@*
begin

case(present_state)
   IDLE:begin
	if(mem_read)
		next_state=READ;
	else if(mem_write)
		next_state=WRITING;
	end
	

   WRITING:begin
	if(mem_read)
		next_state=READ;
	else if(mem_write)
		next_state=WRITING;
	else
	       next_state=IDLE; 
	end

   READ:begin
	if(mem_read)
		next_state=READ;
	else if(mem_write)
		next_state=WRITING;
	else
		next_state=IDLE;
	
     end
endcase
end
//////////////////////////////output
//assign hits=hit_or_miss;
always@*
begin
hits=hit_or_miss;
case(present_state)
   IDLE:begin
	
		cu_to_mem_write=0;
		cu_to_cash_read=0;
		wiring=0;
		hit_or_miss=0;
	end

   WRITING:begin
	cu_to_mem_write=1;
	wiring=0;
	cu_to_cash_read=0;

	if(Tag_v[0]==1'b1 & Tag_v[3:1]==address[9:7])
		 hit_or_miss=1;	
	else
		 hit_or_miss=0;  
	end  
		
   READ:begin
	cu_to_mem_write=0;
	cu_to_cash_read=1;
	if(Tag_v[0]==1'b1 & Tag_v[3:1]==address[9:7]&ok==1)
	   begin hit_or_miss=1;	
		  wiring=0;
	   end
	else
	   begin
		 hit_or_miss=0; 
		 wiring=1;

	   end
     end

endcase 
end
// this always to synchronize stall with time 
always@(negedge clk)
begin

case(next_state)
	
	IDLE:begin ok<=1;    stall<=0; end
		
	WRITING:begin
		  stall<=1;
		  if(done)  stall<=0;
		end

	READ:begin
		  if(Tag_v[0]==1'b1 & Tag_v[3:1]==address[9:7]&ok==1)
	   	    begin hit_or_miss<=1;	
		      stall<=0;
		      ok<=1;
	            end
	          else
	            begin
		      stall<=1;
			ok<=0;
		      if(done)begin  stall<=0 ;ok <=1 ;end 
	            end
	     end
endcase
end
endmodule
