%Given a version end ecl level return 
%   n,k of RS
%   r the number of residual bit
%   nblock the number of block
function [ car, r ] = get_version_caratteristics(version, ecl)

switch version
    
    case 1
        r =0;
        switch ecl
            case 'L'
                car = struct('nblock',1,'n',26,'k',19);
            case 'M'
                car = struct('nblock',1,'n',26,'k',16);
            case 'Q'
                car = struct('nblock',1,'n',26,'k',13);
            case 'H'
                car = struct('nblock',1,'n',26,'k',9);
        end
        
    case 2
        r = 7;
        switch ecl
            case 'L'
                car = struct('nblock',1,'n',44,'k',34);
            case 'M'
                car = struct('nblock',1,'n',44,'k',28);
            case 'Q'
                car = struct('nblock',1,'n',44,'k',22);
            case 'H'
                car = struct('nblock',1,'n',44,'k',16);
        end
        
    case 3
        r= 7;
        switch ecl
            case 'L'
                car = struct('nblock',1,'n',70,'k',55);
            case 'M'
                car = struct('nblock',1,'n',70,'k',44);
            case 'Q'
                car = struct('nblock',2,'n',35,'k',17);
            case 'H'
                car = struct('nblock',2,'n',35,'k',13);
        end
        
    case 4
        r = 7;
        switch ecl
            case 'L'
                car = struct('nblock',1,'n',100,'k',80);
            case 'M'
                car = struct('nblock',2,'n',50,'k',32);
            case 'Q'
                car = struct('nblock',2,'n',50,'k',24);
            case 'H'
                car = struct('nblock',4,'n',25,'k',9);
        end
        
    case 5
        r=7;
        switch ecl
            case 'L'
                car = struct('nblock',1,'n',134,'k',108);
            case 'M'
                car = struct('nblock',2,'n',67,'k',43);
            case 'Q'
                car = struct('nblock',[2 2],'n',[33 34],'k',[15 16]);
            case 'H'
                car = struct('nblock',[2 2],'n',[33 34],'k',[11 12]);
        end
        
    case 6
        r=7;
        switch ecl
            case 'L'
                car = struct('nblock',2,'n',86,'k',68);
            case 'M'
                car = struct('nblock',4,'n',43,'k',27);
            case 'Q'
                car = struct('nblock',4,'n',43,'k',19);
            case 'H'
                car = struct('nblock',4,'n',43,'k',15);
        end
        
    case 7
        r = 0;
        switch ecl
            case 'L'
                car = struct('nblock',2,'n',98,'k',78);
            case 'M'
                car = struct('nblock',4,'n',49,'k',31);
            case 'Q'
                car = struct('nblock',[2 4],'n',[32 33],'k',[14 15]);
            case 'H'
                car = struct('nblock',[4 1],'n',[39 40],'k',[13 14]);
        end
        
    case 8
        r = 0;
        switch ecl
            case 'L'
                car = struct('nblock',2,'n',121,'k',97);
            case 'M'
                car = struct('nblock',[2 2],'n',[60 61],'k',[38 39]);
            case 'Q'
                car = struct('nblock',[4 2],'n',[40 41],'k',[18 19]);
            case 'H'
                car = struct('nblock',[4 2],'n',[40 41],'k',[14 15]);
        end
        
    case 9
        r = 0;
        switch ecl
            case 'L'
                car = struct('nblock',2,'n',146,'k',116);
            case 'M'
                car = struct('nblock',[3 2],'n',[58 59],'k',[36 37]);
            case 'Q'
                car = struct('nblock',[4 4],'n',[36 37],'k',[16 17]);
            case 'H'
                car = struct('nblock',[4 4],'n',[36 37],'k',[12 13]);
        end
        
    case 10
        r = 0;
        switch ecl
            case 'L'
                car = struct('nblock',[2 2],'n',[86 87],'k',[68 69]);
            case 'M'
                car = struct('nblock',[4 1],'n',[69 70],'k',[43 44]);
            case 'Q'
                car = struct('nblock',[6 2],'n',[43 44],'k',[19 20]);
            case 'H'
                car = struct('nblock',[6 2],'n',[43 44],'k',[15 16]);
        end
        
    case 11
        r = 0;
        switch ecl
            case 'L'
                car = struct('nblock',4,'n',101,'k',81);
            case 'M'
                car = struct('nblock',[1 4],'n',[80 81],'k',[50 51]);
            case 'Q'
                car = struct('nblock',[4 4],'n',[50 51],'k',[22 23]);
            case 'H'
                car = struct('nblock',[3 8],'n',[36 37],'k',[12 13]);
        end
        
    case 12
        r = 0;
        switch ecl
            case 'L'
                car = struct('nblock',[2 2],'n',[116 117],'k',[92 93]);
            case 'M'
                car = struct('nblock',[6 2],'n',[58 59],'k',[36 37]);
            case 'Q'
                car = struct('nblock',[4 6],'n',[46 47],'k',[20 21]);
            case 'H'
                car = struct('nblock',[7 4],'n',[42 43],'k',[14 15]);
        end
        
    case 13
        r = 0;
        switch ecl
            case 'L'
                car = struct('nblock',4,'n',133,'k',107);
            case 'M'
                car = struct('nblock',[8 1],'n',[59 60],'k',[37 38]);
            case 'Q'
                car = struct('nblock',[8 4],'n',[44 45],'k',[20 21]);
            case 'H'
                car = struct('nblock',[12 4],'n',[33 34],'k',[11 12]);
        end
        
    case 14
        r = 3;
        switch ecl
            case 'L'
                car = struct('nblock',[3 1],'n',[145 146],'k',[115 116]);
            case 'M'
                car = struct('nblock',[4 5],'n',[64 65],'k',[40 41]);
            case 'Q'
                car = struct('nblock',[11 5],'n',[36 37],'k',[16 17]);
            case 'H'
                car = struct('nblock',[11 5],'n',[36 37],'k',[12 13]);
        end
       
    case 15
        r = 3;
        switch ecl
            case 'L'
                car = struct('nblock',[5 1],'n',[109 110],'k',[87 88]);
            case 'M'
                car = struct('nblock',[5 5],'n',[65 66],'k',[41 42]);
            case 'Q'
                car = struct('nblock',[5 7],'n',[54 55],'k',[24 25]);
            case 'H'
                car = struct('nblock',[11 7],'n',[36 37],'k',[12 13]);
        end
        
    case 16
        r = 3;
        switch ecl
            case 'L'
                car = struct('nblock',[5 1],'n',[122 123],'k',[98 99]);
            case 'M'
                car = struct('nblock',[7 3],'n',[73 74],'k',[45 46]);
            case 'Q'
                car = struct('nblock',[15 2],'n',[43 44],'k',[19 20]);
            case 'H'
                car = struct('nblock',[3 13],'n',[45 46],'k',[15 16]);
        end
        
    case 17
        r = 3;
        switch ecl
            case 'L'
                car = struct('nblock',[1 5],'n',[135 136],'k',[107 108]);
            case 'M'
                car = struct('nblock',[10 1],'n',[74 75],'k',[46 47]);
            case 'Q'
                car = struct('nblock',[1 15],'n',[50 51],'k',[22 23]);
            case 'H'
                car = struct('nblock',[2 17],'n',[42 43],'k',[14 15]);
        end
        
    case 18
        r = 3;
        switch ecl
            case 'L'
                car = struct('nblock',[5 1],'n',[150 151],'k',[120 121]);
            case 'M'
                car = struct('nblock',[9 4],'n',[69 70],'k',[43 44]);
            case 'Q'
                car = struct('nblock',[17 1],'n',[50 51],'k',[22 23]);
            case 'H'
                car = struct('nblock',[2 19],'n',[42 43],'k',[14 15]);
        end
        
    case 19
        r = 3;
        switch ecl
            case 'L'
                car = struct('nblock',[3 4],'n',[141 142],'k',[113 114]);
            case 'M'
                car = struct('nblock',[3 11],'n',[70 71],'k',[44 45]);
            case 'Q'
                car = struct('nblock',[17 4],'n',[47 48],'k',[21 22]);
            case 'H'
                car = struct('nblock',[9 16],'n',[39 40],'k',[13 14]);
        end
        
    case 20
        r = 3;
        switch ecl
            case 'L'
                car = struct('nblock',[3 5],'n',[135 136],'k',[107 108]);
            case 'M'
                car = struct('nblock',[3 13],'n',[67 68],'k',[41 42]);
            case 'Q'
                car = struct('nblock',[15 5],'n',[54 55],'k',[24 25]);
            case 'H'
                car = struct('nblock',[15 10],'n',[43 44],'k',[15 16]);
        end
        
   case 21
        r = 4;
        switch ecl
            case 'L'
                car = struct('nblock',[4 4],'n',[144 145],'k',[116 117]);
            case 'M'
                car = struct('nblock',17,'n', 68,'k',42);
            case 'Q'
                car = struct('nblock',[17 6],'n',[50 51],'k',[22 23]);
            case 'H'
                car = struct('nblock',[19 6],'n',[46 47],'k',[16 17]);
        
        end

