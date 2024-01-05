module rgb2ycbcr_2d
(
    input clk,
    input rst_n,
    input enable,
    input [512-1:0] R, 
    input [512-1:0] G,
    input [512-1:0] B,
    output reg [512-1:0] Y,
    output reg [512-1:0] Cb,
    output reg [512-1:0] Cr,
    output valid
);

// localparam IDLE = 2'd0, LOAD_R = 2'd1, LOAD_G = 2'd2, LOAD_B = 2'd3; 
// reg [2:0] state, state_n;
// always @(posedge clk) begin
//     if(!rst_n) begin
//         state <= IDLE;
//     end
//     else begin
//         state <= state_n;
//     end
// end

// always@* begin
//     case(state) 
//         IDLE : state_n = enable ? LOAD_R : IDLE;
//         LOAD_R : state_n = LOAD_G : LOAD_R;
//         LOAD_G : state_n = LOAD_B : LOAD_G;
//         LOAD_B : state_n = (finish) ? FINISH : LOAD_R;
//         FINISH : state_n = IDLE;
//     endcase
// end
wire [7:0] R00, R01, R02, R03, R04, R05, R06, R07;
wire [7:0] R10, R11, R12, R13, R14, R15, R16, R17;
wire [7:0] R20, R21, R22, R23, R24, R25, R26, R27;
wire [7:0] R30, R31, R32, R33, R34, R35, R36, R37;
wire [7:0] R40, R41, R42, R43, R44, R45, R46, R47;
wire [7:0] R50, R51, R52, R53, R54, R55, R56, R57;
wire [7:0] R60, R61, R62, R63, R64, R65, R66, R67;
wire [7:0] R70, R71, R72, R73, R74, R75, R76, R77;
wire [7:0] G00, G01, G02, G03, G04, G05, G06, G07;
wire [7:0] G10, G11, G12, G13, G14, G15, G16, G17;
wire [7:0] G20, G21, G22, G23, G24, G25, G26, G27;
wire [7:0] G30, G31, G32, G33, G34, G35, G36, G37;
wire [7:0] G40, G41, G42, G43, G44, G45, G46, G47;
wire [7:0] G50, G51, G52, G53, G54, G55, G56, G57;
wire [7:0] G60, G61, G62, G63, G64, G65, G66, G67;
wire [7:0] G70, G71, G72, G73, G74, G75, G76, G77;
wire [7:0] B00, B01, B02, B03, B04, B05, B06, B07;
wire [7:0] B10, B11, B12, B13, B14, B15, B16, B17;
wire [7:0] B20, B21, B22, B23, B24, B25, B26, B27;
wire [7:0] B30, B31, B32, B33, B34, B35, B36, B37;
wire [7:0] B40, B41, B42, B43, B44, B45, B46, B47;
wire [7:0] B50, B51, B52, B53, B54, B55, B56, B57;
wire [7:0] B60, B61, B62, B63, B64, B65, B66, B67;
wire [7:0] B70, B71, B72, B73, B74, B75, B76, B77;
wire [7:0] Y00, Y01, Y02, Y03, Y04, Y05, Y06, Y07;
wire [7:0] Y10, Y11, Y12, Y13, Y14, Y15, Y16, Y17;
wire [7:0] Y20, Y21, Y22, Y23, Y24, Y25, Y26, Y27;
wire [7:0] Y30, Y31, Y32, Y33, Y34, Y35, Y36, Y37;
wire [7:0] Y40, Y41, Y42, Y43, Y44, Y45, Y46, Y47;
wire [7:0] Y50, Y51, Y52, Y53, Y54, Y55, Y56, Y57;
wire [7:0] Y60, Y61, Y62, Y63, Y64, Y65, Y66, Y67;
wire [7:0] Y70, Y71, Y72, Y73, Y74, Y75, Y76, Y77;
wire [7:0] Cb00, Cb01, Cb02, Cb03, Cb04, Cb05, Cb06, Cb07;
wire [7:0] Cb10, Cb11, Cb12, Cb13, Cb14, Cb15, Cb16, Cb17;
wire [7:0] Cb20, Cb21, Cb22, Cb23, Cb24, Cb25, Cb26, Cb27;
wire [7:0] Cb30, Cb31, Cb32, Cb33, Cb34, Cb35, Cb36, Cb37;
wire [7:0] Cb40, Cb41, Cb42, Cb43, Cb44, Cb45, Cb46, Cb47;
wire [7:0] Cb50, Cb51, Cb52, Cb53, Cb54, Cb55, Cb56, Cb57;
wire [7:0] Cb60, Cb61, Cb62, Cb63, Cb64, Cb65, Cb66, Cb67;
wire [7:0] Cb70, Cb71, Cb72, Cb73, Cb74, Cb75, Cb76, Cb77;
wire [7:0] Cr00, Cr01, Cr02, Cr03, Cr04, Cr05, Cr06, Cr07;
wire [7:0] Cr10, Cr11, Cr12, Cr13, Cr14, Cr15, Cr16, Cr17;
wire [7:0] Cr20, Cr21, Cr22, Cr23, Cr24, Cr25, Cr26, Cr27;
wire [7:0] Cr30, Cr31, Cr32, Cr33, Cr34, Cr35, Cr36, Cr37;
wire [7:0] Cr40, Cr41, Cr42, Cr43, Cr44, Cr45, Cr46, Cr47;
wire [7:0] Cr50, Cr51, Cr52, Cr53, Cr54, Cr55, Cr56, Cr57;
wire [7:0] Cr60, Cr61, Cr62, Cr63, Cr64, Cr65, Cr66, Cr67;
wire [7:0] Cr70, Cr71, Cr72, Cr73, Cr74, Cr75, Cr76, Cr77;
assign {R00, R01, R02, R03, R04, R05, R06, R07, R10, R11, R12, R13, R14, R15, R16, R17, R20, R21, R22, R23, R24, R25, R26, R27, R30, R31, R32, R33, R34, R35, R36, R37, R40, R41, R42, R43, R44, R45, R46, R47, R50, R51, R52, R53, R54, R55, R56, R57, R60, R61, R62, R63, R64, R65, R66, R67, R70, R71, R72, R73, R74, R75, R76, R77} = R;
assign {G00, G01, G02, G03, G04, G05, G06, G07, G10, G11, G12, G13, G14, G15, G16, G17, G20, G21, G22, G23, G24, G25, G26, G27, G30, G31, G32, G33, G34, G35, G36, G37, G40, G41, G42, G43, G44, G45, G46, G47, G50, G51, G52, G53, G54, G55, G56, G57, G60, G61, G62, G63, G64, G65, G66, G67, G70, G71, G72, G73, G74, G75, G76, G77} = G;
assign {B00, B01, B02, B03, B04, B05, B06, B07, B10, B11, B12, B13, B14, B15, B16, B17, B20, B21, B22, B23, B24, B25, B26, B27, B30, B31, B32, B33, B34, B35, B36, B37, B40, B41, B42, B43, B44, B45, B46, B47, B50, B51, B52, B53, B54, B55, B56, B57, B60, B61, B62, B63, B64, B65, B66, B67, B70, B71, B72, B73, B74, B75, B76, B77} = B;
always @* begin
    Y  = {Y00, Y01, Y02, Y03, Y04, Y05, Y06, Y07, Y10, Y11, Y12, Y13, Y14, Y15, Y16, Y17, Y20, Y21, Y22, Y23, Y24, Y25, Y26, Y27, Y30, Y31, Y32, Y33, Y34, Y35, Y36, Y37, Y40, Y41, Y42, Y43, Y44, Y45, Y46, Y47, Y50, Y51, Y52, Y53, Y54, Y55, Y56, Y57, Y60, Y61, Y62, Y63, Y64, Y65, Y66, Y67, Y70, Y71, Y72, Y73, Y74, Y75, Y76, Y77};
    Cb = {Cb00, Cb01, Cb02, Cb03, Cb04, Cb05, Cb06, Cb07, Cb10, Cb11, Cb12, Cb13, Cb14, Cb15, Cb16, Cb17, Cb20, Cb21, Cb22, Cb23, Cb24, Cb25, Cb26, Cb27, Cb30, Cb31, Cb32, Cb33, Cb34, Cb35, Cb36, Cb37, Cb40, Cb41, Cb42, Cb43, Cb44, Cb45, Cb46, Cb47, Cb50, Cb51, Cb52, Cb53, Cb54, Cb55, Cb56, Cb57, Cb60, Cb61, Cb62, Cb63, Cb64, Cb65, Cb66, Cb67, Cb70, Cb71, Cb72, Cb73, Cb74, Cb75, Cb76, Cb77};
    Cr = {Cr00, Cr01, Cr02, Cr03, Cr04, Cr05, Cr06, Cr07, Cr10, Cr11, Cr12, Cr13, Cr14, Cr15, Cr16, Cr17, Cr20, Cr21, Cr22, Cr23, Cr24, Cr25, Cr26, Cr27, Cr30, Cr31, Cr32, Cr33, Cr34, Cr35, Cr36, Cr37, Cr40, Cr41, Cr42, Cr43, Cr44, Cr45, Cr46, Cr47, Cr50, Cr51, Cr52, Cr53, Cr54, Cr55, Cr56, Cr57, Cr60, Cr61, Cr62, Cr63, Cr64, Cr65, Cr66, Cr67, Cr70, Cr71, Cr72, Cr73, Cr74, Cr75, Cr76, Cr77};
