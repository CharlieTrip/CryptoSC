% 
% Main file
%   
% Input
% 	M 		: raw message
%  
% Output
%	IMG		: DataMatrix image

% Message to be encoded
Str = 'CiaoCiaoCiaoCiaoCiaoCiaoCiaoCiaoCiaoCiaoCiaoCiaoCiaoCiaoCiaoCi';

% Max data that can be encoded, size by size
	DataWordLength = [3, 5, 8, 12, 18, 22, 30, 36, 44, ...
                    62, 86, 114, 144, 174];
				
				
% Max redundancy that can be encoded, size by size
	ErrorWordLength = [5, 7, 10, 12, 14, 18, 20, 24, 28, ...
                     36, 42, 48, 56, 68];
				 
				 
% Size of the region, size by size
	DataRegionSize = [8, 10, 12, 14, 16, 18, 20, 22, 24, ...
                    28, 32, 36, 40, 44];
	
				
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
	
% No-cross version of the DataMatrix
	DM2=DM;
	DM2 = Margin(DM2);	
	Q = ones(length(DM2))-DM2;
	imwrite(Q, 'NoCross.png');

% Central cross function
	if SizeIndex>9
		DM=CentralCross(DM, DataRegionSize(SizeIndex));
	end
	
% Adding margin
 	DM = Margin(DM);
 	disp('Matrix form with margin = ')
 	disp(DM)

% Matrix-to-image function
	Q = ones(length(DM))-DM;
	imwrite(Q, 'test.png');