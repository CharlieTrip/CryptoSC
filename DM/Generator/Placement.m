% 
% Placement
% Function to place the matrix into the position
% 
% Input
%	Msg		: message
%	x		: x-position of the LSB
%	y		: y-position of the LSB
% 
% Output
%	NewDM	: new DataMatrix

function DM = Placement(DM, Msg, x,y)

% Standard codeword placement
%	|1|2|
%	|3|4|5|
%	|6|7|8|

% Convertion to binary
	BinMsg=de2bi(Msg);
	
% Placement of the message	
	DM(x-2, y-2) = BinMsg(8);
	DM(x-1, y-2) = BinMsg(7);
	DM(x-2, y-1) = BinMsg(6);
	DM(x-1, y-1) = BinMsg(5);
	DM(x  , y-1) = BinMsg(4);
	DM(x-2, y  ) = BinMsg(3);
	DM(x-1, y  ) = BinMsg(2);
	DM(x  , y  ) = BinMsg(1);
	
end