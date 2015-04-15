qr=imread('QRCode.png');
qr = crop_QR(qr);

tx=1;
ty=1;

while qr(tx,ty)==0
    tx=tx+1;
end
%modulo length
ml=(tx-1)/7;

tx = ml;
ty = ml;

qr_matrix = ones(size(qr)/ml);

for tx=ml:ml:size(qr,1)
    for ty=ml:ml:size(qr,2)
        %mean of modulo for get the color
        modulo_color=mean2(qr([tx-ml+1:tx],[ty-ml+1:ty]));
        qr_matrix(tx/ml,ty/ml)=qr_matrix(tx/ml,ty/ml)-modulo_color;
    end
end

        