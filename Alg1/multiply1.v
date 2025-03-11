module mul1 (input clk, load,
input [7:0] aIn, bIn, //32 bit inputs and outputs for testing
output reg [15:0] result);


reg [7:0] s;
reg [7:0] a;
reg [7:0] b;
initial begin //set initial state
	s = 8'd0;
	a = 8'd0;
	b = 8'd0;
end

always @(posedge clk) begin //posedge to prevent clock related computation errors
	case (load)
		1'b1 : begin
			if (b==0) begin
				result = s;
			end else begin
				s = s+a; b = b-1;
			end
		end 1'b0 : begin
			s = 0;
			a = aIn;
			b = bIn;
		end
	endcase
end

endmodule

