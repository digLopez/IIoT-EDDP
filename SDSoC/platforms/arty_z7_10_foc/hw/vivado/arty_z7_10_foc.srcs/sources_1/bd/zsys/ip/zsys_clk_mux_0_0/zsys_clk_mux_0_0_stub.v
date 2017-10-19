// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1_sdx (win64) Build 1881615 Tue May 16 18:39:18 MDT 2017
// Date        : Thu Oct  5 15:59:54 2017
// Host        : free-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               B:/cores/2017.1/design/TEC0053/platforms/arty_z7_10_foc/hw/vivado/arty_z7_10_foc.srcs/sources_1/bd/zsys/ip/zsys_clk_mux_0_0/zsys_clk_mux_0_0_stub.v
// Design      : zsys_clk_mux_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "clk_mux,Vivado 2017.1_sdx" *)
module zsys_clk_mux_0_0(clk0, clk1, sel, clkout)
/* synthesis syn_black_box black_box_pad_pin="clk0,clk1,sel,clkout" */;
  input clk0;
  input clk1;
  input sel;
  output clkout;
endmodule
