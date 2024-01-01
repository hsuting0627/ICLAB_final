module dct_2d (
    input clk,
    input rst_n,
    input enable,
    input [8*10-1:0] data_in0,
    input [8*10-1:0] data_in1,
    input [8*10-1:0] data_in2,
    input [8*10-1:0] data_in3,
    input [8*10-1:0] data_in4,
    input [8*10-1:0] data_in5,
    input [8*10-1:0] data_in6,
    input [8*10-1:0] data_in7,

    output [10-1:0] dct00,
    output [10-1:0] dct01,
    output [10-1:0] dct02,
    output [10-1:0] dct03,
    output [10-1:0] dct04,
    output [10-1:0] dct05,
    output [10-1:0] dct06,
    output [10-1:0] dct07,
    output [10-1:0] dct10,
    output [10-1:0] dct11,
    output [10-1:0] dct12,
    output [10-1:0] dct13,
    output [10-1:0] dct14,
    output [10-1:0] dct15,
    output [10-1:0] dct16,
    output [10-1:0] dct17,
    output [10-1:0] dct20,
    output [10-1:0] dct21,
    output [10-1:0] dct22,
    output [10-1:0] dct23,
    output [10-1:0] dct24,
    output [10-1:0] dct25,
    output [10-1:0] dct26,
    output [10-1:0] dct27,
    output [10-1:0] dct30,
    output [10-1:0] dct31,
    output [10-1:0] dct32,
    output [10-1:0] dct33,
    output [10-1:0] dct34,
    output [10-1:0] dct35,
    output [10-1:0] dct36,
    output [10-1:0] dct37,
    output [10-1:0] dct40,
    output [10-1:0] dct41,
    output [10-1:0] dct42,
    output [10-1:0] dct43,
    output [10-1:0] dct44,
    output [10-1:0] dct45,
    output [10-1:0] dct46,
    output [10-1:0] dct47,
    output [10-1:0] dct50,
    output [10-1:0] dct51,
    output [10-1:0] dct52,
    output [10-1:0] dct53,
    output [10-1:0] dct54,
    output [10-1:0] dct55,
    output [10-1:0] dct56,
    output [10-1:0] dct57,
    output [10-1:0] dct60,
    output [10-1:0] dct61,
    output [10-1:0] dct62,
    output [10-1:0] dct63,
    output [10-1:0] dct64,
    output [10-1:0] dct65,
    output [10-1:0] dct66,
    output [10-1:0] dct67,
    output [10-1:0] dct70,
    output [10-1:0] dct71,
    output [10-1:0] dct72,
    output [10-1:0] dct73,
    output [10-1:0] dct74,
    output [10-1:0] dct75,
    output [10-1:0] dct76,
    output [10-1:0] dct77,
    output valid
);
wire [10-1:0] y00, y01, y02, y03, y04, y05, y06, y07;
wire [10-1:0] y10, y11, y12, y13, y14, y15, y16, y17;
wire [10-1:0] y20, y21, y22, y23, y24, y25, y26, y27;
wire [10-1:0] y30, y31, y32, y33, y34, y35, y36, y37;
wire [10-1:0] y40, y41, y42, y43, y44, y45, y46, y47;
wire [10-1:0] y50, y51, y52, y53, y54, y55, y56, y57;
wire [10-1:0] y60, y61, y62, y63, y64, y65, y66, y67;
wire [10-1:0] y70, y71, y72, y73, y74, y75, y76, y77;

// wire [10-1:0] z00, z01, z02, z03, z04, z05, z06, z07;
// wire [10-1:0] z10, z11, z12, z13, z14, z15, z16, z17;
// wire [10-1:0] z20, z21, z22, z23, z24, z25, z26, z27;
// wire [10-1:0] z30, z31, z32, z33, z34, z35, z36, z37;
// wire [10-1:0] z40, z41, z42, z43, z44, z45, z46, z47;
// wire [10-1:0] z50, z51, z52, z53, z54, z55, z56, z57;
// wire [10-1:0] z60, z61, z62, z63, z64, z65, z66, z67;
// wire [10-1:0] z70, z71, z72, z73, z74, z75, z76, z77;

wire valid_pre, valid_pre0, valid_pre1, valid_pre2, valid_pre3, valid_pre4, valid_pre5, valid_pre6, valid_pre7;
wire valid_post, valid_post0, valid_post1, valid_post2, valid_post3, valid_post4, valid_post5, valid_post6, valid_post7;

// reg [3:0] pipeline;
// always @ (posedge clk) begin
//     if(!rst_n) begin
//         pipeline <= 4'd0;
//     end
//     else begin
//         pipeline <= {pipeline[2:0], enable};
//     end
// end

