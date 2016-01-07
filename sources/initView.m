function robot_graphics = initView(robo, face)

    Vd_staender = robo.V_Staender(1:3,:)';
    Vd_oberarm = robo.V_Oberarm(1:3,:)';
    Vd_unterarm = robo.V_Unterarm(1:3,:)';
    Vd_hand = robo.V_Hand(1:3,:)';
    Vd_daumen = robo.V_Daumen(1:3,:)';
    Vd_garbage = robo.V_Garbage(1:3,:)';

    view(3)
    grid on

    % --- drawing the robot ---
    p_staender = patch('Faces', face.base, 'Vertices' ,Vd_staender);
    set(p_staender, 'facec', 'red');

    p_oberarm = patch('Faces', face.upperArm, 'Vertices' ,Vd_oberarm);
    set(p_oberarm, 'facec', 'blue');

    p_unterarm = patch('Faces', face.lowerArm, 'Vertices' ,Vd_unterarm);
    set(p_unterarm, 'facec', 'green');

    p_hand = patch('Faces', face.hand, 'Vertices' ,Vd_hand);
    set(p_hand, 'facec', 'blue');

    p_daumen = patch('Faces', face.thumb, 'Vertices' ,Vd_daumen);
    set(p_daumen, 'facec', 'blue');
    
    p_garbage = patch('Faces', face.garbage, 'Vertices' ,Vd_garbage);
    set(p_garbage, 'facec', 'cyan');

    xlabel('X'), ylabel('Y'), zlabel('Z');
    title('Awesome Robot');
    axis([-1200, 1200, -1200, 1200, 0, 1200]);
    daspect([1 1 1]) % Setting the aspect ratio
    drawnow

    robot_graphics = struct('p_staender', p_staender,...
                            'p_oberarm', p_oberarm,...
                            'p_unterarm', p_unterarm,...
                            'p_hand', p_hand,...
                            'p_daumen', p_daumen,...
                            'p_garbage', p_garbage)
end
