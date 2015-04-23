%
% input: la matrice (mat) e i punti x,y che identificano
% il byte (si riferiscono al bit meno significativo di ogni byte)
%
% output: seq=sequenza di 8 bit
%
% la funzione leggiBlocco per ogni blocco capisce se è un blocco
% semplice da leggere, con particolari scostamenti o un angolo;
% in ogni caso rimanda alla funzione giusta
%

function [seq] = leggiBlocco(mat,x,y)

	N=length(mat);

	x
	y



	% blocco facile

	if ( x>2 && x<=(N) && y>2 && y<=(N) ) 
		seq=leggiBloccoFacile(mat,x,y);


	% blocco all'angolo

	elseif ((x==N+1 && y==1) || (x==N-1 && y==1 && mod(N,4)) || (x==N-1 && y==1 && mod(N,8)==4) || (x==N+5 && y==4 && mod(N,8)==0))
			seq=leggiBloccoAngolo(mat,x,y);


	% (x,y) fuori dalla matrice quadrata e non è il caso di un angolo

	elseif (x>N || x<1 || y>N || y<1)
			seq=[];


	% blocco difficile (sono all'interno della matrice ma non nel caso di un blocco facile)

	else
		seq=leggiBloccoDifficile(mat,x,y);

	end;

		seq

end

