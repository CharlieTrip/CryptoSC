qr=imread('QRCode.png');
try
qr=rgb2gray(qr);
catch
end
qr = uint8(ones(size(qr)))-qr;
qr_matrix = get_matrix_from_image(qr);
[ecl, mask_n, version]=decode_format_information(qr_matrix);

qr_matrix = release_masking(qr_matrix, mask_n);

%%%%%%%%%%%% Mettere in una funzione %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%value for pointless bit
global null;
null = -1;
side = size(qr_matrix,1);
%qr_matrix = qr_matrix*255;
%%Remove position detection pattern (i 3 quadratoni)
%remove up left
qr_matrix([1:9],[1:9]) = null;
%remove up right
qr_matrix([1:9],[side-7:side])=null;
%remove down left
qr_matrix([side-7:side], [1:9])=null;

%%remove timing patterns (le linee)
qr_matrix(7,:) = null;
qr_matrix(:,7) = null;

%%removing allignement patterns
if version >1
    centers = get_allignment_patterns_center(version);
    %if the centers are more then one TODO:add for more then 7
    for c=centers.list
        qr_matrix([side-6-2:side-6+2],[c+1-2:c+1+2]) = null;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data = retrieve_data (qr_matrix);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %Print result
% imshow(uint8(qr_matrix)*255);
% figure, imshow(qr*255);