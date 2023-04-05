module adder(input clk, reset, input [7:0] in_a, in_b, output reg [8:0] out);
    always@(posedge clk or posedge reset) begin 
      if(reset) out <= 0;
      else out <= in_a + in_b;
    end
  endmodule
