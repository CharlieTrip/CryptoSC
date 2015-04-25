function poli = polinom(input)

for i = 1:length(input)
    
    if input(i) =='x'
        input(i:i+3) = ' ';
    end
    
    if input(i) == 'a'
        input(i:i+1) = 'a^';
    end
    
    if input(i) == '+'
        input(i) = ' ';
    end
    
    
    
end


poli = cat(2,'[1 ',input,']');

%for i = 1:length(poli)
%    if not(poli(i) == ' ')
%        poli(i+1) = ',';
%    end
%end

%for i = 1:length(poli)
%    if poli(i) == ' '
%        poli(i) = '';
%    end
%end



end