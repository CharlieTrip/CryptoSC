% 
% Message encoder script
% Perform the padding and the RS-encoding of the message
%  
% Input
% 	m 		: raw message
%  
% Output
%	msg		: padded message with ECC

% Max data that can be encoded, size by size
	DataWordLength = [3, 5, 8, 12, 18, 22, 30, 36, 44, ...
                    62, 86, 114, 144, 174, 204, ...
                    280, 368, 456, 576, 696, 816, ...
                    1050, 1304, 1558];
				
				
% Max redundancy that can be encoded, size by size
	ErrorWordLength = [5, 7, 10, 12, 14, 18, 20, 24, 28, ...
                     36, 42, 48, 56, 68, 84, ...
                     112, 144, 192, 224, 272, 336, ...
                     408, 496, 620];
				 
				 
% Size of the region, size by size
	DataRegionSize = [8, 10, 12, 14, 16, 18, 20, 22, 24, ...
                    14, 16, 18, 20, 22, 24, ...
                    14, 16, 18, 20, 22, 24, ...
                    18, 20, 22];
				
				

function msg = MsgEnc(m);

% Padding function
	[msg, index] = Padding(m);
	disp('Padded message = ')
	disp(msg)
	
% Encoding function
	msg = RSEncoder(DataRegionSize(index), DataWordLength(index), msg);
	disp('Encoded message = ')
	disp(msg)
end