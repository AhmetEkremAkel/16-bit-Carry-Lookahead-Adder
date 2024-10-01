`timescale 1ns / 1ps

module carry_lookahead_adder_4_bit(
number_1_i,
number_2_i,
sum_o,
carry_i_i,
carry_addition_o,
group_generate_o,
group_propagate_o
);

input [3:0] number_1_i;
input [3:0] number_2_i;
input carry_i_i;
output [4:0] sum_o;
output carry_addition_o;  //
output group_generate_o;  //This part for implementing 4 bit adder to 16 bit adder.
output group_propagate_o; //


reg  [3:0]carry_generate;
reg  [3:0]carry_propagate;
wire [3:0]carry_addition;

integer i;

always @* begin
    for (i = 0;i < 4 ; i=i+1 ) begin
        carry_generate[i] = number_1_i[i] & number_2_i[i];   //Genereting carry_generate variables
    end

    for (i =0 ;i<4 ;i=i+1 ) begin
        carry_propagate[i] = (number_1_i[i] ^ number_2_i[i]); //Genereating carry_propagate variables
    end
end

//Combinational circuit of calculating carry

assign carry_addition[0] =  carry_generate[0] + (carry_i_i         & carry_propagate[0]);
assign carry_addition[1] = (carry_generate[1] + (carry_generate[0] & carry_propagate[1]) + (carry_i_i         & carry_propagate[0] & carry_propagate[1]));
assign carry_addition[2] = (carry_generate[2] + (carry_generate[1] & carry_propagate[2]) + (carry_generate[0] & carry_propagate[1] & carry_propagate[2]) +
(carry_i_i         & carry_propagate[0] & carry_propagate[1] & carry_propagate[2]));
assign carry_addition[3] = (carry_generate[3] + (carry_generate[2] & carry_propagate[3]) + (carry_generate[1] & carry_propagate[2] & carry_propagate[3]) +
(carry_generate[0] & carry_propagate[1] & carry_propagate[2] & carry_propagate[3])+ (carry_i_i & carry_propagate[0] & carry_propagate[1] & carry_propagate[2] & carry_propagate[3]));

//Calculating sum

assign sum_o[0] = (number_1_i[0] ^ number_2_i[0]) ^ carry_i_i;
assign sum_o[1] = (number_1_i[1] ^ number_2_i[1]) ^ carry_addition[0];
assign sum_o[2] = (number_1_i[2] ^ number_2_i[2]) ^ carry_addition[1];
assign sum_o[3] = (number_1_i[3] ^ number_2_i[3]) ^ carry_addition[2];
assign sum_o[4] = ((number_1_i[3] ^ number_2_i[3]) & carry_addition[3]) + (number_1_i[3] & number_2_i[3]);

//This variables are not neccessery for the 4 bit adder but for implementing this adder to 16 bit adder I generate this variables

assign carry_addition_o  = carry_addition[3];
assign group_generate_o = carry_generate[3] + (carry_generate[2] & carry_propagate[3]) + (carry_generate[1] & carry_propagate[2] & carry_propagate[3]) +
(carry_generate[0] & carry_propagate[1] & carry_propagate[2] & carry_propagate[3]);
assign group_propagate_o = carry_propagate[0] & carry_propagate[1] & carry_propagate[2] & carry_propagate[3];

endmodule
