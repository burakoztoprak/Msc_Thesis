function X = getRotMatrix(i,q)
% This function is used to calculate the rotation matrix for coordinate frame. 
% It is denoted with "R" in the document.
if i>0
q = q(i);
X = [cos(q), -sin(q), 0, 0;
     sin(q), cos(q), 0, 0;
     0, 0, 1, 0;
     0, 0, 0, 1];
else
    X = [1, 0, 0, 0;
         0, 1, 0, 0;
         0, 0, 1, 0;
         0, 0, 0, 1];
end
end