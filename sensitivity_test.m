function [sensitivity,ave]=sensitivity_test(num,type)
data=randomdata(1700,400,type); %get random data
ave=0; %initialize ave at zero
sensitivity=zeros(1,num); %initialize sensitivity

for i=1:num %run grade sensitivity num times
    [~,~,~,diff12,diff13]=grade_sensitivity(data,type);
    [~,col1]=size(diff12); %get size of difference matrices
    [~,col3]=size(diff13);
    combined=col1+col3; %combine sizes
    sensitivity(1,i)=combined; %put combined into the sensitivity vector
    ave=ave+combined;
end
ave=ave/(num*2); %solve for average of difference matrices