// assign valid = pipeline[3];

// always @ (posedge clk) begin
//     if(!rst_n) begin
//         dct00 <= 10'd0;
//         dct01 <= 10'd0;
//         dct02 <= 10'd0;
//         dct03 <= 10'd0;
//         dct04 <= 10'd0;
//         dct05 <= 10'd0;
//         dct06 <= 10'd0;
//         dct07 <= 10'd0;
//         dct10 <= 10'd0;
//         dct11 <= 10'd0;
//         dct12 <= 10'd0;
//         dct13 <= 10'd0;
//         dct14 <= 10'd0;
//         dct15 <= 10'd0;
//         dct16 <= 10'd0;
//         dct17 <= 10'd0;
//         dct20 <= 10'd0;
//         dct21 <= 10'd0;
//         dct22 <= 10'd0;
//         dct23 <= 10'd0;
//         dct24 <= 10'd0;
//         dct25 <= 10'd0;
//         dct26 <= 10'd0;
//         dct27 <= 10'd0;
//         dct30 <= 10'd0;
//         dct31 <= 10'd0;
//         dct32 <= 10'd0;
//         dct33 <= 10'd0;
//         dct34 <= 10'd0;
//         dct35 <= 10'd0;
//         dct36 <= 10'd0;
//         dct37 <= 10'd0;
//         dct40 <= 10'd0;
//         dct41 <= 10'd0;
//         dct42 <= 10'd0;
//         dct43 <= 10'd0;
//         dct44 <= 10'd0;
//         dct45 <= 10'd0;
//         dct46 <= 10'd0;
//         dct47 <= 10'd0;
//         dct50 <= 10'd0;
//         dct51 <= 10'd0;
//         dct52 <= 10'd0;
//         dct53 <= 10'd0;
//         dct54 <= 10'd0;
//         dct55 <= 10'd0;
//         dct56 <= 10'd0;
//         dct57 <= 10'd0;
//         dct60 <= 10'd0;
//         dct61 <= 10'd0;
//         dct62 <= 10'd0;
//         dct63 <= 10'd0;
//         dct64 <= 10'd0;
//         dct65 <= 10'd0;
//         dct66 <= 10'd0;
//         dct67 <= 10'd0;
//         dct70 <= 10'd0;
//         dct71 <= 10'd0;
//         dct72 <= 10'd0;
//         dct73 <= 10'd0;
//         dct74 <= 10'd0;
//         dct75 <= 10'd0;
//         dct76 <= 10'd0;
//         dct77 <= 10'd0;
//     end
//     else begin
//         dct00 <= z00;
//         dct01 <= z10;
//         dct02 <= z20;
//         dct03 <= z30;
//         dct04 <= z40;
//         dct05 <= z50;
//         dct06 <= z60;
//         dct07 <= z70;
//         dct10 <= z01;
//         dct11 <= z11;
//         dct12 <= z21;
//         dct13 <= z31;
//         dct14 <= z41;
//         dct15 <= z51;
//         dct16 <= z61;
//         dct17 <= z71;
//         dct20 <= z02;
//         dct21 <= z12;
//         dct22 <= z22;
//         dct23 <= z32;
//         dct24 <= z42;
//         dct25 <= z52;
//         dct26 <= z62;
//         dct27 <= z72;
//         dct30 <= z03;
//         dct31 <= z13;
//         dct32 <= z23;
//         dct33 <= z33;
//         dct34 <= z43;
//         dct35 <= z53;
//         dct36 <= z63;
//         dct37 <= z73;
//         dct40 <= z04;
//         dct41 <= z14;
//         dct42 <= z24;
//         dct43 <= z34;
//         dct44 <= z44;
//         dct45 <= z54;
//         dct46 <= z64;
//         dct47 <= z74;
//         dct50 <= z05;
//         dct51 <= z15;
//         dct52 <= z25;
//         dct53 <= z35;
//         dct54 <= z45;
//         dct55 <= z55;
//         dct56 <= z65;
//         dct57 <= z75;
//         dct60 <= z06;
//         dct61 <= z16;
//         dct62 <= z26;
//         dct63 <= z36;
//         dct64 <= z46;
//         dct65 <= z56;
//         dct66 <= z66;
//         dct67 <= z76;
//         dct70 <= z07;
//         dct71 <= z17;
//         dct72 <= z27;
//         dct73 <= z37;
//         dct74 <= z47;
//         dct75 <= z57;
//         dct76 <= z67;
//         dct77 <= z77;
//     end
// end

