function animate(X)
% animate: a function that shows the change in the ratio of susceptible,
% infected, and recovered individuals in the grid as an image.
% Inputs:
% X: an M*N*3*length(t) matrix, where each point in the M*N space
% corresponds to a single grid with 3 numbers between 0 and 1 showing
% the SIR result. this 3D matrix is repeated for each time step
% making it a 4D matrix.
%
% Output: this function does not output anything.

% Specify:
% St = St/max(St(:)) is blue
% It = It /max(It(:))is red
% Rt = Rt /max(Rt(:)) is green

[M,N,Z,~] = size(X); % get the size of 4D matrix X
 figure;
    
    % Display the image every 10 timesteps
    for t = 1:5:size(X,4)
        color = zeros(M,N,Z);
        
        St = X(:,:,1,t);
        St = St/max(St(:));
        
        It = X(:,:,2,t);
        It = It /max(It(:));
        
        Rt = X(:,:,3,t);
        Rt = Rt /max(Rt(:));
    
        color(:,:,1) = It; % infected: red
        color(:,:,2) = Rt; % recovered: green
        color(:,:,3) = St; % susceptible: blue
        
        image(color);
     
        box on
   
        drawnow();
        pause(0.1); % pause 0.1s before changing to the next frame
    end
  

end