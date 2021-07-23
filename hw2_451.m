A = [-2,11;-10,5];
B = transpose(A);


[U,S,V] = svd(A)

disp([U,S,V])

C = A*B

D = B*A

C1 = [75,75;75,75]

C2 = [-75,75;75,-75]

e1 = eig(C)

e2 = eig(D)

C3 = rref(C1)

C4 = rref(C2)
    

