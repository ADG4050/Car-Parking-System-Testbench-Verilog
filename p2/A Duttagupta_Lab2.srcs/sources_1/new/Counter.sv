`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2022 16:49:30
// Design Name: 
// Module Name: Counter
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


module Counter(input inc, input dec, input clk, input reset, output reg [3:0] count);
always @ (posedge clk, posedge reset)
begin
    if (reset == 1)
        count = 4'b0000;
    else if ((inc == 1) && (count < 15))
        count = count + 0001;
    else if ((dec == 1) && (count > 0))
        count = count - 0001;      
end
endmodule