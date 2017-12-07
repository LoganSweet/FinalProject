`include "AddRoundKey.v"
`include "SubBytes.v"
`include "ShiftRows.v"
`include "MixColumns.v"
`include "KeyExpansion.v"


module RoundA(
	input [127:0] KeyIn,
	input [127:0] StateIn,
	input [7:0] iterate,
	output [127:0] KeyOut,
	output [127:0] StateOut
);

wire [127:0] RoundKey;
wire [127:0] ARKOut;
wire [127:0] SBOut;
wire [127:0] SROut;
wire [127:0] MCOut;

KeyExp128 Keytest(KeyIn, iterate, RoundKey);  // takes in old KeyIn, gives out new Key

AddRoundKey ARKtest(StateIn, RoundKey, ARKOut); // takes in In, Key, gives out Out
		
SubBytes SBtest(ARKOut, SBOut);

ShiftRows SRtest(SBOut, SROut);
		
MixColumns MCtest(SROut, MCOut); 

assign KeyOut = RoundKey;
assign StateOut = MCOut;

endmodule
/*
module testA();

reg [127:0] KI;
reg [127:0] SI;
reg [7:0] it;
wire [127:0] KO;
wire [127:0] STO;

RoundA round(KI, SI, it, KO, STO);
initial begin

KI = 128'b1010; SI = 128'b1100; it = 8'b10; #40
$display("%b | %b ", KI[31:0], KO [31:0]);
$display("%b | %b ", SI[31:0], STO[31:0]);

end

endmodule*/



module RoundB(
	input [127:0] KeyIn,
	input [127:0] StateIn,
	input [7:0] iterate,
	output [127:0] KeyOut,
	output [127:0] StateOut
);

wire [127:0] RoundKey;
wire [127:0] ARKOut;
wire [127:0] SBOut;
wire [127:0] SROut;

KeyExp128 Keytest(KeyIn, iterate, RoundKey);  // takes in old KeyIn, gives out new Key

AddRoundKey ARKtest(StateIn, RoundKey, ARKOut); // takes in In, Key, gives out Out
		
SubBytes SBtest(ARKOut, SBOut);

ShiftRows SRtest(SBOut, SROut);

assign KeyOut = RoundKey;
assign StateOut = SROut;

endmodule

module FSM(
input clk,
output reg DCtrl, 
output reg [7:0] iterate
);

reg [7:0] counter; // counting is a little messed up (which is only problematic for iterate), so changing it to 9

initial counter = 8'b0;
initial iterate = 8'b0;
initial DCtrl = 0;

always @(posedge clk) begin
	counter <= counter + 1;
	iterate <= iterate + 1;
	if (counter > 0 && counter < 9) begin
		DCtrl <= 0;
	end
	else if (counter == 9) begin
		DCtrl <= 1;
	end
	else if (counter > 9)begin
		counter <= 0;
		DCtrl <= 0;
		iterate <= 0;
	end
end
endmodule
/*
module testFSM();
reg clk;
wire Ctrl;
wire [7:0] iterate;

initial clk=0;
always #10 clk=!clk;

FSM fsmt(clk,Ctrl,iterate);

initial begin
#245
$display("%b | %b ", Ctrl, iterate);


$finish;
end

endmodule
*/



