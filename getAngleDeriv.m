function X = getAngleDeriv(i,j)
% This function is used to calculate the partial derivative total angle vector 
% in terms of world coordinate frame.
% It is denoted with "dtheta_j/dqi" in the document.
if i>j
    X = [0;0;0];
else
    X= [0;0;1];
end
end