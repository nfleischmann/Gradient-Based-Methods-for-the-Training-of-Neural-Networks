%% Generates Plots for Gradient-Based Methods (used throughout chapter 4)
clc
clear all
rng('default')

% Define the true relation
linear_mapping = @(x,y) x + y;

% Simulate randomized data
n = 100;
x = 4 * rand(n,1);
y = 4 * rand(n,1);
z = linear_mapping(x,y) + 1 * randn(n,1);
S = [x y z];


[W_1,W_2,Cost,argmin] = prepare_contour_plot(-2,2,0.25,3.5,S);

theta_0 = [-1.8;
            2.5];
       
%% Gradient descent (Figure 4.2)
figure(1)
grad_desc_iterates = gradient_descent(theta_0,14,S,0.1);
plot_iterates(grad_desc_iterates,W_1,W_2,Cost,argmin)
colorbar

%% Comparison Stochastic and Mini-Batch Gradient Descent Gradient Descent (Figure 4.4)
rng('default')
sgd_iterates = sgd(theta_0,99,S,0.03*ones(99,1),1);
rng('default')
mini_batch_iterates = sgd(theta_0,99,S,0.03*ones(99,1),5);

figure(2)
subplot(1,4,[1,2])
plot_iterates(sgd_iterates,W_1,W_2,Cost,argmin)
subplot(1,4,[3,4])
plot_iterates(mini_batch_iterates,W_1,W_2,Cost,argmin)


%% Stochastic Gradient Descent with different Step Sizes (Figure 4.5)
[W_1,W_2,Cost,argmin] = prepare_contour_plot(-5,5,-1,5,S);

rng('default')
slow_iterates = sgd(theta_0,99,S,0.001*ones(99,1),1);
rng('default')
fast_iterates = sgd(theta_0,99,S,0.06*ones(99,1),1);

figure(3)
subplot(1,4,[1,2])
plot_iterates(slow_iterates,W_1,W_2,Cost,argmin)
subplot(1,4,[3,4])
plot_iterates(fast_iterates,W_1,W_2,Cost,argmin)

[W_1,W_2,Cost,argmin] = prepare_contour_plot(-5,2,0,5,S);

theta_0 = [-4.5;
            3.5];
        
%% Step Size Schedules (Figure 4.6)

alpha_pw_constant = [0.03*ones(1,25)  0.03*0.5*ones(1,25)  0.03*0.5^2*ones(1,25)  0.03*0.5^3*ones(1,24)];
alpha_exponential = 0.03 * exp(-0.2* (0:98));
alpha_polynomial = 0.03 * 1./sqrt((0:98)+1);

rng('default')
pw_constant_iterates = sgd(theta_0,99,S,alpha_pw_constant,1);
rng('default')
exponential_iterates = sgd(theta_0,99,S,alpha_exponential,1);
rng('default')
polynomial_iterates = sgd(theta_0,99,S,alpha_polynomial,1);

figure(4)
subplot(3,3,1);
plot(1:99,alpha_pw_constant,'LineWidth',2)
xlabel({'k'},'Interpreter','latex','FontSize',20)
ylabel({'$\alpha_k$'},'Interpreter','latex','FontSize',20)
title('piecewise constant')

subplot(3,3,[2,3]);
plot_iterates(pw_constant_iterates,W_1,W_2,Cost,argmin)

subplot(3,3,4);
plot(1:99,alpha_exponential,'LineWidth',2)
xlabel({'k'},'Interpreter','latex','FontSize',20)
ylabel({'$\alpha_k$'},'Interpreter','latex','FontSize',20)
title('exponential decay')

subplot(3,3,[5,6]);
plot_iterates(exponential_iterates,W_1,W_2,Cost,argmin)

subplot(3,3,7);
plot(1:99,alpha_polynomial,'LineWidth',2)
xlabel({'k'},'Interpreter','latex','FontSize',20)
ylabel({'$\alpha_k$'},'Interpreter','latex','FontSize',20)
title('polynomial decay')

subplot(3,3,[8,9])
plot_iterates(polynomial_iterates,W_1,W_2,Cost,argmin)