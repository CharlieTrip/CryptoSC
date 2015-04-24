%Load an image starting from a path
%given 0 to Black and 1 to white
function [ img ] = load_image(img_path)
    %read img
    [img,map] = imread(img_path);
    %try to convert in gray if it isn't
    try
    img=rgb2gray(img);
    catch
    end
    %read the map for checking if 0 is 0 or 1 this is strange but binry png
    %is strange too
    if length(map)>0 && map(1,1) == 1
        img = uint8(ones(size(img)))-uint8(img);
    end
     %put image in binary version if it isn't, with 0=black
     if max(img)~=1
         for i=1:size(img,1)
             for j=1:size(img,2)
                 if img(i,j)>128
                    img(i,j)= 1;
                 else
                     img(i,j)=0;
                 end
             end
         end
     end
end

