//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Fri Jun 15 15:12:09 2018
//Host        : VN-PC006 running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target top.bd
//Design      : top
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "top,IP_Integrator,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=top,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "top.hwdef" *) 
module top
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

  wire [16:0]BRAM_PORTA_1_ADDR;
  wire BRAM_PORTA_1_CLK;
  wire [11:0]BRAM_PORTA_1_DIN;
  wire [11:0]BRAM_PORTA_1_DOUT;
  wire [0:0]BRAM_PORTA_1_WE;

  assign BRAM_PORTA_1_ADDR = BRAM_PORTA_addr[16:0];
  assign BRAM_PORTA_1_CLK = BRAM_PORTA_clk;
  assign BRAM_PORTA_1_DIN = BRAM_PORTA_din[11:0];
  assign BRAM_PORTA_1_WE = BRAM_PORTA_we[0];
  assign BRAM_PORTA_dout[11:0] = BRAM_PORTA_1_DOUT;
  top_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(BRAM_PORTA_1_ADDR),
        .clka(BRAM_PORTA_1_CLK),
        .dina(BRAM_PORTA_1_DIN),
        .douta(BRAM_PORTA_1_DOUT),
        .wea(BRAM_PORTA_1_WE));
endmodule
