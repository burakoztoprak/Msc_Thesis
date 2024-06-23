function X = getJacobianWMatrix(j,q)
% This function is used to calculate the angular velocity Jacobian matrix. 
% It is denoted with "Jwi" in the document.
n = length(q);
X = zeros(3,n);
for i = 1:n
    F = getAngleDeriv(i,j);
    X(:,i) = F(1:3);
end
end