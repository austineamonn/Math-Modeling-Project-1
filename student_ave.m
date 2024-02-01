function stud_ave=student_ave(class,ave)
[row,~]=size(class);
stud_ave=class;
for i = 1:row
   k = class(i,1);
   j= stud_ave(i,1);
    if k>-1
        stud_ave(i,1)=j-ave;
    end
end