function [Y,U,V]=yuv_import(filename, dims, numfrm, startfrm)

fid=fopen(filename,'r');

Yd = zeros(dims(1),dims(2));
UVd = zeros(dims(1)/2,dims(2)/2);

frelem = numel(Yd) + 2*numel(UVd);
fseek(fid, startfrm * frelem , 0);
Y = cell(1,numfrm);
U = cell(1,numfrm);
V = cell(1,numfrm);

for i=1:numfrm
    Yd = fread(fid,[dims(1) dims(2)],'uint8');
    Y{i} = Yd;
    UVd = fread(fid,[dims(1)/2 dims(2)/2],'uint8');
    U{i} = UVd;
    UVd = fread(fid,[dims(1)/2 dims(2)/2],'uint8');
    V{i} = UVd;    
end

end