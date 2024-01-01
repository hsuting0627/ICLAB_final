module dct_1d(
    input clk,
    input rst_n,
    input enable,
    input signed [10-1:0] x0,
    input signed [10-1:0] x1,
    input signed [10-1:0] x2,
    input signed [10-1:0] x3,
    input signed [10-1:0] x4,
    input signed [10-1:0] x5,
    input signed [10-1:0] x6,
    input signed [10-1:0] x7,

    output reg [10-1:0] y0,
    output reg [10-1:0] y1,
    output reg [10-1:0] y2,
    output reg [10-1:0] y3,
    output reg [10-1:0] y4,
    output reg [10-1:0] y5,
    output reg [10-1:0] y6,
    output reg [10-1:0] y7,
    output valid
);

reg signed [10-1:0] x0_ff, x1_ff, x2_ff, x3_ff, x4_ff, x5_ff, x6_ff, x7_ff;
reg signed [23:0] Ax0, Ax1, Ax2, Ax3, Bx0, Bx1, Bx2, Bx3, Cx0, Cx1, Cx2, Cx3, Dx4, Dx5, Dx6, Dx7, Ex4, Ex5, Ex6, Ex7, Fx4, Fx5, Fx6, Fx7, Gx4, Gx5, Gx6, Gx7;
reg signed [23:0] Ax0_ff, Ax1_ff, Ax2_ff, Ax3_ff, Bx0_ff, Bx1_ff, Bx2_ff, Bx3_ff, Cx0_ff, Cx1_ff, Cx2_ff, Cx3_ff, Dx4_ff, Dx5_ff, Dx6_ff, Dx7_ff, Ex4_ff, Ex5_ff, Ex6_ff, Ex7_ff, Fx4_ff, Fx5_ff, Fx6_ff, Fx7_ff, Gx4_ff, Gx5_ff, Gx6_ff, Gx7_ff;
reg signed [11-1:0] x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_7;
reg signed [11-1:0] x_0_ff, x_1_ff, x_2_ff, x_3_ff, x_4_ff, x_5_ff, x_6_ff, x_7_ff;
wire signed [14-1:0] A, B, C, D, E, F, G, H;
reg signed [10-1:0] y0_next, y1_next, y2_next, y3_next, y4_next, y5_next, y6_next, y7_next;
reg [23:0] y0_pre, y1_pre, y2_pre, y3_pre, y4_pre, y5_pre, y6_pre, y7_pre;
reg [23:0] y0_pre_ff, y1_pre_ff, y2_pre_ff, y3_pre_ff, y4_pre_ff, y5_pre_ff, y6_pre_ff, y7_pre_ff;

reg [23:0] Ax0pAx1, Ax2pAx3, Bx0pCx1, Cx2pBx3, Ax0mAx1 , Ax2mAx3, Cx0mBx1, Bx2mCx3, Dx4pEx5, Fx6pGx7, Ex4mGx5, Dx6pFx7, Fx4mDx5, Gx6pEx7, Gx4mFx5, Ex6mDx7;
reg [23:0] Ax0pAx1_ff, Ax2pAx3_ff, Bx0pCx1_ff, Cx2pBx3_ff, Ax0mAx1_ff, Ax2mAx3_ff, Cx0mBx1_ff, Bx2mCx3_ff, Dx4pEx5_ff, Fx6pGx7_ff, Ex4mGx5_ff, Dx6pFx7_ff, Fx4mDx5_ff, Gx6pEx7_ff, Gx4mFx5_ff, Ex6mDx7_ff;
assign A = 5793;
assign B = 7568;
assign C = 3135;
assign D = 8035;
assign E = 6811;
assign F = 4551;
assign G = 1598;

reg [5:0] pipeline;
always @ (posedge clk) begin
    if(!rst_n) begin
        pipeline <= 6'd0;
    end
    else begin
        pipeline <= {pipeline[4:0], enable};
    end
end

assign valid = pipeline[5];

