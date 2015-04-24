% Questa funzione sistema i blocchi nella matrice di posizione e di
% allineamento
% Versione straprima di alpha
% Prende in input la dimensione della matrice


function QRplaced = Blocchi_info(QRplaced)

%m = 29; % propria della versione 3
m = length(QRplaced(1,:));

QRplaced(6,8:2:m-7)=0;
QRplaced(6,9:2:m-8)=1;

QRplaced(8:2:m-7,6)=0;
QRplaced(9:2:m-8,6)=1;

imshow(QRplaced)


QRplaced(1:7,1:7) = 1;  % Disegno quadrato in alto a sinistra

QRplaced(1:6,m-6:m) = 1;  % Disegno quadrato in alto a destra

QRplaced(m-6:m,1:7) = 1;  % Disegno quadrato in basso a sinistra

QRplaced(m-8:m-4,m-8:m-4) = 1;  % Disegno quadrato in basso a destra


QRplaced(1,1:7) = 0;  % Disegno quadrato in alto a sinistra
QRplaced(7,1:7) = 0;
QRplaced(1:7,1) = 0;
QRplaced(1:7,7) = 0;
QRplaced(3:5,3:5) = 0;
QRplaced(1:8,8) = 1;
QRplaced(8,1:8) = 1;

QRplaced(1,m-6:m) = 0;  % Disegno quadrato in alto a destra
QRplaced(7,m-6:m) = 0;
QRplaced(1:6,m) = 0;
QRplaced(1:6,m-6) = 0;
QRplaced(3:5,m-4:m-2) = 0;
QRplaced(8,m-7:m) = 1;
QRplaced(1:7,m-7) = 1;

QRplaced(m,1:7) = 0;  % Disegno quadrato in basso a sinistra
QRplaced(m-6,1:7) = 0;
QRplaced(m-6:m,1) = 0;
QRplaced(m-6:m,7) = 0;
QRplaced(m-4:m-2,3:5) = 0;
QRplaced(m-7,1:8) = 1;
QRplaced(m-7:m,8) = 1;

QRplaced(m-4,m-8:m-4) = 0;  % Disegno quadrato in basso a destra
QRplaced(m-8,m-8:m-4) = 0;
QRplaced(m-8:m-4,m-4) = 0;
QRplaced(m-8:m-4,m-8) = 0;
QRplaced(m-6,m-6) = 0;

imshow(QRplaced);

end
