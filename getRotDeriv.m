function X = getRotDeriv(i,q)
% This function is used to calculate the rotation matrix for coordinate frame. 
% It is denoted with "dR/dqi" in the document.
if i>0
q = q(i);
X = [-sin(q), -cos(q), 0, 0;
     cos(q), -sin(q), 0, 0;
     0, 0, 0, 0;
     0, 0, 0, 0];
else
    X = [1, 0, 0, 0;
         0, 1, 0, 0;
         0, 0, 1, 0;
         0, 0, 0, 1];
end
end