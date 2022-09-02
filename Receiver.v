`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2022 21:22:33
// Design Name: 
// Module Name: Receiver
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


module Receiver(sys_clk,
rx,
rx_message,
RXOK);

input sys_clk;
input rx;
output reg [128:1]rx_message;
reg  [7:0]weight1=8'd128;
output reg RXOK=0;

// receiving

always @(negedge sys_clk)
begin

if(rx==0)
begin
rx_message[weight1]<=rx;
weight1<=weight1-1;
end

if(weight1<=8'd127)
begin
rx_message[weight1]<=rx;
weight1<=weight1-1;
end

if(weight1==8'd0)
begin
RXOK<=1;
weight1<=8'd128;
end

if(weight1==8'd128)
RXOK<=0;

end

endmodule
