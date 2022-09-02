`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2022 12:21:05
// Design Name: 
// Module Name: Can_Object_layer
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


module Can_Object_layer(sys_clk,
IP2Can_CS,
IP2Can_reset,
IP2Can_RW,
IP2Can_data,
IP2Can_addr,
Can2IP_data,
Can2IP_ack,
Can2IP_interrupt, 
Can2IP_error,
tx_message,
rx_message,
TXOK,
RXOK,
tx_fifo_dlc,
Controller2DEMUX_CS,
addr_bus,
DEMUX2Can_CS,
DEMUX2Can_addr,
Can2DEMUX_data,
Can2DEMUX_ack,
DEMUX2Controller_ack,
DEMUX2txfifo_dlc,
txfifo_op,
state1,
count1,
tx_en,
count2,
state2,
state3,
MUX2Can_CS,
MUX2Can_addr,
MUX2Can_data,
Can2MUX_ack,
MUX2Controller_ack);


input sys_clk;
input IP2Can_CS;
input IP2Can_reset;
input IP2Can_RW;
input [31:0]IP2Can_data;
input [7:0]IP2Can_addr;
output [31:0]Can2IP_data;
output Can2IP_ack;
output Can2IP_interrupt; 
output Can2IP_error;
output [127:0]tx_message;
output tx_en;
input [127:0]rx_message;
input TXOK;
input RXOK;
output [31:0]tx_fifo_dlc;
output Controller2DEMUX_CS;
output [7:0]addr_bus;
output DEMUX2Can_CS;
output [7:0]DEMUX2Can_addr;
output [31:0]Can2DEMUX_data;
output Can2DEMUX_ack;
output DEMUX2Controller_ack;
output [31:0]DEMUX2txfifo_dlc;
output [127:0]txfifo_op;
output [3:0]state1;
output [5:0]count1;
output [5:0]count2;
output [3:0]state2;
output [3:0]state3;
output MUX2Can_CS;
output [7:0]MUX2Can_addr;
output [31:0]MUX2Can_data;
output Can2MUX_ack;
output MUX2Controller_ack;



wire [31:0]software_reset;
wire [31:0]mode_select;
wire [31:0]baudrate_prescalar;
wire [31:0]bit_timing;
wire [31:0]error_counter;
wire [31:0]error_status;
wire [31:0]status;
wire [31:0]interrupt_status;
wire [31:0]interrupt_enable;
wire [31:0]interrupt_clear;
wire [31:0]tx_fifo_id;
wire [31:0]tx_fifo_dlc;
wire [31:0]tx_fifo_dataword1;
wire [31:0]tx_fifo_dataword2;
wire [31:0]tx_hpb_id;
wire [31:0]tx_hpb_dlc;
wire [31:0]tx_hpb_dataword1;
wire [31:0]tx_hpb_dataword2;
wire [31:0]rx_fifo_id;
wire [31:0]rx_fifo_dlc;
wire [31:0]rx_fifo_dataword1;
wire [31:0]rx_fifo_dataword2;
wire [31:0]accp_filt;
wire [31:0]accp_filt_mask1;
wire [31:0]accp_filt_id1;
wire [31:0]accp_filt_mask2;
wire [31:0]accp_filt_id2;
wire [31:0]accp_filt_mask3;
wire [31:0]accp_filt_id3;
wire [31:0]accp_filt_mask4;
wire [31:0]accp_filt_id4;
wire [1:0]counta;
wire [2:0]countb;
wire DEMUX2Can_CS;
wire [7:0]DEMUX2Can_addr;
wire [31:0]Can2DEMUX_data;
wire Can2DEMUX_ack;
wire MUX2Can_CS;
wire [7:0]MUX2Can_addr;
wire [31:0]MUX2Can_data;
wire Can2MUX_ack;
wire [31:0]DEMUX2txfifo_id;
wire [31:0]DEMUX2txfifo_dlc;
wire [31:0]DEMUX2txfifo_dataword1;
wire [31:0]DEMUX2txfifo_dataword2;
wire [31:0]DEMUX2txhpb_id;
wire [31:0]DEMUX2txhpb_dlc;
wire [31:0]DEMUX2txhpb_dataword1;
wire [31:0]DEMUX2txhpb_dataword2;
wire [31:0]DEMUX2accp_filt;
wire [31:0]DEMUX2accp_mask1;
wire [31:0]DEMUX2accp_id1;
wire [31:0]DEMUX2accp_mask2;
wire [31:0]DEMUX2accp_id2;
wire [31:0]DEMUX2accp_mask3;
wire [31:0]DEMUX2accp_id3;
wire [31:0]DEMUX2accp_mask4;
wire [31:0]DEMUX2accp_id4;
wire [31:0]DEMUX2interrupt_en;
wire [31:0]DEMUX2interrupt_clr;
wire [31:0]DEMUX2software_reset;
wire [31:0]DEMUX2mode_select;
wire [31:0]DEMUX2baudrate;
wire [31:0]DEMUX2bittiming;
wire [31:0]rxfifo_id2MUX;
wire [31:0]rxfifo_dlc2MUX;
wire [31:0]rxfifo_dataword12MUX;
wire [31:0]rxfifo_dataword22MUX;
wire [31:0]interruptstat2MUX;
wire [31:0]errorstat2MUX;
wire [31:0]errorcount2MUX;
wire [31:0]status2MUX;
wire DEMUX2addrMUX_ack;
wire MUX2addrMUX_ack;
wire addrMUX2DEMUX_CS;
wire addrMUX2MUX_CS;
wire [7:0]addr_bus;
wire load_data1;
wire deload_data1;
wire [127:0]txfifo_ip;
wire [127:0]TX_FIFO[0:63];
wire [5:0]readcount1;
wire [5:0]writecount1;
wire [5:0]count1;
wire TXFLL;
wire [127:0]txfifo_op;
wire load_data2;
wire deload_data2;
wire [127:0]txhpb_ip;
wire [127:0]TX_HPB;
wire [127:0]txhpb_op;
wire TXBFLL;
wire [127:0]tx_message;
wire filtering_en;
wire [127:0]rxfifo_ip;
wire [12:0]filter1;
wire [12:0]filter2;
wire [12:0]filter3;
wire [12:0]filter4;
wire load_data3;
wire deload_data3;
wire [127:0]RX_FIFO[0:63];
wire [5:0]readcount2;
wire [5:0]writecount2;
wire [5:0]count2;
wire [127:0]rxfifo_op;
wire RXNEMP;
wire ACFBSY;
wire NORMAL;
wire SLEEP;
wire CONFIG;
wire LBACK;
wire RXOFLW;
wire RXUFLW;
wire tx_en;
wire [3:0]state;
wire [3:0]next_state;
wire [3:0]state1;
wire [3:0]next_state1;
wire [3:0]state2;
wire [3:0]next_state2;
wire [7:0]addr_bus1;
wire [3:0]state3;
wire [3:0]next_state3;


 Can_registers block1(sys_clk, 
 IP2Can_CS,
 IP2Can_reset,
 IP2Can_RW,
 IP2Can_data,
 IP2Can_addr,
 Can2IP_data,
 Can2IP_ack,
 Can2IP_interrupt, 
 Can2IP_error,
 DEMUX2Can_CS,
 DEMUX2Can_addr,
 Can2DEMUX_data,
 Can2DEMUX_ack,
 MUX2Can_CS,
 MUX2Can_addr,
 MUX2Can_data,
 Can2MUX_ack,
 tx_fifo_dlc);
 
DEMUX block2(sys_clk,
IP2Can_reset,
addr_bus,
Controller2DEMUX_CS,
DEMUX2Controller_ack,
Can2DEMUX_ack,
Can2DEMUX_data,
DEMUX2Can_CS,
DEMUX2Can_addr,
DEMUX2txfifo_id,
DEMUX2txfifo_dlc,
DEMUX2txfifo_dataword1,
DEMUX2txfifo_dataword2,
DEMUX2txhpb_id,
DEMUX2txhpb_dlc,
DEMUX2txhpb_dataword1,
DEMUX2txhpb_dataword2,
DEMUX2accp_filt,
DEMUX2accp_mask1,
DEMUX2accp_id1,
DEMUX2accp_mask2,
DEMUX2accp_id2,
DEMUX2accp_mask3,
DEMUX2accp_id3,
DEMUX2accp_mask4,
DEMUX2accp_id4,
DEMUX2interrupt_en,
DEMUX2interrupt_clr,
DEMUX2software_reset,
DEMUX2mode_select,
DEMUX2baudrate,
DEMUX2bittiming);

MUX block3(sys_clk,
IP2Can_reset,
Controller2MUX_CS,
MUX2Can_CS,
MUX2Can_addr,
MUX2Can_data,
Can2MUX_ack,
MUX2Controller_ack,
addr_bus1,
rxfifo_id2MUX,
rxfifo_dlc2MUX,
rxfifo_dataword12MUX,
rxfifo_dataword22MUX,
interruptstat2MUX,
errorstat2MUX,
errorcount2MUX,
status2MUX);

Controller_State_Machine block4(sys_clk,
IP2Can_CS,
IP2Can_reset,
IP2Can_addr,
addr_bus,
Controller2DEMUX_CS,
Controller2MUX_CS,
DEMUX2Controller_ack,
MUX2Controller_ack,
interruptstat2MUX,
load_data1,
load_data2,
load_data3,
deload_data1,
deload_data2,
deload_data3,
filtering_en,
tx_en,
count1,
state1,
TXOK,
RXOK,
state2,
addr_bus1,
state3);


Tx_message block5(sys_clk,
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

Rx_message block6(sys_clk,
IP2Can_reset,
rxfifo_id2MUX,
rxfifo_dlc2MUX,
rxfifo_dataword12MUX,
rxfifo_dataword22MUX,
rxfifo_op);

Tx_storage_FIFO block7(sys_clk,
IP2Can_reset,
load_data1,
deload_data1,
txfifo_ip,
txfifo_op,
TXFLL,
count1);

Tx_storage_HPB block8(sys_clk,
load_data2,
deload_data2,
txhpb_ip,
txhpb_op,
TXBFLL);

Rx_storage_FIFO block9(sys_clk,
IP2Can_reset,
load_data3,
deload_data3,
rxfifo_ip,
rxfifo_op,
RXNEMP,
count2);


Tx_priority_logic block10(sys_clk,
txfifo_op,
txhpb_op,
tx_message,
TXBFLL);

Acceptance_filtering block11(sys_clk,
IP2Can_reset,
filtering_en,
rx_message,
rxfifo_ip,
DEMUX2accp_filt,
DEMUX2accp_mask1,
DEMUX2accp_id1,
DEMUX2accp_mask2,
DEMUX2accp_id2,
DEMUX2accp_mask3,
DEMUX2accp_id3,
DEMUX2accp_mask4,
DEMUX2accp_id4,
ACFBSY);





Interrupt_control block13(sys_clk,
WKUP,
SLP,
TXFLL,
TXBFLL,
TXOK,
RXOK,
RXNEMP,
RXOFLW,
RXUFLW,
ARBLST,
BSOFF,
ERROR,
DEMUX2interrupt_en,
DEMUX2interrupt_clr,
interruptstat2MUX);


endmodule
