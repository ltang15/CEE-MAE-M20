
function [xStar, xRoot] = fixPoint(fun2, x0, tol, maxIter)
% Inputs:
% fun2: a function handle, standing for the function written above
% x0: the initial guess of the fixed point
% tol: the tolerance within which the program can stop
% maxIter: the maximum number of iterations the program is allowed to run
% Outputs:
% xStar: the numerical value of the fixed point
% xRoot: the numerical value of the root

    xStar = x0;
    iter = 1;
 
    
    while(abs(fun2(xStar) - xStar) > tol && iter < maxIter)
        
        xStar = fun2(xStar); % x* = g(x*)
        
        if (abs(fun2(xStar) - xStar) <= tol)  
            break;
        end
        
        iter = iter + 1;

        
    end
    xRoot = xStar;
    
    % It is not convergent when exceeding the maximum number of iterations
    if(abs(fun2(xStar) - xStar) > tol && iter >= maxIter)
        
        fprintf('* xStar did not converge with tolerance = %.1e and %d iterations. \n The following xRoot and xStar are not correct.\n', tol, maxIter);
        
    end    
  
    
    
end