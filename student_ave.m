function stud_ave=student_ave(class,ave) 
[row,~]=size(class); %get dimensions of class
stud_ave=class; %intialize stud_ave
for i = 1:row 
   k = class(i,1); % grade in class 
   j= stud_ave(i,1); % student's average score in class
    if ~isnan(k) % exclude students who are not in the class
        stud_ave(i,1)=j-ave; %replace student's grade with difference from average grade
    end
end
