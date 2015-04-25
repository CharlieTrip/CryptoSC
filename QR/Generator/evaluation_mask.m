%Data in input una matrice qr, valuta quale maschera tra le 8 definite
%dalle referenze va applicata

function n=evaluation_mask(qr_matrix,mask_n,version)
s=size(qr_matrix,1);

%Applico la maschera k-esima
qr_matrix=app_masking(qr_matrix, mask_n,version);

%Feature 1 Adjacents modules
%Righe
n=0;
for i=1:s %scorre le righe della matrice
    n_uguali=1;
    for j=1:s-1 %scorre il vettore riga 
        
        if qr_matrix(i,j) == qr_matrix(i,j+1);
            n_uguali=n_uguali+1;
            
        else
                if n_uguali>=5
                    n= n+(n_uguali-5)+3;
                end;
                n_uguali=1;
        end;
    end;
                if (qr_matrix(i,s-1) == qr_matrix(i,s)) && n_uguali>=5;
                    n= n+(n_uguali-5)+3;
                end;
end;

%columns

for j=1:s%scorre le righe della matrice
    n_uguali=1;
    for i=1:s-1%scorre il vettore riga 
        
        if qr_matrix(i,j) == qr_matrix(i+1,j);
            n_uguali=n_uguali+1;
            
        else
                if n_uguali>=5
                    n= n+(n_uguali-5)+3;
                end;
                n_uguali=1;
        end;
    end;
                if (qr_matrix(s-1,j) == qr_matrix(s,j)) && n_uguali>=5;
                    n= n+(n_uguali-5)+3;
                end;
end;

%Feature 2
%Ricerco solo blocchi 2x2, che e' equivalente al cercare i blocchi delle
%varie size mxn
square_n=[1,1;1,1]; %quadrato 2x2 nero
square_b=[0,0;0,0]; %quadrato 2x2 bianco

for i=1:s-1%righe
    for j=1:s-1%colonne
        if isequal(qr_matrix(i:i+1,j:j+1),square_n) || isequal(qr_matrix(i:i+1,j:j+1),square_b)
            n=n+3;
        end
    end
end

%Feature 3

%GENERO v
for q=1:floor(s/7)
    v=[];
    for j=1:q
        v=cat(2,v,1);
    end
    for j=1:q
        v=cat(2,v,0);
    end
    for j=1:q
        v=cat(2,v,[1 1 1]);
    end
    for j=1:q
        v=cat(2,v,0);
    end
    for j=1:q
        v=cat(2,v,1);
    end
%RICERCO v
%righe (indico ii perch? sto usando i nel ciclo for esterno)
for i=1:s
    for j=1:s-(7*q-1);
        if isequal(qr_matrix(i,j:j+7*q-1),v)
            n=n+40;
        end
    end
end

%colonne
for j=1:s
    for i=1:s-(7*q-1);
        if isequal(qr_matrix(i:i+7*q-1,j),transpose(v))
            n=n+40;
        end
    end
end


end

%Feature 4
number_of_blacks=0;
for i= 1: s
    for j = 1:s
        if qr_matrix(i,j) == 1;
            number_of_blacks= number_of_blacks+1;
        end
    end
end

perc_number_of_blacks=floor(number_of_blacks*100/(s^2));
if perc_number_of_blacks == 50 
    k=0;
else
    k=ceil(norm(perc_number_of_blacks-50)/5)-1; 
end
n=n+k*10;

end