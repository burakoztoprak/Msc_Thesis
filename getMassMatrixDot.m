function X = getMassMatrixDot(m,q,l)
% This function is used to calculate the time derivative of mass matrix. 
% It is denoted with "Md(q)" in the document.
n = length(q);
X = zeros(n,n);
if length(m)==1
m = ones(1,n)*m;
end
for j = 1:n
    Y = zeros(n,n);
    for i = 1:n
        J = getJacobianVMatrix(i,q,l);
        Jd = getJacobianVDeriv(j,i,q,l);
        Y = Y + m(i)*(Jd'*J + J'*Jd);
    end
    X = X + Y;
end
end