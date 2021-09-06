
function [xRoot, numIter] = biSection(f, a, b, tol)
% Inputs:
% f: a function handle, standing for the function written above
% a: the left boundary of the range
% b: the right boundary of the range
% tol: the tolerance within which the program can stop
% Outputs:
% xRoot: the numerical value of the root
% numIter: the number of iterations after which the root is found

    eps = b - a;
    
    nMax = (log(eps) - log(tol))/log(2); % maximum number of iterations
    numIter = 1;
   

    while (numIter <= nMax)

       xRoot = (a+b)/2; % mid point
       
       if( f(xRoot) == 0 || eps/2 < tol)
           % When xRoot is found or the (b-a)/2 is very tiny
           break;

       end
       
       numIter = numIter + 1;
       
       % When f(xRoot) has same sign with f(a) or f(b)
       if(sign(f(xRoot)) == sign(f(a)))
           a = xRoot;
       else
           b =xRoot;
       end

    end
   
end