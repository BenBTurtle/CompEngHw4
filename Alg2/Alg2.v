module Alg2(input clk, load, aOrb, set, //load runs the multiplier and set is there for setting values
input [size-1:0] currIn, //32 bit inputs and outputs for testing
output [0:(size*2)-1] result,
output [7:0] disp0, disp1, disp2, disp3);

parameter size = 8;// change this to the width of the operation in bits

reg [size-1:0] a;
reg [size-1:0] b;

initial begin
	a = 0;
	b = 0;
	//result = 0;
end

always @(posedge clk) begin
	
	a = (aOrb == 0 && set == 0)? currIn : a;
	b = (aOrb == 1 && set == 0)? currIn : b;
	
end

mul2 mult(.clk(clk), .load(load), .aIn(a), .bIn(b), .result(result));

hexSevenSegmentDecoder h0(result[0:3],disp3);
hexSevenSegmentDecoder h1(result[4:7],disp2);
hexSevenSegmentDecoder h2(result[8:11],disp1);
hexSevenSegmentDecoder h3(result[12:15],disp0);

endmodule