end
rgb2ycbcr U00 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R00),
    .G(G00),
    .B(B00),
    .Y(Y00),
    .Cb(Cb00),
    .Cr(Cr00),
    .valid(valid)
);
rgb2ycbcr U01 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R01),
    .G(G01),
    .B(B01),
    .Y(Y01),
    .Cb(Cb01),
    .Cr(Cr01),
    .valid(valid)
);
rgb2ycbcr U02 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R02),
    .G(G02),
    .B(B02),
    .Y(Y02),
    .Cb(Cb02),
    .Cr(Cr02),
    .valid(valid)
);
rgb2ycbcr U03 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R03),
    .G(G03),
    .B(B03),
    .Y(Y03),
    .Cb(Cb03),
    .Cr(Cr03),
    .valid(valid)
);
rgb2ycbcr U04 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R04),
    .G(G04),
    .B(B04),
    .Y(Y04),
    .Cb(Cb04),
    .Cr(Cr04),
    .valid(valid)
);
rgb2ycbcr U05 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R05),
    .G(G05),
    .B(B05),
    .Y(Y05),
    .Cb(Cb05),
    .Cr(Cr05),
    .valid(valid)
);
rgb2ycbcr U06 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R06),
    .G(G06),
    .B(B06),
    .Y(Y06),
    .Cb(Cb06),
    .Cr(Cr06),
    .valid(valid)
);
rgb2ycbcr U07 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R07),
    .G(G07),
    .B(B07),
    .Y(Y07),
    .Cb(Cb07),
    .Cr(Cr07),
    .valid(valid)
);
rgb2ycbcr U10 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R10),
    .G(G10),
    .B(B10),
    .Y(Y10),
    .Cb(Cb10),
    .Cr(Cr10),
    .valid(valid)
);
rgb2ycbcr U11 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R11),
    .G(G11),
    .B(B11),
    .Y(Y11),
    .Cb(Cb11),
    .Cr(Cr11),
    .valid(valid)
);
rgb2ycbcr U12 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R12),
    .G(G12),
    .B(B12),
    .Y(Y12),
    .Cb(Cb12),
    .Cr(Cr12),
    .valid(valid)
);
rgb2ycbcr U13 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R13),
    .G(G13),
    .B(B13),
    .Y(Y13),
    .Cb(Cb13),
    .Cr(Cr13),
    .valid(valid)
);
rgb2ycbcr U14 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R14),
    .G(G14),
    .B(B14),
    .Y(Y14),
    .Cb(Cb14),
    .Cr(Cr14),
    .valid(valid)
);
rgb2ycbcr U15 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R15),
    .G(G15),
    .B(B15),
    .Y(Y15),
    .Cb(Cb15),
    .Cr(Cr15),
    .valid(valid)
);
rgb2ycbcr U16 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R16),
    .G(G16),
    .B(B16),
    .Y(Y16),
    .Cb(Cb16),
    .Cr(Cr16),
    .valid(valid)
);
rgb2ycbcr U17 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R17),
    .G(G17),
    .B(B17),
    .Y(Y17),
    .Cb(Cb17),
    .Cr(Cr17),
    .valid(valid)
);
rgb2ycbcr U20 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R20),
    .G(G20),
    .B(B20),
    .Y(Y20),
    .Cb(Cb20),
    .Cr(Cr20),
    .valid(valid)
);
rgb2ycbcr U21 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R21),
    .G(G21),
    .B(B21),
    .Y(Y21),
    .Cb(Cb21),
    .Cr(Cr21),
    .valid(valid)
);
rgb2ycbcr U22 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R22),
    .G(G22),
    .B(B22),
    .Y(Y22),
    .Cb(Cb22),
    .Cr(Cr22),
    .valid(valid)
);
rgb2ycbcr U23 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R23),
    .G(G23),
    .B(B23),
    .Y(Y23),
    .Cb(Cb23),
    .Cr(Cr23),
    .valid(valid)
);
rgb2ycbcr U24 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R24),
    .G(G24),
    .B(B24),
    .Y(Y24),
    .Cb(Cb24),
    .Cr(Cr24),
    .valid(valid)
);
rgb2ycbcr U25 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R25),
    .G(G25),
    .B(B25),
    .Y(Y25),
    .Cb(Cb25),
    .Cr(Cr25),
    .valid(valid)
);
rgb2ycbcr U26 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R26),
    .G(G26),
    .B(B26),
    .Y(Y26),
    .Cb(Cb26),
    .Cr(Cr26),
    .valid(valid)
);
rgb2ycbcr U27 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R27),
    .G(G27),
    .B(B27),
    .Y(Y27),
    .Cb(Cb27),
    .Cr(Cr27),
    .valid(valid)
);
rgb2ycbcr U30 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R30),
    .G(G30),
    .B(B30),
    .Y(Y30),
    .Cb(Cb30),
    .Cr(Cr30),
    .valid(valid)
);
rgb2ycbcr U31 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R31),
    .G(G31),
    .B(B31),
    .Y(Y31),
    .Cb(Cb31),
    .Cr(Cr31),
    .valid(valid)
);
rgb2ycbcr U32 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R32),
    .G(G32),
    .B(B32),
    .Y(Y32),
    .Cb(Cb32),
    .Cr(Cr32),
    .valid(valid)
);
rgb2ycbcr U33 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R33),
    .G(G33),
    .B(B33),
    .Y(Y33),
    .Cb(Cb33),
    .Cr(Cr33),
    .valid(valid)
);
rgb2ycbcr U34 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R34),
    .G(G34),
    .B(B34),
    .Y(Y34),
    .Cb(Cb34),
    .Cr(Cr34),
    .valid(valid)
);
rgb2ycbcr U35 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R35),
    .G(G35),
    .B(B35),
    .Y(Y35),
    .Cb(Cb35),
    .Cr(Cr35),
    .valid(valid)
);
rgb2ycbcr U36 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R36),
    .G(G36),
    .B(B36),
    .Y(Y36),
    .Cb(Cb36),
    .Cr(Cr36),
    .valid(valid)
);
rgb2ycbcr U37 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R37),
    .G(G37),
    .B(B37),
    .Y(Y37),
    .Cb(Cb37),
    .Cr(Cr37),
    .valid(valid)
);
rgb2ycbcr U40 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R40),
    .G(G40),
    .B(B40),
    .Y(Y40),
    .Cb(Cb40),
    .Cr(Cr40),
    .valid(valid)
);
rgb2ycbcr U41 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R41),
    .G(G41),
    .B(B41),
    .Y(Y41),
    .Cb(Cb41),
    .Cr(Cr41),
    .valid(valid)
);
rgb2ycbcr U42 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R42),
    .G(G42),
    .B(B42),
    .Y(Y42),
    .Cb(Cb42),
    .Cr(Cr42),
    .valid(valid)
);
rgb2ycbcr U43 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R43),
    .G(G43),
    .B(B43),
    .Y(Y43),
    .Cb(Cb43),
    .Cr(Cr43),
    .valid(valid)
);
rgb2ycbcr U44 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R44),
    .G(G44),
    .B(B44),
    .Y(Y44),
    .Cb(Cb44),
    .Cr(Cr44),
    .valid(valid)
);
rgb2ycbcr U45 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R45),
    .G(G45),
    .B(B45),
    .Y(Y45),
    .Cb(Cb45),
    .Cr(Cr45),
    .valid(valid)
);
rgb2ycbcr U46 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R46),
    .G(G46),
    .B(B46),
    .Y(Y46),
    .Cb(Cb46),
    .Cr(Cr46),
    .valid(valid)
);
rgb2ycbcr U47 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R47),
    .G(G47),
    .B(B47),
    .Y(Y47),
    .Cb(Cb47),
    .Cr(Cr47),
    .valid(valid)
);
rgb2ycbcr U50 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R50),
    .G(G50),
    .B(B50),
    .Y(Y50),
    .Cb(Cb50),
    .Cr(Cr50),
    .valid(valid)
);
rgb2ycbcr U51 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R51),
    .G(G51),
    .B(B51),
    .Y(Y51),
    .Cb(Cb51),
    .Cr(Cr51),
    .valid(valid)
);
rgb2ycbcr U52 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R52),
    .G(G52),
    .B(B52),
    .Y(Y52),
    .Cb(Cb52),
    .Cr(Cr52),
    .valid(valid)
);
rgb2ycbcr U53 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R53),
    .G(G53),
    .B(B53),
    .Y(Y53),
    .Cb(Cb53),
    .Cr(Cr53),
    .valid(valid)
);
rgb2ycbcr U54 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R54),
    .G(G54),
    .B(B54),
    .Y(Y54),
    .Cb(Cb54),
    .Cr(Cr54),
    .valid(valid)
);
rgb2ycbcr U55 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R55),
    .G(G55),
    .B(B55),
    .Y(Y55),
    .Cb(Cb55),
    .Cr(Cr55),
    .valid(valid)
);
rgb2ycbcr U56 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R56),
    .G(G56),
    .B(B56),
    .Y(Y56),
    .Cb(Cb56),
    .Cr(Cr56),
    .valid(valid)
);
rgb2ycbcr U57 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R57),
    .G(G57),
    .B(B57),
    .Y(Y57),
    .Cb(Cb57),
    .Cr(Cr57),
    .valid(valid)
);
rgb2ycbcr U60 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R60),
    .G(G60),
    .B(B60),
    .Y(Y60),
    .Cb(Cb60),
    .Cr(Cr60),
    .valid(valid)
);
rgb2ycbcr U61 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R61),
    .G(G61),
    .B(B61),
    .Y(Y61),
    .Cb(Cb61),
    .Cr(Cr61),
    .valid(valid)
);
rgb2ycbcr U62 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R62),
    .G(G62),
    .B(B62),
    .Y(Y62),
    .Cb(Cb62),
    .Cr(Cr62),
    .valid(valid)
);
rgb2ycbcr U63 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R63),
    .G(G63),
    .B(B63),
    .Y(Y63),
    .Cb(Cb63),
    .Cr(Cr63),
    .valid(valid)
);
rgb2ycbcr U64 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R64),
    .G(G64),
    .B(B64),
    .Y(Y64),
    .Cb(Cb64),
    .Cr(Cr64),
    .valid(valid)
);
rgb2ycbcr U65 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R65),
    .G(G65),
    .B(B65),
    .Y(Y65),
    .Cb(Cb65),
    .Cr(Cr65),
    .valid(valid)
);
rgb2ycbcr U66 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R66),
    .G(G66),
    .B(B66),
    .Y(Y66),
    .Cb(Cb66),
    .Cr(Cr66),
    .valid(valid)
);
rgb2ycbcr U67 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R67),
    .G(G67),
    .B(B67),
    .Y(Y67),
    .Cb(Cb67),
    .Cr(Cr67),
    .valid(valid)
);
rgb2ycbcr U70 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R70),
    .G(G70),
    .B(B70),
    .Y(Y70),
    .Cb(Cb70),
    .Cr(Cr70),
    .valid(valid)
);
rgb2ycbcr U71 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R71),
    .G(G71),
    .B(B71),
    .Y(Y71),
    .Cb(Cb71),
    .Cr(Cr71),
    .valid(valid)
);
rgb2ycbcr U72 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R72),
    .G(G72),
    .B(B72),
    .Y(Y72),
    .Cb(Cb72),
    .Cr(Cr72),
    .valid(valid)
);
rgb2ycbcr U73 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R73),
    .G(G73),
    .B(B73),
    .Y(Y73),
    .Cb(Cb73),
    .Cr(Cr73),
    .valid(valid)
);
rgb2ycbcr U74 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R74),
    .G(G74),
    .B(B74),
    .Y(Y74),
    .Cb(Cb74),
    .Cr(Cr74),
    .valid(valid)
);
rgb2ycbcr U75 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R75),
    .G(G75),
    .B(B75),
    .Y(Y75),
    .Cb(Cb75),
    .Cr(Cr75),
    .valid(valid)
);
rgb2ycbcr U76 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R76),
    .G(G76),
    .B(B76),
    .Y(Y76),
    .Cb(Cb76),
    .Cr(Cr76),
    .valid(valid)
);
rgb2ycbcr U77 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .R(R77),
    .G(G77),
    .B(B77),
    .Y(Y77),
    .Cb(Cb77),
    .Cr(Cr77),
    .valid(valid)
);

endmodule
