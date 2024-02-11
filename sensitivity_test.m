function [sensitivity,ave,time]=sensitivity_test(num,type)
tic
data=randomdata(1700,400,type);
ave=0;
sensitivity=zeros(1,num);

for i=1:num
    [~,~,~,diff12,~,diff13]=grade_sensitivity(data);
    [~,col1]=size(diff12);
    [~,col3]=size(diff13);
    combined=col1+col3;
    sensitivity(1,i)=combined;
    ave=ave+combined;
end
ave=ave/(num*2);
time=toc;
