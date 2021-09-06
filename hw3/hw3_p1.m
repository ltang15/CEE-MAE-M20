%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: hw3_205542275_p1
% Golden ratio

% Description: this script to calculate golden ratio using two methods

% Input:  Value for uncertainty
% Output: The golden ratio for each method. 
%         For the second mmethod: numbers the Fibonacci sequence takes to
%         get the ratio, and two numbers giving the golden ratio.
% Method: Talor series for calculating 2cos(36)
%         The ratio between two consecutive in the Fibonacci series.

%Name: Linh Tang(linhtang92@g.ucla.edu)
%UID: 205542275
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;


%% Part a: Take uncertainty input
uncertainty = -1;
% Not a negative input
while (uncertainty < 0)
    uncertainty = input('Enter an uncertainty: ');
end

%% Part b: Using Taylor series to calculate 2*cos(36)
err = 1;
rad = deg2rad(36); % Converting degree to rad
exact = 2*cos(rad); % Exact value
n = 0; % step
sum = 0; % initialize the sum

while(err >= uncertainty)
    % Using taylor series to approximate value for cos(36)
    cos = (-1)^n* rad^(2*n)/factorial(2*n);
    sum = sum + cos; % Getting the summation
    approx = 2* sum; % Approximate value for 2cos(36)
    
    %Calculating error between exact and approximate values
    err = abs(approx - exact); 
    n = n + 1; % increment the step
end


%% Part c: Fibonacci sequence
% 1.) Declare the true value of the golden ratio
actual_phi = (1 + sqrt(5))/2;
error = 1;
targetError = err; % Using the error calculated in part b
i =0; % counter

% Define first two numbers in the Fibonacci sequence
a = 0;
b = 1;

while(error >= targetError)
    
    % Creating Fibonacci sequence
    c = a;
    a = b;
    b = c + a;
    
    % Getting the ratio
    phi = a/b;
    phi = 1+ phi;
    error = abs(actual_phi - phi);
    
    % Break the loop when it finds out the ratio
    if (error < targetError)
        break;
    end
    i = i + 1;
      
end
%% Output 
fprintf ('- Part b: Goldern ratio is obtained from 2cos(36): %.12f\n', approx);
fprintf ('- Part c: Goldern ratio is obtained from Fibonacci series: %.12f\n', phi);
fprintf (' %d numbers in the Fibonacci sequence it took to achieve the ratio.\n ', i+2);
fprintf(' Two numbers in Fibonacci series giving golden ratio are %d and %d\n', a, b);











