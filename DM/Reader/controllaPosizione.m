% 
% controllaPosizione
% Data una posizione x,y
% esso ritorna la posizione dall'"altro lato"
%
% Input
%  x,y 		: posizione
%  n 		: grandezza matrice
% 
% Output
%  xp,yp	: nuova posizione
% 

function [ xp , yp ] = controllaPosizione(x,y,n)

	xp = x;
	yp = y;

	if x < 1
	    xp = x + n;
	    yp = y + (4 - mod((n + 4),8)) ;
   	end

    if y < 1
	    yp = y + n;
	    xp = x + (4 - mod((n + 4),8)) ;
	end


end