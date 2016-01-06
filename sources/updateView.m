function updateView(robo, Ps)

    Vd_staender = robo.V_Staender(1:3,:)';
    Vd_oberarm = robo.V_Oberarm(1:3,:)';
    Vd_unterarm = robo.V_Unterarm(1:3,:)';
    Vd_hand = robo.V_Hand(1:3,:)';
    Vd_daumen = robo.V_Daumen(1:3,:)';

    set(Ps.p_staender,'Vertices',Vd_staender);
    set(Ps.p_oberarm, 'Vertices',Vd_oberarm);
    set(Ps.p_unterarm, 'Vertices',Vd_unterarm);
    set(Ps.p_hand, 'Vertices',Vd_hand);
    set(Ps.p_daumen, 'Vertices',Vd_daumen);

    drawnow
end