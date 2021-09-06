
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: hw1_205542275_p1
% String manipulation

% Description: this script gets the input and then print out a greeting.
% Input:  name and UID
% Output: a greeting with the input name and UID backwards
% Method: Using if-else to check validity and Matlab functions to get input
% and display strings.

%Name: Linh Tang

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;

%% Getting the input

% Using upper function to capitalize all characters for name
get_name = upper(input('Enter your name: ', 's'));
% Using fliplr to reverse a string for UID
get_uid = fliplr(input('Enter your UID: ', 's'));


%% Check the validity for UID. UID requires user to input 9 numbers
if (isnan(str2double(get_uid)))
    error ('Invalid input. Only numbers for UID.');
elseif (length(get_uid) ~= 9)
    error ('Invalid input. Enter 9 numbers for UID.');
    
end   

%% Displaying the greeting
fprintf('Hello %s, your UID backwards is %s.\n', get_name, get_uid);

