// unclear if we need macros here either, since we're not actually moving things around.

`define STATE(r,c) inarray[(dimension*dimension-1)-((dimension*(c-1))+(r-1))]

`define OUT(r,c) outarray[(dimension*dimension-1)-((dimension*(c-1))+(r-1))]

module MixColumns(
input [127:0] inarray, 
output [127:0] outarray
);
parameter length = 32;

wire [length - 1:0] d0b0OUT;
wire [length - 1:0] d0b1OUT;
wire [length - 1:0] d0b2OUT;
wire [length - 1:0] d0b3OUT;
wire [length - 1:0] d0OUT;

wire [length - 1:0] d1b0OUT;
wire [length - 1:0] d1b1OUT;
wire [length - 1:0] d1b2OUT;
wire [length - 1:0] d1b3OUT;
wire [length - 1:0] d1OUT;

wire [length - 1:0] d2b0OUT;
wire [length - 1:0] d2b1OUT;
wire [length - 1:0] d2b2OUT;
wire [length - 1:0] d2b3OUT;
wire [length - 1:0] d2OUT;

wire [length - 1:0] d3b0OUT;
wire [length - 1:0] d3b1OUT;
wire [length - 1:0] d3b2OUT;
wire [length - 1:0] d3b3OUT;
wire [length - 1:0] d3OUT;

//parameter c = 1;

genvar c;
generate 
	for (c = 1; c < 5; c = c + 1) begin

		
		Mult2 d0b0(inarray[((c-1)*32+31):(c-1)*32+24], d0b0OUT[(32-(8*(c-1))-1):(32-8*c)] );
		
		Mult3 d0b1(inarray[((c-1)*32+23):(c-1)*32+16], d0b1OUT[(32-(8*(c-1))-1):(32-8*c)]);
		
		assign d0b2OUT[(32-(8*(c-1))-1):(32-8*c)] = inarray[((c-1)*32+15):(c-1)*32+8];
		
		assign d0b3OUT[(32-(8*(c-1))-1):(32-8*c)] = inarray[(((c-1)*32)+7):((c-1)*32)];
		
		BigXOR d0xor(d0b0OUT[(32-(8*(c-1))-1):(32-8*c)], d0b1OUT[(32-(8*(c-1))-1):(32-8*c)], d0b2OUT[(32-(8*(c-1))-1):(32-8*c)], d0b3OUT[(32-(8*(c-1))-1):(32-8*c)], d0OUT[(32-(8*(c-1))-1):(32-8*c)]);

		assign d1b0OUT[(32-(8*(c-1))-1):(32-8*c)] = inarray[((c-1)*32+31):(c-1)*32+24];
		Mult2 d1b1(inarray[((c-1)*32+23):(c-1)*32+16], d1b1OUT[(32-(8*(c-1))-1):(32-8*c)]);
		Mult3 d1b2(inarray[((c-1)*32+15):(c-1)*32+8], d1b2OUT[(32-(8*(c-1))-1):(32-8*c)]);
		assign d1b3OUT[(32-(8*(c-1))-1):(32-8*c)] = inarray[((c-1)*32+7):(c-1)*32];
		BigXOR d1xor(d1b0OUT[(32-(8*(c-1))-1):(32-8*c)], d1b1OUT[(32-(8*(c-1))-1):(32-8*c)], d1b2OUT[(32-(8*(c-1))-1):(32-8*c)], d1b3OUT[(32-(8*(c-1))-1):(32-8*c)], d1OUT[(32-(8*(c-1))-1):(32-8*c)]);
		
		assign d2b0OUT[(32-(8*(c-1))-1):(32-8*c)] = inarray[((c-1)*32+31):(c-1)*32+24];
		assign d2b1OUT[(32-(8*(c-1))-1):(32-8*c)] = inarray[((c-1)*32+23):(c-1)*32+16];
		Mult2 d2b2(inarray[((c-1)*32+15):(c-1)*32+8], d2b2OUT[(32-(8*(c-1))-1):(32-8*c)]);
		Mult3 d2b3(inarray[((c-1)*32+7):(c-1)*32], d2b3OUT[(32-(8*(c-1))-1):(32-8*c)]);
		BigXOR d2xor(d2b0OUT[(32-(8*(c-1))-1):(32-8*c)], d2b1OUT[(32-(8*(c-1))-1):(32-8*c)], d2b2OUT[(32-(8*(c-1))-1):(32-8*c)], d2b3OUT[(32-(8*(c-1))-1):(32-8*c)], d2OUT[(32-(8*(c-1))-1):(32-8*c)]);
		
		Mult3 d3b0(inarray[((c-1)*32+31):(c-1)*32+24], d3b0OUT[(32-(8*(c-1))-1):(32-8*c)]);
		assign d3b1OUT[(32-(8*(c-1))-1):(32-8*c)] = inarray[((c-1)*32+23):(c-1)*32+16];
		assign d3b2OUT[(32-(8*(c-1))-1):(32-8*c)] = inarray[((c-1)*32+15):(c-1)*32+8];
		Mult2 d3b3(inarray[((c-1)*32+7):(c-1)*32], d3b3OUT[(32-(8*(c-1))-1):(32-8*c)]);
		BigXOR d3xor(d3b0OUT[(32-(8*(c-1))-1):(32-8*c)], d3b1OUT[(32-(8*(c-1))-1):(32-8*c)], d3b2OUT[(32-(8*(c-1))-1):(32-8*c)], d3b3OUT[(32-(8*(c-1))-1):(32-8*c)], d3OUT[(32-(8*(c-1))-1):(32-8*c)]);
		
		//assign d0d1 = {d0OUT, d1OUT};
		//assign d2d3 = {d2OUT, d3OUT};
		
		assign outarray[(32*(c-1)+31):(32*(c-1))] = {d0OUT[(32-(8*(c-1))-1):(32-8*c)], d1OUT[(32-(8*(c-1))-1):(32-8*c)],d2OUT[(32-(8*(c-1))-1):(32-8*c)], d3OUT[(32-(8*(c-1))-1):(32-8*c)]};
		//assign outarray = d1b1OUT;
	end
	
