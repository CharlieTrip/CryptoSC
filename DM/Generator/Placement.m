% 
% Placement
% Function to place the matrices into the position
% to get the matrix form of the DataMatrix
% 
% Input
%	Msg		: message
%	size	: size of the matrix
% 
% Output
%	DM		: matrix form of the DataMatrix

function DM = Placement(Msg, size)
	
	% Initialization of the matrix
	DM = ones(size)*5;
	
	% Start position
	x = 5;
	y = 1;
	% Message index
	i = 1;
	
	while 1
		
		% Upwards
		while 1
			[DM, k] = MsgToMatrix(DM, Msg(i), x,y, size);
			i=i+k;
			
			x=x-2;
			y=y+2;
			if x<1 || y>size
				break
			end
		end
		x = x+1;
		y = y+3;
		
		if i>length(Msg)
			break
		end
		
		% Downwards
		while 1
			[DM, k] = MsgToMatrix(DM, Msg(i), x,y, size);
			i=i+k;
			
			x=x+2;
			y=y-2;
			if x>size || y<1
				break
			end
		end
		
		if x>size && y>size
 			break
		end
		x=x+3;
		y=y+1;
		
		if i>length(Msg)
			break
		end
	end
	
	% Fill the unchanged bits with zeros
	for i=1:size
		for j=1:size
			if DM(i,j)==5
				DM(i,j)=0;
			end
		end
	end
	
end