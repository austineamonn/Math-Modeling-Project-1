function final_matrix=Sensitivity_Testing(num)
if nargin<1
    num=101;
end

final_matrix=zeros(num,4);

for i=1:num
    for j=1:4
        [~,ave0,~]=sensitivity_test(10,j); %A+,A,A- etc school
        %[~,ave1,time1]=sensitivity_test(100,1); %Grinnell
        %[~,ave2,time2]=sensitivity_test(100,2); %A,B,C school
        %[~,ave3,time3]=sensitivity_test(100,3); %0-100
        final_matrix(i,j)=ave0;
    %Time=[time0,time1,time2,time3];
    %Ave=[ave0,ave1,ave2,ave3];
    %final_matrix()
    end
end
