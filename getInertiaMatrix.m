function X = getInertiaMatrix(I,q)
% This function is used to calculate the mass matrix. 
% It is denoted with "I(q)" in the document.
n = length(q);
X = zeros(n,n);
if length(I)==1
end
for i = 1:n
    J = getJacobianWMatrix(i,q);
    X = X + I(i)*(J'*J);
end
end