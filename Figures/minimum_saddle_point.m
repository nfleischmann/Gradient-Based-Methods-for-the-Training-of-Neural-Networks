z_1 = @(x,y) x.^2 + y.^2;
z_2 = @(x,y) x.^2 - y.^2;

x = linspace(-1,1,20);
y = linspace(-1,1,20);

[X,Y] = meshgrid(x,y);

Z_1 = z_1(X,Y);
Z_2 = z_2(X,Y);

point = [0 0 0];

subplot(1,2,1)
colormap(viridis)
surfc(X,Y,Z_1)
hold on
plot3(0,0,-0.02,'.','color','red','MarkerSize',30)
xlabel({'$x_1$'},'Interpreter','latex','FontSize',20)
ylabel({'$x_2$'},'Interpreter','latex','FontSize',20)
zlabel({'$f(x)$'},'Interpreter','latex','FontSize',20)
hold off

subplot(1,2,2)
colormap(viridis)
surfc(X,Y,Z_2)
hold on
plot3(0,0,0.02,'.','color','red','MarkerSize',30)
xlabel({'$x_1$'},'Interpreter','latex','FontSize',20)
ylabel({'$x_2$'},'Interpreter','latex','FontSize',20)
zlabel({'$f(x)$'},'Interpreter','latex','FontSize',20)
hold off
