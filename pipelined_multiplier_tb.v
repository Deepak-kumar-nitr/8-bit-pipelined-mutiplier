`timescale 1ns/1ps

module pipelined_multiplier_tb;

  parameter size = 8;
  
  reg clk;
  reg [size-1 : 0] a_in, b_in;
  wire [2*size-1 : 0] y_out; 

  // response checking

  // DUT
  pipelined_multiplier DUT (a_in, b_in, clk, y_out);

  // stimulus
  initial
  begin
    $dumpfile("pipelined_multiplier.vcd");
    $dumpvars(0, pipelined_multiplier_tb);

    clk = 0;
    
    # 5 a_in = 1; b_in = 2;
    #10 a_in = 3; b_in = 4;
    #10 a_in = 5; b_in = 6;
    #10 a_in = 7; b_in = 8;
    #10 a_in = 9; b_in = 10;
    #10 a_in = 11; b_in = 12;
    
    #60 $finish;
  end
  
  always  
    #5  clk =  ! clk; 
  
endmodule
