`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2022 12:05:59
// Design Name: 
// Module Name: Tx_priority_logic
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


module Tx_priority_logic(sys_clk,
txfifo_op,
txhpb_op,
tx_message,
TXBFLL);
   
input sys_clk;
input [127:0]txfifo_op;
input [127:0]txhpb_op;
input TXBFLL;
output reg [127:0]tx_message;

always @(posedge sys_clk)
begin

 tx_message <= TXBFLL ? txhpb_op : txfifo_op;

end

endmodule

  
