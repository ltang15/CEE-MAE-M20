function [t, y] = RK4(f, tspan, y0)
% RK4 Numerically solves the differential equation using the ...
% fourth-order Runge-Kutta algorithm
% Inputs:
% f: function handle of f(t, y)
% tspan: the time period for simulation (should be a 1x2 array ...
% contain start time and end time)
% y0: the initial conditions for the differential equation
% Outputs:
% t: corresponding time sequence as a T x 1 vector
% y: the solution of the differential equation as a T x n matrix, ...
%where T is the number of time steps and n is the dimension of y

    ti= tspan(1);% Start time
    tf = tspan(2);%Final time

    h = 0.1; % time step size
    nSteps = ceil((tf - ti)/h); %Calculate timesteps
 
    n = length(y0); % length of y0 vector

    y = zeros(nSteps, n) ; % initialize an nstepsx n array for y solution
    yk = y0; % define initial conditions
    
    t = zeros(nSteps, 1); % initialize time array  
    tk = ti; % define initial time
       
    k = 0; % timestep start at 0
    
    %RK4 algorithm
    while k <= nSteps
        c1 = h * f(tk, yk);
        c2 = h * f(tk + 0.5*h, yk + 0.5 * c1);
        c3 = h * f(tk + 0.5*h, yk + 0.5 * c2);
        c4 = h * f(tk + h, yk + c3);
        yk = yk + (c1 + 2*c2 + 2*c3 + c4)/6;
        
        tk = tk + h; % update time variable
        k = k + 1;  % update time step
        
        % Store tk and yk values into the array
        t(k) = tk;
        y(k,:) = yk;
               
    end

end



