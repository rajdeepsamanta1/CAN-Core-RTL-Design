`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2022 01:17:13
// Design Name: 
// Module Name: Controller_State_Machine
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

module Controller_State_Machine(sys_clk,
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

input sys_clk;
input IP2Can_CS;
input IP2Can_reset;
input [5:0]count1;
input [7:0]IP2Can_addr;
input DEMUX2Controller_ack;
input MUX2Controller_ack;
input [31:0]interruptstat2MUX;
input TXOK;
input RXOK;
output reg Controller2DEMUX_CS;
output reg Controller2MUX_CS;
output reg [7:0]addr_bus;
output reg [7:0]addr_bus1;
output reg load_data1;
output reg load_data2;
output reg load_data3;
output reg deload_data1;
output reg deload_data2;
output reg deload_data3;
output reg filtering_en;
output reg tx_en;
 reg [3:0]state;
output reg [3:0]state1;
reg [3:0]next_state1;
reg [3:0]next_state;
output reg [3:0]state2;
reg [3:0]next_state2;
output reg [3:0]state3;
reg [3:0]next_state3;
parameter S0=4'd0;
parameter S1=4'd1;
parameter S2=4'd2;
parameter S3=4'd3;
parameter T0=4'd5;
parameter T1=4'd6;
parameter M0=4'd7;
parameter M1=4'd8;
parameter N0=4'd9;
parameter N1=4'd10;
parameter N2=4'd11;
parameter N3=4'd12;


//   state  machine1

always @(posedge sys_clk)
begin

if(IP2Can_reset==1)
state<=S0;

else
state<=next_state;

end

//  computing  outputs of each  state
       
always @(*)
begin

 Controller2DEMUX_CS<=0;
 addr_bus<=8'd0;
 load_data1<=0;
 load_data2<=0;
 
 
 

       case(state)
       
       S0: ;
       
       S1: begin
           Controller2DEMUX_CS<=1;
           addr_bus<=IP2Can_addr;
           end
          
       S2:begin
          Controller2DEMUX_CS<=1;
          addr_bus<=IP2Can_addr;
          end
          
       S3:begin
          if(IP2Can_addr==8'h3C)
          load_data1<=1;
          
           end
          
      
          
       endcase

end

//  computing  next  state  at  each  state

always @(*)
begin

       case(state)
       
       S0: begin
           if(IP2Can_CS==0)
           next_state<=S0;
           
           if(IP2Can_CS==1 &&
              DEMUX2Controller_ack!=1 && 
              (IP2Can_addr==8'h00 ||
               IP2Can_addr==8'h04 ||
               IP2Can_addr==8'h08 ||
               IP2Can_addr==8'h0C ||
               IP2Can_addr==8'h60 ||
               IP2Can_addr==8'h64 ||
               IP2Can_addr==8'h68 ||
               IP2Can_addr==8'h6C ||
               IP2Can_addr==8'h70 ||
               IP2Can_addr==8'h74 ||
               IP2Can_addr==8'h78 ||
               IP2Can_addr==8'h7C ||
               IP2Can_addr==8'h80 ||
               IP2Can_addr==8'h30 ||
               IP2Can_addr==8'h34 ||
               IP2Can_addr==8'h38))
              
              next_state<=S1;
              
            if(IP2Can_CS==1 &&
              DEMUX2Controller_ack!=1 && 
               IP2Can_addr==8'h3C)
              
              next_state<=S2;
              
            
            
            end
            
        S1: begin
            if(DEMUX2Controller_ack==1)
            next_state<=S0;
            end
             
        S2: begin
            if(DEMUX2Controller_ack==1)
            next_state<=S3;
            end
             
        S3: next_state<=S0;
        
         
        default: next_state<=S0;
         
        endcase

end


// state machine2


always @(posedge sys_clk)
begin
if(IP2Can_reset==1)
state1<=T0;
else
state1<=next_state1;
end

// computing outputs of each state

always @(*)
begin
deload_data1<=0;
deload_data2<=0;
tx_en<=0;

case(state1)
   
           T0: ;
           
               
           T1:if(TXOK==1)
               begin
               deload_data1<=1;
               tx_en<=1;
               end
               else
               begin
               deload_data1<=0;
               tx_en<=0;
               end
             
               
             
           
           endcase
end

// computing next states 

always @(*)
begin

case(state1)
           T0: begin
               if(count1>6'd0 && TXOK==1)
               next_state1<=T1;
               else
               next_state1<=T0;
                
               end  
               
            T1:  next_state1<=T0;
            
          
            
           
            
            default: next_state1<=T0;
            
        endcase
        
end


// state machine 3

always @(posedge sys_clk)
begin
if(IP2Can_reset==1)
state2<=M0;
else
state2<=next_state2;
end

// computing outputs

always @(*)
begin
load_data3<=0;
filtering_en<=1;

case(state2)
            M0:;
            M1:load_data3<=1;
            endcase
end

// computing next states

always @(*)
begin
case(state2)
            M0: if(RXOK==1)
                next_state2<=M1;
                else
                next_state2<=M0;
                
            M1: next_state2<=M0;
            endcase
end

// state machine 4

always @(posedge sys_clk)
begin
if(IP2Can_reset==1)
state3<=N0;
else
state3<=next_state3;
end

// computing outputs

always @(*)
begin
Controller2MUX_CS<=0;
addr_bus1<=8'd0;
deload_data3<=0;
case(state3)
            N0:;
            N1:begin
               Controller2MUX_CS<=1;
               addr_bus1<=IP2Can_addr;
               end
            N2:begin
               deload_data3<=1;
               Controller2MUX_CS<=1;
               addr_bus1<=IP2Can_addr;
               end
            N3:begin
               deload_data3<=0;
               Controller2MUX_CS<=1;
               addr_bus1<=IP2Can_addr;
               end
            endcase
end

// computing next states

always @(*)
begin
case(state3)
            N0:begin
                
                if(IP2Can_CS==0)
                next_state3<=N0;
           
                if(IP2Can_CS==1 &&
                MUX2Controller_ack!=1 && 
                (IP2Can_addr==8'h54 ||
                IP2Can_addr==8'h58 ||
                IP2Can_addr==8'h5C ||
                IP2Can_addr==8'h10 ||
                IP2Can_addr==8'h14 ||
                IP2Can_addr==8'h18))
              
                next_state3<=N1;
              
                if(IP2Can_CS==1 &&
                MUX2Controller_ack!=1 && 
                IP2Can_addr==8'h50)
              
                next_state3<=N2;
              
                end
                
       N1: begin
            if(MUX2Controller_ack==1)
            next_state3<=N0;
            end
             
        N2: begin
            
            next_state3<=N3;
            end
             
        N3:if(MUX2Controller_ack==1)
           next_state3<=N0;
        
         
        default: next_state3<=N0;
         
        endcase

end              

endmodule

    

