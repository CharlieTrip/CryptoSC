%0 is black
for i=1:22
    %read imgz 5/12
    % 20 strange 21
    %if i~=5 && i~=12 && i~=20 && i~=21
    readQR(strcat('qr_test/',mat2str(i),'.png'))   
    
   % end
end 
%  [img,map]=imread('qr_test/17.png','png');
%  %img = uint8(ones(size(img)))-uint8(img);
%  %put image in binary version if it isn't, with 0=black
%  if max(img)~=1
%      for i=1:size(img,1)
%          for j=1:size(img,2)
%              if img(i,j)>128
%                 img(i,j)= 1;
%              else
%                  img(i,j)=0;
%              end
%          end
%      end
%  end
%  readQR(img);