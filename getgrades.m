function grades = getgrades(classnum, inflation_level)
    if inflation_level == 0
        dist = pearsrnd(11,1,-1.5,5,1,20*classnum);
    end
    syms x
f(x) = piecewise(0<=x<=1.5,0,1.5<x<5,3,x>5,round(x),3<=x<=4,3,4<=x<=5,5);
grades = f(dist);

        
