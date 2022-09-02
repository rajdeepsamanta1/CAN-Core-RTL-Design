`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2022 12:03:26
// Design Name: 
// Module Name: Tx_message
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


module Tx_message(sys_clk,
IP2Can_reset,
DEMUX2txfifo_id,
DEMUX2txfifo_dlc,
DEMUX2txfifo_dataword1,
DEMUX2txfifo_dataword2,
DEMUX2txhpb_id,
DEMUX2txhpb_dlc,
DEMUX2txhpb_dataword1,
DEMUX2txhpb_dataword2,
txfifo_ip,
txhpb_ip);

input sys_clk;
input IP2Can_reset;
input [31:0]DEMUX2txfifo_id;
input [31:0]DEMUX2txfifo_dlc;
input [31:0]DEMUX2txfifo_dataword1;
input [31:0]DEMUX2txfifo_dataword2;
input [31:0]DEMUX2txhpb_id;
input [31:0]DEMUX2txhpb_dlc;
input [31:0]DEMUX2txhpb_dataword1;
input [31:0]DEMUX2txhpb_dataword2;
output  [127:0]txfifo_ip;
output  [127:0]txhpb_ip;


assign txfifo_ip = IP2Can_reset ? 128'd0 : {DEMUX2txfifo_id, DEMUX2txfifo_dlc, DEMUX2txfifo_dataword1, DEMUX2txfifo_dataword2};

assign txhpb_ip =  IP2Can_reset ? 128'd0 : {DEMUX2txhpb_id, DEMUX2txhpb_dlc, DEMUX2txhpb_dataword1, DEMUX2txhpb_dataword2};
    

endmodule

