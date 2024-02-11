function dist = getgrades(num, type)
if type == 0 % A+,...   
    dist = round(pearsrnd(11,1,-1.5,5,1,num));
    syms x
    f(x) = piecewise(0<=x<=1.5,0,1.5<x<5,3,x>5,round(x),3<=x<=4,3,4<=x<=5,5,x>13,13);
    dist = f(dist);
elseif type == 1 %A,A-,B+,...
    dist = round(pearsrnd(11,1,-1.5,5,1,num));
    syms x
    f(x) = piecewise(0<=x<=1.5,0,1.5<x<5,3,x>5,round(x),3<=x<=4,3,4<=x<=5,5,x>12,12);
    dist = f(dist);
elseif type == 2 %A,B,C,...
    
        dist = round(pearsrnd(4,0.5,-1.5,5,1,num));
        dist(dist>4)=4;
  
else %type 3 is 0-100
        dist = round(pearsrnd(91,5,-1.5,5,1,num));
  
end
        
