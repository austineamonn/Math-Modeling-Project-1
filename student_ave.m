function stud_ave=student_ave(class,ave) 
[row,~]=size(class);
stud_ave=class;
for i = 1:row 
   k = class(i,1); % grade in class 
   j= stud_ave(i,1); % student's average score in class
    if k>-1 % active only if student has real grade in class
        stud_ave(i,1)=j-ave;
    end
end
