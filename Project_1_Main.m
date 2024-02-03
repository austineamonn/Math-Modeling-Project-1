function [low,high]=Project_1_Main(X)
rng('shuffle')
if nargin<1
    X=randomdata();
end
%X = [1 4 NaN; 2 0 13; 3 5 NaN; 4 8 7; 5 3 NaN; 6 10 8; 7 13 10; 8 11 2; 9 NaN 6; 10 NaN 5; 11 4 4; 12 NaN 6; 13 4 9; 14 7 3; 15 NaN 8 ];
[Xrow,Xcol]=size(X);
Student_List = [X(1:end,1)];
new_X=[Student_List];
for i=2:Xcol
    Class = [X(1:end,i)];
    ave=class_ave(Class);
    stud_ave=student_ave(Class,ave);
    new_X=[new_X, stud_ave];
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
final_ranking = [Student_List,new_X(1:end, Xcol+1)]
sorted_list=sortrows(final_ranking, 2, 'descend');

tenthpercent=floor(Xrow/10);

low=sorted_list(1:tenthpercent);

moretenthpercent=ceil(Xrow/10);

high=sorted_list(1:moretenthpercent);

%X_dec = discretize(final_ranking,quantile(final_ranking,[0:10]/10));

% top_stud=[];
% for i=1:15
   % k=X_dec(i,1);
   % if k == 10
    %    top_stud=[top_stud,k];
   % end
% end

% [~,col]=size(top_stud);
% if col > Xrow/10
 %   lowest=top_stud(1,1);
  %  for i=1:col
  %      k=top_stud(1,i);
  %      if k<lowest
  %          lowest=k;
   %     end
   % end
   % toptop_stud=[];
   % for i=1:col
   %     k=top_stud(1,i);
   %     if k==lowest
         %   toptop_stud=[toptop_stud,k];
    %    end
    %end
  %  end 
