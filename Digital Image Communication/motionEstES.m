% Computing motion vectors using exhaustive search method
% imgP : First image for which we'll find motion vectors
% imgI : Second image
% mbSize : Size of the each block
% p : no of pels 
% motionVect : the motion vectors for each integral block in imgP

function [motionVect] = motionEstES(imgP, imgI, mbSize, p)
[row, col] = size(imgI);
% init the vector and count
vectors = zeros(2, row*col/mbSize^2); 
costs = ones(2 * p + 1, 2 * p +1) * 65530007;
minM = (row * col / mbSize^2);
mbCount = 1;
% interate to calculate
for i = 1 : mbSize : row-mbSize+1
    for j = 1 : mbSize : col-mbSize+1
        
        % the exhaustive search starts here
        % we will evaluate cost for  (2p + 1) blocks vertically
        % and (2p + 1) blocks horizontaly
        % m is row(vertical) index
        % n is col(horizontal) index
        % this means we are scanning in raster order
        
        for m = -p : p        
            for n = -p : p
                refBlkVer = i + m;   % row/Vert co-ordinate for ref block
                refBlkHor = j + n;   % col/Horizontal co-ordinate
                if ( refBlkVer < 1 || refBlkVer+mbSize-1 > row ...
                        || refBlkHor < 1 || refBlkHor+mbSize-1 > col)
                    continue;
                end
                costs(m+p+1, n+p+1) = costFuncMAD(imgP(i:i+mbSize-1, j:j+mbSize-1), ...
                     imgI(refBlkVer:refBlkVer+mbSize-1, refBlkHor:refBlkHor+mbSize-1), mbSize);                                              
            end
        end
        
        % Now we find the vector where the cost is minimum        
        [dx, dy, min] = minCost(costs); % finds min value from all MAD values        
        
        vectors(1, mbCount) = dy-p-1;    % row co-ordinate 
        vectors(2, mbCount) = dx-p-1;    % col co-ordinate 
        mbCount = mbCount + 1;
        costs = ones(2*p + 1, 2*p +1) * 65537;
    end
end
%plotting motion vectors using Quiver
block_X = row/8; 
block_Y = col/8;
[x,y] = meshgrid(1:block_X, 1:block_Y);
motion_X = reshape(vectors(1,:), [block_Y, block_X]);
motion_Y = reshape(vectors(2,:), [block_Y, block_X]);
figure(1),
title('Motion Vectors')
quiver(x, y, motion_X, motion_Y);
camroll(270);
motionVect = vectors;

end  