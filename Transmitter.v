`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2022 21:22:13
// Design Name: 
// Module Name: Transmitter
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


module Transmitter(sys_clk,
baud_clk,
tx_message,
tx_en,
frame_indicator,
tx,
TXOK);
    
input sys_clk;
input baud_clk;
input [130:3]tx_message;
input tx_en;
output reg frame_indicator;
output reg tx=1;
reg  [7:0]weight=8'd0;
output reg TXOK=1;

// transmitting

always @(posedge sys_clk)
begin

if(tx_en==1)
begin
weight<=8'd132;
TXOK<=0;
end

if(weight>8'd130 && weight<=8'd132)
begin
weight<=weight-1;
TXOK<=0;
end

if(weight>8'd2 && weight<=8'd130)
begin
tx<=tx_message[weight];
weight<=weight-1;
frame_indicator<=1;
TXOK<=0;
end

if(weight<=8'd2 && weight>8'd0)
begin
tx<=1;
weight<=weight-1;
end

if(weight==8'd0)
begin
TXOK<=1;
frame_indicator<=0;
end

end

endmodule
