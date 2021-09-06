
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: hw4_205542275_p3
% The RLC circuit problem: Implicit Euler

% Description: this script simulate the current i(t) in the RLC circuit
% with three different R values

% Input:  None
% Output: i(t) plot
% Method: implicit Euler

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

R = [R1, R2, R3];

dt = 0.01;
ti = 0;
tf = 20;

% Initial conditions
i_0 = 0;
a_0 = 1;

% Set up array
t = ti:dt:tf; % time array
N = numel(t); % number of time steps

i = zeros(N,1);
a = zeros(N,1);

i(1) = i_0;
a(1) = a_0;


% Implicit Euler
% f1 = (a(k+1) - a(k))/dt + (R/L)*a(k+1) + (1/(L*C))*i(k+1) = 0
% f2 = a(k+1) - (i(k+1) - i(k))/dt = 0

figure(1)

for n = 1:length(R)
    % Calculate and plot for each R
    
    for k = 1:N-1
        x = [i(k); a(k)]; % initial guess for the x = t_k;
        f1 = (x(2) - a(k))/dt + (R(n)/L)*x(2) + (1/(L*C))*x(1);
        f2 = x(2) - (x(1) - i(k))/dt;

        y = [f1;f2];
        
         % norm(y) = sqrt(f1^2+f2^2);
        while(norm(y) > 1e-6)
            %Jacobian J
             % J = [df1/di, df1/da;
             %      df2/di, df2/da];

           % df1/di(k+1) = 1/(L*C),   df1/da(k+1) = 1/dt + R/L;
           % df2/di(k+1) = -1/dt,     df2/da(k+1) = 1;

           J = [1/(L*C), 1/dt + R(n)/L; -1/dt, 1];
           x = x - J\y;
           f1 = (x(2) - a(k))/dt + (R(n)/L)*x(2) + (1/(L*C))*x(1);
           f2 = x(2) - (x(1) - i(k))/dt;
           y = [f1; f2];
        end
        
        % Updates solutions into arrays
        i(k+1) = x(1);
        a(k+1) = x(2);
    end
    
    % Plotting
    p = plot(t,i);
    hold on
    xlabel ('time (s)');
    ylabel ('Current (A)');
    title ('RLC Circuit: i(t) [Implicit Euler]');
    xlim ([ti tf]);

    set(p, 'LineWidth', 2);
    set(gcf, 'Position', [100 40 1000 600]);
    set(gca, 'LineWidth', 2, 'FontSize', 15);
    ax = gca;
    ax.XGrid = 'off';
    ax.YGrid = 'on'; 
   

end
legend('R = 0.2 Ohm','R = 2 Ohm','R = 20 Ohm');
saveas(p, 'hw4_p3.png');


