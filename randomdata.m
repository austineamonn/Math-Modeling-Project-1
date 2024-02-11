function data=randomdata(row,col,type)
rng('shuffle'); %seed randomness
if nargin<1 %if no inputs set inputs as the following
    row=1700;
    col=400;
    type=0;
end
students=[1:row]'; %initialize column vector of students
predata=NaN(row,col-1); %build matrix full of NaN
data=[students, predata]; %combine students and predata
gg=getgrades(400,type); %run getgrades to get random set of weighted data
for i=1:row
    classnum=randi([1,6]); %random number of classes
    scorenum = randsample(gg,classnum,true); %get grades in each class
    idx=randperm(col-1)+1; %random permutation of classes
    classes=idx(1,1:classnum); %pick first classnum classes
    for j=1:classnum %put the students grades in each class they took into data matrix
        curclass=classes(j);
        data(i,curclass)=scorenum(j);
    end
end
