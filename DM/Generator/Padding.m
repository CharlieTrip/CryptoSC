% 
% Padding
% Function to choice the matrix-size and
% perform the padding of the message
% with the ASCII pad char 129
%  
% Input
% 	m 		: message
%  
% Output
%	m 		: padded message
%	t		: matrix-size index

function [m, t] = Padding(m)

% Vector of matrix sizes
	DataWordLength = [3, 5, 8, 12, 18, 22, 30, 36, 44, ...
						62, 86, 114, 144, 174, 204, ...
						280, 368, 456, 576, 696, 816, ...
						1050, 1304, 1558];
					
% Length of the unpadded message
	l = length(m);
	
% Size of the matrix
	size = 0;

% Choice the right matrix dimension
	t = 0;
	while size<1
		t = t+1;
		if data_word_length(t)>=l
			size = DataWordLength(t);
		end
	end

% Padding
	PadLength = size-l;
	for i=1:PadLength
		m(l+i)=129;
	end

end