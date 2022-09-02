`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2022 12:02:57
// Design Name: 
// Module Name: Rx_storage_FIFO
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


module Rx_storage_FIFO(sys_clk,
IP2Can_reset,
load_data3,
deload_data3,
rxfifo_ip,
rxfifo_op,
RXNEMP,
count2);

input sys_clk;
input IP2Can_reset;
input load_data3;
input deload_data3;
input [127:0]rxfifo_ip;
reg   [127:0]RX_FIFO[0:63];
reg   [5:0]readcount2;
reg   [5:0]writecount2;
output  [5:0]count2;
output reg [127:0]rxfifo_op;
output RXNEMP;



always @(posedge sys_clk)
begin

if(IP2Can_reset==1)
begin
readcount2<=6'd0;
writecount2<=6'd0;
end


else if(IP2Can_reset==0)
begin

          if(load_data3==1)
          begin
          RX_FIFO[writecount2]<=rxfifo_ip;
          writecount2<=writecount2+1;
          end
			 

          else if(deload_data3==1)
          begin
		  rxfifo_op<=RX_FIFO[readcount2];
          readcount2<=readcount2+1;
          end
			 
end
			 
if(readcount2==6'd63)
readcount2<=6'd0;

if(writecount2==6'd63)
writecount2<=6'd0;

end

assign count2=IP2Can_reset?0:(writecount2-readcount2);
assign RXNEMP = IP2Can_reset ? 0 : ((count2!=0) ? 1 : 0);

endmodule





    
