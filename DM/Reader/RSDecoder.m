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
%	decodeMsg ; decoded message of length k -
% 

function decodedMsg = RSDecoder(n,k, codedMsg)

	% Creating the Decoder using the Matlab's built-in function
	decoder = comm.RSDecoder(n, k);
	

	% Enable the possibility to change the parameter of the decoder
	release(decoder)
	
	% Changing the Primitive Polynomial of the decoder
	% For DataMatrix, the poly is
	% x^8+x^5+x^3+x^2+1 <--> 301 in decimal form
	% 
	% The function de2bi is in Big Endian so we flip the list to get a Little Endian
	decoder.PrimitivePolynomialSource = 'Property';
	decoder.PrimitivePolynomial = fliplr(de2bi(301,9));

	% Changing the Generator Polynomial of the RS code
	% with respect to the 301 poly for using element of GF(256)
	decoder.GeneratorPolynomialSource = 'Property';
	decoder.GeneratorPolynomial = rsgenpoly(255,255 - (n-k),301);


	% Return the decoding (using step) and traspose it to a row (using ')
	decodedMsg = step(decoder, codedMsg')';
	
end