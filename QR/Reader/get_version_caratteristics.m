function [ car ] = get_version_caratteristics(version, ecl)

switch version
    
    case 1
        switch ecl
            case 'L'
                car = struct('nblock',1);
            case 'M'
                car = struct('nblock',1);
            case 'Q'
                car = struct('nblock',1);
            case 'H'
                car = struct('nblock',2);
        end
        
    case 2
        switch ecl
            case 'L'
                car = struct('nblock',1, 'pol',...
                    retrieve_poly_by_ncc(10),'n',44,'k',34);
            case 'M'
                car = struct('nblock',1);
            case 'Q'
                car = struct('nblock',1);
            case 'H'
                car = struct('nblock',2);
        end
        
    case 3
        switch ecl
            case 'L'
                car = struct('nblock',1);
            case 'M'
                car = struct('nblock',1);
            case 'Q'
                car = struct('nblock',2,'pol',...
                    retrieve_poly_by_ncc(18),'n',53,'k',17);
            case 'H'
                car = struct('nblock',2);
        end
        
    case 4
        switch ecl
            case 'L'
                car = struct('nblock',1);
            case 'M'
                car = struct('nblock',2);
            case 'Q'
                car = struct('nblock',2);
            case 'H'
                car = struct('nblock',4);
        end
        
    case 5
        switch ecl
            case 'L'
                car = struct('nblock',1);
            case 'M'
                car = struct('nblock',2);
            case 'Q'
                car = struct('nblock',[2 2]);
            case 'H'
                car = struct('nblock',[2 2]);
        end
        
    case 6
        switch ecl
            case 'L'
                car = struct('nblock',2);
            case 'M'
                car = struct('nblock',4);
            case 'Q'
                car = struct('nblock',4);
            case 'H'
                car = struct('nblock',4);
        end
        
    case 7
        switch ecl
            case 'L'
                car = struct('nblock',2);
            case 'M'
                car = struct('nblock',4);
            case 'Q'
                car = struct('nblock',[2 4]);
            case 'H'
                car = struct('nblock',[4 1]);
        end
        %TODO: add the rest
end

end