always @(posedge clk) begin
    if(!rst_n) begin
        x0_ff <= 0; x1_ff <= 0; x2_ff <= 0; x3_ff <= 0;
        x4_ff <= 0; x5_ff <= 0; x6_ff <= 0; x7_ff <= 0;
    end
    else begin
        x0_ff <= x0; x1_ff <= x1; x2_ff <= x2; x3_ff <= x3;
        x4_ff <= x4; x5_ff <= x5; x6_ff <= x6; x7_ff <= x7;
    end
end

// always @(posedge clk) begin
//     if(!rst_n) begin
//         x0_ff <= 0; x1_ff <= 0; x2_ff <= 0; x3_ff <= 0;
//         x4_ff <= 0; x5_ff <= 0; x6_ff <= 0; x7_ff <= 0;
//     end
//     else if(enable) begin
//         x0_ff <= x0; x1_ff <= x1; x2_ff <= x2; x3_ff <= x3;
//         x4_ff <= x4; x5_ff <= x5; x6_ff <= x6; x7_ff <= x7;
//     end
//     else begin
//         x0_ff <= 0; x1_ff <= 0; x2_ff <= 0; x3_ff <= 0;
//         x4_ff <= 0; x5_ff <= 0; x6_ff <= 0; x7_ff <= 0;       
//     end
// end

always @(posedge clk) begin
    if(!rst_n) begin
        x_0 <= 0;
        x_1 <= 0;
        x_2 <= 0;
        x_3 <= 0;
        x_4 <= 0;
        x_5 <= 0;
        x_6 <= 0;
        x_7 <= 0;
    end
    else begin
        x_0 <= x_0_ff;
        x_1 <= x_1_ff;
        x_2 <= x_2_ff;
        x_3 <= x_3_ff;
        x_4 <= x_4_ff;
        x_5 <= x_5_ff;
        x_6 <= x_6_ff;
        x_7 <= x_7_ff;   
    end
end
always @* begin
        x_0_ff = x0_ff + x7_ff;
        x_1_ff = x1_ff + x6_ff;
        x_2_ff = x2_ff + x5_ff;
        x_3_ff = x3_ff + x4_ff;
        x_4_ff = x0_ff - x7_ff;
        x_5_ff = x1_ff - x6_ff;
        x_6_ff = x2_ff - x5_ff;
        x_7_ff = x3_ff - x4_ff;   
end
// always @(posedge clk) begin
//     if(!rst_n) begin
//         x_0 <= 0;
//         x_1 <= 0;
//         x_2 <= 0;
//         x_3 <= 0;
//         x_4 <= 0;
//         x_5 <= 0;
//         x_6 <= 0;
//         x_7 <= 0;
//     end
//     else if(enable) begin
//         x_0 <= x0_ff + x7_ff;
//         x_1 <= x1_ff + x6_ff;
//         x_2 <= x2_ff + x5_ff;
//         x_3 <= x3_ff + x4_ff;
//         x_4 <= x0_ff - x7_ff;
//         x_5 <= x1_ff - x6_ff;
//         x_6 <= x2_ff - x5_ff;
//         x_7 <= x3_ff - x4_ff;   
//     end
//     else begin
//         x_0 <= 0;
//         x_1 <= 0;
//         x_2 <= 0;
//         x_3 <= 0;
//         x_4 <= 0;
//         x_5 <= 0;
//         x_6 <= 0;
//         x_7 <= 0;
//     end
// end

always @(posedge clk) begin
    if(!rst_n) begin
        y0 <= 0;
        y1 <= 0;
        y2 <= 0;
        y3 <= 0;
        y4 <= 0;
        y5 <= 0;
        y6 <= 0;
        y7 <= 0;
    end
    else begin
        y0 <= y0_next;
        y1 <= y1_next;
        y2 <= y2_next;
        y3 <= y3_next;
        y4 <= y4_next;
        y5 <= y5_next;
        y6 <= y6_next;
        y7 <= y7_next;
    end
end

