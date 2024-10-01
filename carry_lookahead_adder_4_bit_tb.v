`timescale 1ns / 1ps


module carry_lookahead_adder_4_bit_tb();

reg [3:0] number_1_i;
reg [3:0] number_2_i;
reg carry_i_i;
wire [4:0] sum_o;



carry_lookahead_adder_4_bit uut(
.number_1_i(number_1_i),
.number_2_i(number_2_i),
.carry_i_i(carry_i_i),
.sum_o(sum_o)
);

initial begin


    carry_i_i = 0;
    number_1_i[3:0] = 4'b0000;
    number_2_i[3:0] = 4'b0000;
    #100;

    number_1_i[3:0] = 4'b0011;
    number_2_i[3:0] = 4'b0000;
    #10;
    number_1_i[3:0] = 4'b0001;
    number_2_i[3:0] = 4'b0001;
    #10;
    number_1_i[3:0] = 4'b1111;
    number_2_i[3:0] = 4'b0001;
    #10;
    number_1_i[3:0] = 4'b1111;
    number_2_i[3:0] = 4'b1111;
    #10;
    number_1_i[3:0] = 4'b1000;
    number_2_i[3:0] = 4'b1111;
    #10;
    number_1_i[3:0] = 4'b0000;
    number_2_i[3:0] = 4'b0111;
    carry_i_i = 1;
    #10;
    number_1_i[3:0] = 4'b1111;
    number_2_i[3:0] = 4'b1111;
    #10;
    number_1_i[3:0] = 4'b0000;
    number_2_i[3:0] = 4'b0000;
    #10;
    number_1_i[3:0] = 4'b0001;
    number_2_i[3:0] = 4'b0001;
    #10;
    number_1_i[3:0] = 4'b1010;
    number_2_i[3:0] = 4'b0101;
    #10;
    
    

end






endmodule
