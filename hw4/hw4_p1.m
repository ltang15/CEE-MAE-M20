
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: hw4_p1
% LC circuit problem: explicit Euler

% Description: this script simulate the current i(t) in the LC circuit.

% Input:  None
% Output: i(t) plot and the frequency
% Method: Explicit Euler

%Name: Linh Tang

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all; close all;

% contants
L = 1;
C = 0.1;
dt = 0.01;
ti = 0;
tf = 20;

% Method:
% a = di/dt
% f = da/dt + 1/(L*C) * i(t) = 0

% Initial conditions
i_0 = 1;
a_0 = 0; % a = di/dt

% Set up array
t = ti:dt:tf; % time array
N = numel(t); % number of elements in time array

i = zeros(N, 1);
a = zeros(N,1);

i(1) = i_0;
a(1) = a_0;



for k = 1:N-1
    
    % the discretized governing equations
    a(k+1) = a(k) - (1/(L*C))*i(k)*dt;
    i(k+1) = i(k) + a(k)*dt;
end

% Plotting
figure(1)
p = plot(t, i, 'b');

xlabel ('time (s)');
ylabel ('Current (A)');
title ('LC Circuit: i(t) [Explicit Euler]');
xlim ([ti tf]);
ylim ([1.1*min(i) 1.1*max(i)]);
set(p, 'LineWidth', 2);
set(gcf, 'Position', [100 40 1000 600]);
set(gca, 'LineWidth', 2, 'FontSize', 15);
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on'; 

% Getting datatip of two adjacent peaks
datatip(p, 8, 1.5);
datatip(p, 10, 1.7);


% Calculating the frequency
freq = 1/abs(9.95-7.98); % f = 1/T
fprintf('The frequency of the system is: %.3f Hz.\n',freq);
%saveas(p, 'hw4_p1.png');



