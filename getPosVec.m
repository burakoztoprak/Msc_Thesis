function X = getPosVec(i,q,l)
% This function is used to calculate the position vector in terms of world
% coordinate frame. It is denoted with "r" in the document.
if i>0
    X = getTransformMatrixProduct(0,i-1,q,l)*getLocalPosVec(i,q,l);
else
    X= [0;0;0;1];
end
end