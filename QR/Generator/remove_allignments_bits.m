%%Remove the various finder puttin the null value
function [ qr_matrix ] = remove_allignments_bits( qr_matrix, version)
%value for pointless bit
global null;
null = -1;
side = size(qr_matrix,1);
%qr_matrix = qr_matrix*255;
%%Remove position detection pattern (i 3 quadratoni)
%remove up left
qr_matrix(1:9,1:9) = null;
%remove up right
qr_matrix(1:9,side-10:side)=null;
%remove down left
qr_matrix(side-10:side, 1:9)=null;

%%remove timing patterns (le linee)
qr_matrix(7,:) = null;
qr_matrix(:,7) = null;

%%removing allignement patterns
%TODO:modify for center x,y
if version >1
    centers = get_allignment_patterns_center(version);
    %if the centers are more then one 
    
    for c=centers
        qr_matrix(c.r-2:c.r+2,c.c-2:c.c+2) = null;
    end
end
end

