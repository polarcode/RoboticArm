function updateView(robo)
    Vd_pillar = robo.V_pillar(1:3,:)';
    Vd_upperArm = robo.V_upperArm(1:3,:)';
    Vd_foreArm = robo.V_foreArm(1:3,:)';
    Vd_hand = robo.V_hand(1:3,:)';
    Vd_thumb = robo.V_thumb(1:3,:)';
    Vd_garbage = robo.V_garbage(1:3,:)';

    set(robo.graphics.p_pillar,'Vertices',Vd_pillar);
    set(robo.graphics.p_upperArm, 'Vertices',Vd_upperArm);
    set(robo.graphics.p_foreArm, 'Vertices',Vd_foreArm);
    set(robo.graphics.p_hand, 'Vertices',Vd_hand);
    set(robo.graphics.p_thumb, 'Vertices',Vd_thumb);
    set(robo.graphics.p_garbage, 'Vertices', Vd_garbage);

    drawnow
end