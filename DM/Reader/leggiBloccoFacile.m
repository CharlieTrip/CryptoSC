% 
% leggiBloccoFacile
% Funzione che data una matrice ed una posizione x,y;
% estrae il byte a quel blocchetto associata.
% 
%
% Input
% 	matrixDM 	: matrice del DM
%	x			: posizione x - riga
%	y			: posizione y - colonna
% 
% Output
%	listaBit	: lista dei bit del blocchetto
% 

function listaBit = leggiBloccoFacile(matrixDM , x , y)

	% Il blocchetto deve esser letto in questo modo
	%
	% 	!1|2|
 	%   |3|4|5|
 	%   |6|7|8|
 	%
	% segnato in questo modo [ 8 <-- lsb , --> 1]

	bit1 = matrixDM( x - 2 , y - 2);
	bit2 = matrixDM( x - 2 , y - 1);
	bit3 = matrixDM( x - 1 , y - 2);
	bit4 = matrixDM( x - 1 , y - 1);
	bit5 = matrixDM( x - 1 , y );
	bit6 = matrixDM( x , y - 2 );
	bit7 = matrixDM( x , y - 1);
	bit8 = matrixDM( x  , y );


	% Genero la lista

	listaBit = [bit8, bit7, bit6, bit5, bit4, bit3, bit2, bit1];

end