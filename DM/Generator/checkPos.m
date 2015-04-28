% 
% Check position
% Given a position x,y return the correct position,
% wrapped around the matrix
%
% Input
%  x,y			: position
%  n			: size of the matrix
% 
% Output
%  newX, newY	: new position
% 

function [newX, newY] = checkPos(x, y, n)

	newX = x;
	newY = y;

	if x < 1
	    newX = x + n;
	    newY = y + (4 - mod((n + 4),8)) ;
	end

	if y < 1
	    newY = y + n;
	    newX = x + (4 - mod((n + 4),8)) ;
	end

end