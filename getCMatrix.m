function X = getCMatrix(m,q,qd,l)
% This function is used to calculate the matrix C(q,qd). 
% It is denoted with "C(q,qd)" in the document.
n = length(q);
X = zeros(n,n);
Md = getMassMatrixDot(m,q,l);
Mdq = getMassMatrixDerivqd(m,q,qd,l);
X = Md*qd - 0.5*Mdq'*qd;
end