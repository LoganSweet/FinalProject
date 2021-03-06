`include "SBoxLookup.v" 

module SubBytes(
input [127:0] ARKOut,
output [127:0] SBOut
);

genvar i;
generate
for (i = 1; i < 17; i = i + 1) begin
	SBoxLookup assignvalues(ARKOut[((8*i)-1):(8*(i-1))], SBOut[((8*i)-1):(8*(i-1))]);
end

endgenerate

endmodule

/*
module testSubBytes();

reg [127:0] AO;
wire [127:0] SBO;

SubBytes testSB(AO, SBO);
		
initial begin
$display("Output | Expect | Input ");
AO = 128'hABC; #40
$display("%b ", SBO);
end


endmodule*/
