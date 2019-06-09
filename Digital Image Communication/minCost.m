% Finds the indices of the cell that holds the minimum cost
% costs : The matrix that contains the estimation costs for a block
% dx : the motion vector component in columns
% dy : the motion vector component in rows

function [dx, dy, min] = minCost(costs)

[row, col] = size(costs);

% we check whether the current
% value of costs is less then the already present value in min. If its
% inded smaller then we swap the min value with the current one and note
% the indices.

min = costs(4,4);
dx=4;
dy=4;
% Finding minimum from all 15*15 MAD values
for i = 1:7
    for j = 1:7        
        if costs(i,j) < min
            dis = sqrt((i-4)^2+(j-4)^2);
            min = costs(i,j);
            dx = j; dy = i;
        end
    end
end
end

