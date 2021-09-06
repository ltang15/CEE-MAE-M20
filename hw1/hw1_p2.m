
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: hw1_p2
% Sterling's approximation

% Description: this script calculates exact and approximation of factorials
% and determine the percent error between those two values
% Input:  value for the number n
% Output: Exact and approximation values for n! and relative percent
% error of the approximation.
% Method: IUsing the Sterling's approximation formula

%Name: Linh Tang

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clc; clear all; close all;

% Getting the input valur for n
n = input('Enter a value of n: ');

% Calculate factorial of n using Sterling's approxiamtion formula
% Using round(X) function to round X to the nearest integers
nf_approx = round(sqrt(2*pi*n) * (n/exp(1))^n);

% Calculate factorial of n using built in function in Matlab
nf_exact = factorial(n);


% Calculate percent of error between the exact value and approx value
error = (nf_exact - nf_approx)/nf_exact *100;


% Displaying all the results
fprintf('n! exact) %.0f\n', nf_exact);
fprintf('n! approx) %.0f\n', nf_approx);
fprintf('error: %.6f%%\n', error); % .6f to get 6 decimal places.

