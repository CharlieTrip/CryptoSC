%Load an image starting from a path
%given 0 to Black and 1 to white
function [ output ] = load_image(img_path)
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
     temp= uint8(fix_angle(img));    
     output = fix_orientation(temp);
end

%%Fix qr's angle
function [output] = fix_angle(qr)

I2 = ones(size(qr,1)*3,size(qr,2)*3);
%copio immagine nel quadro ampio
for i=1:size(qr,1)
    for j=1:size(qr,2)
        I2(i+size(qr,1),j+size(qr,2))=qr(i,j);
    end
end
I = I2*255;
a = get_rectangle_ceneter(I);

%cerco il centro di rotazione
%suppongo a(2,:) 
angle=0;
Center=[0,0];
angle1=(a(2,2)-a(1,2))/(a(2,1)-a(1,1));
angle2=(a(2,2)-a(3,2))/(a(2,1)-a(3,1));
if uint8(abs(rad2deg(atan(angle2)-atan(angle1)))) == 90
    angle = min(atan(angle1),atan(angle2));
    Center=a(2,:);
else
    %suppongo a(1,:)
    angle1=(a(1,2)-a(2,2))/(a(1,1)-a(2,1));
    angle2=(a(1,2)-a(3,2))/(a(1,1)-a(3,1));
    if uint8(abs(rad2deg(atan(angle2)-atan(angle1)))) == 90
            angle = min(atan(angle1),atan(angle2));
            Center=a(1,:);
    else
        angle1=(a(3,2)-a(2,2))/(a(3,1)-a(2,1));
        angle2=(a(1,2)-a(3,2))/(a(1,1)-a(3,1));
        angle = min(atan(angle1),atan(angle2));
        Center=a(3,:);
    end

end

T = @(I)rotateAround(I,a(2,1),a(2,2),rad2deg(angle));% imrotate(I,angle,'bilinear','crop');
% Apply transformation
TA = T(I);
mask = T(ones(size(I)))==1;
I(mask) = TA(mask);

%Crop the qr
Ibw = ~im2bw(I,graythresh(I)+0.2);
%imshow(I*255);
Ifill = imfill(Ibw,'holes');
Iarea = bwareaopen(Ifill,100);
Ifinal = bwlabel(Iarea);
stat = regionprops(Ifinal,'boundingbox');
xvec=[];
yvec=[];
%DEBUG
%imshow(I); hold on;
for cnt = 1 : numel(stat)
    bb = stat(cnt).BoundingBox;
    xvec = [xvec,bb(1),bb(1)+bb(3)];
    yvec = [yvec,bb(2),bb(2)+bb(4)];
    %rectangle('position',bb,'edgecolor','r','linewidth',2);
end

P1=[min(xvec),min(yvec)];
P2=[max(xvec),max(yvec)];
I=imcrop(I,[P1(1),P1(2),P2(1)-P1(1),P2(2)-P1(2)]);
output = I;
% Show image
%imshow(I);
end

%%Fix the orientation
function output =fix_orientation(I)

%Rotate part
bound = 10;
a=get_rectangle_ceneter(I);
xvec= sort([a(1,1),a(2,1),a(3,1)]);
yvec = sort([a(1,2),a(2,2),a(3,2)]);

while not(yvec(1)<= yvec(2)+10 && yvec(1)>=yvec(2)-10 && xvec(1)<= xvec(2)+10 && xvec(1)>=xvec(2)-10)
    I=imrotate(I,90);
    a=get_rectangle_ceneter(I);
    xvec= sort([a(1,1),a(2,1),a(3,1)]);
    yvec = sort([a(1,2),a(2,2),a(3,2)]);
end
output = I;
end
