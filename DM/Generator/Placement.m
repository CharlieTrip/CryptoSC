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
	i = 1;
	
	while 1
		
		% Downwards
		while 1
			if x<=size && y>0 && DM(x,y)==5
				DM = MsgToMatrix(DM, Msg(i), x,y, size);
				i=i+1;
			end
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
		
		% Upwards
		while 1
			if x>0 && y<=size && DM(x,y)==5
				DM = MsgToMatrix(DM, Msg(i), x,y, size);
				i=i+1;
			end
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
	
	for i=1:size
		for j=1:size
			if DM(i,j)==5
				DM(i,j)=0;
			end
		end
	end
	
end