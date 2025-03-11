module mul1 (input clk, load,
input [7:0] aIn, bIn, 
output reg [15:0] result);


reg [15:0] s;
reg [15:0] a;
reg [15:0] b;
initial begin //set initial state
	s = 0;
	a = 0;
	b = 0;
end

always @(posedge clk) begin //posedge to prevent clock related computation errors
	case (load)
		1'b1 : begin
			if (b==0) begin
				result = s;
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

endmodule

