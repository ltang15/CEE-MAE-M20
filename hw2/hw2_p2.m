

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: hw2_p2
% Neighebor Identification

% Description: this script returns neighbors of any cell in the matrix

% Input:  Number of rows and columns of the matrix, cell number
% Output: Neighbors number
% Method: Using if-else, mod() and floor () functions, and switch case.

%Name: Linh Tang

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all; close all;

% Getting inputs for M, N and P

M = input('Enter number of rows (M): ');

% M and N are not less than 3
if(M <= 3)
    error('Invalid input. M must be greater than 3.\n');
end    

N = input('Enter number of columns (N): ');
if(N <= 3)
    error('Invalid input. N must be greater than 3.\n');
end  

% P is from 1 to M*N
P = input('Enter the cell (P): ');
if(P < 1 || (P > M*N))
    error('Invalid input. P must be from 1 to M*N.\n');
end  

% Dividing cell number by number of rows
floor_M = floor(P/M);
mod_M = mod(P,M);

%% Four corners
% returns 3 neighbors

last_num = M*N;

% Define 4 corners
first = 1;
second = M;
third = last_num - M + 1;
fourth = last_num;

% Returning neighbors for each case
switch(P)
    case first
        n1 = P + 1; 
        n2 = P + M;
        n3 = n1 + M;
        fprintf ('CornerNode.\nCell %d has neighbors: %d %d %d.\n',P, n1, n2, n3)
    case second 
        n1 = P -1;
        n2 = P + M;
        n3 = n1 + M;
        fprintf ('CornerNode.\nCell %d has neighbors: %d %d %d.\n',P, n1, n2, n3);

    case third
        n1 = P + 1;
        n2 = P - M ;
        n3 = n1 - M;
        fprintf ('CornerNode.\nCell %d has neighbors: %d %d %d.\n',P, n1, n2, n3);

    case fourth
        n1 = P - 1;
        n2 = P - M ;
        n3 = n1 - M;
        fprintf ('CornerNode.\nCell %d has neighbors: %d %d %d.\n',P, n1, n2, n3);
end
      
%% cells at the middle
% returns 8 neighbors

% row is from row 2 to row M -1 => mod(P, M)greater than 1. 
% column is from col 2 to col N-1 => floor(P/M) is from 1 to N-2. 
if((floor_M > 0)&& (floor_M < N-1)&&(mod_M > 1))
    n1 = P - M;
    n2 = P + M;
    n3 = P - 1;
    n4 = n3 - M;
    n5 = n3 + M;
    n6 = P + 1;
    n7 = n6 - M;
    n8 = n6 + M;
    fprintf ('Cell %d has neighbors: %d %d %d %d %d %d %d %d.\n',P, n1, n2, n3, n4, n5, n6, n7, n8);
    
end      

%% firts row, last row, first column, last column except 4 corners
% returns 5 neighbors

% first row
% Cells divide by M giving 1 as the remainder
% quotient is from 1(col 2) to N-2(col N-1). 
if((mod_M == 1)&& (floor_M > 0) && (floor_M < N -1))
    n1 = P - M;
    n2 = P + M;
    n3 = P + 1;
    n4 = n3 - M;
    n5 = n3 + M;  
    fprintf ('Cell %d has neighbors: %d %d %d %d %d.\n', P, n1, n2, n3, n4, n5);  
end

% last row
% Cells ais divisible by M, quotient is from 1(col 2) to N-2(col N-1).
if((mod_M == 0)&& (floor_M > 1) && (floor_M < N))
    n1 = P - M;
    n2 = P + M;
    n3 = P - 1;
    n4 = n3 - M;
    n5 = n3 + M;  
    fprintf ('Cell %d has neighbors: %d %d %d %d %d.\n', P, n1, n2, n3, n4, n5);  
end

% first column
% Cells divide by M giving 0 as quotient, the remainder is greater than 1
if((floor_M == 0) && (mod_M >1))
    n1 = P - 1;
    n2 = P + 1;
    n3 = n1 + M;
    n4 = n2 + M;
    n5 = P + M;
    fprintf ('Cell %d has neighbors: %d %d %d %d %d.\n', P, n1, n2, n3, n4, n5);  
end

% last column
% Cells divide by M giving N-1 as quotient, the remainder is greater than 1.

if((floor_M == N-1) && (mod_M >1))
    n1 = P - 1;
    n2 = P + 1;
    n3 = P - M;
    n4 = n1 - M;
    n5 = n2 - M; 
    fprintf ('Cell %d has neighbors: %d %d %d %d %d.\n', P, n1, n2, n3, n4, n5);  
end
         
  


    




  
     

