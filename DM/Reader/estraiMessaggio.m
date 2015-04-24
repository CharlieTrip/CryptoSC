% 
% estraiMessaggio 
% Toglie il padding da un messaggio, se presente
%
% Input
% 	msgPadded	: Messaggio con possibile pad
% 
% Output
%	msg 		: messaggio senza padding
% 

function msg = estraiMessaggio (msgPadded)

	% Lunghezza del messaggio

	n = length(msgPadded);

	
	% Estraggo l'indice del primo 129 presente nella stringa

	indice = n + 1;

	for i=n:-1:1
		if msgPadded(i) == 129
			indice = i;
		end
	end


	% Estrai sottolista fino all'indice segnato
	
	msg = msgPadded(1:(indice - 1));

end