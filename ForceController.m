function [X,e,ed,ei,eL] = ForceController(q,qd,l,m,k,b,Tff,lambda_ref,t,lambda_est1,lambda,i,tor,e1,ei1,dT,J,cf,t_wait,eL1)

    n = length(q);
    C = getCMatrix(m,q,qd,l);
    F = zeros(3,n);
    T = zeros(3,n);
    T(3,1) = Tff;
    Q = getGenForce(q,l,b,qd,F,T);
    Jwn = [0 0 0;0 0 0;0 1 1];
    FFF = C + diag(k)*q - Q - J'*lambda_ref;

    if cf == 3
        lambda = lambda_est1;
    end

    if i==1
        e = (lambda_ref - lambda(i));
        ed = 0;
        ei = 0;
    else
        e = (lambda_ref - lambda(i-1));
        ed = (e-e1)/dT;
    end
    if t<t_wait
        ei = 0;
    else
        ei = (e+e1)*dT/2 + ei1;
    end

    if t<t_wait
        eL = 0;
    else
        eL = LPF(e,e1,eL1,dT,1000);
    end


    if cf == 1
        Tc = (Jwn'*[0;0;1])\FFF;
    elseif cf == 2
            Tc = tor+0.02*eL+2*ei;
    elseif cf==3
        Tc = tor+0.02*eL+2*ei;
        else
        Tc = tor;
    end


    if Tc <0
        Tc = 0;
    end

    if t<t_wait
        X = tor;
    else
        X = Tc;
    end
end