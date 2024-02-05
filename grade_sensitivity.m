function [low1,high1,low2,high2,low3,high3,data,new_data,newer_data]=grade_sensitivity(data)
rng('shuffle')

if nargin<1
    data=randomdata();
end

[Xrow,Xcol]=size(data);
new_data=data;
newer_data=data;

[low1,high1]=Project_1_Main(data) %no change in data

nochange=0;

while nochange==0
    row=randi(Xrow);
    col=randi([2,Xcol]);
    val=data(row,col)
    if ~isnan(val) && val~=0
        new_data(row,col)=0;
        nochange=1;
    end
end

[low2,high2]=Project_1_Main(new_data) %change to zero

nochange=0;

while nochange==0
    row=randi(Xrow);
    col=randi([2,Xcol]);
    val=data(row,col)
    if ~isnan(val) && val~=13
        newer_data(row,col)=13;
        nochange=1;
    end
end

[low3,high3]=Project_1_Main(newer_data) %change to 13