`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2020 09:41:27 PM
// Design Name: 
// Module Name: flipflop
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

module flipflop(
input wire clk ,
input wire clr ,
input wire [3:0] D ,
input wire E,
output reg [3:0] Q 
);

always @(posedge clk or posedge clr)
    if(clr == 1)
	   Q <= 4'b0000;
	else if(E == 1)
	   Q <= D;
endmodule