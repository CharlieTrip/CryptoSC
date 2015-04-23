%remainders bit
r=7; 
%remove remainders bit
data2 = data(1:length(data)-r);
%convert in byte
temp = reshape(data2,[],8);
M = reshape(bi2de(temp(:,:),'left-msb'),1,[]);
%number of block
nblock = [2];
%length of every single block
lengthb = [86]; 
if length(nblock) == 1
    blocks = reshape(data2,nblock,[]);
end

if length(nblock)==2
    blocks1=zeros(nblock(1),lengthb(1));
    blocks2=zeros(nblock(2),lengthb(2));
    M1 = M(1:nblock(1)*lengthb(1));
    M2 = M(nblock(1)*lengthb(1)+1,length(M));
end
tblock = sum(nblock);
delta = tblock - mod(length(M),tblock);
M2 = [M ones(1,delta)*-1];
