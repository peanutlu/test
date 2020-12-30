module(clk,rst,cnt_up,cnt_down,clk_up,clk_down,clk_out)
      input clk,rst;
	  output cnt_up,cnt_down,clk_up,clk_down,clk_out;
	  reg [2:0]cnt_up;
	  reg [2:0]cnt_down;
	  parameter N=5;
	  
	  always@(posedge clk or negedge rst)begin
	      if(!rst)
		     clk_up <= 0;
		  else if(cnt_up == (N-1)/2)
		     clk_up <= ~clk_up;
		  else if(cnt_up == N-1)
		     clk_up <= ~clk_up;
		  else 
		     clk_up <= clk_up;
		end
	  
	  always@(negedge clk or negedge rst)begin
	      if(!rst)
		     clk_down <= 0;
		  else if(cnt_down == (N-1)/2)
		     clk_down <= ~clk_down;
		  else if(cnt_down == (N-1))
		     clk_down <= clk_down;
		end
		
	  always@(posedge clk or negedge rst)begin
	      if(!rst)
		  cnt_up <= 'b0;
		  else if(cnt_up == N-1)
		  cnt_up <= 'b0;
		  else 
		  cnt_up <= cnt_up + 1'b1;
		end
	  
	  always@(negedge clk or negedge rst )
		  if(!rst)
		  cnt_down <= 'b0;
		  else if (cnt_down == N-1)
		  cnt_down <='b0;
		  else 
		  cnt_down <= cnt_down + 1'b1;
		end
	  assign clk_out = clk_up|clk_down;
endmodule
		  