endgenerate

endmodule

module Mult2(
input [7:0] inmult2,
output [7:0] outmult2
);

reg isone;
wire [7:0] shiftedin;
reg [7:0] oneB = 8'b00011011;
reg [1:0] counter = 2'b0;
wire [7:0] tobeXOR;

assign shiftedin = {inmult2[6:0], 1'b0};
tinydecoder decode(inmult2[7], tobeXOR);
XOR8b_MC xorb(shiftedin, tobeXOR, outmult2);

endmodule

module XOR8b_MC(
input [7:0] V,
input [7:0] W,
output [7:0] Z
);

assign Z = V^W;

endmodule

module tinydecoder(
    MSBctrl,
    Data_out
    );

    input MSBctrl;
    output reg [7:0] Data_out; 
    reg [7:0] oneB = 8'b00011011;
    reg [7:0] zeros = 8'b0;

    //Whenever there is a change in the Data_in, execute the always block.
    always @(MSBctrl)
    case (MSBctrl)   //case statement. Check all the 8 combinations.
        0 : Data_out = zeros;
        1 : Data_out = oneB;

        //To make sure that latches are not created create a default value for output.
        default : Data_out = 8'b00000000; 
    endcase
    
endmodule

module Mult3(
input[7:0] inmult3,
output [7:0] outmult3
);
wire [7:0] shiftedin3;

Mult2 mult2(inmult3, shiftedin3);
XOR8b_MC xorb3(shiftedin3, inmult3, outmult3);

endmodule

module BigXOR(
input [7:0] V,
input [7:0] W,
input [7:0] X,
input [7:0] Y,
output [7:0] Z
);

wire [7:0] A;
wire [7:0] B;

assign A = V^W;
assign B = X^Y;
assign Z = A^B;

endmodule
/*
module testMixCol();

reg [127:0] inmix;
wire [127:0] outmix;

MixColumns mix(inmix, outmix);


initial begin

inmix = 128'h123;  #200
$display("%b", outmix);
$display("real input");
$display("%b", inmix);


end

endmodule
*/








