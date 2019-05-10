function output = falsePosition(func, xi, xu, es, maxiter)
%HW 11 Mech 105
%example input: falsePosition(@(x) sin(x), 0.1, 5, .5, 300)

%Initial Setup
iterc = 0;
maxiterDF = 200;
esDF = 0.0001;
esc = 100;
xr = 0;
PRapp = 0;
format long

if nargin < 4
    es = esDF;
    fprintf('Error set to 0.0001 Percent')
end
if nargin < 5
    maxiter = maxiterDF;
    fprintf('Iterations set to 200')
end

%Errors
if nargin < 3
    error('Minimum inputs are a function and a lower and upper bound')
end
if sign(func(xi)) == sign(func(xu))
    error('Function sign does not change over chosen interval.')
end

%Main Loop
while iterc < maxiter && esc > es
    PRapp = xr;
    xr = xu - ((func(xu) * (xi - xu))/(func(xi) - func(xu)));
    if sign(func(xr)) == sign(func(xi))
        xi = xr;
    else
        xu = xr;
    end
    Papp = xr;
    iterc = iterc + 1;
    esc = abs(((Papp - PRapp)/Papp) * 100); 
       
end    
root = xr;
fx = func(xr);
ea = esc;
iter = iterc;
output = [root, fx, ea, iter];
end

