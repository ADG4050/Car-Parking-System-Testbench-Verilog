`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2022 16:47:59
// Design Name: 
// Module Name: monitor
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


module monitor(input wire clk,rst, input wire dec_exp,inc_exp, input wire [3:0] count);

reg inc_exp_m,dec_exp_m;
reg [3:0] count_m;
reg [39:0] err_msg;
reg [3:0] out;
//reg entry, exit;
//reg st,nst; 
//parameter P = 3'b000, Q = 3'b001, R = 3'b010, S = 3'b011, En = 3'b100, Ex = 3'b101;

initial 
$display("time entry exit count \n");
always@(posedge clk)
begin

inc_exp_m <= inc_exp;
dec_exp_m <= dec_exp;
count_m <= count;

end

always@(posedge clk)     
begin   
 if((inc_exp == 1) & (count_m< 4'b1111))
        out = count_m + 1;
        else if((dec_exp == 1) & (count_m>0))
        out = count_m - 1;
        
        if(count == out)
        err_msg = "PASS";
        else
        err_msg = "ERROR";
        
        $display("%5d, %b%b %4b %s", $time, inc_exp, dec_exp,count, err_msg);
        
end



endmodule

