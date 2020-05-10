`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2020 07:56:36 PM
// Design Name: 
// Module Name: memory
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


module memory(
input wire CLK,
input wire resetn,
input wire [2:0] address,
input wire wr_rd,
input wire [3:0] Din,

output wire [3:0] Dout
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
    
assign EInverted = ~ wr_rd;

// Decode Address
decoder3to8 d38(.x(address), .E(wr_rd), .y(decodedAddress) );

// Each momery block is save in a flip flop
flipflop f0(.clk(CLK), .clr(resetn), .D(Din), .E(decodedAddress[0]), .Q(Q0) );
flipflop f1(.clk(CLK), .clr(resetn), .D(Din), .E(decodedAddress[1]), .Q(Q1) );
flipflop f2(.clk(CLK), .clr(resetn), .D(Din), .E(decodedAddress[2]), .Q(Q2) );
flipflop f3(.clk(CLK), .clr(resetn), .D(Din), .E(decodedAddress[3]), .Q(Q3) );
flipflop f4(.clk(CLK), .clr(resetn), .D(Din), .E(decodedAddress[4]), .Q(Q4) );
flipflop f5(.clk(CLK), .clr(resetn), .D(Din), .E(decodedAddress[5]), .Q(Q5) );
flipflop f6(.clk(CLK), .clr(resetn), .D(Din), .E(decodedAddress[6]), .Q(Q6) );
flipflop f7(.clk(CLK), .clr(resetn), .D(Din), .E(decodedAddress[7]), .Q(Q7) );

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
.sel(address),
.E(EInverted),
.data(Dout)
);

endmodule
