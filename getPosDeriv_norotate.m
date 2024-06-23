function X = getPosDeriv_norotate(i,j,q,l)
% This function is used to calculate the partial derivative position vector
% in terms of world coordinate frame. It is denoted with "drj/dqi" in the document.
if i<j
    X = getTransformMatrixProduct_norotate(0,i-1,q,l)*getTransformDeriv_norotate(i,q,l)*getLocalPosVec_norotate(j,q,l);
elseif i==j
        X = getTransformMatrixProduct_norotate(0,j-1,q,l)*getLocalPosDeriv_norotate(j,q,l);
else
        X= [0;0;0;0];
end
end