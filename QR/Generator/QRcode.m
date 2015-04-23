% Main della che genere il QR code

function QRmatrix = QRcode(Stringa)

DataBlock = AlfaNumConv(Stringa); % sistemo l'input in blocchi di byte

ECBlock = Encoding(DataBlock); % calcolo gli ECC e li sistemo in blocchi

ArrayCodeword = Assembler(DataBlock, ECBlock); % sistemo tutto in un array

QRmatrix = Positioner(ArrayCodeword,29);  % Qui si posizionano i bit nella matrice, la dimensione va poi aggiornata quando si farà lo script generalizzato

QRmatrix = Blocchi_info(QRmatrix); % va aggiornata per le versioni superiori alla 6 e per la 1

imshow(QRmatrix);


% manca inserire le varie info (che palle è più difficile di quello che ci
% si aspettava) e le maschere





end