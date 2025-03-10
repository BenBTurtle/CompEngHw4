module mul2 (input clk, load,
input [size-1:0] aIn, bIn, //32 bit inputs and outputs for testing
output reg [(size*2)-1:0] result);

parameter size = 8;// change this to the width of the operation in bits

reg [size-1:0] s;
reg [size-1:0] c;
reg [size-1:0] a;
reg [size-1:0] b;
initial begin //set initial state
	s = 8'd0;
	c = 8'd8;
	a = 8'd0;
	b = 8'd0;
end

always @(posedge clk) begin //posedge to prevent clock related computation errors
	case (load)
		1'b1 : begin
			if (c==0) begin
				result = s;
			end else if (b[0] == 1) begin
				s = a+s;
			end else begin
				a = a<<1; b = b>>1; c=c-1;
			end
		end 1'b0 : begin
			s = 0;
			c = 8;
			a = aIn;
			b = bIn;
		end
	endcase
end

endmodule