// calculate Y
dct_1d U0(
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .x0(data_in0[79:70]),
    .x1(data_in0[69:60]),
    .x2(data_in0[59:50]),
    .x3(data_in0[49:40]),
    .x4(data_in0[39:30]),
    .x5(data_in0[29:20]),
    .x6(data_in0[19:10]),
    .x7(data_in0[9:0]),
    .y0(y00),
    .y1(y01),
    .y2(y02),
    .y3(y03),
    .y4(y04),
    .y5(y05),
    .y6(y06),
    .y7(y07),
    .valid(valid_pre0)
);

dct_1d U1(
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .x0(data_in1[79:70]),
    .x1(data_in1[69:60]),
    .x2(data_in1[59:50]),
    .x3(data_in1[49:40]),
    .x4(data_in1[39:30]),
    .x5(data_in1[29:20]),
    .x6(data_in1[19:10]),
    .x7(data_in1[9:0]),
    .y0(y10),
    .y1(y11),
    .y2(y12),
    .y3(y13),
    .y4(y14),
    .y5(y15),
    .y6(y16),
    .y7(y17),
    .valid(valid_pre1)
);

dct_1d U2(
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .x0(data_in2[79:70]),
    .x1(data_in2[69:60]),
    .x2(data_in2[59:50]),
    .x3(data_in2[49:40]),
    .x4(data_in2[39:30]),
    .x5(data_in2[29:20]),
    .x6(data_in2[19:10]),
    .x7(data_in2[9:0]),
    .y0(y20),
    .y1(y21),
    .y2(y22),
    .y3(y23),
    .y4(y24),
    .y5(y25),
    .y6(y26),
    .y7(y27),
    .valid(valid_pre2)
);

dct_1d U3(
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .x0(data_in3[79:70]),
    .x1(data_in3[69:60]),
    .x2(data_in3[59:50]),
    .x3(data_in3[49:40]),
    .x4(data_in3[39:30]),
    .x5(data_in3[29:20]),
    .x6(data_in3[19:10]),
    .x7(data_in3[9:0]),
    .y0(y30),
    .y1(y31),
    .y2(y32),
    .y3(y33),
    .y4(y34),
    .y5(y35),
    .y6(y36),
    .y7(y37),
    .valid(valid_pre3)
);

dct_1d U4(
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .x0(data_in4[79:70]),
    .x1(data_in4[69:60]),
    .x2(data_in4[59:50]),
    .x3(data_in4[49:40]),
    .x4(data_in4[39:30]),
    .x5(data_in4[29:20]),
    .x6(data_in4[19:10]),
    .x7(data_in4[9:0]),
    .y0(y40),
    .y1(y41),
    .y2(y42),
    .y3(y43),
    .y4(y44),
    .y5(y45),
    .y6(y46),
    .y7(y47),
    .valid(valid_pre4)
);

dct_1d U5(
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .x0(data_in5[79:70]),
    .x1(data_in5[69:60]),
    .x2(data_in5[59:50]),
    .x3(data_in5[49:40]),
    .x4(data_in5[39:30]),
    .x5(data_in5[29:20]),
    .x6(data_in5[19:10]),
    .x7(data_in5[9:0]),
    .y0(y50),
    .y1(y51),
    .y2(y52),
    .y3(y53),
    .y4(y54),
    .y5(y55),
    .y6(y56),
    .y7(y57),
    .valid(valid_pre5)
);

dct_1d U6(
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .x0(data_in6[79:70]),
    .x1(data_in6[69:60]),
    .x2(data_in6[59:50]),
    .x3(data_in6[49:40]),
    .x4(data_in6[39:30]),
    .x5(data_in6[29:20]),
    .x6(data_in6[19:10]),
    .x7(data_in6[9:0]),
    .y0(y60),
    .y1(y61),
    .y2(y62),
    .y3(y63),
    .y4(y64),
    .y5(y65),
    .y6(y66),
    .y7(y67),
    .valid(valid_pre6)
);

dct_1d U7(
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .x0(data_in7[79:70]),
    .x1(data_in7[69:60]),
    .x2(data_in7[59:50]),
    .x3(data_in7[49:40]),
    .x4(data_in7[39:30]),
    .x5(data_in7[29:20]),
    .x6(data_in7[19:10]),
    .x7(data_in7[9:0]),
    .y0(y70),
    .y1(y71),
    .y2(y72),
    .y3(y73),
    .y4(y74),
    .y5(y75),
    .y6(y76),
    .y7(y77),
    .valid(valid_pre7)
);