always @(posedge clk) begin
    if(!rst_n) begin
        Ax0 <= 0;
        Ax1 <= 0;
        Ax2 <= 0;
        Ax3 <= 0;
        Bx0 <= 0;
        Bx1 <= 0;
        Bx2 <= 0;
        Bx3 <= 0;
        Cx0 <= 0;
        Cx1 <= 0;
        Cx2 <= 0;
        Cx3 <= 0;
        Dx4 <= 0;
        Dx5 <= 0;
        Dx6 <= 0;
        Dx7 <= 0;
        Ex4 <= 0;
        Ex5 <= 0;
        Ex6 <= 0;
        Ex7 <= 0;
        Fx4 <= 0;
        Fx5 <= 0;
        Fx6 <= 0;
        Fx7 <= 0;
        Gx4 <= 0;
        Gx5 <= 0;
        Gx6 <= 0;
        Gx7 <= 0;
    end
    else begin
        Ax0 <= Ax0_ff;
        Ax1 <= Ax1_ff;
        Ax2 <= Ax2_ff;
        Ax3 <= Ax3_ff;
        Bx0 <= Bx0_ff;
        Bx1 <= Bx1_ff;
        Bx2 <= Bx2_ff;
        Bx3 <= Bx3_ff;
        Cx0 <= Cx0_ff;
        Cx1 <= Cx1_ff;
        Cx2 <= Cx2_ff;
        Cx3 <= Cx3_ff;
        Dx4 <= Dx4_ff;
        Dx5 <= Dx5_ff;
        Dx6 <= Dx6_ff;
        Dx7 <= Dx7_ff;
        Ex4 <= Ex4_ff;
        Ex5 <= Ex5_ff;
        Ex6 <= Ex6_ff;
        Ex7 <= Ex7_ff;
        Fx4 <= Fx4_ff;
        Fx5 <= Fx5_ff;
        Fx6 <= Fx6_ff;
        Fx7 <= Fx7_ff;
        Gx4 <= Gx4_ff;
        Gx5 <= Gx5_ff;
        Gx6 <= Gx6_ff;
        Gx7 <= Gx7_ff;
    end
end
always @* begin
    Ax0_ff = A*x_0;
    Ax1_ff = A*x_1;
    Ax2_ff = A*x_2;
    Ax3_ff = A*x_3;
    Bx0_ff = B*x_0;
    Bx1_ff = B*x_1;
    Bx2_ff = B*x_2;
    Bx3_ff = B*x_3;
    Cx0_ff = C*x_0;
    Cx1_ff = C*x_1;
    Cx2_ff = C*x_2;
    Cx3_ff = C*x_3;
    Dx4_ff = D*x_4;
    Dx5_ff = D*x_5;
    Dx6_ff = D*x_6;
    Dx7_ff = D*x_7;
    Ex4_ff = E*x_4;
    Ex5_ff = E*x_5;
    Ex6_ff = E*x_6;
    Ex7_ff = E*x_7;
    Fx4_ff = F*x_4;
    Fx5_ff = F*x_5;
    Fx6_ff = F*x_6;
    Fx7_ff = F*x_7;
    Gx4_ff = G*x_4;
    Gx5_ff = G*x_5;
    Gx6_ff = G*x_6;
    Gx7_ff = G*x_7;
end

always @(posedge clk) begin
    if(!rst_n) begin
        Ax0pAx1 <= 0;
        Ax2pAx3 <= 0;
        Bx0pCx1 <= 0;
        Cx2pBx3 <= 0;
        Ax0mAx1 <= 0;
        Ax2mAx3 <= 0;
        Cx0mBx1 <= 0;
        Bx2mCx3 <= 0;
        Dx4pEx5 <= 0;
        Fx6pGx7 <= 0;
        Ex4mGx5 <= 0;
        Dx6pFx7 <= 0;
        Fx4mDx5 <= 0;
        Gx6pEx7 <= 0;
        Gx4mFx5 <= 0;
        Ex6mDx7 <= 0;
    end
    else begin
        Ax0pAx1 <= Ax0pAx1_ff;
        Ax2pAx3 <= Ax2pAx3_ff;
        Bx0pCx1 <= Bx0pCx1_ff;
        Cx2pBx3 <= Cx2pBx3_ff;
        Ax0mAx1 <= Ax0mAx1_ff;
        Ax2mAx3 <= Ax2mAx3_ff;
        Cx0mBx1 <= Cx0mBx1_ff;
        Bx2mCx3 <= Bx2mCx3_ff;
        Dx4pEx5 <= Dx4pEx5_ff;
        Fx6pGx7 <= Fx6pGx7_ff;
        Ex4mGx5 <= Ex4mGx5_ff;
        Dx6pFx7 <= Dx6pFx7_ff;
        Fx4mDx5 <= Fx4mDx5_ff;
        Gx6pEx7 <= Gx6pEx7_ff;
        Gx4mFx5 <= Gx4mFx5_ff;
        Ex6mDx7 <= Ex6mDx7_ff;
    end
