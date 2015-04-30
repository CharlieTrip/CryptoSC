% 
% Corner Matrix Form
% Function to place the message into the matrix form
% in the four cases of the corners
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

function DM = CornerMatForm(DM, n, Msg, x,y)

% Convertion to binary
	BinMsg=de2bi(Msg);

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
	end;
	
end