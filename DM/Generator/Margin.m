% 
% Adding margin
% Function to place the margin of the DataMatrix
% 
% Input
%	DM		: DataMatrix
% 
% Output
%	DM		: DataMatrix with the margin

function M = Margin(DM)

	size = length(DM);
	M = zeros(size+4);

	for i=2:(size+3)
		for j=2:(size+3)
			
			% Dotted margin on top and right
			if (i==2 && mod(j,2)==0) || (j==(size+3) && mod(i,2)==1)
				M(i,j)=1;
			end
			
			% L-margin on bottom and left
			if j==2 || i==(size+3)
				M(i,j)=1;
			end
			
			% Fill the DM with the data
			if i>2 && i<(size+3) && j>2 && j<(size+3)
				M(i,j)=DM(i-2,j-2);
			end
		end
	end

end