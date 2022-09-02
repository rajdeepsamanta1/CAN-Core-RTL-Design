`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2022 11:45:47
// Design Name: 
// Module Name: Can_registers
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


module Can_registers(sys_clk, 
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
 
													
//input outputs between can registers and user interface

input sys_clk;
input IP2Can_CS;
input IP2Can_reset;
input IP2Can_RW;
input [31:0]IP2Can_data;
input [7:0]IP2Can_addr;
output reg [31:0]Can2IP_data;
output reg Can2IP_ack;
output reg Can2IP_interrupt;
output reg Can2IP_error;


// input outputs between can registers and demux

input DEMUX2Can_CS;
input [7:0]DEMUX2Can_addr;
output reg [31:0]Can2DEMUX_data;
output reg Can2DEMUX_ack;

// input outputs between can registers and mux

input MUX2Can_CS;
input [7:0]MUX2Can_addr;
input [31:0]MUX2Can_data;
output reg Can2MUX_ack;

 

reg [31:0]software_reset;
reg [31:0]mode_select;
reg [31:0]baudrate_prescalar;
reg [31:0]bit_timing;
reg [31:0]error_counter;
reg [31:0]error_status;


reg [31:0]status;
reg [31:0]interrupt_status;
reg [31:0]interrupt_enable;
reg [31:0]interrupt_clear;


reg [31:0]tx_fifo_id;
output reg [31:0]tx_fifo_dlc;
reg [31:0]tx_fifo_dataword1;
reg [31:0]tx_fifo_dataword2;
reg [31:0]tx_hpb_id;
reg [31:0]tx_hpb_dlc;
reg [31:0]tx_hpb_dataword1;
reg [31:0]tx_hpb_dataword2;


reg [31:0]rx_fifo_id;
reg [31:0]rx_fifo_dlc;
reg [31:0]rx_fifo_dataword1;
reg [31:0]rx_fifo_dataword2;


reg [31:0]accp_filt;
reg [31:0]accp_filt_mask1;
reg [31:0]accp_filt_id1;
reg [31:0]accp_filt_mask2;
reg [31:0]accp_filt_id2;
reg [31:0]accp_filt_mask3;
reg [31:0]accp_filt_id3;
reg [31:0]accp_filt_mask4;
reg [31:0]accp_filt_id4;


reg [1:0]counta=2'd0;
reg [2:0]countb=3'd0;


always @(posedge sys_clk)
begin


// READ   WRITE   OPERATION   BY   USER   INTERFACE


if(IP2Can_reset==1)
begin

   Can2IP_data<=32'd0;
   Can2IP_error<=0;
   Can2IP_interrupt<=0;
   software_reset<=32'd0;
   mode_select<=32'd0;
   baudrate_prescalar<=32'd0;
   bit_timing<=32'd0;
   error_counter<=32'd0;
   error_status<=32'd0;
   interrupt_enable<=32'd0;
   interrupt_clear<=32'd0;
   tx_fifo_id<=32'd0;
   tx_fifo_dlc<=32'd0;
   tx_fifo_dataword1<=32'd0;
   tx_fifo_dataword2<=32'd0;
   tx_hpb_id<=32'd0;
   tx_hpb_dlc<=32'd0;
   tx_hpb_dataword1<=32'd0;
   tx_hpb_dataword2<=32'd0; 
   accp_filt<=32'd0;
   accp_filt_mask1<=32'd0;
   accp_filt_id1<=32'd0;
   accp_filt_mask2<=32'd0;
   accp_filt_id2<=32'd0;
   accp_filt_mask3<=32'd0;
   accp_filt_id3<=32'd0;
   accp_filt_mask4<=32'd0;
   accp_filt_id4<=32'd0;
   Can2DEMUX_ack<=0;
   Can2MUX_ack<=0;
   Can2DEMUX_data<=32'd0;
   Can2IP_ack<=0;

end

else if(IP2Can_reset==0 && IP2Can_CS==1)

begin

//  WRITE   OPERATION   BY   MICROCONTROLLER 

   if( IP2Can_RW==0)
   begin
             case(IP2Can_addr)
         
			 8'h00: software_reset<=IP2Can_data;
			 8'h04: mode_select<=IP2Can_data;
			 8'h08: baudrate_prescalar<=IP2Can_data;
			 8'h0C: bit_timing<=IP2Can_data;         
			 8'h14: error_status<=IP2Can_data;
			 8'h20: interrupt_enable<=IP2Can_data;
			 8'h24: interrupt_clear<=IP2Can_data;
			 8'h30: tx_fifo_id<=IP2Can_data;
			 8'h34: tx_fifo_dlc<=IP2Can_data;
			 8'h38: tx_fifo_dataword1<=IP2Can_data;
			 8'h3C: tx_fifo_dataword2<=IP2Can_data;             
			 8'h40: tx_hpb_id<=IP2Can_data;
			 8'h44: tx_hpb_dlc<=IP2Can_data;
			 8'h48: tx_hpb_dataword1<=IP2Can_data;
			 8'h4C: tx_hpb_dataword2<=IP2Can_data;
			 8'h60: accp_filt<=IP2Can_data;
			 8'h64: accp_filt_mask1<=IP2Can_data;
             8'h68: accp_filt_id1<=IP2Can_data;
             8'h6C: accp_filt_mask2<=IP2Can_data;
			 8'h70: accp_filt_id2<=IP2Can_data;
             8'h74: accp_filt_mask3<=IP2Can_data; 
			 8'h78: accp_filt_id3<=IP2Can_data;
             8'h7C: accp_filt_mask4<=IP2Can_data;
			 8'h80: accp_filt_id4<=IP2Can_data;
			        				          
		
	         endcase
			 
	        if(IP2Can_addr==8'h00 ||
	           IP2Can_addr==8'h04 ||
		       IP2Can_addr==8'h08 ||
		       IP2Can_addr==8'h0C ||
		       IP2Can_addr==8'h14 ||
		       IP2Can_addr==8'h20 ||
		       IP2Can_addr==8'h24 ||
		       IP2Can_addr==8'h30 ||
		       IP2Can_addr==8'h34 ||
		       IP2Can_addr==8'h38 ||
		       IP2Can_addr==8'h3C ||
		       IP2Can_addr==8'h40 ||
		       IP2Can_addr==8'h44 ||
		       IP2Can_addr==8'h48 ||
		       IP2Can_addr==8'h4C ||
		       IP2Can_addr==8'h60 ||
		       IP2Can_addr==8'h64 ||
		       IP2Can_addr==8'h68 ||
		       IP2Can_addr==8'h6C ||
		       IP2Can_addr==8'h70 ||
		       IP2Can_addr==8'h74 ||
		       IP2Can_addr==8'h78 ||
		       IP2Can_addr==8'h7C ||
		       IP2Can_addr==8'h80) 
		
		
		      Can2IP_ack<=Can2DEMUX_ack;
		
	end
	
	
 //  READ  OPERATION  BY  MICROCONTROLLER	
			 
    if(IP2Can_RW==1)
    begin
			 
             case(IP2Can_addr)
 
             8'h00: Can2IP_data<=software_reset;
			 8'h04: Can2IP_data<=mode_select;
			 8'h08: Can2IP_data<=baudrate_prescalar;
			 8'h0C: Can2IP_data<=bit_timing;
			 8'h10: Can2IP_data<=error_counter;
			 8'h14: Can2IP_data<=error_status;
			 8'h18: Can2IP_data<=status;
			 8'h1C: Can2IP_data<=interrupt_status;
			 8'h20: Can2IP_data<=interrupt_enable;
			 8'h50: Can2IP_data<=rx_fifo_id;
			 8'h54: Can2IP_data<=rx_fifo_dlc;
			 8'h58: Can2IP_data<=rx_fifo_dataword1;
			 8'h5C: Can2IP_data<=rx_fifo_dataword2;
			 8'h60: Can2IP_data<=accp_filt;
			 8'h64: Can2IP_data<=accp_filt_mask1;
			 8'h68: Can2IP_data<=accp_filt_id1;
			 8'h6C: Can2IP_data<=accp_filt_mask2;
			 8'h70: Can2IP_data<=accp_filt_id2;
			 8'h74: Can2IP_data<=accp_filt_mask3;
			 8'h78: Can2IP_data<=accp_filt_id3;
			 8'h7C: Can2IP_data<=accp_filt_mask4;
			 8'h80: Can2IP_data<=accp_filt_id4;
			 8'h24: Can2IP_data<=32'd0;
			 8'h28: Can2IP_data<=32'd0;
			 8'h2C: Can2IP_data<=32'd0;
			 8'h30: Can2IP_data<=32'd0;
			 8'h34: Can2IP_data<=32'd0;
			 8'h38: Can2IP_data<=32'd0;
			 8'h3C: Can2IP_data<=32'd0;
			 8'h40: Can2IP_data<=32'd0;
			 8'h44: Can2IP_data<=32'd0;			 
			 8'h48: Can2IP_data<=32'd0;
			 8'h4C: Can2IP_data<=32'd0;
			 
			 
			 endcase
			  
			  
	       if(IP2Can_addr==8'h00 ||
	          IP2Can_addr==8'h04 ||
		      IP2Can_addr==8'h08 ||
		      IP2Can_addr==8'h0C ||
		      IP2Can_addr==8'h10 ||
		      IP2Can_addr==8'h14 ||
		      IP2Can_addr==8'h18 ||
		      IP2Can_addr==8'h1C ||
		      IP2Can_addr==8'h20 ||
		      IP2Can_addr==8'h24 ||
		      IP2Can_addr==8'h28 ||
		      IP2Can_addr==8'h2C ||
		      IP2Can_addr==8'h30 ||
		      IP2Can_addr==8'h34 ||
		      IP2Can_addr==8'h38 ||
		      IP2Can_addr==8'h3C ||
		      IP2Can_addr==8'h40 ||
		      IP2Can_addr==8'h44 ||
		      IP2Can_addr==8'h48 ||
		      IP2Can_addr==8'h4C ||
		      IP2Can_addr==8'h50 ||
		      IP2Can_addr==8'h54 ||
		      IP2Can_addr==8'h58 ||
		      IP2Can_addr==8'h5C ||
		      IP2Can_addr==8'h60 ||
		      IP2Can_addr==8'h64 ||
		      IP2Can_addr==8'h68 ||
		      IP2Can_addr==8'h6C ||
		      IP2Can_addr==8'h70 ||
		      IP2Can_addr==8'h74 ||
		      IP2Can_addr==8'h78 ||
		      IP2Can_addr==8'h7C ||
		      IP2Can_addr==8'h80 ) 
		
		
		     Can2IP_ack<=Can2MUX_ack;
		
		
     end


//  READ  OPERATION  BY  DEMUX  

   if(DEMUX2Can_CS==1)

   begin

                case(DEMUX2Can_addr)

                 8'h30: Can2DEMUX_data<=tx_fifo_id;
				 8'h34: Can2DEMUX_data<=tx_fifo_dlc;
				 8'h38: Can2DEMUX_data<=tx_fifo_dataword1;
				 8'h3C: Can2DEMUX_data<=tx_fifo_dataword2;
				 8'h40: Can2DEMUX_data<=tx_hpb_id;
				 8'h44: Can2DEMUX_data<=tx_hpb_dlc;
				 8'h48: Can2DEMUX_data<=tx_hpb_dataword1;
				 8'h4C: Can2DEMUX_data<=tx_hpb_dataword2;
				 8'h60: Can2DEMUX_data<=accp_filt;
				 8'h64: Can2DEMUX_data<=accp_filt_mask1;
				 8'h68: Can2DEMUX_data<=accp_filt_id1;
				 8'h6C: Can2DEMUX_data<=accp_filt_mask2;
				 8'h70: Can2DEMUX_data<=accp_filt_id2;
				 8'h74: Can2DEMUX_data<=accp_filt_mask3;
				 8'h78: Can2DEMUX_data<=accp_filt_id3;
				 8'h7C: Can2DEMUX_data<=accp_filt_mask4;
				 8'h80: Can2DEMUX_data<=accp_filt_id4;
				 8'h20: Can2DEMUX_data<=interrupt_enable;
				 8'h24: Can2DEMUX_data<=interrupt_clear;
				 8'h00: Can2DEMUX_data<=software_reset;
				 8'h04: Can2DEMUX_data<=mode_select;
				 8'h08: Can2DEMUX_data<=baudrate_prescalar;
				 8'h0C: Can2DEMUX_data<=bit_timing;
				 
				 endcase
				 
               if((DEMUX2Can_addr==8'h30)||
                  (DEMUX2Can_addr==8'h34)||
	              (DEMUX2Can_addr==8'h38)||
	              (DEMUX2Can_addr==8'h3C)||
	              (DEMUX2Can_addr==8'h40)||
	              (DEMUX2Can_addr==8'h44)||
	              (DEMUX2Can_addr==8'h48)||
	              (DEMUX2Can_addr==8'h4C)||
	              (DEMUX2Can_addr==8'h60)||
	              (DEMUX2Can_addr==8'h64)||
	              (DEMUX2Can_addr==8'h68)||
	              (DEMUX2Can_addr==8'h6C)||
	              (DEMUX2Can_addr==8'h70)||
	              (DEMUX2Can_addr==8'h74)||
	              (DEMUX2Can_addr==8'h78)||
	              (DEMUX2Can_addr==8'h7C)||
	              (DEMUX2Can_addr==8'h80)||
	              (DEMUX2Can_addr==8'h20)||
	              (DEMUX2Can_addr==8'h24)||
	              (DEMUX2Can_addr==8'h00)||
	              (DEMUX2Can_addr==8'h04)||
	              (DEMUX2Can_addr==8'h08)||
	              (DEMUX2Can_addr==8'h0C))
	
	               begin
		                counta<=counta+1;
		                if(counta==2'd1)
		                Can2DEMUX_ack<=1;
		                if(counta==2'd2)
		                Can2DEMUX_ack<=0;
		           end
		
    end

//  WRITE  OPERATION  BY  MUX  MODULE

   if(MUX2Can_CS==1)

   begin

               case(MUX2Can_addr)

                8'h50: rx_fifo_id<=MUX2Can_data;
				8'h54: rx_fifo_dlc<=MUX2Can_data;
				8'h58: rx_fifo_dataword1<=MUX2Can_data;
				8'h5C: rx_fifo_dataword2<=MUX2Can_data;
				8'h18: status<=MUX2Can_data;
				8'h1C: interrupt_status<=MUX2Can_data;
				8'h10: error_counter<=MUX2Can_data;
				8'h14: error_status<=MUX2Can_data;
				
	            endcase
								
               if((MUX2Can_addr==8'h50)||
                  (MUX2Can_addr==8'h54)||
	              (MUX2Can_addr==8'h58)||
	              (MUX2Can_addr==8'h5C)||
	              (MUX2Can_addr==8'h18)||
	              (MUX2Can_addr==8'h1C)||
	              (MUX2Can_addr==8'h10)||
	              (MUX2Can_addr==8'h14))
	
	              begin
		               countb<=countb+1;
		               if(countb==3'd3)
		               Can2MUX_ack<=1;
		               if(countb==3'd4)
		               Can2MUX_ack<=0;
		           end
	

    end

	
end


if(DEMUX2Can_CS==0)
counta<=2'd0;

if(MUX2Can_CS==0)
countb<=3'd0;


if((interrupt_enable[11]==1 && interrupt_status[11]==1) ||
   (interrupt_enable[10]==1 && interrupt_status[10]==1) ||
   (interrupt_enable[9]==1 && interrupt_status[9]==1)   ||
   (interrupt_enable[8]==1 && interrupt_status[8]==1)   ||
   (interrupt_enable[7]==1 && interrupt_status[7]==1)   ||
   (interrupt_enable[6]==1 && interrupt_status[6]==1)   ||
   (interrupt_enable[5]==1 && interrupt_status[5]==1)   ||
   (interrupt_enable[4]==1 && interrupt_status[4]==1)   ||
   (interrupt_enable[3]==1 && interrupt_status[3]==1)   ||
   (interrupt_enable[2]==1 && interrupt_status[2]==1)   ||
   (interrupt_enable[1]==1 && interrupt_status[1]==1)   ||
   (interrupt_enable[0]==1 && interrupt_status[0]==1))
	
	Can2IP_interrupt<=1;
	
	
else if((interrupt_enable[11]==0 && interrupt_status[11]==1) ||
        (interrupt_enable[10]==0 && interrupt_status[10]==1) ||
	    (interrupt_enable[9]==0 && interrupt_status[9]==1)   ||
	    (interrupt_enable[8]==0 && interrupt_status[8]==1)   ||
	    (interrupt_enable[7]==0 && interrupt_status[7]==1)   ||
	    (interrupt_enable[6]==0 && interrupt_status[6]==1)   ||
	    (interrupt_enable[5]==0 && interrupt_status[5]==1)   ||
	    (interrupt_enable[4]==0 && interrupt_status[4]==1)   ||
        (interrupt_enable[3]==0 && interrupt_status[3]==1)   ||
        (interrupt_enable[2]==0 && interrupt_status[2]==1)   ||
        (interrupt_enable[1]==0 && interrupt_status[1]==1)   ||
        (interrupt_enable[0]==0 && interrupt_status[0]==1)   ||
        (interrupt_enable[11]==1 && interrupt_status[11]==0) ||
        (interrupt_enable[10]==1 && interrupt_status[10]==0) ||
        (interrupt_enable[9]==1 && interrupt_status[9]==0)   ||
        (interrupt_enable[8]==1 && interrupt_status[8]==0)   ||
        (interrupt_enable[7]==1 && interrupt_status[7]==0)   ||
        (interrupt_enable[6]==1 && interrupt_status[6]==0)   ||
        (interrupt_enable[5]==1 && interrupt_status[5]==0)   ||
        (interrupt_enable[4]==1 && interrupt_status[4]==0)   ||
        (interrupt_enable[3]==1 && interrupt_status[3]==0)   ||
        (interrupt_enable[2]==1 && interrupt_status[2]==0)   ||
        (interrupt_enable[1]==1 && interrupt_status[1]==0)   ||
        (interrupt_enable[0]==1 && interrupt_status[0]==0))
		  
		  
	    Can2IP_interrupt<=0;
	


end


endmodule






   



    

