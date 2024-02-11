function [stand_dev,themean,Anova,time]=testofSensitivity_Testing(matrix)
tic
if nargin<1
    matrix=Sensitivity_Testing(101);
end

stand_dev=std(matrix,0,1); %column vector of std
themean=mean(matrix,1); %column vector of mean

Anova=anova(matrix);

time=toc;
