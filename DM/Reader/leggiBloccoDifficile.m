% 
% leggiBloccoDifficile
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

function [matr,listaBit] = leggiBloccoDifficile(matrixDM , x , y)


	matr = matrixDM;

	% Il blocchetto deve esser letto in questo modo
	%
	% 	!1|2|
 	%   |3|4|5|
 	%   |6|7|8|
 	%
	% con unica differenza della posizione di alcuni elementi
	% che vengono presi "dall'altro lato" della matrice



	% Grandezza dei dati

	n = length(matrixDM(1,:));



	% Generazione di tutti le posizioni dei bit

	xbit1 = x - 2;
	xbit2 = x - 2;
	xbit3 = x - 1;
	xbit4 = x - 1;
	xbit5 = x - 1;
	xbit6 = x;
	xbit7 = x;
	xbit8 = x;

	ybit1 = y - 2;
	ybit2 = y - 1;
	ybit3 = y - 2;
	ybit4 = y - 1;
	ybit5 = y;
	ybit6 = y - 2;
	ybit7 = y - 1;
	ybit8 = y;



	% 
	% Condizioni di generazione delle posizioni
	% 
	% Se x < 1 :
	% 	x = x + n
	% 	y = y + (4 - mod(n+4 , 8))
	% 
	% Ugual modo per y
	% 
	% Utilizzato mediante la funziona controllaPosizione
	% 


	[ xbit1 , ybit1 ] = controllaPosizione( xbit1 , ybit1 , n);
	[ xbit2 , ybit2 ] = controllaPosizione( xbit2 , ybit2 , n);
	[ xbit3 , ybit3 ] = controllaPosizione( xbit3 , ybit3 , n);
	[ xbit4 , ybit4 ] = controllaPosizione( xbit4 , ybit4 , n);
	[ xbit5 , ybit5 ] = controllaPosizione( xbit5 , ybit5 , n);
	[ xbit6 , ybit6 ] = controllaPosizione( xbit6 , ybit6 , n);
	[ xbit7 , ybit7 ] = controllaPosizione( xbit7 , ybit7 , n);
	[ xbit8 , ybit8 ] = controllaPosizione( xbit8 , ybit8 , n);



	% Estrazione dei bit dalla matrice

	bit1 = matrixDM( xbit1 , ybit1 );
	bit2 = matrixDM( xbit2 , ybit2 );
	bit3 = matrixDM( xbit3 , ybit3 );
	bit4 = matrixDM( xbit4 , ybit4 );
	bit5 = matrixDM( xbit5 , ybit5 );
	bit6 = matrixDM( xbit6 , ybit6 );
	bit7 = matrixDM( xbit7 , ybit7 );
	bit8 = matrixDM( xbit8 , ybit8 );


    matr(xbit1,ybit1) = -1;
    matr(xbit2,ybit2) = -1;
    matr(xbit3,ybit3) = -1;
    matr(xbit4,ybit4) = -1;
    matr(xbit5,ybit5) = -1;
    matr(xbit6,ybit6) = -1;
    matr(xbit7,ybit7) = -1;
    matr(xbit8,ybit8) = -1;



	% Genero la lista

	listaBit = [bit8, bit7, bit6, bit5, bit4, bit3, bit2, bit1];

end