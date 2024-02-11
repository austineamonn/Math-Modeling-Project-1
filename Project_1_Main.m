function [low,high,sorted_list]=Project_1_Main(X)
rng('shuffle')
if nargin<1
    X=randomdata();
end
[Xrow,Xcol]=size(X);
Student_List = [X(1:end,1)];
new_X=[Student_List];
for i=2:Xcol
    Class = [X(1:end,i)];
    ave=class_ave(Class); %calculate average grade in a class
    stud_ave=student_ave(Class,ave); %calculate difference between a student's score and the class average
    new_X=[new_X, stud_ave]; %add vector of stud_ave to matrix new_X
end
ranking=zeros(Xrow,1);
new_X=[new_X, ranking];

for i=1:Xrow
    sum=0;
    count=0;
    for j=2:Xcol
        k=new_X(i,j);
        if ~isnan(k)
            sum=sum+k;
            count=count+1;
        end
    end
    new_X(i,Xcol+1)=sum/count;
end
final_ranking = [Student_List,new_X(1:end, Xcol+1)];
sorted_list=sortrows(final_ranking, 2, 'descend');

tenthpercent=floor(Xrow/10);

low=sorted_list(1:tenthpercent);

moretenthpercent=ceil(Xrow/10);

high=sorted_list(1:moretenthpercent);
