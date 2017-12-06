`include "InvSBoxLookup.v" 

module InvSubBytes(
input [127:0] in,
output [127:0] InvSBOut
);

genvar i;
generate
for (i = 1; i < 17; i = i + 1) begin
	InvSBoxLookup assignvalues(in[((8*i)-1):(8*(i-1))], InvSBOut[((8*i)-1):(8*(i-1))]);
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
AO = 127'b0; #40
$display("%b | 01100011 | %b ", SBO[7:0], AO[7:0]);
end


endmodule*/
