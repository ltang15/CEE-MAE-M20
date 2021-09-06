% Name of the script: hw3_p3
% SIR Simulation of the Spread of Disease

% Description: this script approximates differential  equations and plot
% the number of infected students in a school.


% Input:  None

% Output: A plot for number of infected student and the maximum number of
% infected students

% Method: forward Euler method
%Name: Linh Tang

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;

% Initial conditions
I_0 = 1;
S_0 = 700;
R_0 = 0;

% constants
beta = 0.0026;
gamma = 0.5;

ti = 0;
tf = 20;
dt = 0.1;
% Calculating time steps
nt = ceil((tf-ti)/dt);

% In first iterartion, current values are initial conditions
I_k = I_0;
S_k = S_0;
R_k = R_0;

I_max = I_0; % Set the first I as maximum value


for k = 1:nt-1
    
    % Forward Euler method
    S_k1 = - beta * S_k * I_k * dt + S_k;
    I_k1 = (beta * S_k * I_k - gamma * I_k)*dt + I_k;
    R_k1 = gamma*I_k*dt + R_k;
     
   % Update the current values
    S_k = S_k1;
    I_k = I_k1;
    R_k = R_k1;
    
    % Find maxinum infected students
    if(I_k > I_max)
        I_max = I_k;
    end  
    
    
    % Plotting
    scatter(ti + dt*k,I_k,'filled','b');   
    hold on
    %I_max = max(I_k); 
    
end

xlabel ('time');
ylabel ('The infected (students)');
title ('Number of infected student (I)');
grid on
fprintf('The maximum number of infected students is %d students.\n', round(I_max));

