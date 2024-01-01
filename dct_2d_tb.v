`timescale 1ns/1ps
`define CYCLE 10

module dct_2d_tb();
    reg clk;
    reg rst_n;
    reg enable;
    reg [8*10-1:0] x0, x1, x2, x3, x4, x5, x6, x7;
    wire [10-1:0] dct00, dct01, dct02, dct03, dct04, dct05, dct06, dct07;
    wire [10-1:0] dct10, dct11, dct12, dct13, dct14, dct15, dct16, dct17;
    wire [10-1:0] dct20, dct21, dct22, dct23, dct24, dct25, dct26, dct27;
    wire [10-1:0] dct30, dct31, dct32, dct33, dct34, dct35, dct36, dct37;
    wire [10-1:0] dct40, dct41, dct42, dct43, dct44, dct45, dct46, dct47;
    wire [10-1:0] dct50, dct51, dct52, dct53, dct54, dct55, dct56, dct57;
    wire [10-1:0] dct60, dct61, dct62, dct63, dct64, dct65, dct66, dct67;
    wire [10-1:0] dct70, dct71, dct72, dct73, dct74, dct75, dct76, dct77;
    wire valid;

initial begin : proc_system
  clk = 0; //
  rst_n = 1;
  // system reset
  #(`CYCLE) rst_n = 0;
  #(`CYCLE) rst_n = 1;
//  #(`CYCLE * 100) $finish;
end
always #(`CYCLE/2) clk=~clk;
initial begin
    $fsdbDumpfile("dct_2d.fsdb");
    $fsdbDumpvars;
end
dct_2d U0(
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .data_in0(x0),
    .data_in1(x1),
    .data_in2(x2),
    .data_in3(x3),
    .data_in4(x4),
    .data_in5(x5),
    .data_in6(x6),
    .data_in7(x7),

    .dct00(dct00),
    .dct01(dct01),
    .dct02(dct02),
    .dct03(dct03),
    .dct04(dct04),
    .dct05(dct05),
    .dct06(dct06),
    .dct07(dct07),
    .dct10(dct10),
    .dct11(dct11),
    .dct12(dct12),
    .dct13(dct13),
    .dct14(dct14),
    .dct15(dct15),
    .dct16(dct16),
    .dct17(dct17),
    .dct20(dct20),
    .dct21(dct21),
    .dct22(dct22),
    .dct23(dct23),
    .dct24(dct24),
    .dct25(dct25),
    .dct26(dct26),
    .dct27(dct27),
    .dct30(dct30),
    .dct31(dct31),
    .dct32(dct32),
    .dct33(dct33),
    .dct34(dct34),
    .dct35(dct35),
    .dct36(dct36),
    .dct37(dct37),
    .dct40(dct40),
    .dct41(dct41),
    .dct42(dct42),
    .dct43(dct43),
    .dct44(dct44),
    .dct45(dct45),
    .dct46(dct46),
    .dct47(dct47),
    .dct50(dct50),
    .dct51(dct51),
    .dct52(dct52),
    .dct53(dct53),
    .dct54(dct54),
    .dct55(dct55),
    .dct56(dct56),
    .dct57(dct57),
    .dct60(dct60),
    .dct61(dct61),
    .dct62(dct62),
    .dct63(dct63),
    .dct64(dct64),
    .dct65(dct65),
    .dct66(dct66),
    .dct67(dct67),
    .dct70(dct70),
    .dct71(dct71),
    .dct72(dct72),
    .dct73(dct73),
    .dct74(dct74),
    .dct75(dct75),
    .dct76(dct76),
    .dct77(dct77),
    .valid(valid)    
);
reg [9:0] x00;
initial begin
    wait(rst_n == 0);
    wait(rst_n == 1);
    #(`CYCLE/4);
    enable = 1;
    x00 = 10'd122 - 10'd128;
    x0 = {10'd178-10'd128, 10'd147-10'd128, 10'd122-10'd128, 10'd109-10'd128, 10'd109-10'd128, 10'd102-10'd128, 10'd93-10'd128, 10'd79-10'd128};
    x1 = {10'd194-10'd128, 10'd160-10'd128, 10'd131-10'd128, 10'd108-10'd128, 10'd96-10'd128, 10'd88-10'd128, 10'd91-10'd128, 10'd103-10'd128};
    x2 = {10'd201-10'd128, 10'd172-10'd128, 10'd141-10'd128, 10'd116-10'd128, 10'd100-10'd128, 10'd94-10'd128, 10'd90-10'd128, 10'd84-10'd128};
    x3 = {10'd202-10'd128, 10'd181-10'd128, 10'd153-10'd128, 10'd128-10'd128, 10'd117-10'd128, 10'd111-10'd128, 10'd101-10'd128, 10'd91-10'd128};
    x4 = {10'd194-10'd128, 10'd175-10'd128, 10'd151-10'd128, 10'd130-10'd128, 10'd117-10'd128, 10'd109-10'd128, 10'd105-10'd128, 10'd96-10'd128};
    x5 = {10'd185-10'd128, 10'd167-10'd128, 10'd144-10'd128, 10'd127-10'd128, 10'd115-10'd128, 10'd105-10'd128, 10'd99-10'd128, 10'd99-10'd128};
    x6 = {10'd181-10'd128, 10'd163-10'd128, 10'd140-10'd128, 10'd123-10'd128, 10'd114-10'd128, 10'd108-10'd128, 10'd104-10'd128, 10'd103-10'd128};
    x7 = {10'd183-10'd128, 10'd167-10'd128, 10'd145-10'd128, 10'd129-10'd128, 10'd122-10'd128, 10'd120-10'd128, 10'd116-10'd128, 10'd111-10'd128};
    #(`CYCLE*20)
    // x0 = 8'd255;
    // x1 = 8'd255;
    // x2 = 8'd255;
    // x3 = 8'd255;
    // x4 = 8'd255;
    // x5 = 8'd255;
    // x6 = 8'd255;
    // x7 = 8'd255;   
    $finish;
end
endmodule