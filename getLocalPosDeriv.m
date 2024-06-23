function X = getLocalPosDeriv(i,q,l)
% This function is used to calculate the partial derivative of the position vector in terms of local
% coordinate frame. It is denoted with "dp/dqi" in the document.
q = q(i);
if i == 1
    X = [0;0;0;0];
else
    if q == 0 % To ensure that the value does not go to infinity, the limit is taken for q=0
        X = [0;
             l/2;
             0;
             0];
    else
    X = [l*(q*cos(q)-sin(q))/q^2;
         l*(q*sin(q)+cos(q)-1)/q^2;
         0;
         0];
    end
end
end