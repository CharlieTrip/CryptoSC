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

function m = Padding(m)

	% Vector of matrix sizes
	DataWordLength = [3, 5, 8, 12, 18, 22, 30, 36, 44, ...
						62, 86, 114, 144, 174, 204, ...
						280, 368, 456, 576, 696, 816, ...
						1050, 1304, 1558];
	l = length(m);		% Length of the unpadded message
	size = 0;			% Size of the matrix

	% Choice the right matrix dimension
	i = 1;
	while size<1
		if data_word_length(i)>=l
			size = data_word_length(i);
		end
		i = i+1;
	end

	% Padding
	pad_length = size-l;
	for i=1:pad_length
		m(l+i)=129;
	end

end