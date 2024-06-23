function X = getRotMatrixProduct(i,j,q)
% This function is used to calculate the product of multiple rotation
% matrices for coordinate frame. 
X = eye(4,4);
if j>-1 && i>-1
if j>i

    for n = i:j
        if n == 0
            X = X*eye(4,4);
        else
            X = X*getRotMatrix(n,q);
        end
    end

elseif j==i

    if i == 0
        X = eye(4,4);
    else
        X = getRotMatrix(i,q);
    end

else
    X = eye(4,4);
end
end

end