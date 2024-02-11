function ave=class_ave(class)
[row,~]=size(class); %get number of rows (number of students) in class
sum=0; %initialize sum
count=0; %initialize count
for i = 1:row %go through class calculate total number of students and their grades
   k = class(i,1);
    if ~isnan(k) %exclude students who are not in the class
        sum=sum+k;
        count=count+1;
    end
end
ave=sum/count; %get average grade in class
