function X = getJacobianVDeriv(k,j,q,l)
% This function is used to calculate the velocity Jacobian matrix. 
% It is denoted with "dJvj/dqk" in the document.
n = length(q);
X = zeros(3,n);
for i = 1:n
    F = getPosDoubleDeriv(k,i,j,q,l);
    X(:,i) = F(1:3);
end
end