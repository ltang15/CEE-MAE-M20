%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: hw7_205542275_p1
% Euler Bernoulli beam bending

% Description: - To plot the displacement of a 
% nitinol alloy beam subjected to a single point load
 
% Input:  None
% Output: A plot of  the y dispacement corresponding to the x-position
%        - The maximum displacement and where it coccurs
%        - The error of the maximum y displacement
%        - Elapse time with different number of discretization points
% Method: 2D array,  

%Name: Linh Tang(linhtang92@g.ucla.edu)
%UID: 205542275
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all; close all;
global L P;

tic % Start the elapsed time calculation

%% Defining constants and variables

L = 1; % (m) length of the bar
P = 1000; % (N) the force
d = 0.8; % (m) where the force is applied

% outer and inner radius of the cross section
ro = 0.1;
ri = 0.06;

E = 6.5e10; %(Nm^-2) modulus of the elasticity
I = pi*(ro^4 - ri^4)/4; % moment inertia

EI = E*I;

N = 100; % Number of discretization points 

dx = L/(N-1); % even space between  2 points

x = linspace(0, L, N); % array for x position
M = zeros(N, 1); % moment array

%% Calculating Moment with corresponding x- position
for k = 1:N
    M(k) = Moment(x(k), d);
end

%% Construct the matrix A & b
A = zeros (N, N); % A matrix of the system
b = zeros(N, 1); % right hand side vector
A(1, 1) = 1; 
A(N, N) = 1;
b(1) = 0;
b(N) = 0;

for i = 2:N-1
    A(i,i-1:i+1) = [1, -2, 1];
    
    b(i) = dx^2*M(i)/EI; 
end
y = A\b; % getting the y- displacement 



%% Maximum displacement and where it coccurs
[max_dis, index] = max(y);

fprintf('** Number of discretization points: %d points. \n', N);
fprintf('- The maximum displacement of the beam is %.4e m. \n', abs(max_dis));
fprintf('- It occurs at %.4f m. \n', x(index));

%% Calculate theoretical y max and the error
c = min(d, L-d);
theo_y = P*c*(L^2 - c^2)^1.5/(9*sqrt(3)*EI*L);
error = abs(max_dis - theo_y)/theo_y*100 ;

fprintf('- The error is %.4f %%.\n',error);

toc % end the elapsed time
%% Plotting
figure(1)
p = plot(x,y,'o-');
title('The displacement y over x- position')
xlabel ('x(m)');
ylabel ('y(m)');
set(gcf, 'Position', [100 40 800 500]);
set(gca, 'LineWidth', 2, 'FontSize', 12);

ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on'; 
saveas(p,'hw7_p1.png');


%% Part e

array_d = linspace(0.1, L-0.1, 9); % array d from 0.1-0.9m
array_x = zeros (9, 1); % array holding the x value for max y with each d value

moment = zeros(N, 1); % moment array for part e

% this is similar to the previous part, but calculate for different d
for n = 1:length(array_d)
    for k = 1:N
        moment(k) = Moment(x(k), array_d(n));
    end
  
  
    for i = 2:N-1
        b(i) = dx^2*moment(i)/EI;
    end
    y = A\b;
    [max_dis, index] = max(y);
    
    array_x(n) = x(index);% Storing the x where it has y max. 
end
fprintf ('\n\n *Part e: The range of x that contains the maximum displacement is:\n');
fprintf ('[%.4f, %.4f]. \n', min(array_x), max(array_x));



%% Function

function m = Moment(x, d)
% Input
% x: x-position 
% d: where he force is applied
% Output
% m: moment result

global L P;
    if (x >= 0 && x <= d)
        m = -P*(L-d)*x/L ;
    else 
        m = -P*d*(L-x)/L;
    end

end
