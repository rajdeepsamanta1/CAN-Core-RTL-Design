`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2022 11:52:04
// Design Name: 
// Module Name: MUX
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


module MUX(sys_clk,
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


input sys_clk;
input IP2Can_reset;
input Can2MUX_ack;
input Controller2MUX_CS;
input [7:0]addr_bus1;
output reg MUX2Can_CS;
output reg MUX2Controller_ack;
output reg [7:0]MUX2Can_addr;
output reg [31:0]MUX2Can_data;
input [31:0]rxfifo_id2MUX;
input [31:0]rxfifo_dlc2MUX;
input [31:0]rxfifo_dataword12MUX;
input [31:0]rxfifo_dataword22MUX;
input [31:0]interruptstat2MUX;
input [31:0]errorstat2MUX;
input [31:0]errorcount2MUX;
input [31:0]status2MUX;


always @(posedge sys_clk)

begin

if(IP2Can_reset==1)
begin
  MUX2Can_CS<=0;
  MUX2Controller_ack<=0;
  MUX2Can_addr<=8'd0;
  MUX2Can_data<=32'd0;
end


else if(IP2Can_reset==0)
begin

  MUX2Can_addr<=addr_bus1;
  MUX2Can_CS<=Controller2MUX_CS;
  MUX2Controller_ack<=Can2MUX_ack;

    if(Controller2MUX_CS==1)
    begin

         case(addr_bus1)

         8'h50: MUX2Can_data<=rxfifo_id2MUX;
		 8'h54: MUX2Can_data<=rxfifo_dlc2MUX;
		 8'h58: MUX2Can_data<=rxfifo_dataword12MUX;
		 8'h5C: MUX2Can_data<=rxfifo_dataword22MUX;
		 8'h18: MUX2Can_data<=status2MUX;
		 8'h1C: MUX2Can_data<=interruptstat2MUX;
		 8'h10: MUX2Can_data<=errorcount2MUX;
		 8'h14: MUX2Can_data<=errorstat2MUX;
		 
		 endcase
		 
     end

     if(Can2MUX_ack==1)
     MUX2Can_CS<=0;


end

end		 

endmodule

    
