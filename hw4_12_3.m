% %part a

spec_mean = zeros(4,1);

for j = 3:6
    figure;
    spec = zeros(100,1);
    m=2.^j;
    eigs = zeros(100,m);
    
    for i = 1:100
        A = randn(m,m)/sqrt(m);
        [c,d] = eig(A);
        eigs(i,:) = diag(d)';
        plot([1:m],abs(eigs(i,:)),'.')
        spec(i) = max(abs(eigs(i,:)));
        hold on;
    end
end

figure;
length(spec_mean)
plot(2.^[3:6], spec_mean, 'r-');

%part b

j = 1;
clf;
allNorms = [];
allSpecs = [];
idx = 3:6;

for j=idx
    gnorm = [];
    gspec = [];
    
    for i = 1:100
        m=2^j;
        A = randn(m,m)/sqrt(m);
        gnorm = [ gnorm norm(A)];
        gspec = [ gspec max(abs(eig(A)))];
        
        hold on
    end
    
    allNorms = [allNorms mean(gnorm)];
    allSpecs = [allSpecs mean(gspec)];
end

plot(idx, allNorms, 'r:')
plot(idx, allSpecs, 'b--')
plot(idx, allNorms-allSpecs, 'k-')
legend('gnorm', 'gspec', 'diff')


