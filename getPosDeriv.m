function X = getPosDeriv(i,j,q,l)
% This function is used to calculate the partial derivative position vector
% in terms of world coordinate frame. It is denoted with "drj/dqi" in the document.
if i<j
    X = getTransformMatrixProduct(0,i-1,q,l)*getTransformDeriv(i,q,l)*getLocalPosVec(j,q,l);
elseif i==j
        X = getTransformMatrixProduct(0,j-1,q,l)*getLocalPosDeriv(j,q,l);
else
        X= [0;0;0;0];
end
end