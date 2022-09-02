`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2022 12:05:26
// Design Name: 
// Module Name: Rx_message
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


module Rx_message(sys_clk,
IP2Can_reset,
rxfifo_id2MUX,
rxfifo_dlc2MUX,
rxfifo_dataword12MUX,
rxfifo_dataword22MUX,
rxfifo_op);

input sys_clk;
input IP2Can_reset;
output [31:0]rxfifo_id2MUX;
output [31:0]rxfifo_dlc2MUX;
output [31:0]rxfifo_dataword12MUX;
output [31:0]rxfifo_dataword22MUX;
input [127:0]rxfifo_op;


assign rxfifo_id2MUX        =  IP2Can_reset ? 32'd0 : rxfifo_op[127:96];
assign rxfifo_dlc2MUX       =  IP2Can_reset ? 32'd0 : rxfifo_op[95:64];
assign rxfifo_dataword12MUX =  IP2Can_reset ? 32'd0 : rxfifo_op[63:32];
assign rxfifo_dataword22MUX =  IP2Can_reset ? 32'd0 : rxfifo_op[31:0];


endmodule

