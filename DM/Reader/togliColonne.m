%
% funzioen utile in estraiByte: data in input una matrice e un intero n,
% restituisce la matrice senza la riga e la colonna in quella posizione
% la successiva riga/colonna


function [matrice] = togliColonne(matrice,n)

		matrice(:,n)=[];
		matrice(:,n)=[];
		matrice(n,:)=[];
		matrice(n,:)=[];

end