`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.08.2022 19:37:09
// Design Name: 
// Module Name: Can_User_Interface
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


module Can_User_Interface(sys_clk,
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

// input outputs between microcontroller and user interface

input sys_clk;
input Bus2IP_reset;
input Bus2IP_CS;
input Bus2IP_RW;
input [31:0]Bus2IP_data;
input [7:0]Bus2IP_addr;
output reg [31:0]IP2Bus_data;
output reg IP2Bus_ack;
output reg IP2Bus_interrupt;
output reg IP2Bus_error;
   
// input outputs between user interface and can controller

output reg IP2Can_reset;
output reg IP2Can_CS;
output reg IP2Can_RW;
output reg [31:0]IP2Can_data;
output reg [7:0]IP2Can_addr;
input [31:0]Can2IP_data;
input Can2IP_ack;
input Can2IP_interrupt;
input Can2IP_error;


// user interface task

always @(posedge sys_clk)
begin

if(Bus2IP_reset==1)
begin

  IP2Can_reset<=Bus2IP_reset;
  IP2Bus_ack<=0;
  IP2Bus_interrupt<=0;
  IP2Bus_error<=0;

end

else if(Bus2IP_reset==0)
begin

  IP2Can_reset<=Bus2IP_reset;
  IP2Can_RW<=Bus2IP_RW;
  IP2Can_addr<=Bus2IP_addr;
  IP2Can_data<=Bus2IP_data;
  IP2Bus_data<=Can2IP_data;
  IP2Bus_ack<=Can2IP_ack;
  IP2Bus_interrupt<=Can2IP_interrupt;
  IP2Bus_error<=Can2IP_error;


   if(Bus2IP_CS==1 && IP2Bus_ack==0)
   IP2Can_CS<=1;

   if(Can2IP_ack==1)
   IP2Can_CS<=0;

end

end


endmodule

