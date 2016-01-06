function updateView(robo, Ps)

V_staender = robo.V_Staender;
V_oberarm = robo.V_Oberarm;
V_unterarm = robo.V_Unterarm;
V_hand = robo.V_Hand;
V_daumen = robo.V_Daumen;

F_staender = robo.F_Staender;
F_oberarm = robo.F_Oberarm;
F_unterarm = robo.F_Unterarm;
F_hand = robo.F_Hand;
F_daumen = robo.F_Daumen;

Vd_staender = V_staender(1:3,:)';
Vd_oberarm = V_oberarm(1:3,:)';
Vd_unterarm = V_unterarm(1:3,:)';
Vd_hand = V_hand(1:3,:)';
Vd_daumen = V_daumen(1:3,:)';


set(Ps.p_staender,'Vertices',Vd_staender);              % Set the face color (force it)
set(Ps.p_oberarm, 'Vertices',Vd_oberarm);              % Set the face color (force it)
set(Ps.p_unterarm, 'Vertices',Vd_unterarm);              % Set the face color (force it)
set(Ps.p_hand, 'Vertices',Vd_hand);              % Set the face color (force it)
set(Ps.p_daumen, 'Vertices',Vd_daumen);              % Set the face color (force it)

drawnow

