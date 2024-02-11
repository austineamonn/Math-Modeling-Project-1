function dist = getgrades(num,type)
if type == 0 %type 0 is A+,...   
    dist = round(pearsrnd(11,1,-1.5,5,1,num)); %weighted distribution of grades
    syms x
    f(x) = piecewise(0<=x<=1.5,0,1.5<x<5,3,x>5,round(x),3<=x<=4,3,4<=x<=5,5,x>13,13); 
    %function to turn distribution into acceptable values for grading
    %system type
    dist = f(dist);
elseif type == 1 %type 1 A,A-,B+,... (Grinell)
    dist = round(pearsrnd(11,1,-1.5,5,1,num)); %weighted distribution of grades
    syms x
    f(x) = piecewise(0<=x<=1.5,0,1.5<x<5,3,x>5,round(x),3<=x<=4,3,4<=x<=5,5,x>12,12);
    %function to turn distribution into acceptable values for grading
    %system type
    dist = f(dist);
elseif type == 2 %type 2 is A,B,C,...
    dist = round(pearsrnd(4,0.5,-1.5,5,1,num)); %weighted distribution of grades
    dist(dist>4)=4; %function to turn distribution into acceptable values for grading
    %system type
else %type 3 is 0-100
    dist = round(pearsrnd(91,5,-1.5,5,1,num)); %weighted distribution of grades
    %function to turn distribution into acceptable values for grading
    %system type
end        
