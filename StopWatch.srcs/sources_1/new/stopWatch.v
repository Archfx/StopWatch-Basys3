`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2019 11:24:49 PM
// Design Name: 
// Module Name: stopWatch
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


module stopWatch(
    input clk,
    input reset,
    input pause,
    output [3:0] anode_select,
    output [7:0] seven_seg
    );
    
    wire [3:0] hex3,hex2,hex1,hex0;
    wire d_pause,d_reset;
    timer t ( 
                .clk(clk),
                .reset(d_reset),
                .pause(d_pause),
                .hex3(hex3),
                .hex2(hex2),
                .hex1(hex1),
                .hex0(hex0)
                );
                
   displayDriver dD(
                .clk(clk),
                .hex3(hex3),
                .hex2(hex2),
                .hex1(hex1),
                .hex0(hex0),
                .anode_select(anode_select),
                .seven_seg(seven_seg)
   );
   
   debounce pausebtn(
                 .clk(clk), 
                 .n_reset(1),
                 .button_in(pause),
                 .DB_out(d_pause)
   );
   
   debounce resetbtn(
                 .clk(clk), 
                 .n_reset(1),
                 .button_in(reset),
                 .DB_out(d_reset)
   );
endmodule
