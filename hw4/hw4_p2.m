
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: hw4_205542275_p2
% The RLC circuit problem: semi-implicit Euler

% Description: this script simulate the current i(t) in the RLC circuit
% with three different R values

% Input:  None
% Output: i(t) plot and the damping coefficient for each system
% Method: Semi-implicit Euler

%Name: Linh Tang(linhtang92@g.ucla.edu)
%UID: 205542275
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all; close all;

% contants
L = 1;
C = 0.01;

R1 = 0.2;
R2 = 2;
R3 = 20;

R = [R1, R2, R3]; % Creating array for resistance

dt = 0.01;
ti = 0;
tf = 20;

% Method:
% a = di/dt
% f = da/dt + (R/L)*a(t) + (1/L*C)*i(t) = 0

% Initial conditions
i_0 = 0;
a_0 = 1;

% Set up arrays 
t = ti:dt:tf; % time array
N = numel(t); % number of time steps

% Initialize the arrays
i = zeros(N,1); % the current array
a = zeros(N,1); % a = di/dt array
coeff = zeros(length(R),1); % array for damping coeff

i(1) = i_0;
a(1) = a_0;


figure(1)

for n =1:length(R)
    % Calculate and plot for each R
    
    for k = 1:N-1
        % The discretized governing equations
        a(k+1) = a(k) - ((R(n)/L)*a(k)+ (1/(L*C))*i(k))*dt;
        i(k+1) = i(k) + a(k+1)*dt;

    end
    
    % Plotting
    p = plot(t,i);
    hold on

    xlabel ('time (s)');
    ylabel ('Current (A)');
    title ('RLC Circuit: i(t) [Semi-implicit Euler]');
    xlim ([ti tf]);
    set(p, 'LineWidth', 2);
    set(gcf, 'Position', [100 40 1000 600]);
    set(gca, 'LineWidth', 2, 'FontSize', 15);
    ax = gca;
    ax.XGrid = 'off';
    ax.YGrid = 'on'; 
    
    % Calculating damping coeff
    coeff(n) = (R(n)/2)*sqrt(C/L); 
    fprintf('The damping coefficient of R = %.1f Ohm: %.2f.\n',R(n), coeff(n));
end
legend('R = 0.2 Ohm','R = 2 Ohm','R = 20 Ohm');
saveas(p, 'hw4_p2.png');




