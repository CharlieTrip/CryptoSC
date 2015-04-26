%given a qrcode matrix return the bit sequence
function [ data ] = retrieve_data (qr_matrix)
%starting from right down corner
<<<<<<< HEAD
%n is the bit counter
n=7;
=======
%n is used for count the number of bit, it start from 7 and end in 0, then begin again from 7 until the matrix end
n=7; 
%bit sequence result
>>>>>>> origin/master
data = [];
%%retrieve data in the first part of qr (prima della riga verticale di 1 0)
for c=(size(qr_matrix,2)):-2:9
	%read from bottom to top
    	[qr_matrix, p, n, data] = upwards(qr_matrix, [size(qr_matrix,1),c], n, data);
	%reverse the matrix for read every time from bottom to top    	
	qr_matrix=rotate_matrix(qr_matrix);
end
%%retrieve data in the second part (dopo la famosa riga)
for c=6:-2:2
	%same as before
    [qr_matrix, p, n, data] = upwards(qr_matrix, [size(qr_matrix,1),c], n, data);
    qr_matrix=rotate_matrix(qr_matrix);
end
%since it appends every bit to the data sequence we need to reverse the sequence
data = fliplr(data);
end

%%Add (if is possible) 1 or 2 bit to the bit sequence data
%input:
%	qr_matrix: the qr matrix (as name says)
%	p : is a point (r,c) where the function begin
%	n : counter of bit (0<=n<=7)
%	data : the result
function [qr_matrix, p ,n, data] = upwards(qr_matrix, p, n, data)
<<<<<<< HEAD
global null;
 %null=-1;
    r=p(1);
    c=p(2);
=======
%this variable is global and it is the value that we give to the null position
%usually we set it to -1
global null;
	%retrieve row form point
    	r=p(1);
	%retrieve column from point    	
	c=p(2);

%check if the gven position is inside the matrix
%if not it finish the column then it exit	
>>>>>>> origin/master
    if r>0 && r<=size(qr_matrix,1)
	%check if the byte isn't finished
        if n>=0
            %check if the position is not null
	    %(for avoid the pattern finder)
            if qr_matrix(r,c) ~= null;
		%budro tu devi mettere al posto di n il bit da scrivere                
		%qr_matrix(r,c) = n;
		%read the bit
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
end

function [result] =rotate_matrix(matrix)
result= zeros(size(matrix));
for r=0:size(matrix,1)-1
   result(r+1,:) = matrix(size(matrix,1)-r,:); 
end
end
