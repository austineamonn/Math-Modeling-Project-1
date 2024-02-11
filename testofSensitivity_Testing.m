function [stand_dev,themean,Anova,time]=testofSensitivity_Testing(matrix)

if nargin<1 %if there is matrix input call Sensitivity_Testing to make one
    matrix=Sensitivity_Testing(101);
end

stand_dev=std(matrix,0,1); %calculate standard deviation by each column
themean=mean(matrix,1); %calculate mean  by each column

Anova=anova(matrix); %calculate ANOVA of matrix
