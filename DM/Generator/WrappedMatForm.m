% 
% Standard Matrix Form
% Function to place the message into the matrix form
% wrapped around the matrix
% 
% Input
%	DM		: old DataMatrix
% 	Msg		: message
%	x		: x-position of the LSB
%	y		: y-position of the LSB
%	n		: size of the matrix
% 
% Output
%	DM		: new DataMatrix

function DM = WrappedMatForm(DM, Msg, x,y, n)

% Standard codeword placement
%	|1|2|
%	|3|4|5|
%	|6|7|8|

% Convertion to binary
	BinMsg=de2bi(Msg);
	
% Set the right position for every bit
	[x1, y1] = checkPos(x  , y  , n);
	[x2, y2] = checkPos(x-1, y  , n);
	[x3, y3] = checkPos(x-2, y  , n);
	[x4, y4] = checkPos(x  , y-1, n);
	[x5, y5] = checkPos(x-1, y-1, n);
	[x6, y6] = checkPos(x-2, y-1, n);
	[x7, y7] = checkPos(x-1, y-2, n);
	[x8, y8] = checkPos(x-2, y-2, n);
	
% Placement of the message	
	DM(x8, y8) = BinMsg(8);
	DM(x7, y7) = BinMsg(7);
	DM(x6, y6) = BinMsg(6);
	DM(x5, y5) = BinMsg(5);
	DM(x4, y4) = BinMsg(4);
	DM(x3, y3) = BinMsg(3);
	DM(x2, y2) = BinMsg(2);
	DM(x1, y1) = BinMsg(1);
	
end