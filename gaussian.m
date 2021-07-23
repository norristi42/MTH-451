% Gauss_np.m
% Gaussian Elimination without pivoting.
clear;
format short;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step 0: Assign the matrix A and the vector b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n = 3;
A = [0.9411, 0.0175, 0.1463;
0, -0.4394, -0.0553; 0,0, 0.8384];
b = [ -0.7521; 0.6310; 0.2501];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step 1: Basic Gaussian Elimination.
% The matrix A is overwritten to store its LU factorization.
% L is unit lower triangular:
% L(i,j) = 0 for j>i; L(i,i) = 1; L(i,j) = A(i,j) for i>j.
% U is upper triangular:
% U(i,j) = A(i,j) for j>=i; U(i,j) = 0 for i>j.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k = 1:(n-1)
    for i = (k+1):n
       A(i,k) = A(i,k) / A(k,k);
          for j = (k+1):n
          A(i,j) = A(i,j) - A(i,k) * A(k,j);
          end
    end      
end

% output the LU factorization of the original matrix A.
A
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step 2: Forward substitution to solve L * y = b where
% L(i,j) = 0 for j>i; L(i,i) = 1; L(i,j) = A(i,j) for i>j.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y = zeros(n,1); % Initialize y to be a column vector
% of length n with zeros entries.
y(1) = b(1);
for i = 2:n
y(i) = b(i);
for j = 1:(i-1)
y(i) = y(i) - A(i,j)*y(j);
end
end
% output y (the intermediate solution):
y
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step 3: Back substitution to solve U * x = y
% U(i,j) = A(i,j) for j>=i; U(i,j) = 0 for i>j.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = zeros(n,1); % Initialize x to be a column vector
% of length n with zeros entries.

x(n) = y(n) / A(n,n);

for i = (n-1):-1:1
    x(i) = y(i);
        for j = (i+1):n
        x(i) = x(i) - A(i,j)*x(j);
        end
    x(i) = x(i) / A(i,i);
end
% output x (the final solution):
x