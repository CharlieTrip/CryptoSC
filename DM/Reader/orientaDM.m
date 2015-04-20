%
% input: m=matrice non orientata
%
% orienta la matrice rispettando la sincronizzazione delle DM
% cioè in tutti gli angoli ci sono 1, mentre in alto a destra 0 
%
% output: a=matrice orientata
%

function [a] = orientaDM(m)

	l=length(m);
	a=zeros(l,l);


	%caso 1: lo 0 è nell'angolo in alto a sinistra

	if  (m(1,1)==0)  
		for i=1:l
			for j=1:l
				a(j,l-i+1)=m(i,j);
			end;
		end;
	end;


	%caso 2: lo 0 è nell'angolo in basso a sinistra

	if  (m(l,1)==0)  
		for i=1:l
			for j=1:l
				a(l-i+1,l-j+1)=m(i,j);
			end;
		end;
	end;


	%caso 3: lo 0 è nell'angolo in basso a destra

	if  (m(l,l)==0)  
		for i=1:l
			for j=1:l
				a(l-j+1,i)=m(i,j);
			end;
		end;
	end;


	%caso 4: lo 0 è nell'angolo in alto a destra

	if (m(1,l)==0)
		a=m;
	end;

end
