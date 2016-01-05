function updateView(V_staender, F_staender, V_oberarm, F_oberarm, V_unterarm, F_unterarm, V_hand, F_hand, V_daumen, F_daumen)

Vd_staender = V_staender(1:3,:)';
Vd_oberarm = V_oberarm(1:3,:)';
Vd_unterarm = V_unterarm(1:3,:)';
Vd_hand = V_hand(1:3,:)';
Vd_daumen = V_daumen(1:3,:)';
clf;

view(3)  


p_staender = patch('Faces', F_staender, 'Vertices' ,Vd_staender);
set(p_staender, 'facec', 'none');              % Set the face color (force it)
daspect([1 1 1])                    % Setting the aspect ratio

p_oberarm = patch('Faces', F_oberarm, 'Vertices' ,Vd_oberarm);
set(p_oberarm, 'facec', 'blue');              % Set the face color (force it)
%set(p_oberarm, 'facec', 'flat');            % Set the face color flat
daspect([1 1 1])                    % Setting the aspect ratio

p_unterarm = patch('Faces', F_unterarm, 'Vertices' ,Vd_unterarm);
set(p_unterarm, 'facec', 'green');              % Set the face color (force it)
%set(p_unterarm, 'facec', 'flat');            % Set the face color flat
daspect([1 1 1])                    % Setting the aspect ratio

p_hand = patch('Faces', F_hand, 'Vertices' ,Vd_hand);
set(p_hand, 'facec', 'blue');              % Set the face color (force it)
%set(p_hand, 'facec', 'flat');            % Set the face color flat
daspect([1 1 1])                    % Setting the aspect ratio

p_daumen = patch('Faces', F_daumen, 'Vertices' ,Vd_daumen);
set(p_daumen, 'facec', 'blue');              % Set the face color (force it)
%set(p_daumen, 'facec', 'flat');            % Set the face color flat
daspect([1 1 1])                    % Setting the aspect ratio


xlabel('X'), ylabel('Y'), zlabel('Z');
title(['My awesome Robot']);
axis([-600,600,-1200,100,0,1200]);

drawnow
