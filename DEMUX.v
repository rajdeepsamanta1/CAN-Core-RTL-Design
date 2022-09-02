`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2022 11:50:11
// Design Name: 
// Module Name: DEMUX
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


module DEMUX(sys_clk,
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

input sys_clk;
input IP2Can_reset;
input [31:0]Can2DEMUX_data;
input [7:0]addr_bus;
input Controller2DEMUX_CS;
input Can2DEMUX_ack;
output reg [7:0]DEMUX2Can_addr;
output reg DEMUX2Controller_ack;
output reg DEMUX2Can_CS;
output reg [31:0]DEMUX2txfifo_id;
output reg [31:0]DEMUX2txfifo_dlc;
output reg [31:0]DEMUX2txfifo_dataword1;
output reg [31:0]DEMUX2txfifo_dataword2;
output reg [31:0]DEMUX2txhpb_id;
output reg [31:0]DEMUX2txhpb_dlc;
output reg [31:0]DEMUX2txhpb_dataword1;
output reg [31:0]DEMUX2txhpb_dataword2;
output reg [31:0]DEMUX2accp_filt;
output reg [31:0]DEMUX2accp_mask1;
output reg [31:0]DEMUX2accp_id1;
output reg [31:0]DEMUX2accp_mask2;
output reg [31:0]DEMUX2accp_id2;
output reg [31:0]DEMUX2accp_mask3;
output reg [31:0]DEMUX2accp_id3;
output reg [31:0]DEMUX2accp_mask4;
output reg [31:0]DEMUX2accp_id4;
output reg [31:0]DEMUX2interrupt_en;
output reg [31:0]DEMUX2interrupt_clr;
output reg [31:0]DEMUX2software_reset;
output reg [31:0]DEMUX2mode_select;
output reg [31:0]DEMUX2baudrate;
output reg [31:0]DEMUX2bittiming;




always @(posedge sys_clk)

begin

if(IP2Can_reset==1)
begin

  DEMUX2txfifo_id<=32'd0;
  DEMUX2txfifo_dlc<=32'd0;
  DEMUX2txfifo_dataword1<=32'd0;
  DEMUX2txfifo_dataword2<=32'd0;
  DEMUX2txhpb_id<=32'd0;
  DEMUX2txhpb_dlc<=32'd0;
  DEMUX2txhpb_dataword1<=32'd0;
  DEMUX2txhpb_dataword2<=32'd0;
  DEMUX2accp_filt<=32'd0;
  DEMUX2accp_mask1<=32'd0;
  DEMUX2accp_id1<=32'd0;
  DEMUX2accp_mask2<=32'd0;
  DEMUX2accp_id2<=32'd0;
  DEMUX2accp_mask3<=32'd0;
  DEMUX2accp_id3<=32'd0;
  DEMUX2accp_mask4<=32'd0;
  DEMUX2accp_id4<=32'd0;
  DEMUX2interrupt_en<=32'd0;
  DEMUX2interrupt_clr<=32'd0;
  DEMUX2software_reset<=32'd0;
  DEMUX2mode_select<=32'd0;
  DEMUX2baudrate<=32'd0;
  DEMUX2bittiming<=32'd0;
  DEMUX2Can_addr<=8'd0;
  DEMUX2Can_CS<=0;
  DEMUX2Controller_ack<=0;

end


else if(IP2Can_reset==0)

begin
    if(Controller2DEMUX_CS==1 && DEMUX2Controller_ack!=1)
    DEMUX2Can_CS<=1;
    DEMUX2Can_addr<=addr_bus;
    DEMUX2Controller_ack<=Can2DEMUX_ack;

    if(Controller2DEMUX_CS==1)
    begin

                 case(addr_bus)

                 8'h30:DEMUX2txfifo_id<=Can2DEMUX_data;
				 8'h34:DEMUX2txfifo_dlc<=Can2DEMUX_data;
				 8'h38:DEMUX2txfifo_dataword1<=Can2DEMUX_data;
				 8'h3C:DEMUX2txfifo_dataword2<=Can2DEMUX_data;
				 8'h40:DEMUX2txhpb_id<=Can2DEMUX_data;
				 8'h44:DEMUX2txhpb_dlc<=Can2DEMUX_data;
				 8'h48:DEMUX2txhpb_dataword1<=Can2DEMUX_data;
				 8'h4C:DEMUX2txhpb_dataword2<=Can2DEMUX_data;
				 8'h60:DEMUX2accp_filt<=Can2DEMUX_data;
				 8'h64:DEMUX2accp_mask1<=Can2DEMUX_data;
				 8'h68:DEMUX2accp_id1<=Can2DEMUX_data;
				 8'h6C:DEMUX2accp_mask2<=Can2DEMUX_data;
				 8'h70:DEMUX2accp_id2<=Can2DEMUX_data;
				 8'h74:DEMUX2accp_mask3<=Can2DEMUX_data;
				 8'h78:DEMUX2accp_id3<=Can2DEMUX_data;
				 8'h7C:DEMUX2accp_mask4<=Can2DEMUX_data;
				 8'h80:DEMUX2accp_id4<=Can2DEMUX_data;
				 8'h00:DEMUX2software_reset<=Can2DEMUX_data;
				 8'h04:DEMUX2mode_select<=Can2DEMUX_data;
				 8'h08:DEMUX2baudrate<=Can2DEMUX_data;
				 8'h0C:DEMUX2bittiming<=Can2DEMUX_data;
				 8'h20:DEMUX2interrupt_en<=Can2DEMUX_data;
				 8'h24:DEMUX2interrupt_clr<=Can2DEMUX_data;
				 
				 
				 endcase
	
       end

if(Can2DEMUX_ack==1)
DEMUX2Can_CS<=0;

end

end	

endmodule

