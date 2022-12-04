`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2022 16:50:37
// Design Name: 
// Module Name: Dutuut
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


module Dutuut();
wire clk, rst;
wire a,b;
wire entry, exit;
wire inc_exp, dec_exp;
wire [3:0] count;

// uut instantiation
//Topmodule dut(.clk(clk), .rst(rst), .a(a), .b(b), .count(count), .entry(entry), .exit(exit));
FSM d5(.clk(clk), .rst(rst), .a(a), .b(b), .entry(entry), .exit(exit));
Counter d6(.clk(clk), .reset(rst), .inc(entry), .dec(exit), .count(count));
generator gut(.clk(clk), .rst(rst), .a(a), .b(b), .inc_exp(inc_exp), .dec_exp(dec_exp));
monitor mut(.clk(clk), .rst(rst), .count(count), .inc_exp(inc_exp), .dec_exp(dec_exp));
endmodule
