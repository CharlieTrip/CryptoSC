% funzione che si occupa dell'encoding del messaggio. Prende in input un
% array di byte (DataCodewordByte) e restituisce un array di byte (ECCodewordInteger) che non
% sono altro che la ridondanza ottenuta mediante la codifica reedsolomon
% Versione 3-Q, dunque i CodeWord sono organizzati
% in 2 blocchi, 1 gruppo

function ECCodewordByte = Encoding(DataCodewordByte)

DataCodewordInteger = zeros(2,length(DataCodewordByte));

for i = 1:length(DataCodewordByte)
    DataCodewordInteger(1,i) = bi2de(DataCodewordByte(i,:,1),'left-msb');  % converto da byte ad interi primo blocco
    DataCodewordInteger(2,i) = bi2de(DataCodewordByte(i,:,2),'left-msb');  % converto da byte ad interi secondo blocco
    
end

a = gf(2,8); % definisco un elemento primitivo di gf(2^8)

% questo che segue è il polinomio di grado 18 proprio del metodo 3-Q
p = [1, a^215, a^234, a^158, a^94, a^184, a^97, a^118, a^170, a^79, a^187, a^152, a^148, a^252, a^179, a^5, a^98, a^96, a^153];



 RSOutput = zeros(2,35);
 ECCodewordByte = zeros(18,8,2);
 
 RSOutput(1,:) = gf2dec(rsenc(gf(DataCodewordInteger(1,:),8),35,17,p),8); % codifico in reed solomon il primo blocco e converto in interi
 RSOutput(2,:) = g'f2dec(rsenc(gf(DataCodewordInteger(2,:),8),35,17,p),8); % codifico in reed solomon il secondo blocco e converto in interi
 
for i =1:18
 
 ECCodewordByte(i,:,1) = de2bi(RSOutput(1,17+i),8,'left-msb'); % converto in byte e salvo solo la ridondanza, che sarà la EC CodeWord, blocco 1
 ECCodewordByte(i,:,2) = de2bi(RSOutput(2,17+i),8,'left-msb'); % converto in byte salvo solo la ridondanza, che sarà la EC CodeWord, blocco 2
 
end

 
 
end






