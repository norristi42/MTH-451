%Algorithm 27.1

N = 4
U = rand(N)
[Q,R] = qr(U)

x = zeros(1,N)

for i = 0:1:N-1
    x(i) = i/N
    
end    
