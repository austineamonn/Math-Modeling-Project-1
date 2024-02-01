function ave=class_ave(class)
[row,~]=size(class);
sum=0;
count=0;
for i = 1:row
   k = class(i,1);
    if k>-1
        sum=sum+k;
        count=count+1;
    end
end
ave=sum/count;