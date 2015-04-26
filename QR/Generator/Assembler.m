% Questa funzione crea l final sequence. prende in input i DataBlock e gli
% ECBlock

function FinSequence = Assembler(DataBlock, ECBlock)

nBlocchi = length(DataBlock(1,1,:)); % numero di blocchi
lDB = length(DataBlock(:,:,1)); % numero di DataCodeword per blocco
lECB = length(ECBlock(:,:,1)); % numero di ECCodeword per blocco
FinSequence = [];

for (i = 1:lDB)    % Inserisco i DataBlock
    for (j = 1:nBlocchi)
        FinSequence = cat(2,FinSequence,DataBlock(i,:,j));
    
    end
end

% NOTA che nel caso ci siano i gruppi il codice va adattato e inoltre
% leggere le specifiche a pag 46

for (i = 1:lECB)
    for (j = 1:nBlocchi)  % Inserisco gli ECBlock
        FinSequence = cat(2,FinSequence,ECBlock(i,:,j));
    
    end
end

end






















% Reminders_bit_info = [0 7 7 7 7 7 0 0 0 0 0 0 0 3 3 3 3 3 3 3 4 4 4 4 4 4 4 3 3 3 3 3 3 3 0 0 0 0 0 0];
