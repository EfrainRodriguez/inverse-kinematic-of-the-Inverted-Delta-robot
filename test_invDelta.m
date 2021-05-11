clc, clf;

% robot2 = invk_invDelta([0,0,0]);
% draw_invDelta(robot2);

% create the helix path data
varv=10;
a = 0.15;
c = 5.0;
t = 0:0.1:varv*2*pi;
x = (a*t/2*pi*c).*sin(t);
y = (a*t/2*pi*c).*cos(t);
z = 35 * t/(2*pi*c);
 
for k=1:length(x)
    clc, clf;
    plot3(x(1:k),y(1:k),z(1:k),'-g');
    robot2 = invk_invDelta([x(k),y(k),z(k)]);    
    draw_invDelta(robot2);
    pause(0.001);
end