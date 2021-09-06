%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: hw1_205542275_p4
% Oblate Spheroid

% Description: this script calculates the surface area of an oblate spheroid.
% Input:  equatorial radius andpolar radius
% Output: Exact and approximation surface area
% Method: It uses arithmetic operation and built-in function (sin, cos,
% log ...) to perform the formulas.

%Name: Linh Tang(linhtang92@g.ucla.edu)
%UID: 205542275
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all; close all;
%% Getting the input for two radius
r1 = input('Enter the value for equatorial radius (r1): ');
r2 = input('Enter the value for polar radius (r2): ');
 

%% Using given exact formula to calculate the surface area
% We have gamma = arccos(r2/r1)
gamma = acos(r2/r1);

% Define terms for the formula
sin_g = sin(gamma);
cos_g = cos(gamma);
log_term = log(cos_g/(1 - sin_g));

A_exact = 2*pi*(r1^2 + (r2^2/sin_g)* log_term);

%% Using formula A(r1,r2) = 4*pi*((r1 + r2)/2)^2 to...
% calculate the approximation value
A_approx = 4*pi*((r1 + r2)/2)^2;

%% Display the results
fprintf('==================================\n');
fprintf('The oblate spheroid with its equatorial radius is %dm and its polar radius is %dm.\n',r1, r2);
fprintf('The exact surface area of the oblate spheroid is %.2e m^2.\n',A_exact);
fprintf('The approximation surface area of the oblate spheroid is %.2e m^2.\n',A_approx);



