Time = qrec(:,1);
TorPress = qrec(:,2);
TorMotor = qrec(:,3);
q1 = qrec(:,4);
q2 = qrec(:,5);
q3 = qrec(:,6);
qd1 = qrec(:,7);
qd2 = qrec(:,8);
qd3 = qrec(:,9);
Xend = posrec(:,1);
Yend = posrec(:,2);
lambda_ref = refs(:,1);
q1ref = refs(:,2);
pth = append(pwd,'\arcplotter.m');
addpath(pth);
mkdir(txt)
save(append(txt,'.mat'),'Time','TorPress','q1','q2','q3','qd1','qd2','qd3','Xend','Yend','q1ref','lambda','block','d_block','dd_block','TorMotor','lambda_ref','lambda_est1','k','b','c','cc','cf')
movefile(append(txt,'.mat'),txt)