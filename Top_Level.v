`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.08.2022 19:42:01
// Design Name: 
// Module Name: Top_Level
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


module Top_Level(sys_clk,
//baud_clk,
//tx_message,
//rx_message,
tx,
rx,
indicator1,
indicator2,
indicator3,
indicator4,
indicator5,
frame_indicator);
//Can2DEMUX_data,
//Bus2IP_reset,
//Bus2IP_CS,
//Bus2IP_RW,
//Bus2IP_addr,
//Bus2IP_data,
//IP2Can_reset,
//IP2Can_CS,
//IP2Can_RW,
//IP2Can_data,
//IP2Can_addr,
//Can2IP_ack,
//IP2Bus_ack,
//tx_fifo_dlc,
//Controller2DEMUX_CS,
//addr_bus,
//DEMUX2Can_CS,
//DEMUX2Can_addr,
//Can2DEMUX_data,
//Can2DEMUX_ack,
//DEMUX2Controller_ack,
//DEMUX2txfifo_dlc,
//txfifo_ip,
//txfifo_op,
//state1,
//count1,
//tx_en,
//TXOK,
//count2,
//state2,
//RXOK,
//state3,
//MUX2Can_CS,
//MUX2Can_addr,
//MUX2Can_data,
//Can2MUX_ack,
//MUX2Controller_ack,
//rxfifo_ip,
//filter2,
//message,
//Can2IP_data,
//rxfifo_op,
//message1,
//IP2Bus_data);

input sys_clk;
//output [127:0]tx_message;
//output [127:0]rx_message;
output tx;
output rx;
//output baud_clk;
output indicator1;
output indicator2;
output indicator3;
output indicator4;
output indicator5;
output frame_indicator;
//output [31:0]Can2DEMUX_data;
//output [127:0]tx_message;
//output [127:0]rx_message;
//output Bus2IP_reset;
//output IP2Can_reset;
//output Bus2IP_CS;
//output Bus2IP_RW;
//output [7:0]Bus2IP_addr;
//output [31:0]Bus2IP_data;
//output IP2Can_CS;
//output IP2Can_RW;
//output [31:0]IP2Can_data;
//output [7:0]IP2Can_addr;
//output [31:0]tx_fifo_dlc;
//output Can2IP_ack;
//output IP2Bus_ack;
//output [31:0]tx_fifo_dlc;
//output Controller2DEMUX_CS;
//output [7:0]addr_bus;
//output DEMUX2Can_CS;
//output [7:0]DEMUX2Can_addr;
//output [31:0]Can2DEMUX_data;
//output Can2DEMUX_ack;
//output DEMUX2Controller_ack;
//output [31:0]DEMUX2txfifo_dlc;
//output [127:0]txfifo_ip;
//output [127:0]txfifo_op;
//output [127:0]rxfifo_ip;
//output [12:0]filter2;
//output [127:0]message;
//output [31:0]message1;
//output [31:0]Can2IP_data;
//output [127:0]rxfifo_op;
//output [31:0]IP2Bus_data;
//output [3:0]state1;
//output [5:0]count1;
//output tx_en;
//output TXOK;
//output [5:0]count2;
//output [3:0]state2;
//output RXOK;
//output [3:0]state3;
//output MUX2Can_CS;
//output [7:0]MUX2Can_addr;
//output [31:0]MUX2Can_data;
//output Can2MUX_ack;
//output MUX2Controller_ack;


wire Bus2IP_reset;
wire Bus2IP_CS;
wire Bus2IP_RW;
wire [31:0]Bus2IP_data;
wire [7:0]Bus2IP_addr;
wire [31:0]IP2Bus_data;
wire IP2Bus_ack;
wire IP2Bus_interrupt;
wire IP2Bus_error;
wire IP2Can_reset;
wire IP2Can_CS;
wire IP2Can_RW;
wire [31:0]IP2Can_data;
wire [7:0]IP2Can_addr;
wire [31:0]Can2IP_data;
wire Can2IP_ack;
wire Can2IP_interrupt;
wire Can2IP_error;

wire indicator1;
wire indicator2;
wire indicator3;
wire indicator4;
wire indicator5;
wire [127:0]message1;
wire [127:0]message2;
wire [127:0]message3;
wire [127:0]message4;
wire [127:0]message5;
wire [127:0]message;

wire [20:0]count;
wire tx_en;
wire frame_indicator;
wire tx;
wire [127:0]tx_message;
wire [127:0]rx_message;
wire TXOK;
wire RXOK;
wire [7:0]weight;
wire [31:0]DEMUX2baudrate;



External_Microcontroller block0(sys_clk,
Bus2IP_reset,
Bus2IP_CS,
Bus2IP_RW,
Bus2IP_data,
Bus2IP_addr,
IP2Bus_data,
IP2Bus_ack,
IP2Bus_interrupt,
IP2Bus_error,
indicator1,
indicator2,
indicator3,
indicator4,
indicator5);

Can_User_Interface block1(sys_clk, 
Bus2IP_reset,
Bus2IP_CS,
Bus2IP_RW,
Bus2IP_data,
Bus2IP_addr,
IP2Bus_data,
IP2Bus_ack,
IP2Bus_interrupt,
IP2Bus_error,
IP2Can_reset,
IP2Can_CS,
IP2Can_RW,
IP2Can_data,
IP2Can_addr,
Can2IP_data,
Can2IP_ack,
Can2IP_interrupt,
Can2IP_error);

Can_Object_layer block2(sys_clk,
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



Can_Transfer_layer block3(sys_clk,
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

assign rx=tx;

endmodule
