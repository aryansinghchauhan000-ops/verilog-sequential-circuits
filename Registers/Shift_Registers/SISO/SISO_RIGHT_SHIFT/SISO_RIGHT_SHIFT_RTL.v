module SISO_RIGHT_SHIFT(clk,rst,clr,ld,en,d,s_in,s_out,q);
  input [3:0]d;
  input clk, rst, clr, ld, en, s_in;
  output reg [3:0]q;
  output s_out;

  
