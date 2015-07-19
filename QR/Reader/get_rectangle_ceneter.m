%Return the center of all square in the QR (use load image for load the
%image)
function [ output ] = get_rectangle_ceneter( I )
%   Detailed explanation goes here
Ibw = ~im2bw(I,graythresh(I)+0.2);
%imshow(I*255);
Ifill = imfill(Ibw,'holes');
Iarea = bwareaopen(Ifill,100);
Ifinal = bwlabel(Iarea);
stat = regionprops(Ifinal,'boundingbox');

%Ottenuti i rettangoli cerco i tre a cui sono interessato
rectN =numel(stat); %numero di rettangoli rilevati
for cnt = 1 : rectN
    bb = stat(cnt).BoundingBox;
    areas(cnt)=(bb(3)*bb(4));
end

%Trovo tre rettangoli con l'area piu' vicina
index=[1 2 3];
minA = max(areas);
for i =1:rectN-2
    for j=i+1:rectN
        for k=j+1:rectN
            set=[areas(i),areas(j),areas(k)];
            if max(set)-min(set)<minA
                minA=max(set)-min(set);
                index=[i j k];
            end
        end
    end
end
%prendo i centri
for i=1:3
    temp = stat(index(i)).BoundingBox;
    a(i,:) = [temp(1)+temp(3)/2,temp(2)+temp(4)/2,temp(3),temp(4)];
end
    output=a;
end

