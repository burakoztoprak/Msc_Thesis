clc
clear
close all
tic
cf = 3;
load('Sim_fixed35.mat');


% Initial values
n = 3;
l = 0.146301652822351/(n-1);

q = zeros(n,1);
qd = zeros(n,1);
qdd = zeros(n,1);
F = zeros(3,n);
T = zeros(3,n);

Area = pi*(1.5*10^-2)^2;            % m^2
h = 2.1*10^-2;                      % m

m = 83.3/1000/(n-1);
I = [10.473*10^-6,ones(1,n-1)*6704.98/(1000*100*100)/(n-1)];
Im = getInertiaMatrix(I,q);

k = [0,k];
b = [0,b];

Force = 0;
dT = 0.0001;
Time = 20;

i = 1;
t = 0:dT:Time;
qrec=zeros(length(t),2*n+3);
refs=zeros(length(t),2);
posrec = zeros(length(t),4);
lambda = ones(length(t),1)*lambda(end);
QF = zeros(length(t),3);


q = [0;q1(end);q2(end)];
qd = [0;qd1(end);qd2(end)];
tor = TorPress(end);
X = [1 0 0 0]*getPosVec(n,q,l);

lref = lambda(1);
err1 = ([0 1 0 0]*getPosVec(n,q,l)-block(X));
errInt = 0;
errInt1 = 0;
Tff1 = 0;
TFFLPF1 = 0;
qd1 = qd(1);

e1 = 0;
ed1 = 0;
ei1 = 0;
eL = 0;
T(3,n) = tor;
lambda_est1 = lambda;


t_wait = 2;
for t = 0:dT:Time

    % Multibody dynamics and controller
    X = [1 0 0 0]*getPosVec(n,q,l);
    lambda_ref = lref;
    lambda_dref = 0;
    lambda_ddref = 0;
    if t<t_wait
        mag = 0;
    else
        mag = -0.5;
    end
    refspeed = 1;
    q1ref = mag*(1-exp(-refspeed*(t-t_wait)));
    q1dref = mag*refspeed*(exp(-refspeed*(t-t_wait)));
    q1ddref = -mag*refspeed*(exp(-refspeed*(t-t_wait)));
    Jvn = getJacobianVMatrix(n,q,l);
    Jvndt = getJacobianVDerivdt(n,q,qd,l);
    F(1,n) = Force;
    C = getCMatrix(m,q,qd,l);
    M = getMassMatrix(m,q,l);
    [Tff,TFFLPF1] = TorFeedForward(q,qd,qdd,q1ref,q1dref,q1ddref,m,I,l,Tff1,t,dT,TFFLPF1);
    T(3,1) = Tff;
    lambda_est1(i) = lambda_est(q,qd,l,k,b,T(3,n),d_block);
    J = ([1 0 0]*d_block(X)-[0 1 0])*Jvn;
    Jdt = [1 0 0]*(Jvndt*d_block(X) + Jvn*([1 0 0]*Jvn*qd)*dd_block(X))  -[0 1 0]*Jvndt;
    [T(3,n),e1,ed1,ei1,eL] = ForceController(q,qd,l,m,k,b,Tff,lambda_ref,t,lambda_est1,lambda,i,tor,e1,ei1,dT,J,cf,t_wait,eL);
    Q = getGenForce(q,l,b,qd,F,T);
    err = ([0 1 0 0]*getPosVec(n,q,l)-block(X));
    errd = (err-err1)/dT;
    errInt = errInt1 + (err+err1)*dT/2;
    errInt1 = errInt;
    lambda(i)=-(J*inv(Im+M)*(J'))\(J*inv(Im+M)*(Q - C- diag(k)*q)+Jdt*qd-(2500*err+100*errd+errInt));
    qdd = (M + Im)\(Q - C - diag(k)*q+J'*lambda(i));
    q = q + qd*dT + qdd*dT^2/2;
    qd = qd + qdd*dT;
    
    % Prev values
    err1 = err;
    Tff1 = Tff;
    % Record data
    qrec(i,1) = t;
    qrec(i,2) = T(3,n);
    qrec(i,3) = T(3,1);
    posrec(i,:) = getPosVec(n,q,l);
    qrec(i,4:n+3) = q';
    qrec(i,n+4:2*n+3) = qd';
    refs(i,1) = lambda_ref;
    refs(i,2) = q1ref;
    i = i + 1;
end

txt = 'Sim_rotbase_variableblock';
Saver();
% Plotter();
arcplotter();
toc
