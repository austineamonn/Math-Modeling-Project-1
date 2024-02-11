function final_matrix=Sensitivity_Testing(num)
if nargin<1 %if there is no input set num to 101.
    num=101;
end

final_matrix=zeros(num,4);

for i=1:num
    for j=1:4 %4 types of grading systems loop through with 1 for each
        [~,ave0,~]=sensitivity_test(10,j-1);
        final_matrix(i,j)=ave0;
    end
end
