% 
% Standard Matrix Form
% Function to place the message into the matrix form
% wrapped around the matrix
% 
% Input
%	DM		: old DataMatrix
% 	Msg		: message
%	x		: x-position of the LSB
%	y		: y-position of the LSB
%	n		: size of the matrix
% 
% Output
%	DM		: new DataMatrix

function [DM, k] = MsgToMatrix(DM, Msg, x,y, n)

% Message-writing flag
	k=0;

% Convertion to binary
	BinMsg=de2bi(Msg, 8);

%
  	% Corner case 1
    %
    % top right corner:   |4|5|
    %                       |6|
    %                       |7|
    %                       |8|
    %
    % bottom left corner: |1|2|3|
    %
    % Placement rule
    % x == size + 1 and y == 1
    %

	if (x == (n+1)) && (y == 1)
		DM(4 , n  ) = BinMsg(8);
		DM(3 , n  ) = BinMsg(7);
		DM(2 , n  ) = BinMsg(6);
		DM(1 , n  ) = BinMsg(5);
		DM(1 , n-1) = BinMsg(4);
		DM(n , 3  ) = BinMsg(3);
		DM(n , 2  ) = BinMsg(2);
		DM(n , 1  ) = BinMsg(1);
		
		k=1;
	end;
	
	
%
    % Corner case 2
    %
	% top right corner:  |4|5|6|7|
	%                          |8| 
    %
    % bottom left corner: |1|
    %                     |2|
    %                     |3|
    %
    % Placement rule
    % x == size - 1 and y == 1 and size % 4
    %

	if (x == (n-1)) && (y == 1) && mod(n,4)
		DM(2  , n  ) = BinMsg(8);
		DM(1  , n  ) = BinMsg(7);
		DM(1  , n-1) = BinMsg(6);
		DM(1  , n-2) = BinMsg(5);
		DM(1  , n-3) = BinMsg(4);
		DM(n  , 1  ) = BinMsg(3);
		DM(n-1, 1  ) = BinMsg(2);
		DM(n-2, 1  ) = BinMsg(1);
		
		k=1;
	end;
	
	
%
    % Corner case 3
    %
    % top right corner:   |4|5|
    %                       |6|
    %                       |7|
    %                       |8| 
    %
    % bottom left corner: |1|
    %                     |2|
    %                     |3|
    %
    % Placement rule
    % x == size - 2 and y == 1 and (size % 8 == 4)
    %

	if (x == (n-1)) && (y == 1) && (mod(n,8) == 4)
		DM(4  , n  ) = BinMsg(8);
		DM(3  , n  ) = BinMsg(7);
		DM(2  , n  ) = BinMsg(6);
		DM(1  , n  ) = BinMsg(5);
		DM(1  , n-1) = BinMsg(4);
		DM(n  , 1  ) = BinMsg(3);
		DM(n-1, 1  ) = BinMsg(2);
		DM(n-2, 1  ) = BinMsg(1);
		
		k=1;
	end;
	
	
%
    % Corner case 4
    %
    % top right corner: |3|4|5|
    %                   |6|7|8| 
    %
    % bottom left corner: |1|
    %
    % bottom right corner: |2|
    %
    % Regola di piazzamento
    % x == size + 5 and y == 3 and (size % 8 == 0)
    %

	if (x == (n+5)) && (y == 3) && (mod(n,8) == 0)
		DM(2 , n  ) = BinMsg(8);
		DM(2 , n-1) = BinMsg(7);
		DM(2 , n-2) = BinMsg(6);
		DM(1 , n  ) = BinMsg(5);
		DM(1 , n-1) = BinMsg(4);
		DM(1 , n-2) = BinMsg(3);
		DM(n , n  ) = BinMsg(2);
		DM(n , 1  ) = BinMsg(1);
		
		k=1;
	end;

% Standard codeword placement
%	|1|2|
%	|3|4|5|
%	|6|7|8|

	if x<=n && x>0 && y>0 && y<=n && DM(x,y)==5
		
	% Set the right position for every bit
		[x8, y8] = checkPos(x  , y  , n);
		[x7, y7] = checkPos(x  , y-1, n);
		[x6, y6] = checkPos(x  , y-2, n);
		[x5, y5] = checkPos(x-1, y  , n);
		[x4, y4] = checkPos(x-1, y-1, n);
		[x3, y3] = checkPos(x-1, y-2, n);
		[x2, y2] = checkPos(x-2, y-1, n);
		[x1, y1] = checkPos(x-2, y-2, n);
	
	% Placement of the message
		DM(x8, y8) = BinMsg(1);
		DM(x7, y7) = BinMsg(2);
		DM(x6, y6) = BinMsg(3);
		DM(x5, y5) = BinMsg(4);
		DM(x4, y4) = BinMsg(5);
		DM(x3, y3) = BinMsg(6);
		DM(x2, y2) = BinMsg(7);
		DM(x1, y1) = BinMsg(8);
		
		k=1;
	end
	
end