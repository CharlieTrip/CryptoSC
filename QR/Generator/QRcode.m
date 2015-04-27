% Main della che genere il QR code

function QRmatrix = QRcode(Stringa)

ecl = input('Inserisci il livello di codifica (L,M,Q,H) :','s');

[mode, version] = find_mode_version( Stringa, ecl );


[ArrayByte1,ArrayByte2] = Codifica(Stringa,version,mode,ecl); % sistemo l'input in blocchi di byte

[ECCodewordByte1, ECCodewordByte2] = Encoding(ArrayByte1,ArrayByte2,version,ecl); % calcolo gli ECC e li sistemo in blocchi

Finsequence = Assembler(ArrayByte1,ArrayByte2, ECCodewordByte1, ECCodewordByte2, version, ecl); % sistemo tutto in un array

QRmatrix = Positioner(Finsequence,version);  % Qui si posizionano i bit nella matrice, la dimensione va poi aggiornata quando si far?? lo script generalizzato

QRmatrix = Blocchi_cover_info(QRmatrix, version);

n_mask=choose_mask(QRmatrix,version);

QRmatrix = app_masking(QRmatrix, n_mask,version);

QRmatrix = bit_information(QRmatrix,n_mask, ecl,version);

M = ones(length(QRmatrix),length(QRmatrix));

QRmatrix = M-QRmatrix;


end