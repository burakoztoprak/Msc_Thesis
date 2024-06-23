cd(txt)
load('Sim_rotbase_variableblock.mat')
qrec = [zeros(length(q1),1) zeros(length(q1),1) zeros(length(q1),1) q1 q2 q3];
circr = @(radius,rad_ang)  [radius*cos(rad_ang);  radius*sin(rad_ang)];
figure(1)
i=1;
n = 3;
l = 0.146301652822351/(n-1);
x = -0.125:0.001:0;
y = block(x)-0.08;

for k = 1:500:length(qrec(:,4))
    arc_length = l;
    coords = [qrec(:,4) qrec(:,5) qrec(:,6)];
    a1 = (pi/2 + coords(k,1));
    a2 = a1 + coords(k,2);
    a3 = a2 + coords(k,3);
    
    N = 25;                                                         % Number Of Points In Complete Circle
    r_angl_1 = linspace(a1, a2, N);
    r_angl_2 = linspace(a2, a3, N);                                   % Angle Defining Arc Segment (radians)
    radius_1 = arc_length/coords(k,2);
    radius_2 = arc_length/coords(k,3);                                          % Arc Radius
    xy_r1 = circr(radius_1,r_angl_1);
    xy_r2 = circr(radius_2,r_angl_2);
    xy_r1 = xy_r1 - xy_r1(:,1);
    gap = xy_r1(:,end)-xy_r2(:,1);
    xy_r2 = xy_r2 + gap;
    plot(xy_r1(1,:), xy_r1(2,:), 'bo');hold on;grid on;
    plot(xy_r2(1,:), xy_r2(2,:), 'ro');
    plot(x,y,'r--')
    axis([-0.125 0 -0.06 0.02])
    myMovie(i) = getframe(gcf);
    if k<length(qrec(:,4))
    cla
    end
    i=i+1;
end

myAvi=VideoWriter('myvideo3.avi');
myAvi.FrameRate = 20;
open(myAvi);
writeVideo(myAvi,myMovie(1:400));
close(myAvi);