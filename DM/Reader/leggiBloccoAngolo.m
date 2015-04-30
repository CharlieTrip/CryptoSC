% 
% leggiBloccoAngolo
% Funzione che data una matrice ed una posizione x,y;
% estrae il byte a quel blocchetto associata considerandolo
% come angolo.
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

function [matr,listaBit] = leggiBloccoAngolo(matrixDM , x , y)
 
 	% Grandezza della matriceDM

 	n = length(matrixDM(:,1));
            
    matr = matrixDM;

 	%
  	% Corner case 1
    %
    % top right corner:   |4|5|
    %                       |6|
    %                       |7|
    %                       |8|
    %
    % bottom left corner: |1|2|3|
    %
    % Regola di piazzamento
    % x == grandezza + 1 and y == 1
    %

    if (x == (n+1)) && ( y == 1 )
    	bit1 = matrixDM( n , 1);
		bit2 = matrixDM( n , 2);
		bit3 = matrixDM( n , 3);
		bit4 = matrixDM( 1, n-1 );
		bit5 = matrixDM( 1 , n );
		bit6 = matrixDM( 2 , n );
		bit7 = matrixDM( 3 , n);
		bit8 = matrixDM( 4  , n );

        matr(n,1) = -1;
        matr(n,2) = -1;
        matr(n,3) = -1;
        matr(1, n-1) = -1;
        matr(1,n) = -1;
        matr(2,n) = -1;
        matr(3,n) = -1;
        matr(4,n) = -1;
	end;




    %
    % Corner case 2
    %
	% top right corner:  |4|5|6|7|
	%                          |8| 
    %
    % bottom left corner: |1|
    %                     |2|
    %                     |3|
    %
    % Regola di piazzamento
    % x == grandezza - 1 and y == 1 and grandezza % 4
    %

    if (x == (n - 1)) && (y == 1) && mod(n,4)
    	bit1 = matrixDM( n - 2, 1);
		bit2 = matrixDM( n - 1 , 1);
		bit3 = matrixDM( n  , 1);
		bit4 = matrixDM( 1, n - 3 );
		bit5 = matrixDM( 1 , n - 2);
		bit6 = matrixDM( 1 , n - 1 );
		bit7 = matrixDM( 1 , n);
		bit8 = matrixDM( 2  , n );

        matr(n-2,1) = -1;
        matr(n-1,1) = -1;
        matr(n,1) = -1;
        matr(1, n-3) = -1;
        matr(1,n-2) = -1;
        matr(1,n-1) = -1;
        matr(1,n) = -1;
        matr(2,n) = -1;
	end;








    %
    % Corner case 3
    %
    % top right corner:   |4|5|
    %                       |6|
    %                       |7|
    %                       |8| 
    %
    % bottom left corner: |1|
    %                     |2|
    %                     |3|
    %
    % Regola di piazzamento
    % x == grandezza - 2 and y == 1 and (grandezza % 8 == 4)
    %

    if (x == (n - 1)) && (y == 1) && (mod(n,8) == 4)
    	bit1 = matrixDM( n - 2, 1);
		bit2 = matrixDM( n - 1 , 1);
		bit3 = matrixDM( n  , 1);
		bit4 = matrixDM( 1, n-1 );
		bit5 = matrixDM( 1 , n );
		bit6 = matrixDM( 2 , n );
		bit7 = matrixDM( 3 , n);
		bit8 = matrixDM( 4  , n );

        matr(n-2,1) = -1;
        matr(n-1,1) = -1;
        matr(n,1) = -1;
        matr(1, n-1) = -1;
        matr(1,n) = -1;
        matr(2,n) = -1;
        matr(3,n) = -1;
        matr(4,n) = -1;
	end;





    %
    % Corner case 4
    %
    % top right corner: |3|4|5|
    %                   |6|7|8| 
    %
    % bottom left corner: |1|
    %
    % bottom right corner: |2|
    %
    % Regola di piazzamento
    % x == grandezza + 5 and y == 3 and (grandezza % 8 == 0)
    %

    if (x == (n + 5)) && (y == 3) && (mod(n,8) == 0)
    	bit1 = matrixDM( n , 1);
		bit2 = matrixDM( n , n);
		bit3 = matrixDM( 1 , n - 2);
		bit4 = matrixDM( 1 , n - 1);
		bit5 = matrixDM( 1 , n );
		bit6 = matrixDM( 2 , n - 2 );
		bit7 = matrixDM( 2 , n - 1);
		bit8 = matrixDM( 2  , n );

        matr(n,1) = -1;
        matr(n,n) = -1;
        matr(1,n-2) = -1;
        matr(1, n-1) = -1;
        matr(1,n) = -1;
        matr(2,n-2) = -1;
        matr(2,n-1) = -1;
        matr(2,n) = -1;
	end;






	% Genero la lista

	listaBit = [bit8, bit7, bit6, bit5, bit4, bit3, bit2, bit1];

end