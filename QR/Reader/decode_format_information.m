function [ecl, mask_n, version ] = decode_format_information(qr_matrix )
%retrieve format information from qr matrix
[format_information_h, format_information_v] = retrieve_format_information(qr_matrix);

%try to decode the format information
[decoded_format,err_num]=bchdec(gf(format_information_v),15,5);
if err_num == -1
    [decoded_format,err_num]=bchdec(gf(format_information_h),15,5);
    if err_num == -1
        assert(false,'Decoding information is not possible');
    end
end

%convert to string (GF breack ball)
df_str = mat2str(decoded_format([1,2]));

%get error correction level
switch df_str([1:5])
    case '[0 1]'
        ecl = 'L';
    case '[0 0]'
        ecl = 'M';
    case '[1 1]'
        ecl = 'Q';
    case '[1 0]'
        ecl = 'H';
end

%get mask
mask_n = mat2str(decoded_format([3:5]));
mask_n = mask_n([2,4,6]);
%calculate version
version = (size(qr_matrix,1)-21)/4+1;
end

function [format_information_h, format_information_v] = retrieve_format_information(qr_matrix)
%Format information mask
mask = uint8([1 0 1 0 1 0 0 0 0 0 1 0 0 1 0]);

%Retrieve format information horizontal
f1 = horzcat(qr_matrix(9, [1:6]), qr_matrix(9,8));
f2 = qr_matrix(9, [size(qr_matrix,1)-7:size(qr_matrix,1)]);
format_information_h = uint8(horzcat(f1,f2));
format_information_h = bitxor(mask,format_information_h);

%Retrieve format information vertical
f1 = horzcat(qr_matrix([1:6],9)', qr_matrix([8,9],9)');
f2 = qr_matrix([size(qr_matrix,2)-6:size(qr_matrix,2)],9);
format_information_v = uint8(fliplr(horzcat(f1,f2')));
format_information_v = bitxor(mask,format_information_v);
end