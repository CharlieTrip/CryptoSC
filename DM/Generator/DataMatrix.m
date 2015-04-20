% 
% Main file
%   
% Input
% 	m 		: raw message
%  
% Output
%	img		: DataMatrix image

m = [97, 98, 99, 100];		% Message to be encoded

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
	
% Padding function
	[msg, index] = Padding(m);
	disp('Padded message = ')
	disp(msg)
	
% RS-Encoding function
	msg = RSEncoder(DataRegionSize(index), DataWordLength(index), msg);
	disp('Encoded message = ')
	disp(msg)
	
% Message-to-matrix function
	

% Matrix-to-image function