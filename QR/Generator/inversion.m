function qr_matrix=inversion(qr_matrix)

s=length(1,qr_matrix);
ones_matrix=ones(s,s);

for i=1:s
    for j=1:s
        qr_matrix(i,j)=bitxor(ones_matrix(i,j),qr_matrix(i,j));
    end
end


end