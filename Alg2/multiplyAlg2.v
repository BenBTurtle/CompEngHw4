module mul2 (input clk, load,
input [7:0] aIn, bIn, 
output reg [15:0] result);


reg [15:0] s;
reg [15:0] c;
reg [15:0] a;
reg [15:0] b;

initial begin //set initial state
	s = 0;
	c = 8;
	a = 0;
	b = 0;
end

always @(posedge clk) begin //posedge to prevent clock related computation errors
	case (load)
		1'b1 : begin
			if (c==0) begin
				result = s;
			end else begin
				if (b[0] == 1) begin
					s = s+a;
				end else begin
					s = s;
				end
				a = a<<1; 
				b = b>>1; 
				c=c-1;
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