`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2020 10:25:27 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb();
    
    
// declare variables
reg clk;
reg clr;
reg [2:0] adrs;
reg [3:0] din;
reg wr_rd;

reg trueR = 1;

wire [3:0] dout;
wire [7:0] decodedAddress;

wire [3:0] Q_0;

wire [3:0] Q_1;
wire [3:0] Q_2;
wire [3:0] Q_3;
wire [3:0] Q_4;
wire [3:0] Q_5;
wire [3:0] Q_6;
wire [3:0] Q_7;

decoder3to8 d38_tb(.x(adrs), .E(wr_rd), .y(decodedAddress) );


flipflop f0_tb(.clk(clk), .clr(clr), .D(din), .E(trueR), .Q(Q_0) );

flipflop f1_tb(.clk(clk), .clr(clr), .D(din), .E(decodedAddress[1]), .Q(Q_1) );
flipflop f2_tb(.clk(clk), .clr(clr), .D(din), .E(decodedAddress[2]), .Q(Q_2) );
flipflop f3_tb(.clk(clk), .clr(clr), .D(din), .E(decodedAddress[3]), .Q(Q_3) );
flipflop f4_tb(.clk(clk), .clr(clr), .D(din), .E(decodedAddress[4]), .Q(Q_4) );
flipflop f5_tb(.clk(clk), .clr(clr), .D(din), .E(decodedAddress[5]), .Q(Q_5) );
flipflop f6_tb(.clk(clk), .clr(clr), .D(din), .E(decodedAddress[6]), .Q(Q_6) );
flipflop f7_tb(.clk(clk), .clr(clr), .D(din), .E(decodedAddress[7]), .Q(Q_7) );

initial
begin

clk = 0;
clr = 0;

// 0
din = 4'b1000; 
adrs = 3'b000;
wr_rd = 1;
#10

// 1

din = 4'b0001; 
adrs = 3'b001;
wr_rd = 1;
#10

// 2

din = 4'b0010; 
adrs = 3'b010;
wr_rd = 1;
#10

// 3

din = 4'b0011; 
adrs = 3'b011;
wr_rd = 1;
#10

$finish;
end

always begin clk = #5 ~clk;
end
endmodule