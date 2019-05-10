function [L, U, P] = luFactor(A)
%Performs an LU decomposition on square matrices

%Inputs
% A = Square matrix to be decomposed

%Outputs
%L = Lower matrix found during decomposition
%U = Upper matrix found during decomposition
%P = Pivot matrix which keeps track of all changes made during pivoting

%Written by Peter Sperl
%Due 4/3/19
%Ver 2

%Initial Population
[n, Throw] = size(A);
U = A;
P = eye(n);
L = eye(n);

%Error
if n~=Throw
    error('Maxtrix A must be an n-by-n(square)matrix')
end
if n == 1
    error('Minimum matrix size is a 2x2')
end

%Main Loop
for It = 1:n-1
   %Checker for Columns 
   p = max(abs(U(It:n,It)));
   %Finding the Pivot
   for Run = It:n
       PTest = abs(U(Run,It));
       if PTest == p
           RunL = Run;
           break
       end
   end
   
   %Pivot
   P([It,RunL],:)= P([RunL,It],:);
   U([It,RunL],It:n)= U([RunL,It],It:n);
   L([It,RunL],1:It-1)= L([RunL,It],1:It-1);
   
   %Elimination
   %Coeff 
   for CL = It+1:n
       Coeff = U(CL, It)/U(It, It);
       %Multiply
       MR = Coeff*U(It,It:n);
       %Redefining the Matrices
       U(CL, It:n) = U(CL, It:n) - MR;
       L(CL,It) = Coeff;
   end
end  
L = L
U = U
P = P

end
