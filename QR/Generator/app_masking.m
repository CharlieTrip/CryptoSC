%Questa funzione applica a una matrice 'qr_matrix' di versione 
%'version' la maschera 'mask_n'. Per chiarimenti vedi funzioni 'locali' 
%in basso

function [ qr_matrix ] = app_masking(qr_matrix, mask_n,version)
s=size(qr_matrix,1);
mask=zeros(s,s);%definisco una matrice nulla della stessa dimensione di qr_matrix
mask=app_masking_all(mask,mask_n);%mask_n applicata a tutta la matrice nulla
mask=remove_allignments_bits(mask,version);%rimuovo la maschera nei pattern di orientamento

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
function [ qr_matrix ] = remove_allignments_bits( qr_matrix, version)
%value for pointless bit
global null;
null=0;
side = size(qr_matrix,1);
%qr_matrix = qr_matrix*255;
%%Remove position detection pattern (i 3 quadratoni)
%remove up left
qr_matrix(1:9,1:9) = null;
%remove up right
qr_matrix(1:9,side-7:side)=null;
%remove down left
qr_matrix(side-7:side, 1:9)=null;

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
%removing version information if version is bigger then 6
if version > 6
    %down left
    qr_matrix([(size(qr_matrix)-10):(size(qr_matrix)-8)], [1:6]) = null;
    %up right
    qr_matrix([1:6], [(size(qr_matrix)-10):(size(qr_matrix)-8)]) = null;
end
end

%%return the center of the allignemts patterns
function [ result ] = get_allignment_patterns_center( v )
%TODO: edit center in case bigger then 7
if v>1
    switch v
        case 2
            rc =18;
        case 3
            rc = 22;
        case 4
            rc = 26;
        case 5
            rc = 30;
        case 6
            rc = 34;
        case 7
            rc=[22 38];
        case 8
            rc=[24 42];
        case 9
            rc=[26 46];
        case 10
            rc=[28 50];
        case 11
            rc=[30 54];
        case 12
            rc=[32 58];
        case 13
            rc=[34 62];
        case 14
            rc =[26 46 66];
        case 15
            rc =[26 48 70];
        case 16
            rc =[26 50 74];
        case 17
            rc =[30 54 78];
        case 18
            rc =[30 56 82];
        case 19
            rc =[30 58 86];
        case 20
            rc =[34 62 90];
        case  21
            rc=[28 50 72 94];
        case  22
            rc=[26 50 74 98];
        case  23
            rc=[30 54 78 102];
        case  24
            rc=[ 28 54 80 106];
        case  25
            rc=[32 58 86 114];
        case  26
            rc=[ 30 58 86 114];
        case  27
            rc=[ 34 62 90 118];
        case  28
            rc=[26 50 74 98 122 ];
        case  29
            rc=[30 54 78 102 126 ];
        case  30
            rc=[26 52 78 104 130 ];
        case  31
            rc=[ 30 56 82 108 134];
        case  32
            rc=[ 34 60 86 112 138];
        case  33
            rc=[30 58 86 114 142 ];
        case  34
            rc=[34 62 90 118 146 ];
        case  35
            rc=[30 54 78 102 126 150];
        case  36
            rc=[24 50 76 102 128 154];
        case  37
            rc=[28 54 80 106 132 158 ];
        case  38
            rc=[32 58 84 110 136 162];
        case  39
            rc=[26 54 82 110 138 166];
        case 40
            rc = [30 58 86 114 142 170];
    end
    %size qr
    s = 21+(v-1)*4;
    %initialize result
    result=[];
    %add 6 since it is present a the beginning of all rc vector
    rc =[6 rc];
    %calculate max and min for avoid the 3 corner in the if
    M = max(rc);
    m = min(rc);
    for r =rc
        for c=rc
            %evito i quadratoni nei tre bordi
            if (c~=M|| r~=M)&&(c~=m || r~=m) && ...
                    (r~=M || c~=m)
                result = [result struct('r',s-r,'c',c+1)]; 
            end
        end
    end
end

end

