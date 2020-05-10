`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2020 04:21:22 PM
// Design Name: 
// Module Name: top
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


module top(
input wire CLK,

/**
* Data in = SW[3:0]
* Address = SW[6:4]
* Enable = SW[7]
**/
input wire [6:0] SW,
input wire BTNC,

output wire [6:0] SEG ,
output wire [3:0] AN ,
output wire DP  
);

wire [15:0] RD;

memory mem(
    .CLK(CLK),
    .resetn(SW[7]),
    .address(SW[6:4]),
    .wr_rd(SW[7]),
    .Din(SW[3:0]),
    .Dout(RD[3:0])
);

// 7-segment
assign RD[15:4]  = 12'b000000000000; 
d7seg seg (
    .x(RD),
	.clk(CLK),
	.clr(BTNC),
	.a_to_g(SEG),
	.an(AN),
	.dp(DP)
); 

endmodule