assign valid_pre = valid_pre0 && valid_pre1 && valid_pre2 && valid_pre3 && valid_pre4 && valid_pre5 && valid_pre6 && valid_pre7;
//calculate Z

dct_1d Z0(
    .clk(clk),
    .rst_n(rst_n),
    .enable(valid_pre),
    .x0(y00),
    .x1(y10),
    .x2(y20),
    .x3(y30),
    .x4(y40),
    .x5(y50),
    .x6(y60),
    .x7(y70),
    .y0(dct00),
    .y1(dct10),
    .y2(dct20),
    .y3(dct30),
    .y4(dct40),
    .y5(dct50),
    .y6(dct60),
    .y7(dct70),
    .valid(valid_post0)
);

dct_1d Z1(
    .clk(clk),
    .rst_n(rst_n),
    .enable(valid_pre),
    .x0(y01),
    .x1(y11),
    .x2(y21),
    .x3(y31),
    .x4(y41),
    .x5(y51),
    .x6(y61),
    .x7(y71),
    .y0(dct01),
    .y1(dct11),
    .y2(dct21),
    .y3(dct31),
    .y4(dct41),
    .y5(dct51),
    .y6(dct61),
    .y7(dct71),
    .valid(valid_post1)
);

dct_1d Z2(
    .clk(clk),
    .rst_n(rst_n),
    .enable(valid_pre),
    .x0(y02),
    .x1(y12),
    .x2(y22),
    .x3(y32),
    .x4(y42),
    .x5(y52),
    .x6(y62),
    .x7(y72),
    .y0(dct02),
    .y1(dct12),
    .y2(dct22),
    .y3(dct32),
    .y4(dct42),
    .y5(dct52),
    .y6(dct62),
    .y7(dct72),
    .valid(valid_post2)
);

dct_1d Z3(
    .clk(clk),
    .rst_n(rst_n),
    .enable(valid_pre),
    .x0(y03),
    .x1(y13),
    .x2(y23),
    .x3(y33),
    .x4(y43),
    .x5(y53),
    .x6(y63),
    .x7(y73),
    .y0(dct03),
    .y1(dct13),
    .y2(dct23),
    .y3(dct33),
    .y4(dct43),
    .y5(dct53),
    .y6(dct63),
    .y7(dct73),
    .valid(valid_post3)
);

dct_1d Z4(
    .clk(clk),
    .rst_n(rst_n),
    .enable(valid_pre),
    .x0(y04),
    .x1(y14),
    .x2(y24),
    .x3(y34),
    .x4(y44),
    .x5(y54),
    .x6(y64),
    .x7(y74),
    .y0(dct04),
    .y1(dct14),
    .y2(dct24),
    .y3(dct34),
    .y4(dct44),
    .y5(dct54),
    .y6(dct64),
    .y7(dct74),
    .valid(valid_post4)
);

dct_1d Z5(
    .clk(clk),
    .rst_n(rst_n),
    .enable(valid_pre),
    .x0(y05),
    .x1(y15),
    .x2(y25),
    .x3(y35),
    .x4(y45),
    .x5(y55),
    .x6(y65),
    .x7(y75),
    .y0(dct05),
    .y1(dct15),
    .y2(dct25),
    .y3(dct35),
    .y4(dct45),
    .y5(dct55),
    .y6(dct65),
    .y7(dct75),
    .valid(valid_post5)
);

dct_1d Z6(
    .clk(clk),
    .rst_n(rst_n),
    .enable(valid_pre),
    .x0(y06),
    .x1(y16),
    .x2(y26),
    .x3(y36),
    .x4(y46),
    .x5(y56),
    .x6(y66),
    .x7(y76),
    .y0(dct06),
    .y1(dct16),
    .y2(dct26),
    .y3(dct36),
    .y4(dct46),
    .y5(dct56),
    .y6(dct66),
    .y7(dct76),
    .valid(valid_post6)
);

dct_1d Z7(
    .clk(clk),
    .rst_n(rst_n),
    .enable(valid_pre),
    .x0(y07),
    .x1(y17),
    .x2(y27),
    .x3(y37),
    .x4(y47),
    .x5(y57),
    .x6(y67),
    .x7(y77),
    .y0(dct07),
    .y1(dct17),
    .y2(dct27),
    .y3(dct37),
    .y4(dct47),
    .y5(dct57),
    .y6(dct67),
    .y7(dct77),
    .valid(valid_post7)
);

assign valid = valid_post0 && valid_post1 && valid_post2 && valid_post3 && valid_post4 && valid_post5 && valid_post6 && valid_post7;

endmodule