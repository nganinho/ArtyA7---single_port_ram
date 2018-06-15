//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Fri Jun 15 15:12:09 2018
//Host        : VN-PC006 running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target top_wrapper.bd
//Design      : top_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module top_wrapper
   (BRAM_PORTA_addr,
    BRAM_PORTA_clk,
    BRAM_PORTA_din,
    BRAM_PORTA_dout,
    BRAM_PORTA_we);
  input [16:0]BRAM_PORTA_addr;
  input BRAM_PORTA_clk;
  input [11:0]BRAM_PORTA_din;
  output [11:0]BRAM_PORTA_dout;
  input [0:0]BRAM_PORTA_we;

  wire [16:0]BRAM_PORTA_addr;
  wire BRAM_PORTA_clk;
  wire [11:0]BRAM_PORTA_din;
  wire [11:0]BRAM_PORTA_dout;
  wire [0:0]BRAM_PORTA_we;

  top top_i
       (.BRAM_PORTA_addr(BRAM_PORTA_addr),
        .BRAM_PORTA_clk(BRAM_PORTA_clk),
        .BRAM_PORTA_din(BRAM_PORTA_din),
        .BRAM_PORTA_dout(BRAM_PORTA_dout),
        .BRAM_PORTA_we(BRAM_PORTA_we));
endmodule
