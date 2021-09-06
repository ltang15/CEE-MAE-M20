%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: hw7_p2
% Langton's ant

% Description: - To simulate Langton's ant model and display the portion of
%               black grids. 
 
% Input:  None
% Output: An image of the Lanton's Ant simulation.
%       - A portion plot for black grids over time 
% Method: 2D array, imagesc. 

%Name: Linh Tang(linhtang92@g.ucla.edu)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all; close all;


% North = 1;
% East = 2;
% South = 3;
% West = 4; 


% Define the size of 2D grids
global num_rows num_cols

num_rows = 50;
num_cols = 50;

% number of simulations
max_steps = 1000;

% Define the initial position of the ant
% randomly put in the grid
ant_row = randi(50);
ant_col = randi(50);

% North = 1;
% East = 2;
% South = 3;
% West = 4; 

% Ant's head initially points to North
head = 1; 

% Initialize 2D grid
square_color = zeros(num_rows, num_cols);


% Initialize the array holding the portion of the black squares
portion = zeros(max_steps, 1);


v = VideoWriter('LangtonAnt.mp4'); % Create an object to write video
v.open();


for k = 1: max_steps
    
    
    %% Flip the ant
    head = ant_flip(square_color, ant_row, ant_col, head);
    
    %% Change the color
    if(square_color(ant_row, ant_col) == 0)
        % White to black  
        square_color(ant_row, ant_col) = 1;
        
    else
        % Black to white
        square_color(ant_row, ant_col) = 0;
    end
    
   
    
    %% Move and check boundary  
    
    [ant_row, ant_col] = ant_move(ant_row, ant_col, head);
    
    %% Portion of black
    counter = 0; % Set up the counter for black squares in the 2D grids
    
    % Counting the black squares in the grid
    for i = 1: num_rows
        for j = 1: num_cols
            if (square_color(i,j) == 1)
                counter = counter + 1;
                
            end            
            
        end
        
    end
    
    % Calculate the portion
    portion(k) = counter/ (num_rows * num_cols);
    
    %% Image
    figure(1)
    
    imagesc(square_color); % Create animation
    
    % Create a black and white colormap: 1 1 1 is white, 0 0 0 is black
    mymap = [1 1 1
    0 0 0];   
    colormap(mymap);
    box on   
    title(sprintf('Timesteps %d.', k));  
    set(gcf, 'Position', [300 50 500 500]);
    set(gca, 'LineWidth', 2, 'FontSize', 10);

    drawnow();
    frame = getframe(gcf); % get the content of the current frame of the fig
    writeVideo(v, frame); % save this frame into the videoWrite.
    
end
v.close();

%% The portion plot
figure(2)
p = plot(1:max_steps, portion, 'r');
title('The portion of black grids')
xlabel ('Time steps');
ylabel ('Black portion');
set(gcf, 'Position', [300 50 500 500]);
set(gca, 'LineWidth', 2, 'FontSize', 10);

ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on'; 
saveas(p, 'hw7_p2.png');

%% Functions

function [new_head] = ant_flip (grid, curr_row, curr_col, head)
% This function flips the ant
% Inputs: 
% grid: 2D grids
% curr_row: the current row of the ant
% curr_col: the current col of the ant
% head: the direction the head points to

% Outputs: new_head: the new direction after flipping the ant

  if(grid(curr_row, curr_col) == 0)
        new_head = head + 1; %white square (0), flip clockwise 90 degree
        
        
  else
        new_head = head - 1; %black square(1), flip counter-clockwise 90 degree
       
  end
  
  % keep the head direction in the range 1-4
    if new_head > 4
        new_head = new_head - 4;
    elseif new_head < 1
        new_head = new_head + 4;
    end 

end

function [ant_row, ant_col] = ant_move (curr_row, curr_col, head)
% This function moves the ant and check the boundary
% Inputs: 
% curr_row: the current row of the ant
% curr_col: the current col of the ant
% head: the direction the head points to

% Outputs: ant_row: the new row where the ant is
%          ant_col: the new col where the ant is

global num_rows num_cols

    % Using periodic boundary
    if head == 1
        % Move North
        ant_row = curr_row - 1;
        ant_col = curr_col;
        
        % The ant is at the 1st row, wants to move North
        if ant_row < 1
            ant_row = num_rows; % Move to the last row
        end     
            
    elseif head == 2
        % Move East
        ant_col = curr_col + 1;
        ant_row = curr_row;
        
        % The ant is at the last col, wants to move East
        if ant_col > num_cols
            ant_col = 1; % Move to the 1st col
        end 
       
    
    
    elseif head ==  3
        % Move South
        ant_row = curr_row + 1;
        ant_col = curr_col;
        
        % The ant is at the last row, wants to move South
        if ant_row > num_rows
           ant_row = 1; % Move to the 1st col
        end    
       
            
    elseif head == 4
        %Move West      
        ant_col = curr_col - 1;
        ant_row = curr_row;
        
        % The ant is at the 1st col, wants to move West
        if ant_col < 1
            ant_col = num_cols; % Move to the last col
        end  
    end
        
end
