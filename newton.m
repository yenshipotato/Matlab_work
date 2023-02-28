f=@(x) x^2-2;
f1=@(x) 2*x;
TOL=10^-10;
n=1;
x0=2;
x(n)=x0-f(x0)/f1(x0);
while (abs(x(n)-x0)>=TOL)
    x0=x(n);
    n=n+1;
    x(n)=x0-f(x0)/f1(x0);
end