case 22
        r = 4;
        switch ecl
            case 'L'
                car = struct('nblock',[2 7],'n',[139 140],'k',[111 112]);
            case 'M'
                car = struct('nblock',17,'n', 74,'k',46);
            case 'Q'
                car = struct('nblock',[7 16],'n',[54 55],'k',[24 25]);
            case 'H'
                car = struct('nblock',34,'n',37,'k',13);
        
        end
        
    case 23
        r = 4;
        switch ecl
            case 'L'
                car = struct('nblock',[4 5],'n',[151 152],'k',[121 122]);
            case 'M'
                car = struct('nblock',[4 14],'n', [75 76],'k',[47 48]);
            case 'Q'
                car = struct('nblock',[11 14],'n',[54 55],'k',[24 25]);
            case 'H'
                car = struct('nblock',[16 14],'n',[45 46],'k',[15 16]);
                
        end
    case 24
        r = 4;
        switch ecl
            case 'L'
                car = struct('nblock',[6 4],'n',[147 148],'k',[117 118]);
            case 'M'
                car = struct('nblock',[6 14],'n', [73 74],'k',[45 46]);
            case 'Q'
                car = struct('nblock',[11 16],'n',[54 55],'k',[24 25]);
            case 'H'
                car = struct('nblock',[30 2],'n',[46 47],'k',[16 17]);
                
        end
