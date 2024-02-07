function [stand_dev,themean]=testofSensitivity_Testing(matrix)
if nargin<1
    matrix=Sensitivity_Testing(101);
end

stand_dev=std(matrix,0,2);
themean=mean(matrix,2);