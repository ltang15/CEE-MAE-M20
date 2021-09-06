%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: hw2_p3
% Type of number

% Description: this script determine what type a 6 digit number is

% Input:  6 digit number
% Output: The number is whether symmetrical, increasing, decreasing,
% neither
% Method: Using if-else, mod() and floor () functions

%Name: Linh Tang

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;

num = input('Enter 6 digit number:');

% Input must be a number
if (mod(num,1) ~= 0)
    error('Invalid input. Enter numbers only.');
end 

% The number must contains 6 digits
s = num2str(num);
if (length(s) ~= 6)
    error('Invalid input. Enter a number with 6 digits.');
end 

%% Separating 6 digits
sixth = mod(num,10);
f1 = floor(num/10);

fifth = mod(f1,10);
f2 = floor (f1/10);

fourth = mod(f2,10);
f3 = floor (f2/10);

third = mod(f3,10);
f4 = floor (f3/10);

second = mod(f4,10);
f5 = floor(f4/10);

first = mod(f5,10);
f6 = floor(f5/10);

%% Checking the number

if(first == sixth && second == fifth && third == fourth)
    % Symmetrical
    fprintf('%d is symmetrical.\n', num);
    
elseif (first < second && second < third && third <fourth && fourth <fifth && fifth < sixth)
    % Increasing
    fprintf('%d is increasing.\n', num);
    
elseif (first > second && second > third && third > fourth && fourth > fifth && fifth > sixth)
    % Decreasing
    fprintf('%d is decreasing.\n', num);
else
    % Neither
    fprintf('%d is not either increasing or decreasing or symmetrical.\n', num);  
end    
    
    

