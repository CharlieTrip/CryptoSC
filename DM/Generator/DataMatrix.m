% 
% Main file
%   
% Input
% 	M 		: raw message
%  
% Output
%	IMG		: DataMatrix image

% Message to be encoded
Str = 'Budroni infame!!';

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
	
				
% String to ASCII
	M = uint8(Str);
				
% Padding function
	[Msg, SizeIndex] = Padding(M);
	disp('Padded message = ')
	disp(Msg)
	
% RS-Encoding function
	Msg = RSEncoder(DataWordLength(SizeIndex)+ErrorWordLength(SizeIndex), DataWordLength(SizeIndex), Msg);
	disp('Encoded message = ')
	disp(Msg)
	
% Message-to-matrix function
	DM = Placement(Msg, DataRegionSize(SizeIndex));
	disp('Matrix form = ')
	disp(DM)
	
% Adding margin
 	DM = Margin(DM, DataRegionSize(SizeIndex));
 	disp('Matrix form with margin = ')
 	disp(DM)

% Matrix-to-image function
	Q = ones(DataRegionSize(SizeIndex)+4)-DM;
	imwrite(Q, 'test.png');