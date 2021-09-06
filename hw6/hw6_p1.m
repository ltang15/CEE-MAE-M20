%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: hw6_205542275_p1
% Numerical Integration with Monte Carlo

% Description: - To approximate the numerical value of an integral and plot
% the result as a function of number of samples picked
%              - To count how many samples under the curve    
% Input:  None
% Output: The plot of results and the number of samples under the curve
% Method: Monte Carlo method

%Name: Linh Tang(linhtang92@g.ucla.edu)
%UID: 205542275
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;



%% Monte carlo method

N = 1000; % number of simulations

% Define the boundary of the integral
a = 0; % lower bound
b = 10; % upper bound

% function handle
fx = @(x) 1/(x^3+1);

% An array holds all the results of calculation
approx_arr = zeros(1, N);

% counter for number of samples under the curve
under = 0;

for i = 1:N
    
     % pick samples in a rectangle containing the region of the function
     %  x is from 0-10, y is from 0-1
     
     x = rand() *(b-a) + a; % generate randomly for x from 0-10
     y = rand();  % generate randomly for y from 0-1
     
     f_value = fx(x); % the y - coord of the curve with the corresponding random x
        
    % If the sample point is under the curve 
    if(y < f_value)
       under = under + 1;   
    end
    
    samples = i; % number of samples
    
    % Calculate the result based on number of samples picked
    approx = integration(fx, a, b, samples);
    
    % Update the result into the array
    approx_arr(i) = approx; 
      
end

fprintf('Number of samples under the curve is: %d .\n', under);
fprintf('The probability is: %.2f%% .\n', under/N*100);


% expected result
syms x;
f = 1/(x^3 + 1);
exp = int(f, 0, 10);

% Graph
figure(1);
p = plot(1:N, approx_arr); % plot the approx results
hold on
plot ([1, N],[exp, exp], 'r'); % plot the expected answer

xlabel ('Number of samples');
ylabel ('Results');
    

set(gcf, 'Position', [100 40 1000 600]);
set(gca, 'LineWidth', 2, 'FontSize', 15);
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on'; 
box on
legend('Approx','Expected');
saveas(p, 'hw6_p1.png');
    



function [approx] = integration(f, L, U, samples)
%inputs:
% f: the function needs to be interated
% L: lower bound
% U: Upper bound
% samples: number of samples

%outputs:
% approx: the approximate result of the integral

sum = 0;

    for k = 1: samples
        x = rand() *(U-L) + L; % random x values from 0-10
        f_value = f(x); % the value of function at that x.     
        
        sum = sum + f_value; % summation area of rectangles

    end
    approx =((U -L)/samples)*sum;   % Using rieman formula  
end
