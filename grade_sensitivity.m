function [row,col,val,diff12,diff13]=grade_sensitivity(data,type)
rng('shuffle') %seed randomness

if nargin<1 %if no inputs add in data and type
    data=randomdata();
    type=0;
end

[Xrow,Xcol]=size(data); %get dimensions of data
datadown=data; %make two exact copies of data
dataup=data;

[~,high1,~]=Project_1_Main(data); %no change in data

nochange=0; %initialize nochange
if type==0 %type 0 is A+,... 
    while nochange==0
        row=randi(Xrow); %pick a random row and column
        col=randi([2,Xcol]);
        val=data(row,col); %get current value
        if ~isnan(val) && val~=0 && val~=13 %if not NaN or a boundary value move it up 1 or down 1
            if val==3
                datadown(row,col)=0;
                dataup(row,col)=5;
            elseif val==5
                datadown(row,col)=3;
                dataup(row,col)=6;
            else
                datadown(row,col)=val-1;
                dataup(row,col)=val+1;
            nochange=1; %note that a value was changed
            end
        end
    end
elseif type==1 %type 1 A,A-,B+,... (Grinell)
    while nochange==0
        row=randi(Xrow); %pick a random row and column
        col=randi([2,Xcol]);
        val=data(row,col); %get current value
        if ~isnan(val) && val~=0 && val~=12 %if not NaN or a boundary value move it up 1 or down 1
            if val==3
                datadown(row,col)=0;
                dataup(row,col)=5;
            elseif val==5
                datadown(row,col)=3;
                dataup(row,col)=6;
            else
                datadown(row,col)=val-1;
                dataup(row,col)=val+1;
            nochange=1;  %note that a value was changed
            end
        end
    end
elseif type==2 %type 2 is A,B,C,...
    while nochange==0
        row=randi(Xrow); %pick a random row and column
        col=randi([2,Xcol]);
        val=data(row,col); %get current value
        if ~isnan(val) && val~=0 && val~=4 %if not NaN or a boundary value move it up 1 or down 1
            datadown(row,col)=val-1;
            dataup(row,col)=val+1;
            nochange=1;  %note that a value was changed
        end
    end
elseif type==3 %type 3 is 0-100
    while nochange==0
        row=randi(Xrow); %pick a random row and column
        col=randi([2,Xcol]);
        val=data(row,col); %get current value
        if ~isnan(val) && val~=0 && val~=1 && val~=2 && val~=98 && val~=99 && val~=100
            %if not NaN or a boundary value move it up 1 or down 1
            datadown(row,col)=val-3;
            dataup(row,col)=val+3;
            nochange=1; %note that a value was changed
        end
    end
end

[~,high2,~]=Project_1_Main(datadown); %change to go down 1

[~,high3,~]=Project_1_Main(dataup); %change to go up 1

diff12=setdiff(high1,high2); %difference in top decile when a grade moved down 1
diff13=setdiff(high1,high3); %difference in top decile when a grade moved up 1
