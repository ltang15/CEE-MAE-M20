
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: hw5_p1a
% Finding roots of nonlinear equation

% Description: Find roots of two functions 1+ 0.5sin(x) -x =0 and
% using bisection method
% Input:  None
% Output: The solution and the number of iterations takes to get that
% solution
% Method: Bisection method

%Name: Linh Tang

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



clc; clear all; close all;

% Define the interval [a,b]
a = 1;
b = 2;
tol = 1e-5; % tolerance

% Calls the function biSection method
[root, numIter] = biSection(@fun1, a, b, tol);

fprintf('The solution of the equation is: %.4f. \n', root);
fprintf('The number of iteration is: %d. \n', numIter);


