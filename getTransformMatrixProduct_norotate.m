function X = getTransformMatrixProduct_norotate(i,j,q,l)
% This function is used to calculate the product of multiple transformation
% matrices for coordinate frame. 
X = eye(4,4);
if j>-1 && i>-1
if j>i
    for n = i:j
        if n == 0
            X = X*eye(4,4);
        else
            X = X*getTransformMatrix_norotate(n,q,l);
        end
    end
elseif j==i

    if i == 0
        X = eye(4,4);
    else
        X = getTransformMatrix_norotate(i,q,l);
    end

else
    X = eye(4,4);
end
end
end