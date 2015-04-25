%ecl 'L', 'M', 'Q', 'H'
function [mode, version] = find_mode_version( msg, ecl )

msg_ASCII = double(msg); %convert message to ascii

M =max(msg_ASCII); %tage max and min
m = min(msg_ASCII);
%numeric mode the ascii value is between 30, 39 in HEX
if m>=48 && M<=57
%mode is numeric
    mode = [0 0 0 1];
    
%alphanumeric mode, the ascii value is between 41, 5A HEX
elseif m>=32 && M<=90 && m>=48 
    mode = [0 0 1 0];
else
    %byte mode
    mode = [0 1 0 0];
end




version = retrieve_version(length(msg), mode, ecl);
end







function version=retrieve_version(length, mode, ecl)



        % numeric
        if mode == [0,0,0,1]          
            switch ecl
                
                case 'L'
                
                    Data_capacity = [41 77 127 187 255 322 370 461 552 652 772 883 1022 1101 1250 1408 1548 1725 1903 2061 2232 2409 2620 2812 3057 3283 3517 3669 3909 4158 4417 4686 4965 5253 5529 5836 6153 6479 6743 7089]; 
                    version = 1;
                    while length >= Data_capacity(version)
                        version = version+1;
                    end
                    
                    
                case 'M'
                    
                    Data_capacity = [34 63 101 149 202 255 293 365 432 513 604 691 796 871 991 1082 1212 1346 1500 1600 1708 1872 2059 2188 2395 2544 2701 2857 3035 3289 3486 3693 3909 4134 4343 4588 4775 5039 5313 5596]
                    version = 1;
                    while length >= Data_capacity(version)
                        version = version+1;
                    end
                    
                case 'Q'
                    
                    Data_capacity = [27 48 77 111 144 178 207 259 312 364 427 489 580 621 703 775 876 948 1063 1159 1224 1358 1468 1588 1718 1804 1933 2085 2181 2358 2473 2670 2805 2949 3081 3244 3417 3599 3791 3993]
                    version = 1;
                    while length >= Data_capacity(version)
                        version = version+1;
                    end
                    

                case 'H'
                    
                    Data_capacity = [17 34 58 82 106 139 145 202 235 288 331 374 427 468 530 602 674 746 813 919 969 1056 1108 1228 1286 1425 1501 1581 1677 1782 1897 2022 2157 2301 2361 2524 2625 2735 2927 3057];
                    version = 1;
                    while length >= Data_capacity(version)
                        version = version+1;
                    end
                    
                    
                    
            end
            
            
            
            % alphanumeric
        elseif mode == [0,0,1,0]          
            switch ecl        
             case 'L'
                
                    Data_capacity = [25 47 77 114 154 195 224 279 335 395 468 535 619 667 758 854 938 1046 1153 1249 1352 1460 1588 1704 1853 1990 2132 2223 2369 2520 2677 2840 3009 3183 3351 3537 3729 3927 4087 4296];
                    version = 1;
                    while length >= Data_capacity(version)
                        version = version+1;
                    end
                    
                    
                case 'M'
                    
                    Data_capacity =  [20 38 61 90 122 154 178 221 262 311 366 419 483 528 600 656 734 816 909 970 1035 1134 1248 1326 1451 1542 1637 1732 1839 1994 2113 2238 2369 2506 2632 2780 2894 3054 3220 3391];
                     version = 1;     
                    while length >= Data_capacity(version)
                        version = version+1;
                    end
                    
                case 'Q'
                    
                    Data_capacity = [16 29 47 67 87 108 125 157 189 221 259 296 352 376 426 470 531 574 644 702 742 823 890 963 1041 1094 1172 1263 1322 1429 1499 1618 1700 1787 1867 1966 2071 2181 2298 2420];
                    version = 1;
                    while length >= Data_capacity(version)
                        version = version+1;
                    end
                    

                case 'H'
                    
                    Data_capacity = [10 20 35 50 64 84 93 122 143 174 200 227 259 283 321 365 408 452 493 557 587 640 672 744 779 864 910 958 1016 1080 1150 1226 1307 1394 1431 1530 1591 1658 1774 1852];
                    version = 1;
                    while length >= Data_capacity(version)
                        version = version+1;
                    end
                    
                    
                    
            end
            
            
            
            % byte mode
       % elseif mode == [0,1,0,0]          
       %     switch ecl  
                
      %          case 'L'
                
                    
      %          case 'M'
                    
                    
     %           case 'Q'
                    
                    
     %           case 'H'
                    
    %         end
        end
            
end