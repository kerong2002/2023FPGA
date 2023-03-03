module seg_choose(in_4,out_LED_7);
	input [3:0] in_4;
	output reg [6:0] out_LED_7;
	always @(*)begin
		case(in_4)
			4'h0 : out_LED_7 = 7'b1111110;
			4'h1 : out_LED_7 = 7'b0110000;
			4'h2 : out_LED_7 = 7'b1101101;
			4'h3 : out_LED_7 = 7'b1111001;
			4'h4 : out_LED_7 = 7'b0110011;
			4'h5 : out_LED_7 = 7'b1011011;
			4'h6 : out_LED_7 = 7'b1011111;
			4'h7 : out_LED_7 = 7'b1110000;
			4'h8 : out_LED_7 = 7'b1111111;
			4'h9 : out_LED_7 = 7'b1110011;
			4'ha : out_LED_7 = 7'b1110111;
			4'hb : out_LED_7 = 7'b0011111;
			4'hc : out_LED_7 = 7'b0001101;
			4'hd : out_LED_7 = 7'b0111101;
			4'he : out_LED_7 = 7'b1101111;
			4'hf : out_LED_7 = 7'b1000111;
		endcase
	end
	
endmodule 