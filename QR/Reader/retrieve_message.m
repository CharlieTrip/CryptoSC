function [ message ] = retrieve_message( data, version, ecl )
global version_  ecl_
ecl_ =ecl;
version_ = version;
%Decode data applying error correction code
data = decode_data(data, version, ecl);
%Convert data from byte to bit
data=de2bi(data,8,'left-msb');
dtemp=[];
for i=1:size(data,1)
    dtemp=[dtemp data(i,:)];
end
data=dtemp;

%%Retrieve mode and the character count according with table 2 and 3
mode = mat2str(data(1:4));
message ='not supported';
switch mode([2,4,6,8])
    
    case '0001'
        %mode = 'Numeric';
        if version<=9
            character_count = data(5:14);
            data = data(15:length(data));
        elseif version <=26
            character_count = data(5:16);
            data = data(17:length(data));
        else
            character_count = data(5:18);
            data = data(19:length(data));
        end
        
    case '0010'
        %mode = 'Alphanumeric';
        if version<=9
            character_count = data(5:13);
            data = data(14:length(data));
        elseif version <=26
            character_count = data(5:15);
            data = data(16:length(data));
        else
            character_count = data(5:17);
            data = data(18:length(data));
        end    
        message = retrieve_alphanumeric(data, bi2de(character_count,'left-msb'));
        
    case '0100'
        %mode = 'Byte';
        if version<=9
            character_count = data(5:12);
            data = data(13:length(data));
        else
            character_count = data(5:20);
            data = data(21:length(data));
        end
        message = retrieve_byte(data, bi2de(character_count,'left-msb'));
        
    case '1000'
        %mode = 'Kanji';
        if version<=9
            character_count = data(5:12);
            data = data(13:length(data));
        elseif version <=26
            character_count = data(5:14);
            data = data(15:length(data));
        else
            character_count = data(5:16);
            data = data(17:length(data));
        end
        
    case '0111'
        mode = 'ECI';
    case '0011'
        mode = 'Structured Append';
end

 disp('Mode:');
 disp(mode);

%numer of char in string
%character_num = mat2str(character_count);
%number of character
%character_num = bin2dec(character_num(2:2:length(character_num)));

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Byte part
function message = retrieve_byte(data,character_num)
global version_ ecl_
    message =[];
    for i=1:character_num        
        l=bi2de(data([(i-1)*8+1:i*8]),'left-msb');
        message=[message ,num2jis8(l)];
    end
    

end

%Given a byte (num between 0 and 256) return the character 
%according with JIS8 table
function [out] = num2jis8( n )
out='404';
caratters = {'NUL', 'SOH', 'STX', 'ETX', 'EOT', 'ENQ', 'ACK', 'BEL', ...
    'BS', 'HT', '\n', 'VT', 'FF', 'CR', 'SO', 'SI', 'DLE',  ...
    'DC1', 'DC2', 'DC3', 'DC4', 'NAK', 'SYN', 'ETB', 'CAN', ...
    'EM', 'SUB', 'ESC', 'FS', 'GS', 'RS', 'US', ' ', '!',  ...
    '"', '#', '$', '%', '&', 'apice', '(', ')', '*', '+',  ...
    ',', '-', '.', '/', '0', '1', '2', '3', '4', '5', '6',  ...
    '7', '8', '9', ':', ';', '<', '=', '>', '?', '@', 'A',  ...
    'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',  ...
    'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',  ...
    'X', 'Y', 'Z', '[', '¥', ']', '^', '_', '`', 'a', 'b',  ...
    'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',  ...
    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',  ...
    'y', 'z', '{', '|', '}', '', '?', 'DEL', ''};
if n==195
    out = 'è';
end
if n<=length(caratters)
    out = caratters(n+1);
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Alphanumeric part
function message = retrieve_alphanumeric(data,character_num)
    message ='';
    cn = character_num;
    if mod(character_num,2)~=0
        cn=character_num-1;
    end
    for i=1:(cn/2)        
        l1l2=bi2de(data((i-1)*11+1:i*11),'left-msb');
        l2 = mod(l1l2,45);
        l1 = (l1l2-l2)/45;
        message=[message,number_to_alphanumeric(l1),number_to_alphanumeric(l2)];
    end
    if cn<character_num
        %retrieve the last six bit if the message has odd lenght
        l1=bi2de(data((cn/2)*11+1:(cn/2)*11+6),'left-msb');
        message = [message, number_to_alphanumeric(l1)];
    end
    message = message';
end


%Convert number to letter in Alphanumeric mode
function [ letter ] = number_to_alphanumeric(num)
 CHARACTERS = ['0','1','2','3','4','5','6','7','8','9', ...
     'A','B','C','D','E','F','G','H','I','J','K',...
     'L','M','N','O','P','Q','R','S','T','U','V','W',...
     'X','Y','Z',' ','$','%','*','+','-','.','/',':','','',''];
 letter = CHARACTERS(num+1);
end

