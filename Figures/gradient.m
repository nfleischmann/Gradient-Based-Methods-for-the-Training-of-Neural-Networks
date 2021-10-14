function [g] = gradient(theta,x_1,x_2,y)
% Computes the average over the loss gradients for a set of observations 
% at theta = (w1,w2)'
%   Inputs:
%   theta       -   current parameter
%   x_1         -   first component of the input of the observations
%   x_2         -   second component of the input of the observations
%   y           -   output of the observations
%   Output:
%   g           -   average of the loss gradients

n = length(x_1);
g = zeros(2,1);
for i = 1:n
    g(1) = g(1) + 2*x_1(i)*(theta(1)*x_1(i) + theta(2)*x_2(i) - y(i));
    g(2) = g(2) + 2*x_2(i)*(theta(1)*x_1(i) + theta(2)*x_2(i) - y(i));
end
g = 1/n * g;
end
