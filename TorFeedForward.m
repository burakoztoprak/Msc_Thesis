function [X,TFFLPF] = TorFeedForward(q,qd,qdd,q1ref,q1dref,q1ddref,m,I,l,Tff1,t,dT,TFFLPF1)
% This function is used to calculate feedforward part of the DC motor torque. 

    n = length(q);
    M = getMassMatrix(m,q,l);
    Im = getInertiaMatrix(I,q);
    ZZ = zeros(1,n);
    ZZ(1) = 1;
    MM = ZZ*inv(M+Im);
    Kp = 10000;
    Kd = 200;
    e = q1ref-q(1);
    ed = q1dref - qd(1);
    Tc = (q1ddref + Kp*e + Kd*ed)/MM(1);
    g = 1500;
    TFF = Tff1 + qd(1)*g/MM(1);
    TFFLPF = LPF(TFF,Tff1,TFFLPF1,dT,g);
    Td = Tff1 - qdd(1)/MM(1);
    X = Tc+Td;

end