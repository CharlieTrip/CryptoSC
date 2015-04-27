%given a qrcode matrix return the bit sequence
function [ data ] = retrieve_data (qr_matrix)
%starting from right down corner
%bit sequence result
data = [];
%%retrieve data in the first part of qr (prima della riga verticale di 1 0)
for c=(size(qr_matrix,2)):-2:9
	%read from bottom to top
    	[qr_matrix, p, data] = upwards(qr_matrix, [size(qr_matrix,1),c], data);
	%reverse the matrix for read every time from bottom to top    	
	qr_matrix=rotate_matrix(qr_matrix);
end
%%retrieve data in the second part (dopo la famosa riga)
for c=6:-2:2
	%same as before
    [qr_matrix, p, data] = upwards(qr_matrix, [size(qr_matrix,1),c], data);
    qr_matrix=rotate_matrix(qr_matrix);
end
%since it appends every bit to the data sequence we need to reverse the sequence
data = fliplr(data);
end

%%Add (if is possible) 1 or 2 bit to the bit sequence data
%input:
%	qr_matrix: the qr matrix (as name says)
%	p : is a point (r,c) where the function begin
%	data : the result
function [qr_matrix, p , data] = upwards(qr_matrix, p, data)
    global null;
	%retrieve row and column form point
    r=p(1);   	
	c=p(2);

%check if the gven position is inside the matrix
%if not it finish the column then it exit	
    if r>0 && r<=size(qr_matrix,1)
    %check if the position is not null
	%(for avoid the pattern finder)
        if qr_matrix(r,c) ~= null;		              
            %qr_matrix(r,c) = n;
            %read the bit
            data = [qr_matrix(r,c) data];
            if qr_matrix(r,c-1) ~= null                      
                data = [qr_matrix(r,c-1) data];
                [qr_matrix, p, data] = upwards(qr_matrix, [r-1,c], data);
            else
                [qr_matrix, p, data] = upwards(qr_matrix, [r-1,c], data);
            end
        else
            if qr_matrix(r,c-1) ~= null
                data = [qr_matrix(r,c-1) data];
                [qr_matrix, p, data] = upwards(qr_matrix, [r-1,c], data);
            else
                [qr_matrix, p, data] = upwards(qr_matrix, [r-1,c], data);
            end
        end
    end
end

function [result] =rotate_matrix(matrix)
result= zeros(size(matrix));
for r=0:size(matrix,1)-1
   result(r+1,:) = matrix(size(matrix,1)-r,:); 
end
end
