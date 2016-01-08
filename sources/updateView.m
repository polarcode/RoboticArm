function updateView(robot)

    Vd_staender = robot.V_Staender(1:3,:)';
    Vd_oberarm = robot.V_Oberarm(1:3,:)';
    Vd_unterarm = robot.V_Unterarm(1:3,:)';
    Vd_hand = robot.V_Hand(1:3,:)';
    Vd_daumen = robot.V_Daumen(1:3,:)';
    Vd_garbage = robot.V_Garbage(1:3,:)';

    set(robot.graphics.p_staender,'Vertices',Vd_staender);
    set(robot.graphics.p_oberarm, 'Vertices',Vd_oberarm);
    set(robot.graphics.p_unterarm, 'Vertices',Vd_unterarm);
    set(robot.graphics.p_hand, 'Vertices',Vd_hand);
    set(robot.graphics.p_daumen, 'Vertices',Vd_daumen);
    set(robot.graphics.p_garbage, 'Vertices', Vd_garbage);

    drawnow
end