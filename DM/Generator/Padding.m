% 
% Padding
% Function to choice the matrix-size and
% perform the padding of the message
% with the ASCII pad char 129
%  
% Input
% 	M 		: message
%  
% Output
%	Msg 	: padded message
%	t		: matrix-size index

function [Msg, t] = Padding(M)

% Vector of matrix sizes
	DataWordLength = [3, 5, 8, 12, 18, 22, 30, 36, 44, ...
						62, 86, 114, 144, 174, 204, ...
						280, 368, 456, 576, 696, 816, ...
						1050, 1304, 1558];
					
% Length of the unpadded message
	Len = length(Msg);
	
% Size of the matrix
	Size = 0;

% Choice the right matrix dimension
	t = 0;
	while Size<=Len
		t = t+1;
		if data_word_length(t)>=Len
			Size = DataWordLength(t);
		end
	end

% Padding
	PadLength = Size-Len;
	for i=1:PadLength
		Msg(Len+i)=129;
	end

end