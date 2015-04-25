%% prende in input una stringa di numeri e la versione e la codifica nel mode numerico.
%% poi bisognera fare ancora il padding


function ArrayByte = NumConv(Stringa,version)
parity = mod(length(Stringa),3); %resto mod 3
lenStringa = (length(Stringa)-parity); % lunghezza stringa divisibile per tre
keyset = ['0', '1' ,'2','3','4','5','6','7','8','9'];
if version < 10
ArrayByte = cat(2,[0,0,0,1],de2bi(length(Stringa),10,'left-msb'));
elseif  and(version >= 10, version < 27)
    ArrayByte = cat(2,[0,0,0,1],de2bi(length(Stringa),12,'left-msb'));
else
    ArrayByte = cat(2,[0,0,0,1],de2bi(length(Stringa),14,'left-msb'));
end
%devo trasformare 3 a 3 la stringa in interi
s= floor(lenStringa/3);
for i= 1 : s
    num = (find(keyset == Stringa(3*(i-1)+1))-1)*100 +(find(keyset == Stringa(3*(i-1)+2))-1)*10 +(find(keyset == Stringa(3*(i-1)+3))-1);
    ArrayByte=cat(2,ArrayByte,de2bi(num,10,'left-msb'));
end
 if parity == 2
     num = (find(keyset == Stringa(length(Stringa)-1 ))-1 )*10 + find(keyset == Stringa(length(Stringa)))-1;
    ArrayByte=cat(2,ArrayByte,de2bi(num,7,'left-msb'));
 end
 if parity == 1
     num = find(keyset == Stringa(length(Stringa)))-1;
     ArrayByte=cat(2,ArrayByte,de2bi(num,4,'left-msb'));
end

end