module GFieldMultInverse(

input num,
output outnum 

);

reg out;
wire [1:0] in;
always @(in)
case(in)
    2'b00 : out = 0;
    2'b01 : out = 1;
    2'b10 : out = 1;
    2'b11 : out = 0;
endcase

01 8d f6 cb 52 7b d1 e8 4f 29 c0 b0 e1 e5 c7 
74 b4 aa 4b 99 2b 60 5f 58 3f fd cc ff 40 ee b2 
3a 6e 5a f1 55 4d a8 c9 c1 0a 98 15 30 44 a2 c2 
2c 45 92 6c f3 39 66 42 f2 35 20 6f 77 bb 59 19 
1d fe 37 67 2d 31 f5 69 a7 64 ab 13 54 25 e9 09 
ed 5c 05 ca 4c 24 87 bf 18 3e 22 f0 51 ec 61 17 
16 5e af d3 49 a6 36 43 f4 47 91 df 33 93 21 3b 
79 b7 97 85 10 b5 ba 3c b6 70 d0 06 a1 fa 81 82 
83 7e 7f 80 96 73 be 56 9b 9e 95 d9 f7 02 b9 a4 
de 6a 32 6d d8 8a 84 72 2a 14 9f 88 f9 dc 89 9a 
fb 7c 2e c3 8f b8 65 48 26 c8 12 4a ce e7 d2 62 
0c e0 1f ef 11 75 78 71 a5 8e 76 3d bd bc 86 57 
0b 28 2f a3 da d4 e4 0f a9 27 53 04 1b fc ac e6 
7a 07 ae 63 c5 db e2 ea 94 8b c4 d5 9d f8 90 6b 
b1 0d d6 eb c6 0e cf ad 08 4e d7 e3 5d 50 1e b3 
5b 23 38 34 68 46 03 8c dd 9c 7d a0 cd 1a 41 1c 