%
% input: mat=DataMatrix sotto forma di matrice di 1 e 0
%
% output: sequenza di byte letti nella DataMatrix
%
% la funzione partendo dal primo blocchetto della DM,
% li percorre tutti leggendo i byte corrispondenti
%


function [sequenza] = estraiByte(mat)

	% tolgo la sincronizzazione
	mat=tolgoSinc(mat);

	N=length(mat); %nuova dimensione della matrice

	% coordinate che identificano il primo blocchetto;
	% x e y sono le coordinate del bit meno significativo del byte/blocchetto
	x=5;
	y=1;



	% leggo i blocchetti nell'ordine giusto

	sequenza=[]; % inizializzo l'output (sequenza)
	contatorePercorsi=1; % serve per sapere il percorso che sto seguendo (verso l'alto/destro o verso basso/sinistra)


	while ( y<= N || x<=N ) % esce dal while quando supera l'angolo in basso a sinistra



		% faccio leggiBlocco: se sono nel caso di un blocco facile, di un angolo o di un blocco difficile, legge il blocco;
		% altrimenti la seq è vuota e devo rientrare nella matrice

		[mat,sequenzaBit] = leggiBlocco(mat,x,y);



		% trasformo sequenzaBit in byte e l'aggiungo a sequenza (solo se la sequenzaBit non è vuota)

		if ( length(sequenzaBit) ~= 0 )

			if (length(sequenzaBit) ~= 1)
				byte=sequenzaBit(1)+sequenzaBit(2)*2+sequenzaBit(3)*4+sequenzaBit(4)*8+...
				sequenzaBit(5)*16+sequenzaBit(6)*32+sequenzaBit(7)*64+sequenzaBit(8)*128;
				
				
				sequenza=[sequenza,byte]; % aggiungo il byte a sequenza
			end;
			

			% passo al blocchetto successivo

			if ( mod(contatorePercorsi,2) ~= 0 ) 
				
				x=x-2;
				y=y+2;
			
			else

				x=x+2;
				y=y-2;

			end;



		else





			% il blocchetto esce dall'alto o da destra

			if (x<1 || y>N)
				
				x=x+1;
				y=y+3;

				while ((x<1 || y>N) && ~( y > N && x > N ))

					x=x+2;
					y=y-2;
				end;

				contatorePercorsi=contatorePercorsi+1; 

			end;


			% il blocchetto esce da basso a sinistra

			if (x>N || y<1) % il bolcchetto uscirebbe da basso o da sinistra

				x=x+3;
				y=y+1;

				while ((x>N || y<1) && ~( y > N && x > N ))



					[mat,sequenzaBit] = leggiBlocco(mat,x,y);

					% trasformo sequenzaBit in byte e l'aggiungo a sequenza (solo se la sequenzaBit non è vuota)

					if ( length(sequenzaBit) ~= 0 )

						byte=sequenzaBit(1)+sequenzaBit(2)*2+sequenzaBit(3)*4+sequenzaBit(4)*8+...
						sequenzaBit(5)*16+sequenzaBit(6)*32+sequenzaBit(7)*64+sequenzaBit(8)*128;
						
						sequenza=[sequenza,byte]; % aggiungo il byte a sequenza

					end;




					x=x-2;
					y=y+2;
				end;

				contatorePercorsi=contatorePercorsi+1; 

			end;

		
		end; 



	end;

end
		


		
