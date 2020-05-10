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
reg CLK;
reg resetn;
reg [2:0] address;
reg [3:0] Din;
reg wr_rd;
wire [3:0] Dout;

memory mem_tb(
    .CLK(CLK),
    .resetn(resetn),
    .address(address),
    .wr_rd(wr_rd),
    .Din(Din),
    .Dout(Dout)
);

initial
begin

CLK = 0;
resetn = 0;

// Writes
wr_rd = 1;

// 0
Din = 4'b1010; 
address = 3'b000;
#10

// 1

Din = 4'b0101; 
address = 3'b001;
#10

// 2

Din = 4'b1010; 
address = 3'b010;
#10

// 3

Din = 4'b0101; 
address = 3'b011;
#10


// 4
Din = 4'b1010; 
address = 3'b100;
#10

// 5

Din = 4'b0101; 
address = 3'b101;
#10

// 6

Din = 4'b1010; 
address = 3'b110;
#10

// 7

Din = 4'b0101; 
address = 3'b111;

////////////////////////////
// Reads
wr_rd = 0;

// 0
Din = 4'b1010; 
address = 3'b000;
#10

// 1

Din = 4'b0101; 
address = 3'b001;
#10

// 2

Din = 4'b1010; 
address = 3'b010;
#10

// 3

Din = 4'b0101; 
address = 3'b011;
#10


// 4
Din = 4'b1010; 
address = 3'b100;
#10

// 5

Din = 4'b0101; 
address = 3'b101;
#10

// 6

Din = 4'b1010; 
address = 3'b110;
#10

// 7

Din = 4'b0101; 
address = 3'b111;
#10

$finish;
end

always begin CLK = #5 ~CLK;
end
endmodule