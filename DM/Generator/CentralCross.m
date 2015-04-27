% 
% Central cross
% Function to place the central cross of the DataMatrix
% 
% Input
%	DM		: DataMatrix
%	size	: size of the matrix
% 
% Output
%	DM		: DataMatrix with the cross

function M = CentralCross(DM, size)

	M = zeros(size+2);
	
	% Central cross
	for i=1:(size+2)
		for j=1:(size+2)
			if i==((size+2)/2) || j==((size+2)/2+1)
				M(i,j)=1;
			end
			if (i==((size+2)/2+1) && mod(j,2)==0) || (j==((size+2)/2) && mod(i,2)==1)
				M(i,j)=1;
			end
		end		
	end
	
	% Fill the regions
	for i=1:size
		for j=1:size
			if i<=(size/2) && j<=(size/2)
				M(i,j)=DM(i,j);
			end
			
			if i<=(size/2) && j>(size/2)
				M(i,j+2)=DM(i,j);
			end
			
			if i>(size/2) && j<=(size/2)
				M(i+2,j)=DM(i,j);
			end
			
			if i>(size/2) && j>(size/2)
				M(i+2,j+2)=DM(i,j);
			end
		end
	end
end