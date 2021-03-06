% Opening the test.png and extract the matrix

a8  = imread('test8.png');
a10 = imread('test10.png');
a12 = imread('test12.png');
a14 = imread('test14.png');
a18 = imread('test18.png');
a20 = imread('test20.png');
a22 = imread('test22.png');
a24 = imread('test24.png');
a26 = imread('test26.png');
a28 = rgb2gray(imread('test28.png'));



e8  = [98 98 98 90 76 134 174 80];
e10 = [98 98 98 98 98 39 102 83 93 103 181 21];
e12 = [98 98 98 98 98 98 98 98 206 93 183 122 218 30 237 179 5 201];
e14 = [98 98 98 98 98 98 98 98 98 98 98 98 189 164 131 83 98 108 173 237 161 138 51 112];
e18 = [98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 133 191 186 62 255 21 96 172 8 132 162 129 2 3];
e20 = [98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 241 169 196 234 194 171 159 123 182 43 87 51 89 190 36 40 196 66];
e22 = [98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 118 251 123 249 87 6 30 223 8 61 217 81 161 66 203 25 216 226 200 128];
e24 = [98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 250 197 141 212 241 159 81 218 170 155 191 238 36 144 154 103 121 98 220 20 252 246 243 154];
e26 = [98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 98 116 170 126 23 201 81 15 151 235 95 236 48 111 145 23 159 160 106 173 143 121 9 253 246 23 240 74 10];



d8  = DMfunctionTest(a8);
d10 = DMfunctionTest(a10);
d12 = DMfunctionTest(a12);
d14 = DMfunctionTest(a14);
d18 = DMfunctionTest(a18);
d20 = DMfunctionTest(a20);
d22 = DMfunctionTest(a22);
d24 = DMfunctionTest(a24);
d26 = DMfunctionTest(a26);
d28 = DMfunctionTest(a28);

sum(any( 0 == (e8 == d8)))
sum(any( 0 == (e10 == d10)))
sum(any( 0 == (e12 == d12)))
sum(any( 0 == (e14 == d14)))
sum(any( 0 == (e18 == d18)))
sum(any( 0 == (e20 == d20)))
sum(any( 0 == (e22 == d22)))
sum(any( 0 == (e24 == d24)))
sum(any( 0 == (e26 == d26)))
