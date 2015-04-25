% Questa funzione sistema i blocchi nella matrice di posizione e di
% allineamento
% Versione straprima di alpha
% Prende in input la dimensione della matrice


function QR_matrix_out = Blocchi_info(QR_matrix_in, mask_reference, ECC_level, Version)

QR_matrix_out = Blocchi(QR_matrix_in,Version); % metto i blocchi

QR_matrix_out = QRmatrix_information(QR_matrix_out,mask_reference, ECC_level);


end

function QRplaced = Blocchi(QRplaced,Version)

%m = 29; % propria della versione 3
m = length(QRplaced(1,:));

QRplaced(6,8:2:m-7)=1;
QRplaced(6,9:2:m-8)=0;

QRplaced(8:2:m-7,6)=1;
QRplaced(9:2:m-8,6)=0;


QRplaced(1:7,1:7) = 0;  % Disegno quadrato in alto a sinistra

QRplaced(1:6,m-6:m) = 0;  % Disegno quadrato in alto a destra

QRplaced(m-6:m,1:7) = 0;  % Disegno quadrato in basso a sinistra

QRplaced(m-8:m-4,m-8:m-4) = 0;  % Disegno quadrato in basso a destra


QRplaced(1,1:7) = 1;  % Disegno quadrato in alto a sinistra
QRplaced(7,1:7) = 1;
QRplaced(1:7,1) = 1;
QRplaced(1:7,7) = 1;
QRplaced(3:5,3:5) = 1;
QRplaced(1:8,8) = 0;
QRplaced(8,1:8) = 0;

QRplaced(1,m-6:m) = 1;  % Disegno quadrato in alto a destra
QRplaced(7,m-6:m) = 1;
QRplaced(1:6,m) = 1;
QRplaced(1:6,m-6) = 1;
QRplaced(3:5,m-4:m-2) = 1;
QRplaced(8,m-7:m) = 0;
QRplaced(1:7,m-7) = 0;

QRplaced(m,1:7) = 1;  % Disegno quadrato in basso a sinistra
QRplaced(m-6,1:7) = 1;
QRplaced(m-6:m,1) = 1;
QRplaced(m-6:m,7) = 1;
QRplaced(m-4:m-2,3:5) = 1;
QRplaced(m-7,1:8) = 0;
QRplaced(m-7:m,8) = 0;
QRplaced(m-7,9) = 1; % metto il dark module



Center = get_allignment_patterns_center(Version);

for i=1:length(Center)
    
    QRplaced(Center.r-2:Center.r+2,Center.c-2:Center.c+2) = 1;
    QRplaced(Center.r-1:Center.r+1,Center.c-1:Center.c+1) = 0;
    QRplaced(Center.r,Center.c) = 1;
    
end
    
    
    
end


% Questa funzione mette le information bit.
% INPUT:
% - QRmatrix: la matrice
% - mask_reference: deve essere un vettore di 3 bit che ci dice che
% maschera si sta usando
% - ECC_level deve essere il livello di correzione, un char tra 'L', 'M',
% 'Q' e 'H'.


function QRmatrix = QRmatrix_information(QRmatrix,mask_reference, ECC_level)

Mask_pattern = gf([1 0 1 0 1 0 0 0 0 0 1 0 0 1 0]);

m = length(QRmatrix(:,1));

switch ECC_level
    case 'L'
        eclvl = [0 1 mask_reference];
    case 'M'
        eclvl = [0 0 mask_reference];
    case 'Q'
        eclvl = [1 1 mask_reference];
    case 'H'
        eclvl = [1 0 mask_reference];
end

 Bitsequence = bchenc(gf(eclvl),15,5); % ottengo la sequenza codificata con BCH(15,5)
 
 Bitsequence = gf2dec(Bitsequence+Mask_pattern,1); % faccio lo xor con il mask pattern
 
 QRmatrix(1:6,9) = Bitsequence(15:-1:10);
 QRmatrix(8:9,9) = Bitsequence(9:-1:8);
 QRmatrix(8,9) = Bitsequence(7);
 QRmatrix(9,6:-1:1) = Bitsequence(6:-1:1); 
  
 QRmatrix(9,m:-1:m-7) = Bitsequence(15:-1:8);
 QRmatrix(m:-1:m-6,9) = Bitsequence(1:7);

imshow(QRplaced);

end

