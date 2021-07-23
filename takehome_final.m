%Take Home Final


%24.3

B = eye(10,10); 

A1 = rand(10,10)

A = A1 - 2*B

vec = zeros(10,1)

vec = eigs(A,10)
 
time = 0:1:20

t = time'

twonorm = zeros(1,10)
%Find Max Eigenvalue
for i = 1:1:9
   if  abs(vec(i)) > abs(vec(i+1))
       max = abs(vec(i))
   
   else
       max = abs(vec(i+1))
       
   end
   two_norm = max^2
   twonorm(i) = two_norm
   
end    


sum = 0;
sumnorm = zeros(1,10)

%Matrix Exponential Calculation
for k = 1:1:10
    sum = sum + (A.^k * ((t(k).^k)/(factorial(k))))
    sum_norm = norm(sum,2)
    sumnorm(k) = sum_norm
end




x = linspace(0,1,20)
loglog(twonorm,sumnorm, 's')
grid on


% Algorithm 27.1

N = 128
U = rand(N)
[Q,R] = qr(U)

x = zeros(1,N)

%Generate Values for x
for i = 0:1:N-1
    x(i+1) = i/N
    
end    

D = diag(exp(-x))

Qo = orth(Q)
A2 = Q*D*Qo

v = zeros(1,N)
lambda = zeros(1,N)
w = zeros(1,N)

v(1) = 1

for k = 1:N
    w = A2(:,k)*v(k)
    v = w.^k/norm(w.^k)
    lambda(k) = transpose(v.^k)*A2(:,k)*A2(k,:)*v.^k
end




