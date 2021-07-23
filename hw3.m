q = (1/sqrt(2))*[1;0;1]
qt = transp(q)

v2 = [0;1;0]
r12 = qt*v2

%Experiment 1

x= (-128:128)'/128;

A = [x.^0, x.^1, x.^2, x.^3];

[Q,R] = qr(A,0)

scale = Q(257,:);

Q = Q*diag(1./scale);

plot(Q)

% Experiment 2

[U,X] = qr(randn(80));
[V,X] = qr(randn(80));
S = diag(2.^(-1:-1:-80));

A = U*S*V;

[QC, RC] = clgs(A)

[QM, RM] = mgs(A)