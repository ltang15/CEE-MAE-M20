

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: hw5_p1b
% Finding roots of nonlinear equation

% Description: Find roots of two functions 1+ 0.5sin(x) -x =0 and
% 3+ 2sin(x) -x =0 using fixed-point iteration method
% Input:  None
% Output: xStar and xRoot, the graph
% Method: Fixed point iteration method

%Name: Linh Tang

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all; close all;

%% Part ii
x0= 0; % first initial guess
tol = 1e-5; % tolerance
maxIter = 100; % maximum number of iterations

[xStar1, xRoot1] = fixPoint(@fun2, x0, tol, maxIter);
fprintf('Part ii: Fixed point method for equation: 1 + 0.5sin(x) - x =0 \n');
fprintf('Initial guess = 0.\n');
fprintf ('- xRoot is: %.5f. \n', xRoot1);
fprintf ('- xStar is: %.5f. \n\n', xStar1);



%% Part iii
guess = 3; %second initial guess

hx = @(x) 3 + 2*sin(x); % function handle for the second function

fprintf('Part iii: Fixed point method for equation: 3 + 2sin(x) - x =0 \n');
fprintf('1) Initial guess = 3.\n');
[xStar2, xRoot2] = fixPoint(hx, guess, tol, maxIter);

fprintf ('- xRoot is: %.5f. \n', xRoot2);
fprintf ('- xStar is: %.5f. \n\n', xStar2);

fprintf('2) Initial guess = 0.\n');
[xStar3, xRoot3] = fixPoint(hx, x0, tol, maxIter);

fprintf ('xRoot is: %.5f. \n', xRoot3);
fprintf ('xStar is: %.5f. \n', xStar3);

%% Graph
N =100;
x = linspace(0,10,N);
y = zeros(N,1);
g = zeros(N,1);
h = zeros(N,1);


for k= 1:N
    y(k) = x(k);
    g(k) = fun2(x(k));
    h(k) = hx(x(k));
    
end

figure(1)
p = plot(x,y,'b',x,g,'r',x,h,'g');
set(p, 'LineWidth', 2);
set(gcf, 'Position', [100 40 1000 600]);
set(gca, 'LineWidth', 2, 'FontSize', 15);
xticks(0:1:10);
yticks(0:1:10);
legend('y = x','g(x) = 1 + 0.5sin(x)','h(x) = 3 + 2sin(x)');
xlabel ('Domain');
ylabel ('Range');
box on
grid on


saveas(gcf, 'hw5.png');









