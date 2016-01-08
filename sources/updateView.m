function updateView(robo)
    Vd_staender = robo.V_Staender(1:3,:)';
    Vd_oberarm = robo.V_Oberarm(1:3,:)';
    Vd_unterarm = robo.V_Unterarm(1:3,:)';
    Vd_hand = robo.V_Hand(1:3,:)';
    Vd_daumen = robo.V_Daumen(1:3,:)';
    Vd_garbage = robo.V_Garbage(1:3,:)';

    set(robo.graphics.p_staender,'Vertices',Vd_staender);
    set(robo.graphics.p_oberarm, 'Vertices',Vd_oberarm);
    set(robo.graphics.p_unterarm, 'Vertices',Vd_unterarm);
    set(robo.graphics.p_hand, 'Vertices',Vd_hand);
    set(robo.graphics.p_daumen, 'Vertices',Vd_daumen);
    set(robo.graphics.p_garbage, 'Vertices', Vd_garbage);

    drawnow
end