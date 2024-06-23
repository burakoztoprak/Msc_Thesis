function X = getPosDoubleDeriv(k,i,j,q,l)
% This function is used to calculate the second partial derivative position vector
% in terms of world coordinate frame. It is denoted with "d*(drj/dqi)/dqk" in the document.
if j > i
    if i > k
        X = getTransformMatrixProduct(0,k-1,q,l)*getTransformDeriv(k,q,l)*getTransformMatrixProduct(k+1,i-1,q,l)*getTransformDeriv(i,q,l)*getTransformMatrixProduct(i+1,j-1,q,l)*getLocalPosVec(j,q,l);
    elseif k == i
        X = getTransformMatrixProduct(0,i-1,q,l)*getTransformDoubleDeriv(i,q,l)*getTransformMatrixProduct(i+1,j-1,q,l)*getLocalPosVec(j,q,l);
    elseif j > k && k > i
        X = getTransformMatrixProduct(0,i-1,q,l)*getTransformDeriv(i,q,l)*getTransformMatrixProduct(i+1,k-1,q,l)*getTransformDeriv(k,q,l)*getTransformMatrixProduct(k+1,j-1,q,l)*getLocalPosVec(j,q,l);
    elseif j == k
        X = getTransformMatrixProduct(0,i-1,q,l)*getTransformDeriv(i,q,l)*getTransformMatrixProduct(i+1,j-1,q,l)*getLocalPosDeriv(j,q,l);
    elseif k > j
        X = [0;0;0;0];
    end
elseif i == j
    if i > k
        X = getTransformMatrixProduct(0,k-1,q,l)*getTransformDeriv(k,q,l)*getTransformMatrixProduct(k+1,j-1,q,l)*getLocalPosDeriv(j,q,l);
    elseif k == i
        X = getTransformMatrixProduct(0,j-1,q,l)*getLocalPosDoubleDeriv(j,q,l);
    elseif k > i
        X = [0;0;0;0];
    end
elseif i > j
    X = [0;0;0;0];
end
end