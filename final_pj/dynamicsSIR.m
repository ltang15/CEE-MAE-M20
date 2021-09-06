function dxdt = dynamicsSIR(x, M, N, alpha, beta, gamma)
% dynamicsSIR Compute the rate of change of the model
% Inputs:
% x: vectorized state
% M, N: size of the grid
% alpha, beta, gamma: model parameters
% Output:
% dxdt: vectorized time derivative of state

% devectorize x
x = reshape (x, [M, N, 3]);

% SIR matrices
S = x(:, :, 1);
I = x(:, :, 2);
%R = x(:, :, 3);

%initialize a matrice storing the summation WI at each cell
sum_WI = zeros(M,N);
    
    % calculate WI for each position and store it to the array
    for index = 1:M*N
    
        %% 4 corners => 3 neighbors
        switch (index)
            case 1 
                % first corner (row 1, col 1)
                sum_WI(index) = 1* I(index + 1) + 1*I(index + M) + 1/sqrt(2)*I(index + M +1);       
            case M
                % second corner (row M, col 1)           
                sum_WI(index) = 1* I(index - 1) + 1*I(index + M) + 1/sqrt(2)*I(index + M - 1);
            case M*N - M +1
                % third corner (row 1, col N)           
                sum_WI(index) = 1* I(index + 1) + 1*I(index - M) + 1/sqrt(2)*I(index - M + 1);
            case M*N 
                % fourth corner (row M, col N)
                sum_WI(index) = 1* I(index - 1) + 1*I(index - M) + 1/sqrt(2)*I(index - M - 1);

        end  

        %% cells at the middle => 8 neighbors

        % row is from row 2 to row M -1 => mod(index, M) greater than 1. 
        % column is from col 2 to col N-1 => floor(index/M) is from 1 to N-2. 
        if((floor(index/M) > 0)&& (floor(index/M) < N-1)&&(mod(index, M)> 1))

            sum_WI(index) = 1* (I(index - M)+ I(index + M) + I(index - 1) + ...
                I(index + 1)) + 1/sqrt(2)*(I(index - M - 1) + I(index + M - 1)...
                + I(index - M + 1) + I(index + M + 1));

        end  

        %% Boundaries => 5 neighbors
        % firts row, last row, first column, last column except 4 corners

        % first row 
        if((mod(index,M) == 1)&& (floor(index/M) > 0) && (floor(index/M) < N -1))

            sum_WI(index) = 1* (I(index - M)+ I(index + M) + I(index + 1)) + ...
                 1/sqrt(2)*(I(index - M + 1) + I(index + M + 1));    
        end

        % last row
        % Cells ais divisible by M, quotient is from 1(col 2) to N-2(col N-1).
        if((mod(index,M) == 0)&& (floor(index/M) > 1) && (floor(index/M) < N))

            sum_WI(index) = 1* (I(index - M)+ I(index + M) + I(index - 1)) + ...
                 1/sqrt(2)*(I(index - M - 1) + I(index + M - 1));  
        end

        % first column
        % Cells divide by M giving 0 as quotient, the remainder is greater than 1
        if((floor(index/M) == 0) && (mod(index,M) >1))

            sum_WI(index) = 1* (I(index - 1)+ I(index + 1) + I(index + M)) + ...
                 1/sqrt(2)*(I(index + M - 1) + I(index + M + 1)); 

        end

        % last column
        % Cells divide by M giving N-1 as quotient, the remainder is greater than 1.
        if((floor(index/M) == N-1) && (mod(index,M) >1))

            sum_WI(index) = 1* (I(index - 1)+ I(index + 1) + I(index - M)) + ...
                 1/sqrt(2)*(I(index - M - 1) + I(index - M + 1));  
        end


    end
    
    % Calculate dS, dI, dR
    dS = - (beta .* I + alpha .* sum_WI) .* S;
    dI = (beta .* I + alpha .* sum_WI) .* S - gamma .*I;
    dR = gamma .* I;
    
    % Form dSIR 3D matrix
    dSIR = zeros(M, N, 3);
    dSIR(:,:,1) = dS;
    dSIR(:,:,2) = dI;
    dSIR(:,:,3) = dR;
    
    % Vectorize the 3D matrix of the system
    dxdt = dSIR(:);
    


end
