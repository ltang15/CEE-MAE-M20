%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: hw6_p2
% Implementing Customized Probability Distributions

% Description: - To creat a histogram of the customized Probability
% Distribution

% Input:  None
% Output: The histogram of the results
% Method: Monte Carlo method

%Name: Linh Tang

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clc; clear all; close all;

N = 10000; % number of simulations
x = zeros(1,N); % array holds the values of N samples

for k = 1:N
    x(k) = myRand();    

end

% Histogram
figure (1)
p = histogram(x, 'Normalization', 'pdf');
hold on

% Plot the p(x) function
fplot(@(x) -1/2*x + 1,[0 2],'r');

xlabel ('x');
ylabel ('Random sample y');

set(gcf, 'Position', [100 40 1000 600]);
set(gca, 'LineWidth', 2, 'FontSize', 15);
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on'; 
%saveas(p, 'hw6_p2.png');



function x = myRand()
% outputs:
% x: the random sample drawn from p(x)

y = rand();

% p(x)= x - (x^2/4);
% inverse = 2*(1 - x)^(1/2) + 2;

x = 2 - 2*(1 - y)^(1/2);

end
