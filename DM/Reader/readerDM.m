%
% Funzione di lettura di una DM: dall'immagine al messaggio
% Metto insieme tutte le funzioni fatte
%


function [msg] = readerDM (immDM)


% dall'immagine alla matrice di 1 e 0

matrix = leggiDM (immDM);



% Orientamento della matrice usando la sincronizzazione delle DM

matrix = orientaDM (matrix);



% Tolgo la sincronizzazione, leggo i blocchetti come sequenze di bit e 
% ricavo la sequenza di byte

 seq = estraiByte(matrix);



% a seconda della lunghezza della sequenza ricavata, la lunghezza del messaggio cambia
% n = lunghezza sequenza
% k = lunghezza messaggio

n = length (seq);

% creo un vettore lungo 2178 (VectorData) con in posizione j (=lunghezza del messaggio) il numero di byte 
% che sono dati di seq (e non fanno parte della codifica)

VectorData = zeros(1,2178);

VectorData(8)=3;
VectorData(12)=5;
VectorData(18)=8;
VectorData(24)=12;
VectorData(32)=18;
VectorData(40)=22;
VectorData(50)=30;
VectorData(60)=36;
VectorData(72)=44;
VectorData(98)=62;
VectorData(128)=86;
VectorData(162)=114;
VectorData(200)=144;
VectorData(242)=174;
VectorData(288)=204;
VectorData(392)=280;
VectorData(512)=368;
VectorData(648)=456;
VectorData(800)=576;
VectorData(968)=696;
VectorData(1152)=816;
VectorData(1458)=1050;
VectorData(1800)=1304;
VectorData(2178)=1558;

k = VectorData(n);



% decodifica

seq = RSDecoder(n, k, seq);



% estraggo il messaggio

msg = estraiMessaggio (seq);

