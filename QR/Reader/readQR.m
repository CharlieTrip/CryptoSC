%Given the qr image path return the decoded message
function [message] = readQR(image_path)
global null;
null = -1;
%read image
qr=load_image(image_path);%imread(image_name);

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
%retrieve and cecode message
message = retrieve_message(data, version, ecl);
%disp(message);
%disp(version);
%join all character TODO:fix it for alphanumeric
message=strjoin(cellstr(message),'');
sprintf('%s',message(:));
end