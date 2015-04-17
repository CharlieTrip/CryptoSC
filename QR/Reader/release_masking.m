function [ qr_matrix ] = release_masking(qr_matrix, mask_n)
switch mask_n
    
    case '000'
        for i=1:size(qr_matrix,1)
            for j=1:size(qr_matrix,2)
                if mod(i+j,2) == 0
                    qr_matrix(i,j)= bitxor(qr_matrix(i,j),1);
                end
            end
        end
        
    case '001'
        for i=1:size(qr_matrix,1)
            for j=1:size(qr_matrix,2)
                if mod(i-1,2) == 0
                    qr_matrix(i,j)= bitxor(qr_matrix(i,j),1);
                end
            end
        end
        
    case '010'
        for i=1:size(qr_matrix,1)
            for j=1:size(qr_matrix,2)
                if mod(j-1,3) == 0
                    qr_matrix(i,j)= bitxor(qr_matrix(i,j),1);
                end
            end
        end
        
    case '011'
        for i=1:size(qr_matrix,1)
            for j=1:size(qr_matrix,2)
                if mod(i+j-2,3) == 0
                    qr_matrix(i,j)= bitxor(qr_matrix(i,j),1);
                end
            end
        end
        
    case '100'
        for i=1:size(qr_matrix,1)
            for j=1:size(qr_matrix,2)
                if mod(idivide(uint8(i-1),uint8(2))+idivide(uint8(j-1),uint8(3)),2) == 0
                    qr_matrix(i,j)= bitxor(qr_matrix(i,j),1);
                end
            end
        end
        
    case '101'
        for i=1:size(qr_matrix,1)
            for j=1:size(qr_matrix,2)
                if mod((i-1)*(j-1),2)+ mod((i-1)*(j-1),3) == 0
                    qr_matrix(i,j)= bitxor(qr_matrix(i,j),1);
                end
            end
        end
        
    case '110'
        for i=1:size(qr_matrix,1)
            for j=1:size(qr_matrix,2)
                if mod(mod((i-1)*(j-1),2)+ mod((i-1)*(j-1),3),2) == 0
                    qr_matrix(i,j)= bitxor(qr_matrix(i,j),1);
                end
            end
        end
        
    case '111'
        for i=1:size(qr_matrix,1)
            for j=1:size(qr_matrix,2)
                if mod(mod((i-1)+(j-1),2)+ mod((i-1)*(j-1),3),2) == 0
                    qr_matrix(i,j)= bitxor(qr_matrix(i,j),1);
                end
            end
        end
end

