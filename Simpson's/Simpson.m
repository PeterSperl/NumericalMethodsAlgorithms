function[I] = Simpson(x,y)
%Ver_2 Simpson's 1/3 Program
%Function finds the integral using Simpson's 1/3 rule. If a odd number of
%intervals are found, the trapezoidal rule is applied to the final
%interval. All intervals must be the same size. x and y are vectors
%containing their resepctive values. 


%Created by Peter Sperl
%Due 4/19/19
%Dr. Bechara
%Mech 105

%Switches------------------------------------------------------------------
%Trapezoidal
TrapS = 0;
%Run Length
DET = length(x);
%--------------------------------------------------------------------------

%Warnings and Errors-------------------------------------------------------
if nargin < 2
    error('An input of x and y are needed, where x and y are vectors containing their respective values')
end
if nargin > 2
    error('Function will only accept an x and y vector as imputs')
end
if length(x) ~= length(y)
    error('x and y need to have the same length')
end
if mod(length(x), 2) == 0
    warning('Odd number of intervals detected, trapezoidal rule will be applied to the last interval. Increased inaccuracy in integration may occur.') 
    TrapS = 1;
    DET = length(x)-1;
end
%--------------------------------------------------------------------------

%Size Checker
Ideal = linspace(x(1), x(length(x)), length(x));
for L1 = 1:length(x)
    Check = Ideal(L1)==x(L1);
    if Check ~= 1
        error('Spacing between intervals must be even')
        break;
    end
end

%Misc. Setup
h = x(2)-x(1);
I = 0;

%Core Loop-----------------------------------------------------------------
for L2 = 1:DET
    if L2 == 1
       I = y(1); 
    end
    if mod(L2, 2) == 0
        I = I+(4*y(L2));
    end
    if mod(L2, 2) ~= 0 && L2 ~= 1 && L2 ~= DET
        I = I+(2*y(L2));
    end
    if L2 == DET
        I = I+y(DET);
    end
end
%--------------------------------------------------------------------------

%Final 1/3 Calculation(Unless TrapS == 1)
I = (h/3)*I;

%TrapS for Odd Intervals
if TrapS == 1
    IT = h*((y(length(x)-1)+y(length(x)))/2);
    I = I+IT;
end
    
%Display Answer
disp(I)
end