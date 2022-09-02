`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2022 12:08:05
// Design Name: 
// Module Name: Interrupt_control
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


module Interrupt_control(sys_clk,
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

input sys_clk;
input WKUP;
input SLP;
input TXFLL;
input TXBFLL;
input TXOK;
input RXOK;
input RXNEMP;
input RXOFLW;
input RXUFLW;
input ARBLST;
input BSOFF;
input ERROR;
input [31:0]DEMUX2interrupt_en;
input [31:0]DEMUX2interrupt_clr;
output [31:0]interruptstat2MUX;


assign interruptstat2MUX[11]=WKUP;
assign interruptstat2MUX[10]=SLP;
assign interruptstat2MUX[9]=BSOFF;
assign interruptstat2MUX[8]=ERROR;
assign interruptstat2MUX[7]=RXNEMP;
assign interruptstat2MUX[6]=RXOFLW;
assign interruptstat2MUX[5]=RXUFLW;
assign interruptstat2MUX[4]=RXOK;
assign interruptstat2MUX[3]=TXBFLL;
assign interruptstat2MUX[2]=TXFLL;
assign interruptstat2MUX[1]=TXOK;
assign interruptstat2MUX[0]=ARBLST;



  
endmodule
