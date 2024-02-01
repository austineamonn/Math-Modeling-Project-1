rng('shuffle');
X = [1 4 NaN; 2 0 13; 3 5 NaN; 4 8 7; 5 3 NaN; 6 10 8; 7 13 10; 8 11 2; 9 NaN 6; 10 NaN 5; 11 4 4; 12 NaN 6; 13 4 9; 14 7 3; 15 NaN 8 ];
[Xrow,~]=size(X);
Student_List = [X(1:end,1)];
Class_1 = [X(1:end,2)];
Class_2 = [X(1:end,3)];
ave1=class_ave(Class_1);
ave2=class_ave(Class_2);
stud_ave1=student_ave(Class_1,ave1);
stud_ave2=student_ave(Class_2,ave2);
ranking=zeros(15,1);

new_X=[Student_List,stud_ave1,stud_ave2,ranking];
for i=1:15
    sum=0;
    count=0;
    for j=2:3
        k=new_X(i,j);
        if ~isnan(k)
            sum=sum+k;
            count=count+1;
        end
    end
    new_X(i,4)=sum/count;
end
final_ranking = new_X(1:end, 4);
X_dec = discretize(final_ranking,quantile(final_ranking,[0:10]/10));

top_stud=[];
for i=1:15
    k=X_dec(i,1);
    if k == 10
        top_stud=[top_stud,k];
    end
end

[~,col]=size(top_stud);
if col > Xrow/10
    lowest=top_stud(1,1);
    for i=1:col
        k=top_stud(1,i);
        if k<lowest
            lowest=k;
        end
    end
    toptop_stud=[];
    for i=1:col
        k=top_stud(1,i);
        if k==lowest
            toptop_stud=[top_stud,k];
        end
    end
end
