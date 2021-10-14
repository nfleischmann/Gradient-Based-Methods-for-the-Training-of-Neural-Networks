function [x] = gradient_descent(x_0,maxIt,S,alpha)
% Performs maxIt iteration of gradient descent. 
%   Inputs:
%   x_0         -   initial iterate
%   maxIt       -   number of iterations
%   S           -   training set
%   alpha       -   step size schedule
%   Output:
%   x           -   iterates

x = zeros(2,maxIt);
x(:,1) = x_0;

for it = 1:maxIt
    x(:,it+1) = x(:,it) - alpha * gradient(x(:,it),S(:,1),S(:,2),S(:,3));
end

end

