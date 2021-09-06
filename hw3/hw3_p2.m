
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: hw3_p2
% Guess the number

% Description: this script is  about the game asking the user guessing a
% number from 1-50; the program generates a random number in that range.

% Input:  Number for each try, and an answer if the user want to continue
% the game or not.
% Output: The statements when user get it correct, or get it wrong after 5
% tries. 
% Method: double while loops. 

%Name: Linh Tang

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all; close all;

answer = 'Y';
while(answer == 'Y')
    num = randi([1, 50]);
    %fprintf ('The random number is: %d.\n', num);
    trials = 0;
    guess = -1;
    
    while (trials < 5)
        guess = input('Guess the number: ');
        if(guess <1 || guess >50 || mod(guess,1)~= 0 || ~isreal(guess))
            fprintf ('Invalid input.\n');
            break;
            
        end
  
        if (guess == num)
            fprintf('Nice guess, you found my number!\n');
            break;
        end

        trials = trials + 1;
        if(trials >= 5)
            fprintf('Out of tries, better luck next time\n')
            break;
        end
        
    end
    answer = upper(input('Do you want to play again?(Y/N) ','s'));
        
end
