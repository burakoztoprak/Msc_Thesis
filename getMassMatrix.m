function X = getMassMatrix(m,q,l)
% This function is used to calculate the mass matrix. 
% It is denoted with "M(q)" in the document.
n = length(q);
X = zeros(n,n);
if length(m)==1
m = ones(1,n)*m;
end
for i = 1:n
    J = getJacobianVMatrix(i,q,l);
    X = X + m(i)*(J'*J);
end
end