function X = getLocalPosVec_norotate(i,q,l)
% This function is used to calculate the position vector in terms of local
% coordinate frame. It is denoted with "p" in the document.
if i>0
q = q(i);
if q == 0 % To ensure that the value does not go to infinity, the limit is taken for q=0
    X = [l;
         0;
         0;
         1];
else
X = [l*sin(q)/q;
     l/q-l*cos(q)/q;
     0;
     1];
end
else
    X=[0;0;0;1];
end
end