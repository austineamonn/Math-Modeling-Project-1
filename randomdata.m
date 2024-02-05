function data=randomdata(row,col,type)
rng('shuffle');
if nargin<1
    row=1700;
    col=399;
    type=0;
end
students=[1:row]';
predata=NaN(row,col-1);
data=[students, predata];

if type==0 %A+,A,A- etc school
    possible_scores = [0,3,5:13]';
elseif type ==1 %Grinnell
    possible_scores = [0,3,5:12]';
else %A,B,C school
    possible_scores = [0:4]';
end
gg=getgrades(400,0);
for i=1:row
    classnum=randi([1,6]); %random number of classes
    scorenum = randsample(gg,classnum,true);
    %scorenum = randsample(possible_scores,classnum,true);

    %scorenum=randi([0,13],classnum,1); %random grades in each class
    idx=randperm(col-1)+1; %random permutation of classes
    classes=idx(1,1:classnum); %pick first classnum classes
    for j=1:classnum
        curclass=classes(j);
        data(i,curclass)=scorenum(j);
    end
end

%add in student numbers in first column
