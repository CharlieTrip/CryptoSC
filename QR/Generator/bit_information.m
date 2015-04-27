
function QRmatrix = bit_information(QRmatrix,n_mask, ecl,version)

 QRmatrix = format_information(QRmatrix,n_mask, ecl);

 QRmatrix = version_information(QRmatrix,version);

end



function QRmatrix = format_information(QRmatrix,n_mask, ecl)

Mask_pattern = gf([1 0 1 0 1 0 0 0 0 0 1 0 0 1 0]);

m = length(QRmatrix(:,1));

mask_reference = de2bi(n_mask,3,'left-msb');


switch ecl
    case 'L'
        eclvl = [0 1 mask_reference];
    case 'M'
        eclvl = [0 0 mask_reference];
    case 'Q'
        eclvl = [1 1 mask_reference];
    case 'H'
        eclvl = [1 0 mask_reference];
end

 Bitsequence = bchenc(gf(eclvl),15,5); % ottengo la sequenza codificata con BCH(15,5) DA AGGIUSTARE
 
 Bitsequence = gf2dec(Bitsequence+Mask_pattern,1); % faccio lo xor con il mask pattern
 
 QRmatrix(1:6,9) = Bitsequence(15:-1:10);
 QRmatrix(8:9,9) = Bitsequence(9:-1:8);
 QRmatrix(9,8) = Bitsequence(7);
 QRmatrix(9,6:-1:1) = Bitsequence(6:-1:1); 
  
 QRmatrix(9,m:-1:m-7) = Bitsequence(15:-1:8);
 QRmatrix(m:-1:m-6,9) = Bitsequence(1:7);

end









function QR_matrix = version_information(QR_matrix,version)

if version >=7
    
String_encoded = BCHencoding(version);
m = length(QR_matrix);
k = 1;
for j=6:-1:1
    for i=1:3        
      QR_matrix(m-7-i,j) = String_encoded(k);  
      k = k+1;
    end
end

k = 1;
for j=6:-1:1
    for i=1:3        
      QR_matrix(j,m-7-i) = String_encoded(k);  
      k = k+1;
    end
end


end

end






function BCHcode_VI=BCHencoding(version)
xnk=[1 0];

for i=1:11
    xnk=conv(xnk,[1 0]);
end
length(xnk)

version_bits=gf(de2bi(version,6,'left-msb'),8);

version_bits_xnk=conv(version_bits,xnk);

[quotient,remainder]=deconv(version_bits_xnk,gf([1 1 1 1 1 0 0 1 0 0 1 0 1],8));
remainder=gf2dec(remainder(7:18),1);

BCHcode_VI=[version_bits,remainder];


end