case 25
        r = 4;
        switch ecl
            case 'L'
                car = struct('nblock',[8 4],'n',[132 133],'k',[106 107]);
            case 'M'
                car = struct('nblock',[8 13],'n', [75 76],'k',[47 48]);
            case 'Q'
                car = struct('nblock',[7 22],'n',[54 55],'k',[24 25]);
            case 'H'
                car = struct('nblock',[22 13],'n',[45 46],'k',[15 16]);
        
        end      
        
    case 26
        r = 4;
        switch ecl
            case 'L'
                car = struct('nblock',[10 2],'n',[142 143],'k',[114 115]);
            case 'M'
                car = struct('nblock',[19 4],'n', [74 75],'k',[46 47]);
            case 'Q'
                car = struct('nblock',[28 6],'n',[50 51],'k',[22 23]);
            case 'H'
                car = struct('nblock',[33 4],'n',[46 47],'k',[16 17]);
                
        end
        
    case 27
        r = 4;
        switch ecl
            case 'L'
                car = struct('nblock',[8 4],'n',[152 153],'k',[122 123]);
            case 'M'
                car = struct('nblock',[22 3],'n', [73 74],'k',[45 46]);
            case 'Q'
                car = struct('nblock',[8 26],'n',[53 54],'k',[23 24]);
            case 'H'
                car = struct('nblock',[12 28],'n',[45 46],'k',[15 16]);
                
        end
    case 28
        r = 3;
        switch ecl
            case 'L'
                car = struct('nblock',[3 10],'n',[147 148],'k',[117 118]);
            case 'M'
                car = struct('nblock',[3 23],'n', [73 74],'k',[45 46]);
            case 'Q'
                car = struct('nblock',[4 31],'n',[54 55],'k',[24 25]);
            case 'H'
                car = struct('nblock',[11 31],'n',[45 46],'k',[15 16]);
                
        end   
    case 29
        r = 3;
        switch ecl
            case 'L'
                car = struct('nblock',[7 7],'n',[146 147],'k',[116 117]);
            case 'M'
                car = struct('nblock',[21 7],'n', [73 74],'k',[45 46]);
            case 'Q'
                car = struct('nblock',[1 37],'n',[53 54],'k',[23 24]);
            case 'H'
                car = struct('nblock',[19 26],'n',[45 46],'k',[15 16]);
                
        end
    case 30
        r = 3;
        switch ecl
            case 'L'
                car = struct('nblock',[5 10],'n',[145 146],'k',[115 116]);
            case 'M'
                car = struct('nblock',[19 10],'n', [75 76],'k',[47 48]);
            case 'Q'
                car = struct('nblock',[15 25],'n',[54 55],'k',[24 25]);
            case 'H'
                car = struct('nblock',[23 25],'n',[45 46],'k',[15 16]);
                
        end
   case 31
        r = 3;
        switch ecl
            case 'L'
                car = struct('nblock',[13 3],'n',[145 146],'k',[115 116]);
            case 'M'
                car = struct('nblock',[2 29],'n', [74 75],'k',[46 47]);
            case 'Q'
                car = struct('nblock',[42 1],'n',[54 55],'k',[24 25]);
            case 'H'
                car = struct('nblock',[23 28],'n',[45 46],'k',[15 16]);
                
        end
        
   case 32
        r = 3;
        switch ecl
            case 'L'
                car = struct('nblock',17,'n',145,'k',115);
            case 'M'
                car = struct('nblock',[10 23],'n', [74 75],'k',[46 47]);
            case 'Q'
                car = struct('nblock',[10 35],'n',[54 55],'k',[24 25]);
            case 'H'
                car = struct('nblock',[19 35],'n',[45 46],'k',[15 16]);
                
        end
    case 33
        r = 3;
        switch ecl
            case 'L'
                car = struct('nblock',[17 1],'n',[145 146],'k',[115 116]);
            case 'M'
                car = struct('nblock',[14 21],'n', [74 75],'k',[46 47]);
            case 'Q'
                car = struct('nblock',[29 19],'n',[54 55],'k',[24 25]);
            case 'H'
                car = struct('nblock',[11 46],'n',[45 46],'k',[15 16]);
                
        end
    case 34
        r = 3;
        switch ecl
            case 'L'
                car = struct('nblock',[13 6],'n',[145 146],'k',[115 116]);
            case 'M'
                car = struct('nblock',[14 23],'n', [74 75],'k',[46 47]);
            case 'Q'
                car = struct('nblock',[44 7],'n',[54 55],'k',[24 25]);
            case 'H'
                car = struct('nblock',[59 1],'n',[46 47],'k',[16 17]);
                
        end
      case 35
        r = 0;
        switch ecl
            case 'L'
                car = struct('nblock',[12 7],'n',[151 152],'k',[121 122]);
            case 'M'
                car = struct('nblock',[12 26],'n', [75 76],'k',[47 48]);
            case 'Q'
                car = struct('nblock',[39 14],'n',[54 55],'k',[24 25]);
            case 'H'
                car = struct('nblock',[22 41],'n',[45 46],'k',[15 16]);
                
        end
    case 36
        r = 0;
        switch ecl
            case 'L'
                car = struct('nblock',[6 14],'n',[151 152],'k',[121 122]);
            case 'M'
                car = struct('nblock',[6 34],'n', [75 76],'k',[47 48]);
            case 'Q'
                car = struct('nblock',[46 10],'n',[54 55],'k',[24 25]);
            case 'H'
                car = struct('nblock',[2 64],'n',[45 46],'k',[15 16]);
                
        end
    case 37
        r = 0;
        switch ecl
            case 'L'
                car = struct('nblock',[17 4],'n',[152 153],'k',[122 123]);
            case 'M'
                car = struct('nblock',[29 14],'n', [74 75],'k',[46 47]);
            case 'Q'
                car = struct('nblock',[49 10],'n',[54 55],'k',[24 25]);
            case 'H'
                car = struct('nblock',[24 46],'n',[45 46],'k',[15 16]);
                
        end
        
    case 38
        r = 0;
        switch ecl
            case 'L'
                car = struct('nblock',[4 18],'n',[152 153],'k',[122 123]);
            case 'M'
                car = struct('nblock',[13 32],'n', [74 75],'k',[46 47]);
            case 'Q'
                car = struct('nblock',[48 14],'n',[54 55],'k',[24 25]);
            case 'H'
                car = struct('nblock',[42 32],'n',[45 46],'k',[15 16]);
        end
        
    case 39
        r = 0;
        switch ecl
            case 'L'
                car = struct('nblock',[20 4],'n',[147 148],'k',[117 118]);
            case 'M'
                car = struct('nblock',[40 7],'n', [75 76],'k',[47 48]);
            case 'Q'
                car = struct('nblock',[43 22],'n',[54 55],'k',[24 25]);
            case 'H'
                car = struct('nblock',[10 67],'n',[45 46],'k',[15 16]);
        end
  
    case 40
        r = 0;
        switch ecl
            case 'L'
                car = struct('nblock',[19 6],'n',[148 149],'k',[118 119]);
            case 'M'
                car = struct('nblock',[18 31],'n', [75 76],'k',[47 48]);
            case 'Q'
                car = struct('nblock',[34 34],'n',[54 55],'k',[24 25]);
            case 'H'
                car = struct('nblock',[20 61],'n',[45 46],'k',[15 16]);
        end
        
end
end



