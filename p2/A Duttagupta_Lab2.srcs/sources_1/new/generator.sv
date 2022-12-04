`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2022 16:46:37
// Design Name: 
// Module Name: generator
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


module generator(output reg clk, rst, a, b, inc_exp, dec_exp);

always
begin 
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
end

// test procedure


initial
begin
    initialise();
    
    Counter(10,1); // Entry - 1
    Counter(10,1); // Entry - 2   
    Counter(10,0); // Exit - 1 
    Counter(10,1); // Entry - 1
    Counter(10,1); // Entry - 2
    Counter(10,1); // Entry - 3
    Counter(10,1); // Entry - 4
    Counter(10,1); // Entry - 5
    Counter(10,1); // Entry - 6
    Counter(10,1); // Entry - 7
    Counter(10,1); // Entry - 8
    Counter(10,1); // Entry - 9
    Counter(10,1); // Entry - 10
    Counter(10,1); // Entry - 11
    Counter(10,1); // Entry - 12
    Counter(10,1); // Entry - 13
    Counter(10,1); // Entry - 14
    Counter(10,1); // Entry - 15
    Counter(10,1); // Overflow Condition check, display error
    Counter(10,3); // Incorrect Sequence, display error
    
    
end

// Task definations

task Counter_reset();
    begin@(negedge clk)
    rst = 1'b1;
    #25;
    rst = 1'b0;
    end
endtask

task initialise();
    begin
    a = 0;
    b = 0;
    inc_exp = 0;
    dec_exp = 0;
    Counter_reset();
    end
endtask

task Counter(input integer C, input integer UP_DOWN);
    begin@(negedge clk)
        if(UP_DOWN == 1) // Entry Sequence
            begin
            // State P
            a = 0;
            b = 0;
            repeat(C)@(negedge clk);  
            // State Q
            a = 1;
            b = 0;
            repeat(C)@(negedge clk);           
            // State S
            a = 1;
            b = 1; 
            repeat(C)@(negedge clk);
            // State R
            a = 0;
            b = 1; 
            repeat(C)@(negedge clk);
           // State En
            a = 0;
            b = 0;
           
            inc_exp = 1;
            dec_exp = 0;
            repeat(1)@(negedge clk);
           // State En
            inc_exp = 0;
            dec_exp = 0;
            end
            
         else if(UP_DOWN == 0) // Exit Sequence
            begin
            // State P
            a = 0;
            b = 0;
            repeat(C)@(negedge clk);  
            // State R
            a = 0;
            b = 1;
            repeat(C)@(negedge clk);           
            // State S
            a = 1;
            b = 1; 
            repeat(C)@(negedge clk);
            // State Q
            a = 1;
            b = 0; 
            repeat(C)@(negedge clk);
           // State Ex
            a = 0;
            b = 0;
         
            inc_exp = 0;
            dec_exp = 0;
            repeat(1)@(negedge clk);
           // State En
            inc_exp = 0;
            dec_exp = 0;
            end   
            
            else // Error sequence display error
                begin
                a = 0;
                b = 0;
                inc_exp = 0;
                dec_exp = 0;
            end
    end
endtask         
             
endmodule



