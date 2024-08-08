module main_memory(
input clk,
input [31:0]data_in,
input [9:0]address,
input cu_to_mem_write,waring,
output  [31:0]read_value,
output reg done

);


reg [31:0] memory [0:1023];

integer countOFMem=0;
// here we assign value that we read from memeory all time
assign read_value=memory[{address[9:2],2'b00}+countOFMem];

always@(posedge clk)
begin
    done<=0;
if(cu_to_mem_write)
   begin
    memory[address]<=data_in;
    countOFMem<=countOFMem+1;
    done<=0;
     if(countOFMem==3) begin countOFMem<=0; done<=1; end
	else if (done)   countOFMem<=0; // here we check if done bit from main memory 
   end

if(waring)
    begin 
     countOFMem<=countOFMem+1;
      done<=0;
     if(countOFMem==3) begin countOFMem<=0; done<=1; end
	else if (done)   countOFMem<=0;
    
    end

  
end

endmodule 


