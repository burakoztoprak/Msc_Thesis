function X = getTransformMatrix(i,q,l)
% This function is used to calculate the transformation matrix for coordinate frame. 
% It is denoted with "A" in the document.
if i>0
    q = q(i);
    if i == 1
        X = [cos(q), -sin(q), 0, 0;
             sin(q), cos(q), 0, 0;
             0, 0, 1, 0;
             0, 0, 0, 1];
    else      
        if q == 0 % To ensure that the value does not go to infinity, the limit is taken for q=0
            X = [1, 0, 0, l;
                 0, 1, 0, 0;
                 0, 0, 1, 0;
                 0, 0, 0, 1];
        else
            X = [cos(q), -sin(q), 0, l*sin(q)/q;
                 sin(q), cos(q), 0, l/q-l*cos(q)/q;
                 0, 0, 1, 0;
                 0, 0, 0, 1];
        end
    end
else
    X = [1, 0, 0, 0;
         0, 1, 0, 0;
         0, 0, 1, 0;
         0, 0, 0, 1];
end
end