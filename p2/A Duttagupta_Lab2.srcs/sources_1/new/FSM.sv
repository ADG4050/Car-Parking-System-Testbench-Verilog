`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2022 16:48:52
// Design Name: 
// Module Name: FSM
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


module FSM(input clk, input rst, input a, input b, output reg entry, output reg exit);
parameter P = 3'b000, Q = 3'b001, R = 3'b010, S = 3'b011, En = 3'b100, Ex = 3'b101;
reg [2:0] st,nst;

always @(posedge clk, posedge rst)
begin
    if(rst == 1)
        st <= P;
    else
        st <= nst;
end

always @(*)     
begin   
        case(st)
        P: if ((a==1)&&(b==0)) nst <= Q;  // 00
           else if((a==0)&&(b==1))   nst <= R;
           else nst <= P;
        Q: if ((a==1)&&(b==1)) nst <= S;  // 01
           else if ((a==0)&&(b==0)) nst <=Ex;
           else nst <= Q;
        R: if ((a==1)&&(b==1)) nst <= S;  // 10
           else if ((a==0)&&(b==0)) nst <=En;
           else nst <= R;
        S: if ((a==1)&&(b==0)) nst <= Q;  // 11
           else if ((a==0)&&(b==1)) nst <=R;
           else nst <= S;
        En: if((a==0)&&(b==0)) nst <=P;
        Ex: if((a==0)&&(b==0)) nst <=P;   
        
        
        default: nst <= P;
        endcase
end
  
always @(*)  
begin
    case(st)
    P: begin
    entry = 0;
    exit = 0;
    end
    Q: begin
    entry = 0; 
    exit = 0;
    end
    R: begin
    entry = 0; 
    exit = 0;
    end 
    S: begin
    entry = 0; 
    exit = 0;
    end 
    Ex: begin
    entry = 0; 
    exit = 1;
    end 
    En: begin
    entry = 1; 
    exit = 0;
    end  
    default: begin
    entry = 0; 
    exit = 0;
    end
    endcase
end
    

endmodule
