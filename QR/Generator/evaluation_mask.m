function n=evaluation_mask(qr_matrix,k)

%Applico la maschera i-esima
qr_matrix=release_masking(qr_matrix,k);%VA SISTEMATA

%EVALUATION FOR ALL ENTIRE MATRIX.

%Feature 1 Adjacents modules
%Righe
n=0;
for i=1:size(qr_matrix,1)%scorre le righe della matrice
    n_uguali=1;
    for j=1:size(qr_matrix,2)-1%scorre il vettore riga 
        
        if qr_matrix(i,j) == qr_matrix(i,j+1);
            n_uguali=n_uguali+1;
            
        else
                if n_uguali>=5
                    n= n+(n_uguali-5)+3;
                end;
                n_uguali=1;
        end;
    end;
                if (qr_matrix(i,size(qr_matrix,2)-1) == qr_matrix(i,size(qr_matrix,2))) && n_uguali>=5;
                    n= n+(n_uguali-5)+3;
                end;
end;

%columns

for j=1:size(qr_matrix,2)%scorre le righe della matrice
    n_uguali=1;
    for i=1:size(qr_matrix,1)-1%scorre il vettore riga 
        
        if qr_matrix(i,j) == qr_matrix(i+1,j);
            n_uguali=n_uguali+1;
            
        else
                if n_uguali>=5
                    n= n+(n_uguali-5)+3;
                end;
                n_uguali=1;
        end;
    end;
                if (qr_matrix(size(qr_matrix,2)-1,j) == qr_matrix(size(qr_matrix,2),j)) && n_uguali>=5;
                    n= n+(n_uguali-5)+3;
                end;
end;

%Feature 2
%Ricerco solo blocchi 2x2, che e' equivalente al cercare i blocchi delle
%varie size mxn
square_n=[1,1;1,1]; %quadrato 2x2 nero
square_b=[0,0;0,0]; %quadrato 2x2 bianco

for i=1:size(qr_matrix,1)-1
    for j=1:size(qr_matrix,2)-1
        if isequal(qr_matrix(i:i+1,j:j+1),square_n) || isequal(qr_matrix(i:i+1,j:j+1),square_b)
            n=n+3;
        end
    end
end

%Feature 3
%righe
dldddld=[1 0 1 1 1 0 1];

for i=1:size(qr_matrix,1)
    for j=1:size(qr_matrix,2)-6;
        if isequal(qr_matrix(i,j:j+6),dldddld)
            n=n+40;
        end
    end
end

%colonne
for j=1:size(qr_matrix,2)
    for i=1:size(qr_matrix,1)-6;
        if isequal(qr_matrix(i:i+6,j),transpose(dldddld))
            n=n+40;
        end
    end
end

%Feature 4
number_of_blacks=0;
for i= 1: size(qr_matrix,1)
    for j = 1:size(qr_matrix,2)
        if qr_matrix(i,j) == 1;
            number_of_blacks= number_of_blacks+1;
        end
    end
end

perc_number_of_blacks=floor(number_of_blacks*100/(size(qr_matrix,1)^2));

if mod(perc_number_of_blacks,5) == 0
    n=n+norm(50-perc_number_of_blacks)*10;
else
    q=floor(perc_number_of_blacks/5);
    a=norm(q*5-50)/5;
    b=norm((q+1)*5-50)/5;
    n=n+min(a,b)*10;
end

end