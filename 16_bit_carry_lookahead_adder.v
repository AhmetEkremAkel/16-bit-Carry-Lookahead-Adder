`timescale 1ns / 1ps

module carry_lookahead_adder_16_bit(
A_number_16_i,  //First 16 bit
B_number_16_i,  //Second 16 bit
sum_17_o,       //Sum of calculation
carry_i_i);     //carry bit of this  module

input [15:0]A_number_16_i;
input [15:0]B_number_16_i;
input carry_i_i;
output[16:0]sum_17_o;

//This wires are taking the outputs of modules

wire carry_addition[3:0];
wire group_generate[3:0];
wire group_propagate[3:0];
wire carry_addition_o[3:0];

genvar i;

generate
    for (i = 0;i<4 ;i=i+1 ) begin
        carry_lookahead_adder_4_bit full_adder(
        .number_1_i(A_number_16_i[(i*4) + 3 : (i*4)]),
        .number_2_i(B_number_16_i[(i*4) + 3 : (i*4)]),
        .carry_i_i(carry_addition[i]),
        .sum_o(sum_17_o[(i*4) + 3 : (i*4)]),
        .carry_addition_o(carry_addition_o[i]),
        .group_generate_o(group_generate[i]),
        .group_propagate_o(group_propagate[i])
        );

    end
endgenerate


//The combinational circuit for calculating carry bit

assign carry_addition[0] = carry_i_i;
assign carry_addition[1] = carry_addition_o[0];
assign carry_addition[2] = group_generate[1] + (group_propagate[1] & carry_addition_o[0]);
assign carry_addition[3] = group_generate[2] + (group_propagate[2] & group_generate[1]) + (group_propagate[2] & group_propagate[1] & carry_addition_o[0]);
assign sum_17_o[16]      = group_generate[3] + (group_propagate[3] & group_generate[2]) + (group_propagate[3] & group_propagate[2] & group_generate[1]) + (group_propagate[3] & group_propagate[2] & group_propagate[1] & carry_addition_o[0]);



endmodule
