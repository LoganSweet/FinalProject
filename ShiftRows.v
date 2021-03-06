`define STATE2(r,c) inarray[(dimension*dimension-1)-((dimension*(c-1))+(r-1))]

`define OUT2(r,c) outarray[(dimension*dimension-1)-((dimension*(c-1))+(r-1))]

`define STATE(r, c) inarray[((4*c)+(8*r)+7):((4*c)+(8*r))]
`define OUT(r, c) outarray[((4*c)+(8*r)+7):((4*c)+(8*r))]

module ShiftRows (

input [127:0] inarray,
//input clk,
output [127:0] outarray

);
parameter dimension = 4;
reg X;
reg Y;
reg [1:0] counter = 2'b0;
/*
always @(posedge clk) begin
	counter = counter + 1;
	
	if (counter == 1) begin
	
		`OUT(3, 0) <= `STATE(3, 0) ;
		`OUT(3, 8) <= `STATE(3, 8) ;
		`OUT(3, 16) <= `STATE(3, 16) ;
		`OUT(3, 24) <= `STATE(3, 24) ;
		
		`OUT(2, 8) <= `STATE(2, 0) ;
		`OUT(2, 16) <= `STATE(2, 8) ;
		`OUT(2, 24) <= `STATE(2, 16) ;
		`OUT(2, 0) <= `STATE(2, 24) ;
		
		`OUT(1, 16) <= `STATE(1, 0) ;
		`OUT(1, 24) <= `STATE(1, 8) ;
		`OUT(1, 0) <= `STATE(1, 16) ;
		`OUT(1, 8) <= `STATE(1, 24) ;		
		
		
		`OUT(0, 24) <= `STATE(0, 0) ;
		`OUT(0, 0) <= `STATE(0, 8) ;
		`OUT(0, 8) <= `STATE(0, 16) ;
		`OUT(0, 16) <= `STATE(0, 24) ;		
				
	end
	else if (counter == 2) begin
		counter <= 0;
	end

end
*/

		assign `OUT(3, 0) = `STATE(3, 0) ;
		assign `OUT(3, 8) = `STATE(3, 8) ;
		assign `OUT(3, 16) = `STATE(3, 16) ;
		assign `OUT(3, 24) = `STATE(3, 24) ;
		
		assign `OUT(2, 8) = `STATE(2, 0) ;
		assign `OUT(2, 16) = `STATE(2, 8) ;
		assign `OUT(2, 24) = `STATE(2, 16) ;
		assign `OUT(2, 0) = `STATE(2, 24) ;
		
		assign `OUT(1, 16) = `STATE(1, 0) ;
		assign `OUT(1, 24) = `STATE(1, 8) ;
		assign `OUT(1, 0) = `STATE(1, 16) ;
		assign `OUT(1, 8) = `STATE(1, 24) ;		
		
		
		assign `OUT(0, 24) = `STATE(0, 0) ;
		assign `OUT(0, 0) = `STATE(0, 8) ;
		assign `OUT(0, 8) = `STATE(0, 16) ;
		assign `OUT(0, 16) = `STATE(0, 24) ;	
		


endmodule


module testSR();

reg [127:0] s;

wire [127:0] so;
ShiftRows shift(s, so);



initial begin

$display("ShiftOut ");
s = 128'b00000000000000000000000010111100000000000000000000001010000000000000000000000000000000000000000000000000000000000000000000000000 
; #200
$display("%b ", so); 

end

endmodule

