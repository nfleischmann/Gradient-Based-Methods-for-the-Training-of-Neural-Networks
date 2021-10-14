function [X,Y,Z,argmin] = prepare_contour_plot(x_min,x_max,y_min,y_max,S)
% Generate a 2-dimensional grid on [x_1,x_2] x [y_1,y_2] and calculate the 
% cost for each grid point in order to prepare the contour plot
%   Inputs:
%   x_min    -   left limit of the x-axis
%   x_max    -   right limit of the x-axis
%   y_min    -   left limit of the y-axis
%   y_max    -   right limit of the y-axis
%   S        -   training set
%   Outputs:
%   X        -   x-coordinates
%   Y        -   y-coordinates
%   Z        -   cost of the respective grid points
%   argmin   -   grid point with the lowest cost

n = size(S,1);
cost = @(x,y) 1/n * sum((x*S(:,1) + y*S(:,2) - S(:,3)).^2);

x = linspace(x_min,x_max);
y = linspace(y_min,y_max);

[X,Y] = meshgrid(x,y);
Z = zeros(100);
for i = 1:n
    for j = 1:n
        Z(i,j) = cost(X(i,j),Y(i,j));
    end
end
[~,idx] = min(Z(:));
argmin = [X(idx) Y(idx)];
end