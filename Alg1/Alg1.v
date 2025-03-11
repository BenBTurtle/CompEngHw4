module Alg1(input clk, load, aOrb, set, //load runs the multiplier and set is there for setting values
input [7:0] currIn, //32 bit inputs and outputs for testing
output [0:15] result,
output [7:0] disp0, disp1, disp2, disp3);


reg [7:0] a;
reg [7:0] b;

initial begin
	a = 0;
	b = 0;
	//result = 0;
end

always @(posedge clk) begin
	
	a = (aOrb == 0 && set == 0)? currIn : a;
	b = (aOrb == 1 && set == 0)? currIn : b;
	
end

mul1 mult(.clk(clk), .load(load), .aIn(a), .bIn(b), .result(result));

hexSevenSegmentDecoder h0(result[0:3],disp3);
hexSevenSegmentDecoder h1(result[4:7],disp2);
hexSevenSegmentDecoder h2(result[8:11],disp1);
hexSevenSegmentDecoder h3(result[12:15],disp0);

endmodule


module algorithmTB();


reg clk, load, aOrb, set; //default states, load and set = 1, aOrb = 0
reg [7:0] currIn;

wire [15:0] result;
wire [7:0] disp0, disp1, disp2, disp3;

Alg1 DUT(clk, load, aOrb, set, currIn, result, disp0, disp1, disp2, disp3);

always begin
	#2 clk=~clk;
end

initial begin
	clk = 0; load = 1; set = 1; aOrb = 0; currIn = 0; #10;//set defaults
	
	load = 1; set = 1; aOrb = 0; currIn = 20; #8; //putting the value 20 into A
	load = 1; set = 0; aOrb = 0; currIn = 20; #8; //button press to set 20 as A
	
	load = 1; set = 1; aOrb = 1; currIn = 23; #8; //putting the value 23 into B
	load = 1; set = 0; aOrb = 1; currIn = 23; #8; //button press and switch set to set B as 23
	
	load = 0; set = 1; aOrb = 1; currIn = 23; #100; //executing multiplication instruction
	$stop; //end simulation
	 
end

endmodule