function [coeffOrth,pcaData] = myPCA(data)
% myPCA analyzes the principal components of given COVID-19 statistical ...
% data from multiple countries - covid_countries.csv
% Inputs:
% data: A nxp matrix representing only the numerical parts of ...
% the dataset
% Outputs:
% coeffOrth: a pxp matrix whose columns are the eigenvectors ...
% corresponding to the sorted eigenvalues
% pcaData: a nxp matrix representing the data projected onto ...
% the principal components

% getting the size of the data
[n, p] = size(data);

% initialize the normalized array
normalized = zeros(n, p);
    
    % Step 1: normalize the data by substracting each element by the
    % average of column, and then divide it by the standard deviation 
    for j = 1: p
        mean_col = mean(data(:,j)); % calculate the mean of column
        std_col = std(data(:,j)); % calculate the standard deviation of column

        normalized(:, j) = (data(:, j)- mean_col)./ std_col;
    end
    
    % Step 2 & 3: compute covariance matrix and eigenvalues
    [V, D] = eig(cov(normalized)); % V: eigenvector, D: eigen values
    
    % Step 4: Keeping principlal components
    D = abs(D); %get absolute value of the eigen values
    [~, index] = sort(diag(D),'descend'); %sort D in descending order
    
    coeffOrth = V(:,index); % re-arrange the eigenvectors following 
                            % the order of eigenvalues
    
    pcaData = zeros(n,p);
    
    % Step 5: Converting normalized data to projected data
    for k = 1: n
       pcaData(k,:) = normalized(k,:) * coeffOrth; 
    end
    
end
