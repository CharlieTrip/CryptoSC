for i=1:20
	n=randi(174);
	s='';
	for j=1:n
		s(j)=char(randi([35,110]));
	end
	DataMatrix(s);
	t=readerDM('test.png');
	fprintf('Test num. %02d: ',i)
	if sum(any(s==t))
		fprintf('la codifica è corretta.\n')
	else
		fprintf('la codifica è errata.\n')
	end
end