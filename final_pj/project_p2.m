%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: project_205542275_p2
% Spatial SIR model

% Description: - Solve SIR model by using RK4
%              - Plot S(t), I(t), R(t) at a specific coordinates
%              - Animate the SIR system

% Input:  x, y co-ords for the SIR plot
% Output: - A plot of SIR
%         - An animation of SIR
%         - Time elapse when using RK4 and ode45 
% Method: Runge Kutta 4, spatial, SIR model.  

%Name: Linh Tang

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all; close all;

% loading the data
load('initialValues.mat');

% define constants
tFinal = 60; % final time in s
alpha = 0.1;
beta = 0.05;
gamma = 0.1;

% Coordinate
x = 5;
y = 18;

%% ODE45
tic
[t, SIR] = solveSpatialSIR(tFinal, initialConditions, alpha, beta, gamma, @ode45);
ode = toc;
fprintf('Run time for using ode45 solver: %.4fs.\n', ode);

%% Using RK4, plot and animate the system
tic
[t2, SIR2] = solveSpatialSIR(tFinal, initialConditions, alpha, beta, gamma, @RK4);
rk = toc;
fprintf('Run time for using RK4 solver: %.4fs.\n', rk);

plotTimeSeries(t2, SIR2, x,y);
animate(SIR);
