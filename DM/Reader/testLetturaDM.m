% Opening the test.png and extract the matrix

a = imread('test14.png');

b = leggiDM(a);

c = orientaDM(b);

d = estraiByte(c)

e12 = [ 98 98 98 98 98 98 98 98 206 93 183 122 218 30 237 179 5 201];
e8 = [98 98 98 98 98 39 102 83 93 103 181 21];
e10 = [98 98 98 98 98 39 102 83 93 103 181 21];
e14 = [98 98 98 98 98 98 98 98 98 98 98 98 189 164 131 83 98 108 173 237 161 138 51 112]

d == e14