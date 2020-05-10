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
input wire [7:0] SW, // Data in = SW[3:0] , Address = SW[6:4] , wr_rd = SW[7]
input wire BTNC,

output wire [3:0] LED,
output CA,CB,CC,CD,CE,CF,CG,
output wire [7:0] AN ,
output wire DP  
);
 
wire [3:0] x;

memory mem1(
    .CLK(CLK),
    .resetn(BTNC),
    .address(SW[6:4]),
    .wr_rd(SW[7]),
    .Din(SW[3:0]),
    .Dout(x[3:0])
);

assign LED = x[3:0];

assign AN = 8'b11111110;	   // all digits on
assign DP = 1; 		   // dp off

// 7-segment
d7seg seg1 (
    .x(x[3:0]),
	.a_to_g({CA,CB,CC,CD,CE,CF,CG})
); 

endmodule
