%%Recognize Black\White Modules
function [ qr_matrix ] = get_matrix_from_image( image_qr )
    image_qr = uint8(ones(size(image_qr)))-uint8(image_qr);
    image_qr = crop_QR(image_qr); 
    qr_matrix = image_to_matrix(image_qr);
end

%%Crop the image after the right orientation
function [ cropped_image ] = crop_QR( qr )

lux =1;
luy=1;
while qr(lux,luy)>0 %TODO: add and finish of image
lux=lux+1;
if lux > size(qr,1)
lux = 1;
luy = luy+1;
end
end

%Looking for right up corner
rux=size(qr,1);
ruy=1;
while qr(rux,ruy)>0 %TODO: add and finish of image
rux=rux-1;
if rux == 1
rux = size(qr,1);
ruy = ruy+1;
end
end

%Looking for lef down corner
ldx=1;
ldy=size(qr,2);
while qr(ldx,ldy)>0 %TODO: add and finish of image
ldx=ldx+1;
if ldx == size(qr,1)
ldx = 1;
ldy = ldy-1;
end
end

cropped_image = imcrop(qr,[lux,luy, rux-lux,ldy-ruy]);
end

%Given a cropped image return the matrix
function [ qr_matrix ] = image_to_matrix( qr )

tx=1;
ty=1;

while qr(tx,ty)==0
    tx=tx+1;
end
%total number of modulo in the side
tn = floor(size(qr,1)/((tx-1)/7));
%is incredible but the resize works very nice 
qr_matrix = ones([tn tn])-double(imresize(qr,[tn tn]));
%modulo length
% ml=idivide(uint8(tx-1),7);
% 
% tx = ml;
% ty = ml;w
% 
% qr_matrix = ones(uint8(size(qr))/ml);
% 
% for tx=ml:ml:size(qr,1)
%     for ty=ml:ml:size(qr,2)
%         %mean of modulo for get the color
%         modulo_color=mean2(qr([tx-ml+1:tx],[ty-ml+1:ty]));
%         qr_matrix(tx/ml,ty/ml)=qr_matrix(tx/ml,ty/ml)-modulo_color;
%     end
% end

end
