module Alg2(input clk, load, aOrb, set, //load runs the multiplier and set is there for setting values
input [7:0] currIn, 
output [15:0] result,
output [7:0] disp0, disp1, disp2, disp3);


reg [15:0] a;
reg [15:0] b;

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

hexSevenSegmentDecoder h0(result[3:0],disp0);
hexSevenSegmentDecoder h1(result[7:4],disp1);
hexSevenSegmentDecoder h2(result[11:8],disp2);
hexSevenSegmentDecoder h3(result[15:12],disp3);
endmodule



module algorithmTB();


reg clk, load, aOrb, set; //default states, load and set = 1, aOrb = 0
reg [7:0] currIn;

wire [15:0] result;
wire [7:0] disp0, disp1, disp2, disp3;

Alg2 DUT(clk, load, aOrb, set, currIn, result, disp0, disp1, disp2, disp3);

always begin
	#2 clk=~clk;
end

initial begin
	clk = 0; load = 1; set = 1; aOrb = 0; currIn = 0; #10;//set defaults
	
	load = 1; set = 1; aOrb = 0; currIn = 20; #8; //putting the value 20 into A
	load = 1; set = 0; aOrb = 0; currIn = 20; #8; //button press to set 20 as A
	
	load = 1; set = 1; aOrb = 1; currIn = 23; #8; //putting the value 23 into B
	load = 1; set = 0; aOrb = 1; currIn = 23; #8; //button press and switch set to set B as 23
	
	load = 0; set = 1; aOrb = 1; currIn = 23; #8; //executing multiplication instruction
	load = 1; set = 1; aOrb = 1; currIn = 23; #100; //waiting for instruction to complete
	$stop; //end simulation with completed instruction
	 
end

endmodule