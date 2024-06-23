cd(txt)
load(append(txt,'.mat'))
x = 0:0.0001:0.15;
x = x';
if c == 1
    x = 0:0.0001:0.15;
    x = x';
    block = @(x)0.04*ones(length(x),1);
end


figure
hold on,grid on
plot(Time,lambda,'k','Linewidth',2)
plot(Time,lambda_est1,'b--','Linewidth',2)
plot(Time,lambda_ref,'r--','Linewidth',2)
xlabel('Time (s)')
ylabel('\lambda (N)')
title('Reaction Force')
legend('\lambda','\lambda_{est}','\lambda_{ref}','Location','best')
% print -dpng -r300 lambda

figure
hold on, grid on
plot(Time,q1,'k','Linewidth',2)
plot(Time,q1ref,'r--','Linewidth',2)
xlabel('Time (s)')
ylabel('Angle (rad)')
title('q1')
legend('Response','Reference','Location','best')
% print -dpng -r300 q1

figure
hold on, grid on
plot(Time,q2,'k','Linewidth',2)
plot(Time,q3,'r','Linewidth',2)
xlabel('Time (s)')
ylabel('Angle (rad)')
title('q2 and q3')
legend('q2','q3','Location','best')
% print -dpng -r300 q23

figure
hold on, grid on
plot(Time,TorMotor,'k','Linewidth',2)
xlabel('Time (s)')
ylabel('Torque (Nm)')
title('Motor Input Torque')
% print -dpng -r300 Motor

figure
hold on, grid on
plot(Time,TorPress,'k','Linewidth',2)
xlabel('Time (s)')
ylabel('Torque (Nm)')
title('Pressure Torque')
% print -dpng -r300 Pressure

figure
hold on, grid on
axis([0 0.15 0 0.15])
plot(x,block(x),'r','Linewidth',2)
plot(Xend,Yend,'k','Linewidth',2)
plot(Xend(1),Yend(1),'b*','Linewidth',2)
xlabel('X Axis (m)')
ylabel('Y Axis (m)')
title('End Point Position')
legend('Block','End Point','Start','Location','best')
% print -dpng -r300 XYPos

figure
hold on, grid on
plot(Time,Yend,'k','Linewidth',2)
plot(Time,block(Xend),'r--','Linewidth',2)
xlabel('Time (s)')
ylabel('Y Position (m)')
title('End Point Position in Y Axis')
legend('End Point','Block','Location','best')
% print -dpng -r300 YPos

figure
hold on, grid on
plot(Time,Xend,'k','Linewidth',2)
xlabel('Time (s)')
ylabel('X Position (m)')
title('End Point Position in X Axis')
% print -dpng -r300 XPos