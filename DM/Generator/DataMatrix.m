% 
% Main file
% This function takes a string of standard ASCII char as input
% and returns a PNG file (called 'DataMatrix.png').
% The maximum length of the message is 174.
%   
% Input
% 	Str		: string form of the message
%  
% Output
%	IMG		: DataMatrix image

function DM = DataMatrix(Str)

% Max data that can be encoded, size by size
	DataWordLength = [3, 5, 8, 12, 18, 22, 30, 36, 44, ...
                    62, 86, 114, 144, 174];
				
				
% Max redundancy that can be encoded, size by size
	ErrorWordLength = [5, 7, 10, 12, 14, 18, 20, 24, 28, ...
                     36, 42, 48, 56, 68];
				 
				 
% Size of the region, size by size
	DataRegionSize = [8, 10, 12, 14, 16, 18, 20, 22, 24, ...
                    28, 32, 36, 40, 44];


if length(Str)>DataWordLength(14)
	error('The message is too long.');
end
				
% String to ASCII
	M = uint8(Str)+1;
				
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
	
% Central cross function
	if SizeIndex>=10
		DM=CentralCross(DM, DataRegionSize(SizeIndex));
	end
	
% Adding margin
  	DM = Margin(DM);
  	disp('Matrix form with margin = ')
  	disp(DM)

% Matrix-to-image function
	imwrite(ones(length(DM))-DM, 'DataMatrix.png');
	
end