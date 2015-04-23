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

%%return the center of the allignemts patterns
function [ result ] = get_allignment_patterns_center( v )
%TODO: edit center in case bigger then 7
switch v
    case 2
        result =struct('r',21+(v-1)*4-6,'c',18+1);
    case 3
result =struct('r',21+(v-1)*4-6,'c',22+1);
    case 4
result =struct('r',21+(v-1)*4-6,'c',26+1);
    case 5
result =struct('r',21+(v-1)*4-6,'c',30+1);
    case 6
result =struct('r',21+(v-1)*4-6,'c',34+1);
    case 7 %TODO: continue 
result =[struct('r',(21+(v-1)*4)-6,'c',38+1),struct('r',21+(v-1)*4-6,'c',21+(v-1)*4-22),...
                 struct('r',21+(v-1)*4-22,'c',21+(v-1)*4-6),struct('r',21+(v-1)*4-22,'c',21+(v-1)*4-22),struct('r',21+(v-1)*4-22,'c',6+1),...
                 struct('r',7,'c',21+(v-1)*4-22)];
    case 8
result =[struct('r',(21+(v-1)*4)-6,'c',42+1),struct('r',21+(v-1)*4-6,'c',21+(v-1)*4-24),...
                 struct('r',21+(v-1)*4-24,'c',21+(v-1)*4-6),struct('r',21+(v-1)*4-24,'c',21+(v-1)*4-24),struct('r',21+(v-1)*4-24,'c',6+1),...
                 struct('r',7,'c',21+(v-1)*4-24)];        
end

end
