function n=evaluation_mask(qr_matrix,k)

%Applico la maschera i-esima
qr_matrix=release_masking(qr_matrix,k);

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

%Feature 3
%righe
dldddld=[1 0 1 1 1 0 1];

for i=1:size(qr_matrix,1)
    for j=1:size(qr_matrix,2)-6;
        if qr_matrix(i,j:j+6) == dldddld
            n=n+40;
        end
    end
end

%colonne
for j=1:size(qr_matrix,2)
    for i=1:size(qr_matrix,1)-6;
        if qr_matrix(i:i+6,j) == transpose(dldddld)
            n=n+40;
        end
    end
end

%Feature 4
number_of_blacks=0;
for i= 1: size(qr_matrix,1)
    for j = 1 size(qr_matrix,2)
        if qr_matrix(i,j) == 0;
            number_of_blacks= number_of_blacks+1;
        end
    end
end

number_of_blacks=%finire



end