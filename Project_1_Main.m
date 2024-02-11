function [low,high,sorted_list]=Project_1_Main(X)
rng('shuffle') %seed randomness
if nargin<1 %if no data inputed create random data
    X=randomdata();
end
[Xrow,Xcol]=size(X); %get dimensions of matrix X
Student_List = [X(1:end,1)]; %list of students
new_X=[Student_List]; %initialize new_X
for i=2:Xcol
    Class = [X(1:end,i)]; %get the ith class
    ave=class_ave(Class); %calculate average grade in a class
    stud_ave=student_ave(Class,ave); %calculate difference between a student's score and the class average
    new_X=[new_X, stud_ave]; %add vector of stud_ave to matrix new_X
end
ranking=zeros(Xrow,1); %initialize ranking
new_X=[new_X, ranking]; %add ranking to new_X

for i=1:Xrow %calculate the average grade per student accross all the classes they took
    sum=0;
    count=0;
    for j=2:Xcol
        k=new_X(i,j);
        if ~isnan(k)
            sum=sum+k;
            count=count+1;
        end
    end
    new_X(i,Xcol+1)=sum/count; %add this value to new_X
end
final_ranking = [Student_List,new_X(1:end, Xcol+1)]; %initialize final_ranking with student list and their average grades
sorted_list=sortrows(final_ranking, 2, 'descend'); %sort final ranking with highest average at top

tenthpercent=floor(Xrow/10); %floor of top decile

low=sorted_list(1:tenthpercent); %take top tenthpercent from sorted_list

moretenthpercent=ceil(Xrow/10); %ceiling of top decile

high=sorted_list(1:moretenthpercent); %take top moretenthpercent from sorted_list
