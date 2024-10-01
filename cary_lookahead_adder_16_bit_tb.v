`timescale 1ns / 1ps

module cary_lookahead_adder_16_bit_tb();

reg [15:0]A_number_16_i;
reg [15:0]B_number_16_i;
reg carry_i_i;
wire [16:0] sum_17_o;

carry_lookahead_adder_16_bit uut (
.A_number_16_i(A_number_16_i),
.B_number_16_i(B_number_16_i),
.sum_17_o(sum_17_o),
.carry_i_i(carry_i_i)
);
integer i,j;
initial begin
    #10
    
    /* 
    for ( i= 0;i<256 ;i=i+1) begin
        for ( j=0 ;j<256 ;j=j+1 ) begin
            carry_i_i = 0;
            A_number_16_i[15:0] = 16'd0000 + i;
            B_number_16_i[15:0] = 16'd0000 + j;
            #10;
        end
    end
    for ( i= 0;i<256 ;i=i+1) begin
        for ( j=0 ;j<256 ;j=j+1 ) begin
            carry_i_i = 1;
            A_number_16_i[15:0] = 16'd0000 + i;
            B_number_16_i[15:0] = 16'd0000 + j;
            #10;
        end
    end
    */
        
    carry_i_i = 0;
    A_number_16_i[15:0] = 16'hF0F0;
    B_number_16_i[15:0] = 16'h0F0F;
    #10;
    carry_i_i = 0;
    A_number_16_i[15:0] = 16'hF0F1;
    B_number_16_i[15:0] = 16'h0F0F;

    #10;
    carry_i_i = 1;
    A_number_16_i[15:0] = 16'hF0F0;
    B_number_16_i[15:0] = 16'h0F0F;
    #10;

    A_number_16_i[15:0] = 16'hFFFF;
    B_number_16_i[15:0] = 16'h1111;
    #10;
    carry_i_i = 0;
    A_number_16_i[15:0] = 16'hFFFF;
    B_number_16_i[15:0] = 16'h0000;
    #10;
    A_number_16_i[15:0] = 16'hFFFF;
    B_number_16_i[15:0] = 16'hFFFF;
    #10;
    carry_i_i = 1;
    A_number_16_i[15:0] = 16'hFFFF;
    B_number_16_i[15:0] = 16'h0000;
    #10;
    carry_i_i = 0;
    A_number_16_i[15:0] = 16'hFFFF;
    B_number_16_i[15:0] = 16'hFFFF;
    #10;
end


endmodule
