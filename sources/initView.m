function robot_graphics = initView(robo, face)

    Vd_pillar = robo.V_pillar(1:3,:)';
    Vd_upperArm = robo.V_upperArm(1:3,:)';
    Vd_foreArm = robo.V_foreArm(1:3,:)';
    Vd_hand = robo.V_hand(1:3,:)';
    Vd_thumb = robo.V_thumb(1:3,:)';
    Vd_garbage = robo.V_garbage(1:3,:)';

    view(3)
    grid on

    % --- drawing the robot ---
    p_pillar = patch('Faces', face.pillar, 'Vertices' ,Vd_pillar);
    set(p_pillar, 'facec', 'red');

    p_upperArm = patch('Faces', face.upperArm, 'Vertices' ,Vd_upperArm);
    set(p_upperArm, 'facec', 'blue');

    p_foreArm = patch('Faces', face.foreArm, 'Vertices' ,Vd_foreArm);
    set(p_foreArm, 'facec', 'green');

    p_hand = patch('Faces', face.hand, 'Vertices' ,Vd_hand);
    set(p_hand, 'facec', 'blue');

    p_thumb = patch('Faces', face.thumb, 'Vertices' ,Vd_thumb);
    set(p_thumb, 'facec', 'blue');
    
    p_garbage = patch('Faces', face.garbage, 'Vertices' ,Vd_garbage);
    set(p_garbage, 'facec', 'cyan');

    xlabel('X'), ylabel('Y'), zlabel('Z');
    title('Awesome Robot');
    axis([-1200, 1200, -1200, 1200, 0, 1200]);
    daspect([1 1 1]) % Setting the aspect ratio
    drawnow

    robot_graphics = struct('p_pillar', p_pillar,...
                            'p_upperArm', p_upperArm,...
                            'p_foreArm', p_foreArm,...
                            'p_hand', p_hand,...
                            'p_thumb', p_thumb,...
                            'p_garbage', p_garbage)
end
