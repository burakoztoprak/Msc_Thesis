function X = getMassMatrixDerivqd(m,q,qd,l)
% This function is used to calculate the partial derivative of mass matrix times 
% time derivative of generalized vector. 
% It is denoted with "M(q)*qd/dq" in the document.
n = length(q);
X = zeros(n,n);
for i = 1:n
    Mqd = getMassMatrixDeriv(i,m,q,l);
    X(:,i) = Mqd*qd;
end
end