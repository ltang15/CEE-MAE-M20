
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: hw6_p3
% Birthday Paradox

% Description: Finding how many people need to be in the room such that 50%
% probability at least two people have the same birthday. 

% Input:  None
% Output: Number of people needed
% Method: Monte Carlo
%Name: Linh Tang

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;

nTrials = 2000; % number of simulations
arr = linspace (2, 101, 100); % the array holding number of people we want to test




for i = 1:length (arr)
    counter = 0; % counter when people have the same birthday
    
    for k = 1:nTrials
        group = zeros(1, arr(i)); % the array holding the birthday
        
        for j = 1: arr(i)
            bday = randi([1 365]); % generate randomly the birthday
            group(j) = bday; % append bday to array
            
        end
        
        % the difference between two consecutive numbers in the array
        diff_group = diff(sort(group));
        
        if (find(diff_group == 0))
            % at least 2 ppls found have the same birthday
            counter = counter + 1;        
        end
    end
    
    % Calculate probability
    P = counter/nTrials;
    
    % when  50 <= P < 51%
    if(abs(P - 0.5) < 0.01) 
        fprintf ("Number of people needed to be in a room : %d\n", length(group));
        break;
    end  
    
    if (i == length(arr)&& abs(P - 0.5) > 0.01)
        disp("There is no number of people satisfying 50% probability in this run.");
        break;
    end  
       
end










