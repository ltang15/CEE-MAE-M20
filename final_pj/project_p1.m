
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: project_p1
% Principle component analysis (PCA)

% Description: - Analyze COVID-19 data from 27 different countries
%              - Visualize the first two principle component eigenvectors
% and the projected data 

% Input:  None
% Output: A biplot of  the projected data

% Method: PCA, biplot function  

%Name: Linh Tang

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clc; clear all; close all;

% Loading the data of 27 countries from C2 cell to H28 cell
data = readmatrix('covid_countries.csv', 'Range', 'C2:H28');


% Call myPCA function to get sorted eigenvectors and projected data
[coeff, projectData] = myPCA(data);

% Plotting
figure(1)

vbls = {'Infections','Deaths','Cures','Mortality','Cure rate', 'Infection rate'};
biplot(coeff(:,1:2),'Score', projectData(:,1:2), 'VarLabels',vbls);
title ('PCA of COVID-19 data from 27 countries');
xticks(-0.6:0.1:0.6);
yticks(-0.8:0.1:0.8);
box on

saveas(gcf,'PCA.png');





   
