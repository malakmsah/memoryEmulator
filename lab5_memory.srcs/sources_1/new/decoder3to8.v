`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2020 02:49:52 PM
// Design Name: 
// Module Name: decoder3to8
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


module decoder3to8(
input wire [2:0] x,
input wire E,
output reg [7:0] y 
);
integer i;

always @(*)
    begin
        if ( E == 1 )
        begin
            for(i = 0; i <= 7; i = i+1)
                begin
                    if(x == i)
                       y[i] = 1;
                    else
                        y[i] = 0;
                end
	    end
	end
endmodule
