function [t, x] = solveSpatialSIR(tFinal, initialCondition, alpha, ...
beta, gamma, odeSolver)
%solveSpatialSIR Solve the spatial SIR model
% Inputs:
% tFinal: end time for the simulation (assuming start is t=0)
% initialCondition: a MxNx3 matrix that sums to 1 in third dimension
% alpha, beta, gamma: model parameters
% odeSolver: a function handle for an ode45-compatible solver
% Outputs:
% t: a vector of the time-steps
% x: MxNx3xlength(t) matrix representing the state vs. time

% Get the size of initialCondition matrix
[M, N, Z] = size(initialCondition);

% vectorize the initialCondition matrix
initialCondition = initialCondition(:);

% Create 2x1 array for tspan, ti = 0 and tf = tFinal
tspan = [0 tFinal];

% Function handle for SIR system
dSIRdt = @(t, X) dynamicsSIR(X, M, N, alpha, beta, gamma);

% Using odesolver to solve the system
[t,x] = odeSolver(dSIRdt, tspan, initialCondition);

 T = length(t); % size of time array
 
 
 x = reshape(x, [T, M, N, Z]); % size is TxMxNx3
 x = permute (x, [2 3 4 1]); %   size is MxNx3xT
 


end