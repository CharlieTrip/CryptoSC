%Questa funzione prende in Input la matrice qr_matrix
%e restituisce il numero di maschera da applicare
%(per la numerazione delle masks vedi il file release_masking.m).

function n_mask= choose_mask(qr_matrix)

evaluation=zeros(8); %inizializzo il vettore di valutazione
for i=1:8
    evaluation(i)=evaluation_mask(qr_matrix,i-1); %calcolo le valutazioni per 
    %ogni singola mask e le salvo nel vettore evaluation
end

n_mask=find(evaluation == min(evaluation))-1; %calcolo la valutazione minima 
%ricerco la maschera corrispondente.
%REMARK la maschera restituita ? un numero tra 0 e 7.
end 


 
