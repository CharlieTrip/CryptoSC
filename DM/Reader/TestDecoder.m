% Simple Decoding Test
% WIP for all the cases

n = 8;
k = 3;


disp(' a ')
disp(' Trying different errors')

codedmsg = [98 98 98 90 76 134 174 80];

disp('[98 98 98] is the correct first message : No Errors')
disp(RSDecoder( n , k , codedmsg))
disp('')

codedmsg = [98 98 98 90 52 134 174 80];
disp(' One error')

disp(RSDecoder( n , k , codedmsg))
disp('')