function [row,col,val,diff12,diff13]=grade_sensitivity(data)
rng('shuffle')

if nargin<1
    data=randomdata();
end

[Xrow,Xcol]=size(data);
new_data=data;
newer_data=data;

[low1,~,~]=Project_1_Main(data); %no change in data

nochange=0;
type=3;
if type==0 % A+,...
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
elseif type==1 %Grinnell
    while nochange==0
        row=randi(Xrow);
        col=randi([2,Xcol]);
        val=data(row,col);
        if ~isnan(val) && val~=0 && val~=12
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
elseif type==2 %A,B,C,...
    while nochange==0
        row=randi(Xrow);
        col=randi([2,Xcol]);
        val=data(row,col);
        if ~isnan(val) && val~=0 && val~=4
            new_data(row,col)=val-1;
            newer_data(row,col)=val+1;
            nochange=1;
        end
    end
elseif type==3 %type 3 is 0-100
    while nochange==0
        row=randi(Xrow);
        col=randi([2,Xcol]);
        val=data(row,col);
        if ~isnan(val) && val~=0 && val~=1 && val~=2 && val~=98 && val~=99 && val~=100
            new_data(row,col)=val-3;
            newer_data(row,col)=val+3;
            nochange=1;
        end
    end
end

[low2,~,~]=Project_1_Main(new_data); %change to go down 1

[low3,~,~]=Project_1_Main(newer_data); %change to go up 1

diff12=setdiff(low1,low2); %no highs
diff13=setdiff(low1,low3);
