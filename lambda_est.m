function lambda = lambda_est(q,qd,l,k,b,Tc1,d_block)

    n = length(q);
    X = [1 0 0 0]*getPosVec(n,q,l);
    k = k(2:end);
    b = b(2:end);
    Jwn = [0 0;0 0;1 1];
    R = getRotMatrix(1,-q(1));
    R = R(1:3,1:3);
    Jvn = getJacobianVMatrix_norotate(2,q(2:end),l);
    J = Jvn'*(R*([1;0;0]*d_block(X) -[0;1;0]));
    lambda = (J)\(-Jwn'*[0;0;Tc1] + diag(k)*q(2:end) + diag(b)*qd(2:end));

end