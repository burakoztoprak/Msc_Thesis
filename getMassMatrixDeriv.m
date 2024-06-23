function X = getMassMatrixDeriv(j,m,q,l)
% This function is used to calculate the partial derivative of mass matrix. 
% It is denoted with "M(q)/dqj" in the document.
n = length(q);
X = zeros(n,n);
if length(m)==1
m = ones(1,n)*m;
end
for i = 1:n
    J = getJacobianVMatrix(i,q,l);
    Jd = getJacobianVDeriv(j,i,q,l);
    X = X + m(i)*(Jd'*J + J'*Jd);
end
end