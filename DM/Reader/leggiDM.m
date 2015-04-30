% 
% leggiDM
% Funzione che data un immagine contenente il DM, estrae la matrice
% di 0 e 1 
%
% Input
% 	immDM		: immagine del DM
% 
% Output
%	matrixDM	: matrice del DM
% 

function matrixDM = leggiDM(immDM)


	% Just for test.png
	% Waiting for contaCambi
	% quietZone = 11;
	% numeroCambi = 10;



	% Elimino la QuietZone
	% Cerco la prima riga che ha un contaCambi diverso da 0

	quietZone = 1;

	while( contaCambi(immDM(quietZone,:)) == 1)
		quietZone = quietZone + 1; 
	end




	% Estraggo la sottomatrice togliendo la quietZone

	immDM = immDM(quietZone : (length(immDM(1,:))-quietZone +1) , quietZone : (length(immDM(1,:))-quietZone +1));



	% Estraggo la grandezza della matrice
	% Prendo i 3 lati esterni e faccio il massimo della
	% conta per quello diverso da 0.

	lato1 = contaCambi(immDM(1,:));
	lato2 = contaCambi(immDM(:,1));
	lato3 = contaCambi(immDM(length(immDM(1)),:));

	numeroCambi = max([lato1,lato2,lato3]);




	% Controllo che il numeroCambi sia un numero ammissibile
	% Se no, genera errore ed esci

	numeriAmmissibili = [10,12,14,16,18,20,22,24,26,32,36,40,44,48,52,64,72,80,88,96,104,120,132,144];

	if (any(numeroCambi == numeriAmmissibili)) == 0
		error('Non è stato trovato un DataMatrix ammissibile')
	end




	% Creo il passo per estrarre il valore centrale del quadrato

	passo = length(immDM(1,:))/(2*numeroCambi);


	% Estraggo dalla matrice il valore e lo inserisco nella matrice di output

	normalizzare = max(max(immDM));
	colore = sum([ uint8(immDM(uint32(passo),uint32(passo))/normalizzare) uint8(immDM(uint32(length(immDM) - passo) , uint32(passo))/normalizzare) uint8(immDM(uint32(passo) , uint32(length(immDM) - passo ))/normalizzare) uint8(immDM(uint32(length(immDM) - passo ), uint32(length(immDM) - passo ))/normalizzare) ]);




	for i = 1 : numeroCambi
		for j = 1 : numeroCambi


			% Controllo con soglia per impostare il bit della tabella
			% Se è un grigio sopra 127, setta a 0 il valore. 1 altrimenti

			tmp = 0;
			x = int32(passo + ((2 * passo) * (i-1)));
			y = int32(passo + ((2 * passo) * (j-1)));

			if ( immDM( x , y )/normalizzare ) > 0.5
				if colore == 1
					tmp = 0;
				else
					tmp = 1;
				end
			else
				if colore == 1
					tmp = 1;
				else
					tmp = 0;
				end
			end;
			
			matrixDM(i , j) = tmp;


		end
	end

end