function [x] = sgd(x_0,maxIt,S,alpha,batch_size)
% Performs maxIt iteration of stochastic or mini-batch gradient descent. 
%   Inputs:
%   x_0         -   initial iterate
%   maxIt       -   number of iterations
%   S           -   training set
%   alpha       -   step size schedule
%   batch_size  -   batch-size (= 1 for stochastic gradient descent)
%   Output:
%   x           -   iterates

n = size(S,1);
x = zeros(2,maxIt);
x(:,1) = x_0;
for it = 1:maxIt
    j = randi(n, batch_size);
    x(:,it+1) = x(:,it) - alpha(it) * gradient(x(:,it),S(j,1),S(j,2),S(j,3));
end
end
