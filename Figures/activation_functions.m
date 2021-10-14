%% Plots of the most common activation functions (used in Table 2.1)

sigmoid = @(z) 1./(1 + exp(-z));
ReLU = @(z) (z >= 0) .* z;
leaky_ReLU = @(z) max(z, 0.1 * z);

z = linspace(-4,4);

figure(1)
plot(z,sigmoid(z),'b','LineWidth',3)
yline(0,'k')
xline(0,'k')
ylim([-0.125, 1])
yticks([-0.1, 0, 0.5, 1])
xticks([-4,-2,0,2,4])
set(gca,'FontSize',15)
xlabel('z','FontSize',20)
ylabel('\sigma(z)','FontSize',20)

figure(2)
plot(z,ReLU(z),'b','LineWidth',3)
yline(0,'k')
xline(0,'k')
ylim([-0.5, 4])
yticks([-0.5, 0, 2, 4])
xticks([-4,-2,0,2,4])
set(gca,'FontSize',15)
xlabel('z','FontSize',20)
ylabel('\sigma(z)','FontSize',20)

figure(3)
xline(0,'k')
plot(z,leaky_ReLU(z),'b','LineWidth',3)
yline(0,'k')
xline(0,'k')
ylim([-0.5, 4])
yticks([-0.5, 0, 2, 4])
xticks([-4,-2,0,2,4])
set(gca,'FontSize',15)
xlabel('z','FontSize',20)
ylabel('\sigma(z)','FontSize',20)
