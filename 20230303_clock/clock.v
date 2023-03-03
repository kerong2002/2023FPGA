`include "counter_div.v"
`include "seg_choose.v"

module clock(clk, rst, BT2, seg, d1);
	input clk;
	input rst;
	input BT2;
	output reg [2:0] d1;				//選擇七緞
	output [6:0] seg;				//輸出七段
	wire clk_1hz;
	wire clk_test;
	counter_div #(26, 5000_0000) div1(clk, rst, clk_1hz);		//除1s
	counter_div #(26, 70_0000) div2(clk, rst, clk_test);		//掃描
	reg [3:0] take_binary;		//抓取選擇的二進制
	reg [7:0] hh;
   reg [7:0] mm;
   reg [7:0] ss;
	
	
	wire c_s,c_m,c_h;
	//wire pm_night;
	always @(posedge clk_1hz, negedge rst) begin
		if(!rst)begin
			{hh,mm,ss} <= 24'd0;
		end
		else begin
			case({c_h, c_m, c_s})
				3'b111:begin		//過一整天
					{hh,mm,ss} <= 24'd0;
				end
				3'b011:begin		//小時計數
					mm = 8'h0;
               ss = 8'h0;
					if(hh[3:0]<9)begin
						hh[3:0] <= hh[3:0] + 1'h1;
					end
					else begin
						hh[3:0] <= 4'd0;
						hh[7:4] <= hh[7:4] + 1'h1;
					end 
				end
				3'b001:begin			//分鐘計數
					ss = 8'h0;			//秒數歸零
               if(mm[3:0]<9)begin
                  mm[3:0] <= mm[3:0] + 1'h1;
               end
               else begin
                  mm[3:0] <= 4'd0;
                  mm[7:4] <= mm[7:4] + 1'h1;
               end
				end	
				default:begin			//秒數計數
					if(ss[3:0]<9)begin
                    ss[3:0] <= ss[3:0] + 1'b1;
               end
               else begin
                  ss[3:0] <= 4'd0;
                  ss[7:4] <= ss[7:4] + 1'b1;
               end
				end
			endcase
		end
	end
	
	assign c_s = ss==8'h59 ? 1'b1 : 1'b0;
	assign c_m = c_s && mm==8'h59 ? 1'b1 : 1'b0;
	assign c_h = c_m && hh==8'h23 ? 1'b1 : 1'b0;
	
	wire [3:0] wire_binary;
	assign wire_binary = take_binary;
	
	seg_choose seg_choose1(take_binary, seg);
	
	always@(posedge clk_test, negedge rst)begin
		case(d1)
			3'd0 : take_binary <= hh[7:4];
			3'd1 : take_binary <= hh[3:0];
			3'd2 : take_binary <= mm[7:4];
			3'd3 : take_binary <= mm[3:0];
			3'd4 : take_binary <= ss[7:4];
			3'd5 : take_binary <= ss[3:0];
			default : take_binary <= 4'd0;
		endcase
	end
	
	always@(posedge clk_test, negedge rst)begin
		if(!rst)begin
			d1 <= 3'b000;
		end
		else begin
			if(d1 < 3'd5)begin
				d1 <= d1 + 3'd1;
			end
			else begin
				d1 <= 3'b000;
			end
		end
	end
	
	
endmodule 