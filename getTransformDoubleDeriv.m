function X = getTransformDoubleDeriv(i,q,l)
% This function is used to calculate the transformation matrix for coordinate frame. 
% It is denoted with "d^2A/dqi^2" in the document.
q = q(i);
if i == 1
    X = [-cos(q), sin(q), 0, 0;
         -sin(q), -cos(q), 0, 0;
         0, 0, 0, 0;
         0, 0, 0, 0];
else
    if q == 0 % To ensure that the value does not go to infinity, the limit is taken for q=0
        X = [-1, 0, 0, -l/3;
             0, -1, 0, 0;
             0, 0, 0, 0;
             0, 0, 0, 0];
    else
        X = [-cos(q), sin(q), 0, l*(2*sin(q)-2*q*cos(q)-q^2*sin(q))/q^3;
             -sin(q), -cos(q), 0, l*(q^2*cos(q)+2-2*q*sin(q)-2*cos(q))/q^3;
             0, 0, 0, 0;
             0, 0, 0, 0];
    end
end
end