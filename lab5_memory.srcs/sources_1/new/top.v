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
input wire resetn,

output wire [6:0] SEG ,
output wire [3:0] AN ,
output wire DP  
);

wire [7:0] decodedAddress;
wire [3:0] Q0;
wire [3:0] Q1;
wire [3:0] Q2;
wire [3:0] Q3;
wire [3:0] Q4;
wire [3:0] Q5;
wire [3:0] Q6;
wire [3:0] Q7;
wire EInverted;
wire [15:0] RD;


assign EInverted = ~ SW[7];

assign RD[15:4]  = 12'b000000000000; 


// Decode Address
decoder3to8 d38(.x(SW[6:4]), .E(SW[7]), .y(decodedAddress) );

// Each momery block is save in a flip flop
flipflop f0(.clk(CLK), .clr(BTNC), .D(SW[3:0]), .E(decodedAddress[0]), .Q(Q0) );
flipflop f1(.clk(CLK), .clr(BTNC), .D(SW[3:0]), .E(decodedAddress[1]), .Q(Q1) );
flipflop f2(.clk(CLK), .clr(BTNC), .D(SW[3:0]), .E(decodedAddress[2]), .Q(Q2) );
flipflop f3(.clk(CLK), .clr(BTNC), .D(SW[3:0]), .E(decodedAddress[3]), .Q(Q3) );
flipflop f4(.clk(CLK), .clr(BTNC), .D(SW[3:0]), .E(decodedAddress[4]), .Q(Q4) );
flipflop f5(.clk(CLK), .clr(BTNC), .D(SW[3:0]), .E(decodedAddress[5]), .Q(Q5) );
flipflop f6(.clk(CLK), .clr(BTNC), .D(SW[3:0]), .E(decodedAddress[6]), .Q(Q6) );
flipflop f7(.clk(CLK), .clr(BTNC), .D(SW[3:0]), .E(decodedAddress[7]), .Q(Q7) );

// Mux
mux8to1 mux(
.memoryBlock0(Q0),
.memoryBlock1(Q1),
.memoryBlock2(Q2),
.memoryBlock3(Q3),
.memoryBlock4(Q4),
.memoryBlock5(Q5),
.memoryBlock6(Q6),
.memoryBlock7(Q7),
.sel(SW[6:4]),
.E(EInverted),
.data(RD[3:0])
);

// 7-segment
d7seg seg (
    .x(RD),
	.clk(CLK),
	.clr(BTNC),
	.a_to_g(SEG),
	.an(AN),
	.dp(DP)
); 
endmodule
