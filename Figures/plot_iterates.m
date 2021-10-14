function [] = plot_iterates(iterates,W_1,W_2,Cost,argmin)
% Plots the iterates of the gradient-based methods along with the contour 
% of the cost surface
%   Inputs:
%   iterates    -   iterates of the gradient-based method
%   W1          -   x-coordinates of the grid points
%   W2          -   y-coordinates of grid points
%   Cost        -   cost of the respectiv grid points
%   argmin      -   grid point with the lowest cost

x_0 = iterates(:,1);
n = size(iterates,2);

line_color = [238,159,10]/255;
colormap(viridis)

hold on 
[C,h] = contourf(W_1,W_2,Cost,'white');
clabel(C,h,'Color','white')
[C,h] = contour(W_1,W_2,Cost,[2 10],'white');
clabel(C,h,'Color','white')
xlabel({'$\omega_1$'},'Interpreter','latex','FontSize',20)
ylabel({'$\omega_2$'},'Interpreter','latex','FontSize',20)

p1 = plot(iterates(1,:),iterates(2,:),'color',line_color,'LineWidth',2);
p2 = plot(x_0(1),x_0(2),'.','color',line_color,'MarkerSize',25);
p3 = plot(argmin(1),argmin(2),'.','color','red','MarkerSize',25);

label_iterates = sprintf('iterates \\theta_1,...,\\theta_{%.i}',n);
legend([p1,p2,p3],{label_iterates,'initial iterate \theta_1','minimum \theta_*'})
hold off
end