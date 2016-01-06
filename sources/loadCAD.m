function [F,V,C] =  loadCAD(filename)
    % CAD2MATDEMO, a demonstration of importing 3D CAD data into Matlab.
    % To get CAD data into Matlab, the process is:
    %
    % 1) Export the 3D CAD data as an ASCII STL (or Pro/E render SLP) file.
    % 2) This Matlab routine reads the CAD data
    % 3) Once read, the CAD data is rotated around a bit.
    %
    % Program has been tested with: AutoCAD, Cadkey, and Pro/Engineer.
    % Should work with most any CAD programs that can export STL.
    % 
    % Format Details:  STL is supported, and the color version of STL
    % that Pro/E exports, called 'render.'  The render (SLP) is just 
    % like STL but with color added.
    % 
    % Note: This routine has both the import function and some basic
    % manipulation for testing.  The actual reading mechanism is located
    % at the end of this file.
  
    if nargin == 0    
       warning(['No file specified']);
    else
        % Read the CAD data file:
        [F, V] = rndread(filename);
        disp(['CAD file ' filename ' data is read'])

        % Move it around.
        % To use homogenous transforms, the n by 3 Vertices will be turned to 
        % n by 4 vertices, then back to 3 for the set command.
        % Note: n by 4 needed for translations, not used here, but could, using tl(x,y,z)
        V = V';
        V = [V(1,:); V(2,:); V(3,:); ones(1,length(V))];
    end
end

function [fout, vout] = rndread(filename)
    % Reads CAD STL ASCII files, which most CAD programs can export.
    % Used to create Matlab patches of CAD 3D data.
    % Returns a vertex list and face list, for Matlab patch command.
    fid=fopen(filename, 'r'); %Open the file, assumes STL ASCII format.
    if fid == -1 
        error('File could not be opened, check name or path.')
    end

    % --- Render files take the form ---
    % The first line is object name, then comes multiple facet and vertex lines.
    % A color specifier is next, followed by those faces of that color, until
    % next color line.
    CAD_object_name = sscanf(fgetl(fid), '%*s %s');  %CAD object name, if needed. (Some STLs have it, some don't)

    vnum=0;       % Vertex number counter.
    report_num=0; % Report the status as we go.
    VColor = 1;

    while feof(fid) == 0                    % test for end of file, if not then do stuff
        tline = fgetl(fid);                 % reads a line of data from file.
        fword = sscanf(tline, '%s ');       % make the line a character string

        if strncmpi(fword, 'v',1) == 1;    % Checking if a "V"ertex line, as "V" is 1st char.
           vnum = vnum + 1;                % If a V we count the # of V's
           report_num = report_num + 1;    % Report a counter, so long files show status

           if report_num > 249;
               report_num = 0;
           end
           
           v(:,vnum) = sscanf(tline, '%*s %f %f %f'); % & if a V, get the XYZ data of it.
        end                                          
    end

    %   Build face list; The vertices are in order, so just number them.
    fnum = vnum/3;      % Number of faces, vnum is number of vertices.  STL is triangles.
    flist = 1:vnum;     % Face list of vertices, all in order.
    F = reshape(flist, 3,fnum); % Make a "3 by fnum" matrix of face list data.

    % return values
    fout = F';  % Orients the array for direct use in patch.
    vout = v';  % same here

    fclose(fid);
end