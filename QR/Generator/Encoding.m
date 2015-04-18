% funzione che si occupa dell'encoding del messaggio. Prende in imput un
% array di bit e restituisce un array codificato.
% Livello di correzione Q, versione 3

function DataCodewordInteger, ECCodewordInteger = Encoding(DataCodewordByte)

DataCodewordInteger = zeros(2,length(DataCodewordByte));

for i = 1:length(DataCodewordByte)
    DataCodewordInteger(1,i) = bi2de(DataCodewordByte(i,:,1),'left-msb');
    DataCodewordInteger(2,i) = bi2de(DataCodewordByte(i,:,2),'left-msb');
    
end

a = gf(2,8);

% questo che segue è il polinomio di grado 36 proprio del metodo 3-Q
p=[1, a^200, a^183, a^98, a^16, a^172, a^31, a^246, a^234, a^60, a^152, a^115, 1, a^167, a^152, a^113, a^248, a^238, a^107, a^18, a^63, a^218, a^37, a^87 , a^210, a^105, a^177, a^120, a^74, a^121, a^196, a^117, a^251, a^113, a^233, a^30, a^120];



 RSOutput = gf(zeros(2,53),8);
 
 RSOutput(1,:) = rsenc(gf(DataCodewordInteger(1,:),8),53,17,p);
 RSOutput(2,:) = rsenc(gf(DataCodewordInteger(2,:),8),53,17,p);
 
 

 
 
end






