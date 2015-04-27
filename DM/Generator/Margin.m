% 
% Adding margin
% Function to place the margin of the DataMatrix
% 
% Input
%	DM		: DataMatrix
%	size	: size of the matrix
% 
% Output
%	DM		: DataMatrix with the margin

function M = Margin(DM, size)

	M = zeros(size+4);
	for i=1:(size+3)
		for j=1:(size+3)
			if (i==2 && mod(j,2)==0) || (j==(size+3) && mod(i,2)==1 && i~=1)
				%disp('Primo if')
				%i, j
				M(i,j)=1;
			end
			if (j==2 && i~=1 )|| (i==(size+3) && j~=1)
				%disp('Secondo if')
				%i, j
				M(i,j)=1;
			end
			if i>2 && i<(size+3) && j>2 && j<(size+3)
				%disp('Terzo if')
				%i, j
				M(i,j)=DM(i-2,j-2);
			end
		end
	end

end