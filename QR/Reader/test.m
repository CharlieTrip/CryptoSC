global null;
null = -1;
%read image
qr=imread('qr_test/HELLO WORLD.png');
%try to convert in gray if it isn't
try
qr=rgb2gray(qr);
catch
end
%invert ones with zeros
qr = uint8(ones(size(qr)))-qr;
%extract matrix from image
qr_matrix = get_matrix_from_image(qr);
%retrieve and decode format information
[ecl, mask_n, version]=decode_format_information(qr_matrix);
%apply mask
qr_matrix = release_masking(qr_matrix, mask_n);
%remove allignments bits
qr_matrix =remove_allignments_bits(qr_matrix, version);
%retrieve data
data = retrieve_data (qr_matrix);
%retrieve message
message = retrieve_message(data, version, ecl);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %Print result
% imshow(uint8(qr_matrix)*255);
% figure, imshow(qr*255);