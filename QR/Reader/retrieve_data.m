function [ data ] = retrieve_data (qr_matrix)
%starting from right down corner
%n is the bit counter
n=7;
data = [];
for c=(size(qr_matrix,2)):-2:9
    [qr_matrix, p, n, data] = upwards(qr_matrix, [size(qr_matrix,1),c], n, data);
    qr_matrix=rotate_matrix(qr_matrix);
end
for c=6:-2:2
    [qr_matrix, p, n, data] = upwards(qr_matrix, [size(qr_matrix,1),c], n, data);
    qr_matrix=rotate_matrix(qr_matrix);
end
data = fliplr(data);
end

function [qr_matrix, p ,n, data] = upwards(qr_matrix, p, n, data)
global null;
 %null=-1;
    r=p(1);
    c=p(2);
    if r>0 && r<=size(qr_matrix,1)
        if n>=0
            %first number
            if qr_matrix(r,c) ~= null;
                %qr_matrix(r,c) = n;
                data = [qr_matrix(r,c) data];
                if qr_matrix(r,c-1) ~= null
                    if n==0
                        n=8;
                        %qr_matrix(r,c-1) = n-1;
                        data = [qr_matrix(r,c-1) data];
                    else
                        %qr_matrix(r,c-1) = n-1;
                        data = [qr_matrix(r,c-1) data];
                    end
                    [qr_matrix, p, n, data] = upwards(qr_matrix, [r-1,c], n-2, data);
                else
                    [qr_matrix, p, n, data] = upwards(qr_matrix, [r-1,c], n-1, data);
                end
            else
                if qr_matrix(r,c-1) ~= null
                    %qr_matrix(r,c-1) = n;
                    data = [qr_matrix(r,c-1) data];
                    [qr_matrix, p, n, data] = upwards(qr_matrix, [r-1,c], n-1, data);
                else
                    [qr_matrix, p, n, data] = upwards(qr_matrix, [r-1,c], n, data);
                end
            end
         else
             %recall the upward for the new byte
             [qr_matrix, p ,n, data] = upwards(qr_matrix, p, 7, data);
        end
    end
%     else
%         %rotate the qr
%         if c>0 && c<=size(qr_matrix,2)
%             qr_matrix=rotate_matrix(qr_matrix);
%             [qr_matrix, p] = upwards(qr_matrix, [size(qr_matrix,1),c-2], n); 
%         end
%     end
end

function [result] =rotate_matrix(matrix)
result= zeros(size(matrix));
for r=0:size(matrix,1)-1
   result(r+1,:) = matrix(size(matrix,1)-r,:); 
end
end
