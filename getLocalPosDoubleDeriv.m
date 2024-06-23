function X = getLocalPosDoubleDeriv(i,q,l)
% This function is used to calculate the second partial derivative of the position vector in terms of local
% coordinate frame. It is denoted with "d^2p/dqi^2" in the document.

q = q(i);
if i == 1
    X = [0;0;0;0];
else
    if q == 0 % To ensure that the value does not go to infinity, the limit is taken for q=0
        X = [-l/3;
             0;
             0;
             0];
    else
    X = [l*(2*sin(q)-2*q*cos(q)-q^2*sin(q))/q^3;
         l*(q^2*cos(q)+2-2*q*sin(q)-2*cos(q))/q^3;
         0;
         0];
    end
end
end