end

always @* begin
    Ax0pAx1_ff = Ax0 + Ax1;
    Ax2pAx3_ff = Ax2 + Ax3;
    Bx0pCx1_ff = Bx0 + Cx1;
    Cx2pBx3_ff = Cx2 + Bx3;
    Ax0mAx1_ff = Ax0 - Ax1;
    Ax2mAx3_ff = Ax2 - Ax3;
    Cx0mBx1_ff = Cx0 - Bx1;
    Bx2mCx3_ff = Bx2 - Cx3;
    Dx4pEx5_ff = Dx4 + Ex5;
    Fx6pGx7_ff = Fx6 + Gx7;
    Ex4mGx5_ff = Ex4 - Gx5;
    Dx6pFx7_ff = Dx6 + Fx7;
    Fx4mDx5_ff = Fx4 - Dx5;
    Gx6pEx7_ff = Gx6 + Ex7;
    Gx4mFx5_ff = Gx4 - Fx5;
    Ex6mDx7_ff = Ex6 - Dx7;
end

always @(posedge clk) begin
    if(!rst_n) begin
        y0_pre <= 0;
        y1_pre <= 0;
        y2_pre <= 0;
        y3_pre <= 0;
        y4_pre <= 0;
        y5_pre <= 0;
        y6_pre <= 0;
        y7_pre <= 0;
    end
    else begin
        y0_pre <= y0_pre_ff;
        y1_pre <= y1_pre_ff;
        y2_pre <= y2_pre_ff;
        y3_pre <= y3_pre_ff;
        y4_pre <= y4_pre_ff;
        y5_pre <= y5_pre_ff;
        y6_pre <= y6_pre_ff;
        y7_pre <= y7_pre_ff;
    end
end
always @* begin
        y0_pre_ff = Ax0pAx1 + Ax2pAx3;
        y2_pre_ff = Bx0pCx1 - Cx2pBx3;
        y4_pre_ff = Ax0mAx1 - Ax2mAx3;
        y6_pre_ff = Cx0mBx1 + Bx2mCx3;
        y1_pre_ff = Dx4pEx5 + Fx6pGx7;
        y3_pre_ff = Ex4mGx5 - Dx6pFx7;
        y5_pre_ff = Fx4mDx5 + Gx6pEx7;
        y7_pre_ff = Gx4mFx5 + Ex6mDx7;
end
always @* begin
    y0_next = y0_pre[13] ? y0_pre[23:14] + 1 : y0_pre[23:14];
    y1_next = y1_pre[13] ? y1_pre[23:14] + 1 : y1_pre[23:14];
    y2_next = y2_pre[13] ? y2_pre[23:14] + 1 : y2_pre[23:14];
    y3_next = y3_pre[13] ? y3_pre[23:14] + 1 : y3_pre[23:14];
    y4_next = y4_pre[13] ? y4_pre[23:14] + 1 : y4_pre[23:14];
    y5_next = y5_pre[13] ? y5_pre[23:14] + 1 : y5_pre[23:14];
    y6_next = y6_pre[13] ? y6_pre[23:14] + 1 : y6_pre[23:14];
    y7_next = y7_pre[13] ? y7_pre[23:14] + 1 : y7_pre[23:14];
end
endmodule
