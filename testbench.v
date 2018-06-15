`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2018 01:38:04 PM
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench();

reg [16:0]   BRAM_PORTA_addr;
reg         BRAM_PORTA_clk;
reg [11:0]  BRAM_PORTA_din;
wire [11:0] BRAM_PORTA_dout;
//reg         BRAM_PORTA_en;
reg [0:0]   BRAM_PORTA_we;

reg [8:0] i;
integer f;


top_wrapper DUT (
    .BRAM_PORTA_addr( BRAM_PORTA_addr),
    .BRAM_PORTA_clk ( BRAM_PORTA_clk), 
    .BRAM_PORTA_din ( BRAM_PORTA_din), 
    .BRAM_PORTA_dout( BRAM_PORTA_dout),
//    .BRAM_PORTA_en  ( BRAM_PORTA_en),  
    .BRAM_PORTA_we  ( BRAM_PORTA_we)
); 

initial begin
    BRAM_PORTA_addr = 17'd0;
    BRAM_PORTA_clk  = 1'b0;
    BRAM_PORTA_din  = 12'h000;
//    BRAM_PORTA_en   = 1'b0;
    BRAM_PORTA_we   = 1'b0; 
    f = $fopen("pixel.coe") ;
end

always begin
    #5; BRAM_PORTA_clk = ~BRAM_PORTA_clk; 
end

initial begin
    gen_circle;
     $fclose(f);
    #50;
    // enable ram
//    BRAM_PORTA_en = 1'b1;
    for ( i = 0; i < 256 ; i = i + 1 ) begin
        @ ( posedge BRAM_PORTA_clk ); #1;
        BRAM_PORTA_addr = i[7:0];
    end
//    read (0);
//    read (1);
//    read (2);
//    read (3);
//    read (4);
//    read (5);
//    read (6);
//    read (7);
end

task write;
  input [2:0] addr;
  input [15:0] dat;
    begin
        @ ( posedge BRAM_PORTA_clk ); #1;
        BRAM_PORTA_we = 1'b1;
        BRAM_PORTA_din  = dat;
        BRAM_PORTA_addr = addr;
        @ ( posedge BRAM_PORTA_clk ); #1
        BRAM_PORTA_we   = 1'b0;
        BRAM_PORTA_din  = 16'h0000;
        BRAM_PORTA_addr = 16'h0000;
    end    
endtask

task read;
  input [2:0] addr;
    begin
        @ ( posedge BRAM_PORTA_clk ); #1;
        BRAM_PORTA_addr = addr;
        @ ( posedge BRAM_PORTA_clk ); #1
        BRAM_PORTA_we   = 1'b0;
        BRAM_PORTA_addr = 16'h0000;
    end    
endtask

integer k, j;


task gen_circle;
    begin
        for ( k = 1; k <= 320; k = k + 1 ) begin
            for ( j = 1; j <= 240; j = j + 1 ) begin
                if ( k*k + j*j <= 10000 ) $fwrite (f, "%h,\n", 12'h000);
                else                      $fwrite (f, "%h,\n", 12'hfff);
            end
        end
    end
endtask

endmodule
