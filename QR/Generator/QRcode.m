% Main della che genere il QR code

function QRmatrix = QRcode(Stringa)

ecl = 'Q';

[mode, version] = find_mode_version( msg,ecl);

DataBlock = AlfaNumConv(Stringa,version,mode,ecl); % sistemo l'input in blocchi di byte

ECBlock = Encoding(DataBlock); % calcolo gli ECC e li sistemo in blocchi

ArrayCodeword = Assembler(DataBlock, ECBlock); % sistemo tutto in un array

QRmatrix = Positioner(ArrayCodeword,29);  % Qui si posizionano i bit nella matrice, la dimensione va poi aggiornata quando si farà lo script generalizzato



        for i=1:size(QRmatrix,1)
            for j=1:size(QRmatrix,2)
                if mod(i+j,2) == 0
                    QRmatrix(i,j)= bitxor(uint8(QRmatrix(i,j)),1);
                end
            end
        end

QRmatrix = Blocchi_info(QRmatrix,[0,0,0],'Q',3); % va aggiornata per le versioni superiori alla 6 e per la 1

XORmatrix = zeros(length(QRmatrix),length(QRmatrix)); % faccio lo xor
XORmatrix(1:length(QRmatrix),1:length(QRmatrix))=1; % faccio lo xor

QRmatrix = XORmatrix - QRmatrix; % faccio lo xor

imshow(QRmatrix);


% manca inserire le varie info (che palle è più difficile di quello che ci
% si aspettava) e le maschere





end