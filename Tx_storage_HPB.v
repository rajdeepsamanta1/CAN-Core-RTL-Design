`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2022 12:02:26
// Design Name: 
// Module Name: Tx_storage_HPB
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


module Tx_storage_HPB(sys_clk,
load_data2,
deload_data2,
txhpb_ip,
txhpb_op,
TXBFLL);

input sys_clk;
input load_data2;
input deload_data2;
input [127:0]txhpb_ip;
reg [127:0]TX_HPB;
output reg [127:0]txhpb_op;
output reg TXBFLL=0;



always @(posedge sys_clk)
begin


if(load_data2==1)
begin
    
          TX_HPB<=txhpb_ip;
		  TXBFLL<=1;

end


else if(deload_data2==1)
begin
         txhpb_op<=TX_HPB;
         TXBFLL<=0;
			
end


end

endmodule



