function [row,col,val,diff12,diff23,diff13]=grade_sensitivity(data)
rng('shuffle')

if nargin<1
    data=randomdata();
end

[Xrow,Xcol]=size(data);
new_data=data;
newer_data=data;

[low1,high1,list1]=Project_1_Main(data); %no change in data

nochange=0;

while nochange==0
    row=randi(Xrow);
    col=randi([2,Xcol]);
    val=data(row,col);
    if ~isnan(val) && val~=0 && val~=13
        if val==3
            new_data(row,col)=0;
            newer_data(row,col)=5;
        elseif val==5
            new_data(row,col)=3;
            newer_data(row,col)=6;
        else
            new_data(row,col)=val-1;
            newer_data(row,col)=val+1;
        nochange=1;
        end
    end
end

[low2,high2,list2]=Project_1_Main(new_data); %change to go down 1

[low3,high3,list3]=Project_1_Main(newer_data); %change to go up 1

diff12=setdiff(low1,low2); %no highs
diff23=setdiff(low2,low3);
diff13=setdiff(low1,low3);
