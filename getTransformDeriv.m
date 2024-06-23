function X = getTransformDeriv(i,q,l)
% This function is used to calculate the transformation matrix for coordinate frame. 
% It is denoted with "dA/dqi" in the document.
q = q(i);
if i == 1
    X = [-sin(q), -cos(q), 0, 0;
         cos(q), -sin(q), 0, 0;
         0, 0, 0, 0;
         0, 0, 0, 0];
else
    if q == 0 % To ensure that the value does not go to infinity, the limit is taken for q=0
        X = [0, -1, 0, 0;
             -1, 0, 0, l/2;
             0, 0, 0, 0;
             0, 0, 0, 0];
    else
        X = [-sin(q), -cos(q), 0, l*(q*cos(q)-sin(q))/q^2;
             cos(q), -sin(q), 0, l*(q*sin(q)+cos(q)-1)/q^2;
             0, 0, 0, 0;
             0, 0, 0, 0];
    end
end
end