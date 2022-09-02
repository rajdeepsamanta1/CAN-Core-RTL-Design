`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2022 12:00:02
// Design Name: 
// Module Name: Tx_storage_FIFO
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Tx_storage_FIFO(sys_clk,
IP2Can_reset,
load_data1,
deload_data1,
txfifo_ip,
txfifo_op,
TXFLL,
count1);

   
input sys_clk;
input IP2Can_reset;
input load_data1;
input deload_data1;
input [127:0]txfifo_ip;
reg   [127:0]TX_FIFO[0:63];
reg   [5:0]readcount1;
reg   [5:0]writecount1;
output  TXFLL;
output [5:0]count1;
output reg [127:0]txfifo_op;



always @(posedge sys_clk)
begin

if(IP2Can_reset==1)
begin
readcount1<=6'd0;
writecount1<=6'd0;
end


else if(IP2Can_reset==0)
begin

      if(load_data1==1)
      begin
    

             TX_FIFO[writecount1]<=txfifo_ip;
			 writecount1<=writecount1+1;
          
       end
 
 
       else if(deload_data1==1)
       begin
			 
			 txfifo_op<=TX_FIFO[readcount1];
			 readcount1<=readcount1+1;
         
			 
       end

end
	
			 
if(readcount1==6'd63)
readcount1<=6'd0;

if(writecount1==6'd63)
writecount1<=6'd0;	 			

end

assign count1=IP2Can_reset?0:(writecount1-readcount1);
assign TXFLL = IP2Can_reset ? 0 :((count1==63) ? 1 : 0);	

endmodule


   
