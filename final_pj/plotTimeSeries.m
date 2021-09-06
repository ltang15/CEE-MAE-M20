function plotTimeSeries(t, X, x, y)
% plotTimeSeries: a function that plots and saves the local S.I.R ...
% distribution at spatial coordianate (x, y).
% Inputs:
% t: a vector of time steps
% X: an M*N*3*length(t) matrix, where each point in the M*N space
% corresponds to a local S.I.R. model with states whose values ...
% are between 0 and 1. This 3D matrix is repeated for each time step, ...
% making it a 4D matrix.
% x: the spatial x-coordinate on the grid
% y: the spatial y-coordinate on the grid
% Outputs:
% This function has no outputs

timeSteps = length(t); % get the number of steps 

% Create arrays for S, I, R
S = zeros(1, timeSteps);
I = zeros(1, timeSteps);
R = zeros(1, timeSteps);

figure;

    % Store values of S, I, R at a specific co-ords over time
    for i = 1:timeSteps
        S(i) = X(x,y,1,i);
        I(i) = X(x,y,2,i);
        R(i) = X(x,y,3,i);
        
    end
    
   % Plotting
    
    % Plot S(t) at x,y coords
    subplot(3,1,1);
    plot(t, S);  
    xlim([0 60]);
    ylim([0 1]);
    xlabel('Timesteps');
    ylabel('S(t)');
    title(sprintf('S(t) - number of susceptible individuals at [%d, %d]',x, y));
    
    % Plot I(t) at x,y coords
    subplot(3,1,2);
    plot(t, I);
    xlim([0 60]);
    ylim([0 1]);
    xlabel('Timesteps');
    ylabel('I(t)');
    title(sprintf('I(t) - number of infected individuals at [%d, %d]',x, y));
    
    % Plot R(t) at x,y coords
    subplot(3,1,3);
    plot(t, R);  
    xlim([0 60]);
    ylim([0 1]);
    xlabel('Timesteps');
    ylabel('R(t)');
    title(sprintf('R(t) - number of recovered individuals at [%d, %d]',x, y));
    
    saveas(gcf,'time_series_x_y.png');

end