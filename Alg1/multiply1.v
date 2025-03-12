module mul1 (input clk, load,
input [7:0] aIn, bIn, 
output [15:0] result);


reg [15:0] s;
reg [15:0] a;
reg [15:0] b;
reg [15:0] rout;
initial begin //set initial state
	s = 0;
	a = 0;
	b = 0;
	rout = 0;
end

always @(posedge clk) begin //posedge to prevent clock related computation errors
	case (load)
		1'b1 : begin
			if (b==0) begin
				rout = s;
			end else begin
				s = s+a; 
				b = b-1;
			end
		end 1'b0 : begin
			s = 0;
			a = aIn;
			b = bIn;
		end
	endcase
end

assign result = rout;

endmodule




module multiplierTB();

reg clk, load;
reg [7:0] aIn, bIn;
wire [15:0] result;

mul1 DUT(clk, load, aIn, bIn, result);

initial begin
	clk = 0; load = 0; aIn = 20; bIn = 23; #10;
	load = 1; aIn = 20; bIn = 23; #10;
	load = 0; aIn = 20; bIn = 23; #10;
	load = 1; aIn = 20; bIn = 23; #100;
	$stop;
end

always begin
	#2 clk = ~clk;
end

endmodule