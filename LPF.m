function yk = LPF(uk,uk1,yk1,dT,g)
% Low Pass Filter with Bilinear Transformation

    yk = (g*dT/2*(uk+uk1)-yk1*(dT*g/2-1))/(1+g*dT/2);

end