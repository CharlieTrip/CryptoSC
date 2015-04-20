%
%input: v=vettore
%
%preso in input il vettore conta 
%quante volte c'è il passaggio da 1 a 0 e vicecersa
%
%output: count=contatore
%

function [count] = contaCambi(v)

	count=1;

	for i=2:length(v)
		if (v(i)~=v(i-1)) 
			count=count+1; 
		end;
	end;

end