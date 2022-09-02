`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2022 12:06:43
// Design Name: 
// Module Name: Acceptance_filtering
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


module Acceptance_filtering(sys_clk,
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


input sys_clk;
input IP2Can_reset;
input filtering_en;
input [127:0]rx_message;
output reg [127:0]rxfifo_ip;
input [31:0]DEMUX2accp_filt;
input [31:0]DEMUX2accp_mask1;
input [31:0]DEMUX2accp_id1;
input [31:0]DEMUX2accp_mask2;
input [31:0]DEMUX2accp_id2;
input [31:0]DEMUX2accp_mask3;
input [31:0]DEMUX2accp_id3;
input [31:0]DEMUX2accp_mask4;
input [31:0]DEMUX2accp_id4;
output ACFBSY;
reg [12:0]filter1;
reg [12:0]filter2;
reg [12:0]filter3;
reg [12:0]filter4;
   

always @(posedge sys_clk)
begin

if(IP2Can_reset==1)
begin

filter1<=13'd0;
filter1<=13'd0;
filter1<=13'd0;
filter1<=13'd0;

end

else if (IP2Can_reset==0)

begin

// generating filter1

   if(DEMUX2accp_mask1[31]==1)
   filter1[12]<=DEMUX2accp_id1[31];

   if(DEMUX2accp_mask1[30]==1)
   filter1[11]<=DEMUX2accp_id1[30];

   if(DEMUX2accp_mask1[29]==1)
   filter1[10]<=DEMUX2accp_id1[29];

   if(DEMUX2accp_mask1[28]==1)
   filter1[9]<=DEMUX2accp_id1[28];

   if(DEMUX2accp_mask1[27]==1)
   filter1[8]<=DEMUX2accp_id1[27];

   if(DEMUX2accp_mask1[26]==1)
   filter1[7]<=DEMUX2accp_id1[26];

   if(DEMUX2accp_mask1[25]==1)
   filter1[6]<=DEMUX2accp_id1[25];

   if(DEMUX2accp_mask1[24]==1)
   filter1[5]<=DEMUX2accp_id1[24];

   if(DEMUX2accp_mask1[23]==1)
   filter1[4]<=DEMUX2accp_id1[23];

   if(DEMUX2accp_mask1[22]==1)
   filter1[3]<=DEMUX2accp_id1[22];

   if(DEMUX2accp_mask1[21]==1)
   filter1[2]<=DEMUX2accp_id1[21];

   if(DEMUX2accp_mask1[20]==1)
   filter1[1]<=DEMUX2accp_id1[20];

   if(DEMUX2accp_mask1[19]==1)
   filter1[0]<=DEMUX2accp_id1[19];


// generating filter2


   if(DEMUX2accp_mask2[31]==1)
   filter2[12]<=DEMUX2accp_id2[31];

   if(DEMUX2accp_mask2[30]==1)
   filter2[11]<=DEMUX2accp_id2[30];

   if(DEMUX2accp_mask2[29]==1)
   filter2[10]<=DEMUX2accp_id2[29];

   if(DEMUX2accp_mask2[28]==1)
   filter2[9]<=DEMUX2accp_id2[28];

   if(DEMUX2accp_mask2[27]==1)
   filter2[8]<=DEMUX2accp_id2[27];

   if(DEMUX2accp_mask2[26]==1)
   filter2[7]<=DEMUX2accp_id2[26];

   if(DEMUX2accp_mask2[25]==1)
   filter2[6]<=DEMUX2accp_id2[25];

   if(DEMUX2accp_mask2[24]==1)
   filter2[5]<=DEMUX2accp_id2[24];

   if(DEMUX2accp_mask2[23]==1)
   filter2[4]<=DEMUX2accp_id2[23];

   if(DEMUX2accp_mask2[22]==1)
   filter2[3]<=DEMUX2accp_id2[22];

   if(DEMUX2accp_mask2[21]==1)
   filter2[2]<=DEMUX2accp_id2[21];

   if(DEMUX2accp_mask2[20]==1)
   filter2[1]<=DEMUX2accp_id2[20];

   if(DEMUX2accp_mask2[19]==1)
   filter2[0]<=DEMUX2accp_id2[19];


// generating filter3

   if(DEMUX2accp_mask3[31]==1)
   filter3[12]<=DEMUX2accp_id3[31];

   if(DEMUX2accp_mask3[30]==1)
   filter3[11]<=DEMUX2accp_id3[30];

   if(DEMUX2accp_mask3[29]==1)
   filter3[10]<=DEMUX2accp_id3[29];

   if(DEMUX2accp_mask3[28]==1)
   filter3[9]<=DEMUX2accp_id3[28];

   if(DEMUX2accp_mask3[27]==1)
   filter3[8]<=DEMUX2accp_id3[27];

   if(DEMUX2accp_mask3[26]==1)
   filter3[7]<=DEMUX2accp_id3[26];

   if(DEMUX2accp_mask3[25]==1)
   filter3[6]<=DEMUX2accp_id3[25];

  if(DEMUX2accp_mask3[24]==1)
  filter3[5]<=DEMUX2accp_id3[24];

  if(DEMUX2accp_mask3[23]==1)
  filter3[4]<=DEMUX2accp_id3[23];

  if(DEMUX2accp_mask3[22]==1)
  filter3[3]<=DEMUX2accp_id3[22];

  if(DEMUX2accp_mask3[21]==1)
  filter3[2]<=DEMUX2accp_id3[21];

  if(DEMUX2accp_mask3[20]==1)
  filter3[1]<=DEMUX2accp_id3[20];

  if(DEMUX2accp_mask3[19]==1)
  filter3[0]<=DEMUX2accp_id3[19];


// generating filter4

  if(DEMUX2accp_mask4[31]==1)
  filter4[12]<=DEMUX2accp_id4[31];

  if(DEMUX2accp_mask4[30]==1)
  filter4[11]<=DEMUX2accp_id4[30];

  if(DEMUX2accp_mask4[29]==1)
  filter4[10]<=DEMUX2accp_id4[29];

  if(DEMUX2accp_mask4[28]==1)
  filter4[9]<=DEMUX2accp_id4[28];

  if(DEMUX2accp_mask4[27]==1)
  filter4[8]<=DEMUX2accp_id4[27];

  if(DEMUX2accp_mask4[26]==1)
  filter4[7]<=DEMUX2accp_id4[26];

  if(DEMUX2accp_mask4[25]==1)
  filter4[6]<=DEMUX2accp_id4[25];

  if(DEMUX2accp_mask4[24]==1)
  filter4[5]<=DEMUX2accp_id4[24];

  if(DEMUX2accp_mask4[23]==1)
  filter4[4]<=DEMUX2accp_id4[23];

  if(DEMUX2accp_mask4[22]==1)
  filter4[3]<=DEMUX2accp_id4[22];

  if(DEMUX2accp_mask4[21]==1)
  filter4[2]<=DEMUX2accp_id4[21];

  if(DEMUX2accp_mask4[20]==1)
  filter4[1]<=DEMUX2accp_id4[20];

  if(DEMUX2accp_mask4[19]==1)
  filter4[0]<=DEMUX2accp_id4[19];


  if(filtering_en==1)
  begin

        if(DEMUX2accp_filt[0]==0)
        rxfifo_ip<=rx_message;

        else if(DEMUX2accp_filt[0]==1 && DEMUX2accp_filt[1]==0 && DEMUX2accp_filt[2]==0 && DEMUX2accp_filt[3]==0)
        begin

            if(rx_message[127:115]==filter1)
            rxfifo_ip<=rx_message;

        end

        else if(DEMUX2accp_filt[1]==1 && DEMUX2accp_filt[0]==1 && DEMUX2accp_filt[2]==0 && DEMUX2accp_filt[3]==0)
        begin

           if(rx_message[127:115]==filter1 &&
           rx_message[127:115]==filter2)
	
	      rxfifo_ip<=rx_message;
	
         end


        else if(DEMUX2accp_filt[2]==1 && DEMUX2accp_filt[1]==1 && DEMUX2accp_filt[0]==1 && DEMUX2accp_filt[3]==0)
        begin

             if(rx_message[127:115]==filter1 &&
                rx_message[127:115]==filter2 &&
	            rx_message[127:115]==filter3)
	
	            rxfifo_ip<=rx_message;
	
        end

        else if(DEMUX2accp_filt[3]==1 && DEMUX2accp_filt[2]==1 && DEMUX2accp_filt[1]==1 && DEMUX2accp_filt[0]==1)
        begin

            if(rx_message[127:115]==filter1 &&
               rx_message[127:115]==filter2 &&
	           rx_message[127:115]==filter3 && 
	           rx_message[127:115]==filter4)
	
	           rxfifo_ip<=rx_message;
	
        end


  end

end

end

endmodule

    
