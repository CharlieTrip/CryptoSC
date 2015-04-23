% funzione che toglie le colonne e le righe della sincronizzazione

	function [mat] = tolgoSinc(mat)

	N=length(mat);

	mat(:,N)=[];
	mat(N,:)=[];
	mat(:,1)=[];
	mat(1,:)=[];

	N=length(mat); %aggiorno la dimensione della matrice

	if (N>=30) %se sono nel caso in qui la DM ha più regioni

		n=N/2;

		%tolgo la "croce"
		mat=togliColonne(mat,n);
	end;

	if (N>=62 && N<=100)

		
		l1=floor(length(mat)/4);
		l2=length(mat)-floor(length(mat)/4);

		%se 62<=N<=102 allora ci 2 colonne e 2 righe di sincroniz in più
		%rispetto alla sola "croce"
		mat=togliColonne(mat,l2); %le ultime

		mat=togliColonne(mat,l1); %le prime

	end;



	if (N>=116)

		l1=floor(length(mat)/6);
		l4=2*l1-1;
		l2=length(mat)-floor(length(mat)/6);
		l3=length(mat)-2*(floor(length(mat)/6))-1;

		%se N>=118 allora ci sono 4 colonne e 4 righe in più
		%rispetto alla sola "croce"
		mat=togliColonne(mat,l2); %le ultime

		mat=togliColonne(mat,l3); %le penultime

		mat=togliColonne(mat,l1); %le seconde

		mat=togliColonne(mat,l4); %le prime
		
	end;
