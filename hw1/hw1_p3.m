
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: hw1_205542275_p3
% Law of sines and cosines

% Description: this script calculates the angles of given triangle using
% the Law of Sines and Cosines
% Output: three angles and the sum of three angles.
% Method: Using the Law of Sines and Cosines

%Name: Linh Tang(linhtang92@g.ucla.edu)
%UID: 205542275
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clc; clear all; close all;
% Define side lengths
a = 10;
b = 20;
c = 25;

%% Part a: Calculate the angle alpha
% Using the Law of Cosines a^2 = b^2 + c^2 - 2*b*c*cos(alpha)
% so cos(alpha) = (b^2 + c^2 - a^2)/(2*b*c)

cos_a = (b^2 + c^2 - a^2)/(2*b*c);

% To find alpha (in radian), we use the inverse cosine

alpha = acos(cos_a);
alpha_deg = rad2deg(alpha); % Convert the angle rad to degree

fprintf ('a)alpha is %.2f degree.\n', alpha_deg);

%% Part b: Calculate the angles beta and gamma
% Using the Law of Sines: a/sin(alpha) = b/sin(beta) = c/sin(gamma)
% Comute beta and gamma using given a,b, c and the alpha we got in part a.

% Calculate sin(beta) and beta
sin_b = b*sin(alpha)/a;
beta = asin(sin_b); % Using inverse sine to get beta in rad
beta_deg = rad2deg(beta); % Convert the angle rad to degree

% Calculate sin(gamma) and gamma
sin_g = c*sin(alpha)/a;
gamma = asin(sin_g); % Using inverse sine to get gamma in rad
gamma_deg = rad2deg(gamma); % Convert the angle rad to degree

% Law of sine gives us two result: angle and 180 - angle (in degree)
% In figure 1, gamma is an obtuse angle while bot a and b are acute angles
if(gamma_deg < 90)
    final_g = 180 - gamma_deg;
end    
    
fprintf ('b)beta is %.2f degree.\n  gamma is %.2f degree.\n', beta_deg, final_g);

%% Part c: Verify sum of three angles

sum = alpha_deg + beta_deg + final_g;
fprintf('c)The sum of three angles is %.0f degree.\n', sum);






