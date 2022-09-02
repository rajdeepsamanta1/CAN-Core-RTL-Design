`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2022 01:07:35
// Design Name: 
// Module Name: Can_Transfer_layer
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


module Can_Transfer_layer(sys_clk,
baud_clk,
tx_message,
rx_message,
tx,
rx,
tx_en,
frame_indicator,
TXOK,
RXOK,
DEMUX2baudrate);

input sys_clk;
input [130:3]tx_message;
input rx;
input tx_en;
input [31:0]DEMUX2baudrate;
output frame_indicator;
output [128:1]rx_message;
output  tx;
wire  [7:0]weight=8'd0;
wire  [7:0]weight1=8'd128;
wire baud_clk;
wire [9:0]counter;
output  TXOK;
output  RXOK;
output baud_clk;

Transmitter block1(sys_clk,
baud_clk,
tx_message,
tx_en,
frame_indicator,
tx,
TXOK);

Receiver block2(sys_clk,
rx,
rx_message,
RXOK);

Clock_prescalar block3(sys_clk,
DEMUX2baudrate,
baud_clk);

endmodule
