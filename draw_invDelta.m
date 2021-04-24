%%draw robot

%robot:
%              R: 
%              r: 
%             L1: 
%             L2: 
%            phi: []
%     rotational: []
%         linear: 
%              A: [2×3 double]
%              B: [2×3 double]
%              C: [2×3 double]

%%
function draw_invDelta(robot)

    %-------fixed pivots
    for i = 1: 3
        patch([robot.A(i,1)-20, robot.A(i,1)+20, robot.A(i,1)], [robot.A(i,2), robot.A(i,2), robot.A(i,2)], [robot.A(i,3)-50, robot.A(i,3)-50, robot.A(i,3)], 'c');
        hold on
    end
    %-------joints
    for i = 1: 3
        plot3(robot.A(i,1), robot.A(i,2), robot.A(i,3), 'ob');% A
        hold on
        plot3(robot.B(i,1), robot.B(i,2), robot.B(i,3), 'ob');% B
        hold on
        plot3(robot.C(1), robot.C(2), robot.C(3), 'ob');% C
        hold on
    end
    %-------links
    for i = 1: 3
        plot3([robot.A(i,1),robot.B(i,1)], [robot.A(i,2),robot.B(i,2)], [robot.A(i,3),robot.B(i,3)], '-k');% L1
        plot3([robot.B(i,1),robot.C(1)], [robot.B(i,2),robot.C(2)], [robot.B(i,3),robot.C(3)], '-k');% L2
        hold on
    end
    
    %-------bed
    pos = [-100 -100 200 200]; 
    rectangle('Position',pos,'FaceColor',[1 0 0],'Curvature',[1 1])
    
    %axis tight
    view(45,20);
    axis([-300 300 -300 300 -200 400]);
end