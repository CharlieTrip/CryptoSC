%Questa funzione applica a una matrice 'qr_matrix' di versione 
%'version' la maschera 'mask_n'. Per chiarimenti vedi funzioni 'locali' 
%in basso

function [ qr_matrix ] = app_masking(qr_matrix, mask_n,version)
s=size(qr_matrix,1);
mask=zeros(s,s);%definisco una matrice nulla della stessa dimensione di qr_matrix
mask=app_masking_all(mask,mask_n);%mask_n applicata a tutta la matrice nulla
mask=remove_allignments_bits0(mask,version);%rimuovo la maschera nei pattern di orientamento

%applico la mask costruita sulla qr_matrix.
for i=1:s
    for j=1:s
        qr_matrix(i,j)=bitxor(mask(i,j),qr_matrix(i,j));
    end
end

end

%Applica la maschera a tutta la matrice - modificata da release_masking.m
function [ qr_matrix ] = app_masking_all(qr_matrix, mask_n)

switch mask_n
    
    case 0
        for i=1:size(qr_matrix,1)
            for j=1:size(qr_matrix,2)
                if mod(i+j,2) == 0
                    qr_matrix(i,j)= bitxor(qr_matrix(i,j),1);
                end
            end
        end
        
    case 1
        for i=1:size(qr_matrix,1)
            for j=1:size(qr_matrix,2)
                if mod(i-1,2) == 0
                    qr_matrix(i,j)= bitxor(qr_matrix(i,j),1);
                end
            end
        end
        
    case 2
        for i=1:size(qr_matrix,1)
            for j=1:size(qr_matrix,2)
                if mod(j-1,3) == 0
                    qr_matrix(i,j)= bitxor(qr_matrix(i,j),1);
                end
            end
        end
        
    case 3
        for i=1:size(qr_matrix,1)
            for j=1:size(qr_matrix,2)
                if mod(i+j-2,3) == 0
                    qr_matrix(i,j)= bitxor(qr_matrix(i,j),1);
                end
            end
        end
        
    case 4
        for i=1:size(qr_matrix,1)
            for j=1:size(qr_matrix,2)
                if mod(idivide(uint8(i-1),uint8(2))+idivide(uint8(j-1),uint8(3)),2) == 0
                    qr_matrix(i,j)= bitxor(qr_matrix(i,j),1);
                end
            end
        end
        
    case 5
        for i=1:size(qr_matrix,1)
            for j=1:size(qr_matrix,2)
                if mod((i-1)*(j-1),2)+ mod((i-1)*(j-1),3) == 0
                    qr_matrix(i,j)= bitxor(qr_matrix(i,j),1);
                end
            end
        end
        
    case 6
        for i=1:size(qr_matrix,1)
            for j=1:size(qr_matrix,2)
                if mod(mod((i-1)*(j-1),2)+ mod((i-1)*(j-1),3),2) == 0
                    qr_matrix(i,j)= bitxor(qr_matrix(i,j),1);
                end
            end
        end
        
    case 7
        for i=1:size(qr_matrix,1)
            for j=1:size(qr_matrix,2)
                if mod(mod((i-1)+(j-1),2)+ mod((i-1)*(j-1),3),2) == 0
                    qr_matrix(i,j)= bitxor(qr_matrix(i,j),1);
                end
            end
        end
end
end

%%Remove the various finder puttin the null value
function [ qr_matrix ] = remove_allignments_bits0(qr_matrix, version)
%value for pointless bit
global null;
null = 0;
side = size(qr_matrix,1);
%qr_matrix = qr_matrix*255;
%%Remove position detection pattern (i 3 quadratoni)
%remove up left
qr_matrix(1:9,1:9) = null;
%remove up right
qr_matrix(1:9,side-10:side)=null;
%remove down left
qr_matrix(side-10:side, 1:9)=null;

%%remove timing patterns (le linee)
qr_matrix(7,:) = null;
qr_matrix(:,7) = null;

%%removing allignement patterns
%TODO:modify for center x,y
if version >1
    centers = get_allignment_patterns_center(version);
    %if the centers are more then one 
    
    for c=centers
        qr_matrix(c.r-2:c.r+2,c.c-2:c.c+2) = null;
    end
end
end

%%return the center of the allignemts patterns
function [ result ] = get_allignment_patterns_center( v )
%TODO: edit center in case bigger then 7
switch v
    case 2
        result =struct('r',21+(v-1)*4-6,'c',18+1);
    case 3
result =struct('r',21+(v-1)*4-6,'c',22+1);
    case 4
result =struct('r',21+(v-1)*4-6,'c',26+1);
    case 5
result =struct('r',21+(v-1)*4-6,'c',30+1);
    case 6
result =struct('r',21+(v-1)*4-6,'c',34+1);
    case 7 %TODO: continue 
result =[struct('r',(21+(v-1)*4)-6,'c',38+1),struct('r',21+(v-1)*4-6,'c',21+(v-1)*4-22),...
                 struct('r',21+(v-1)*4-22,'c',21+(v-1)*4-6),struct('r',21+(v-1)*4-22,'c',21+(v-1)*4-22),struct('r',21+(v-1)*4-22,'c',6+1),...
                 struct('r',7,'c',21+(v-1)*4-22)];
    case 8
result =[struct('r',(21+(v-1)*4)-6,'c',42+1),struct('r',21+(v-1)*4-6,'c',21+(v-1)*4-24),...
                 struct('r',21+(v-1)*4-24,'c',21+(v-1)*4-6),struct('r',21+(v-1)*4-24,'c',21+(v-1)*4-24),struct('r',21+(v-1)*4-24,'c',6+1),...
                 struct('r',7,'c',21+(v-1)*4-24)];        
end

end

