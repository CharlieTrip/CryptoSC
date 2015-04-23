%Given a bit sequence return the byte sequence which contains the message
%decoded 
function [ message ] = decodeData( data, version, ecl )
%retrieve information from version and error correction level
[ car, r ] = get_version_caratteristics(version, ecl);
 %remove remainders bit
data2 = data(1:length(data)-r);
%convert in byte
temp = reshape(data2,8,[]);
M=[];

for i=1:size(temp,2)
    M=[M bi2de(temp(:,i)','left-msb')];
end
message = [];

if length(car.nblock) == 1
     blocks = reshape(M,car.nblock,[]);
     for i =1:car.nblock
         message = [message decodeRS(car.n, car.k, blocks(i,:))];
     end
else   
    blocks1= zeros([car.nblock(1) car.n(1)]);
    for i=1:car.nblock(1)
        j=i;
        col=1;
        while j<=length(M)
            blocks1(i,col)=M(j);
            j=j+car.nblock(1)+car.nblock(2);
            col=col+1;
        end
    end
    
    blocks2= zeros([car.nblock(2) car.n(2)]);
    for i=1:car.nblock(2)
        j=i;
        col = 1;
        while j<=length(M)
            blocks2(i,col)=M(j);
            j=j+car.nblock(1)+car.nblock(2);
            col= col +1;
        end
    end
    %decoding procedure
    for i =1:car.nblock(1)
         message = [message decodeRS(car.n(1), car.k(1), blocks1(i,:))];
    end
    for i =1:car.nblock(2)
         message = [message decodeRS(car.n(2), car.k(2), blocks2(i,:))];
    end
end
end

  function [message] = decodeRS( n, k, code)
      message = code(1:k);
  end
% 
% 
% RSDecoder
% Function to decode a list of integers in 0..255 using
% Reed-Solomon with parameter n,k
% 
% Input
% 	n 		: length of the codeword
% 	k 		: dimension of the message
% 	comeMsg : list that rappresent the message
% 
% Output
% 	decodeMsg ; decoded message of length k
% 
% 
% function decodedMsg = decodeRS(n,k, codedMsg)
% 
% 	% Creating the Decoder using the Matlab's built-in function
% 	decoder = comm.RSDecoder(n, k);
% 	
% 
% 	% Enable the possibility to change the parameter of the decoder
% 	release(decoder)
% 	
% 	% Changing the Primitive Polynomial of the decoder
% 	% For DataMatrix, the poly is
% 	% x^8+x^5+x^3+x^2+1 <--> 301 in decimal form
% 	% 
% 	% The function de2bi is in Big Endian so we flip the list to get a Little Endian
% 	decoder.PrimitivePolynomialSource = 'Property';
% 	decoder.PrimitivePolynomial = fliplr(de2bi(301,9));
% 
% 	% Changing the Generator Polynomial of the RS code
% 	% with respect to the 301 poly for using element of GF(256)
% 	decoder.GeneratorPolynomialSource = 'Property';
% 	decoder.GeneratorPolynomial = rsgenpoly(255,255 - (n-k),301);
% 
% 
% 	% Return the decoding (using step) and traspose it to a row (using ')
% 	decodedMsg = step(decoder, codedMsg')';
% 	
% end