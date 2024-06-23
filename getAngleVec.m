function X = getAngleVec(i,q)
% This function is used to calculate the total angle vector in terms of world
% coordinate frame. It is denoted with "theta_i" in the document.
if i>0
    X = [0;0;sum(q(1:i))];
else
    X= [0;0;0];
end
end