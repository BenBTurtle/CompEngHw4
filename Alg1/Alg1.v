module Alg1(input clk,
input [size-1:0] aIn, bIn, //32 bit inputs and outputs for testing
output reg [size-1:0] result);

parameter size = 32;// change this to the width of the operation in bits

reg [size-1:0] s;
reg [size-1:0] a;
reg [size-1:0] b;
initial begin //set initial state
	s = 0;
	a = aIn;
	b = bIn;
end

always @(posedge clk) begin //posedge to prevent clock related computation errors
	if (b==0) begin
		result = s;
	end else begin
		s = s+a; b = b-1;
	end
	
end

endmodule