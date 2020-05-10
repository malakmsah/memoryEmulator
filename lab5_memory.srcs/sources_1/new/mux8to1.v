`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2020 02:36:26 PM
// Design Name: 
// Module Name: mux8to1
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


module mux8to1(
    // memory blocks
    input wire [3:0] memoryBlock0,
    input wire [3:0] memoryBlock1,
    input wire [3:0] memoryBlock2,
    input wire [3:0] memoryBlock3,
    input wire [3:0] memoryBlock4,
    input wire [3:0] memoryBlock5,
    input wire [3:0] memoryBlock6,
    input wire [3:0] memoryBlock7,
    
    // select
    input wire [2:0] sel,
    
    // enable
    input wire E,
    
    // output
    output reg [3:0] data
);
    
    
always@(*)
    begin
        if(E == 1)
            begin
                case(sel)
                    3'b000: data = memoryBlock0;
                    3'b001: data = memoryBlock1;
                    3'b010: data = memoryBlock2;
                    3'b011: data = memoryBlock3;
                    3'b100: data = memoryBlock4;
                    3'b101: data = memoryBlock5;
                    3'b110: data = memoryBlock6;
                    3'b111: data = memoryBlock7;
                    default: data = memoryBlock0;
                endcase
            end
    end
    
    
endmodule
