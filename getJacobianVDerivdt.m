function X = getJacobianVDerivdt(j,q,qd,l)
% This function is used to calculate the velocity Jacobian matrix. 
% It is denoted with "dJvj/dt" in the document.
n = length(q);
X = zeros(3,n);
X1 = zeros(3,n);
for i = 1:n
    for k = 1:n
        F = getPosDoubleDeriv(k,i,j,q,l);
        X1(:,k) = F(1:3);
    end
    X(:,i) = X1*qd;
end
end