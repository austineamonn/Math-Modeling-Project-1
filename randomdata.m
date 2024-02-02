function data=randomdata(row,col)
rng('shuffle');
if nargin<1
    row=20;
    col=20;
end
students=[1:row]';
predata=NaN(row,col-1);
data=[students, predata];

for i=1:row
    classnum=randi([1,6]); %random number of classes
    scorenum=randi([0,13],classnum,1); %random grades in each class
    idx=randperm(col-1)+1; %random permutation of classes
    classes=idx(1,1:classnum); %pick first classnum classes
    for j=1:classnum
        curclass=classes(j);
        data(i,curclass)=scorenum(j);
    end
end

%add in student numbers in first column