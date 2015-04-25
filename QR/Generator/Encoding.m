% funzione che si occupa dell'encoding del messaggio. Prende in input un
% array di byte (DataCodewordByte) e restituisce un array di byte (ECCodewordInteger) che non
% sono altro che la ridondanza ottenuta mediante la codifica reedsolomon
% Versione 3-Q, dunque i CodeWord sono organizzati
% in 2 blocchi, 1 gruppo

function ECCodewordByte = Encoding(DataCodewordByte)

a = gf(2,8); % definisco un elemento primitivo di gf(2^8)
% questo che segue è il polinomio di grado 18 proprio del metodo 3-Q
p = [1, a^215, a^234, a^158, a^94, a^184, a^97, a^118, a^170, a^79, a^187, a^152, a^148, a^252, a^179, a^5, a^98, a^96, a^153];
k = 17; % dimensione propria della versione 3-Q
n = 35; % lunghezza propria della versione 3-Q (per blocco)
RSOutput = zeros(2,35);
ECCodewordByte = zeros(18,8,2);

DataCodewordInteger = zeros(2,length(DataCodewordByte));

for i = 1:length(DataCodewordByte)
    DataCodewordInteger(1,i) = bi2de(DataCodewordByte(i,:,1),'left-msb');  % converto da byte ad interi primo blocco
    DataCodewordInteger(2,i) = bi2de(DataCodewordByte(i,:,2),'left-msb');  % converto da byte ad interi secondo blocco
    
end



 
 RSOutput(1,:) = gf2dec(rsenc(gf(DataCodewordInteger(1,:),8),n,k,p),8); % codifico in reed solomon il primo blocco e converto in interi
 RSOutput(2,:) = gf2dec(rsenc(gf(DataCodewordInteger(2,:),8),n,k,p),8); % codifico in reed solomon il secondo blocco e converto in interi
 
for i =1:18
 
 ECCodewordByte(i,:,1) = de2bi(RSOutput(1,k+i),8,'left-msb'); % converto in byte e salvo solo la ridondanza, che sarà la EC CodeWord, blocco 1
 ECCodewordByte(i,:,2) = de2bi(RSOutput(2,k+i),8,'left-msb'); % converto in byte salvo solo la ridondanza, che sarà la EC CodeWord, blocco 2
 
end

 
 
end


% Salvo i polinomi


% polinomio di grado 7
% p = [1, a^87, a^229, a^146, a^149, a^238, a^102, a^21];



% polinomio di grado 10
% p = [1, a^251, a^67, a^46, a^61, a^118, a^70, a^64, a^94, a^32      45];


% polinomio di grado 13
% p = [1, a^74, a^152, a^176, a^100, a^86, a^100, a^106, a^104, a^130, a^218, a^206, a^140      78];


% polinomio di grado 15
% p = [1, a^8, a^183, a^61, a^91, a^202, a^37, a^51, a^58, a^58, a^237, a^140, a^124, a^5, a^99      105];



% polinomio di grado 18
% a = gf(2,8);
% p = [1, a^215, a^234, a^158, a^94, a^184, a^97, a^118, a^170, a^79, a^187, a^152, a^148, a^252, a^179, a^5, a^98, a^96, a^153];



% polinomio di grado 36
% a = gf(2,8);
% p=[1, a^200, a^183, a^98, a^16, a^172, a^31, a^246, a^234, a^60, a^152, a^115, 1, a^167, a^152, a^113, a^248, a^238, a^107, a^18, a^63, a^218, a^37, a^87 , a^210, %%% a^105, a^177, a^120, a^74, a^121, a^196, a^117, a^251, a^113, a^233, a^30, a^120];

























