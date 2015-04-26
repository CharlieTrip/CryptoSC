
% Funzione che prende in input una stringa e restituisce un array di bit
% corrispondente (conversione alfanumerica)
% Gli input devono essere maiuscoli... nel caso bisogna fixare il problema
% del casesensitive
% Livello di correzione Q, versione 3


function ArrayByte = AlfaNumConv(Stringa,version)

numDataBits = 272;   % Cambia da versione a versione (272) 3-Q

keySet = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',' ','$','%','*','+','-','.','/',':'];

if version < 10 % inserisco il mode e una stringa di bit indicante la lunghezza della stringa che voglio convertire( dipende dalla versione)
ArrayByte = cat(2,[0,0,1,0],de2bi(length(Stringa),9,'left-msb'));
elseif  and(version >= 10, version < 27)
    ArrayByte = cat(2,[0,0,1,0],de2bi(length(Stringa),11,'left-msb'));
else
    ArrayByte = cat(2,[0,0,1,0],de2bi(length(Stringa),13,'left-msb'));
end

parity = mod(length(Stringa),2);    % Verifico se la lunghezza della stringa sia pari o dispari(parity = 1 \/ 0)
lenStringa = (length(Stringa)-parity);   % Lunghezza della stringa a meno dell'ultimo carattere

Coppie = zeros(2,lenStringa/2);  % inizializzo un array a due dimensioni in cui registrerò le coppie di char

for (i = 1:lenStringa/2)  % registro ogni coppia di caratteri
    Coppie(1,i) = find(keySet == Stringa(2*i-1))-1;
    Coppie(2,i) = find(keySet == Stringa(2*i))-1;
        
end


for (i = 1:lenStringa/2) % converto ogni coppia di caratteri in bit e casto tutto in un unico array 
    ArrayBit = cat(2,ArrayBit,de2bi(Coppie(1,i)*45 + Coppie(2,i),11,'left-msb'));
    
end

if (parity == 1) % casto il carattere rimanente nel caso la lunghezza della stringa sia dispari
   ArrayBit = cat(2,ArrayBit,de2bi(find(keySet == Stringa(length(Stringa)))-1,6,'left-msb'));
    
end

%length(ArrayBit)


for(i = 1:4)
    if (length(ArrayBit) == numDataBits)
        break;
    end
    ArrayBit = cat(2,ArrayBit,0);
    
end

while not(mod(length(ArrayBit),8) == 0)
    ArrayBit = cat(2,ArrayBit,0);
end

while not(length(ArrayBit)== numDataBits)
    ArrayBit = cat(2,ArrayBit,[1,1,1,0,1,1,0,0]);
    if (length(ArrayBit) == numDataBits)
        break;
    end
    ArrayBit = cat(2,ArrayBit,[0,0,0,1,0,0,0,1]);
    if (length(ArrayBit) == numDataBits)
        break;
    end    
end

% Divido in codeword da 8 poi: ...
% Nelle versioni fino alla 6 escluse le 5-Q e 5-H i Codeword sono divisi in
% 1 solo gruppo. Nelle altre versioni vengono divisi in 2 gruppi. In questo
% script per semplicità non faccio la divisione in gruppi ma solo quella in
% blocchi, successivamente, nel caso voglia estendere versione, dovrò
% correggere lo script aggiunggendo anche la versione in blocchi


% Per la version 3-Q i blocchi sono 2, ciascuno contenente 17 DataCodeword

tempArrayByte=reshape(ArrayBit,8,length(ArrayBit)/8/2,2);  % I codeword sono in colonne

ArrayByte(:,:,1) = transpose(tempArrayByte(:,:,1));
ArrayByte(:,:,2) = transpose(tempArrayByte(:,:,2));  % I codeword ora sono in righe divisi in due blocchi





end


