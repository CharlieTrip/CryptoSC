
% Function to Encode a list of integers in 0..255 using
% Reed-Solomon with parameter n,k
% 
% Input
% 	n 		: length of the codeword
% 	k 		: dimension of the message
% 	comeMsg : list that rappresent the message
% 
% Output
%	EncodeMsg ; encoded message of length n
function encodedMsg = RSEncoder(n,k, codedMsg)

	% Creating the Encoder using the Matlab's built-in function
	encoder = comm.RSEncoder(n, k);
	

	% Enable the possibility to change the parameter of the encoder	release(encoder)
	
	% Changing the Primitive Polynomial of the encoder
	% For DataMatrix, the poly is
	% 
	% The function de2bi is in Big Endian so we flip the list to get a Little Endian
	encoder.PrimitivePolynomialSource = 'Property';
	encoder.PrimitivePolynomial = fliplr(de2bi(285,9));

	% Changing the Generator Polynomial of the RS code
	% with respect to the 301 poly for using element of GF(256)
	encoder.GeneratorPolynomialSource = 'Property';
	encoder.GeneratorPolynomial = rsgenpoly(255,255 - (n-k),285,0);


	% Return the encoding (using step) and traspose it to a row (using ')
	encodedMsg = step(encoder, codedMsg')';
	
end
