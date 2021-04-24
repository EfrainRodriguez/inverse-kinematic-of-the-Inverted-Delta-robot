%%
% inverse kinematics of the inverted Delta robot

%%
function robot = invk_invDelta(position)

    %initializing robot
    robot = init_invDelta();

    %end-effector points
    Px = position(1);
    Py = position(2);
    Pz = position(3);
    
    %fixed pivots
    for i = 1: 3
        omega = (2 * i - 2) * pi / 3;
        A(i,:) = [robot.R * cos(omega), robot.R * sin(omega), 0];
    end
    
    %shadow line
    for i = 1: 3
        s(i) = sqrt((A(i,1) - Px) ^ 2 + (A(i,2) - Py) ^ 2);
        phi(i) = atan2(A(i,2) - Py, A(i,1) - Px);
    end
    
    %imaginary line
    for i = 1: 3
        h(i) = sqrt(Pz ^ 2 + s(i) ^ 2);
        alpha(i) = atan2(Pz, s(i));
        beta(i) = acos((robot.L2 ^ 2 - robot.L1 ^ 2 - h(i)) / (-2 * robot.L1 * h(i)));
    end
    
    %elbow point
    for i = 1: 3
        B(i,:) = [A(i,1) + (robot.L1 * cos(pi - alpha(i) - beta(i))) * cos(phi(i)),...
                  A(i,2) + (robot.L1 * cos(pi - alpha(i) - beta(i))) * sin(phi(i)),...
                  robot.L1 * sin(pi - alpha(i) - beta(i))];
    end
    
    %joint positions
    robot.A = A;
    robot.B = B;
    robot.C = position;

end