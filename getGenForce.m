function X = getGenForce(q,l,b,qd,F,T)
% This function is used to calculate the generalized forces vector.
% It is denoted with "Q" in the document.
% b is the damping
% F is the force
% T is the torque
n = length(q);
X = zeros(n,1);
for i = 1:n
    Jv = getJacobianVMatrix(i,q,l);
    Jw = getJacobianWMatrix(i,q);
    IR = getRotMatrixProduct(0,i,q);
    R = IR(1:3,1:3);
    f = R*F(:,i);
    t = T(:,i);
    if i==n
        Jw(3,1)=0;
    end
    X = X + Jv'*f + Jw'*t;
end
X = X - diag(b)*qd;
end