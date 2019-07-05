`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2019 11:24:49 PM
// Design Name: 
// Module Name: timer
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


module timer(
    input clk,
    input reset,
    input pause,
    output reg [3:0] hex3,
    output reg [3:0] hex2,
    output reg [3:0] hex1,
    output reg [3:0] hex0

    );
    localparam [28:0] oneHz_constant = 20'd100000000;
    reg oneHz_enable;
    reg [28:0] oneHz_counter;
    reg count;
    
    always@(posedge clk) begin
        if (reset) begin
            oneHz_counter=oneHz_constant;
            hex3 = 4'd0;
            hex2 = 4'd0;
            hex1 = 4'd0;
            hex0 = 4'd0;
            count = 1;
        end
        
        else begin
            if (pause) begin
                if (count) count = 0;
                else count = 1;
            end
            
            if (count) begin
                oneHz_counter = oneHz_counter - 1;
                oneHz_enable = (oneHz_counter == 0);
                if (!oneHz_counter) oneHz_counter = oneHz_constant;
            end
        end
    end
    
    always@(posedge oneHz_enable) begin
        if (hex0<4'd10) hex0 = hex0 + 1;
        else begin
            if (hex1<4'd10) begin
                hex1 = hex1 + 1;
                hex0 = 0;
            end
            else begin
                if (hex2<4'd10) begin
                    hex2 = hex2 + 1;
                    hex1 = 0;
                end
                else begin
                    if (hex3<4'd10) begin
                        hex3 = hex3 + 1;
                        hex2 = 0;
                    end
                    else hex3 = 0;
                end
            end
        end
    end
endmodule
