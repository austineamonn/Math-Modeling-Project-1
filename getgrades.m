function dist = getgrades(classnum, inflation_level, type)
if type == 0 % A+,...   
    if inflation_level == 0
        dist = pearsrnd(11,1,-1.5,5,1,20*classnum);
    end
    syms x
    f(x) = piecewise(0<=x<=1.5,0,1.5<x<5,3,x>5,round(x),3<=x<=4,3,4<=x<=5,5);
    dist = f(dist);
elseif type == 2 %A,B,C,...
    if inflation_level == 0
        dist = round(pearsrnd(4,0.5,-1.5,5,1,20*classnum));
        dist(dist>4)=4;
    end
else %type 3 is 0-100
    if inflation_level == 0
        dist = round(pearsrnd(91,5,-1.5,5,1,20*classnum));
    end
end

        
