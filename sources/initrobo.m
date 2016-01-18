clear
clf

% --- create arm ---
[face_pillar,V_pillar] = loadCAD('cad/cad_pillar.stl');
[face_upperArm,V_upperArm] = loadCAD('cad/cad_upperArm.stl');
[face_foreArm,V_foreArm] = loadCAD('cad/cad_foreArm.stl');
[face_hand, V_hand] = loadCAD('cad/cad_hand.stl');
[face_thumb,V_thumb] = loadCAD('cad/cad_thumb.stl');
[face_garbage,V_garbage] = loadCAD('cad/cad_garbage1.stl');

% setting internal coordinate systems
X = [0, 1, 0, 0;
     0, 0, 1, 0;
     0, 0, 0, 1;
     1, 1, 1, 1];

shoulderK = tl(0,0,700)*X;
elbowK = tl(500,0,640)*X;
handK = tl(1000,0,640)*X;
fingerK = tl(1055,0,540)*X;
garbageK = tl(1100,0,540)*X;


face = struct('pillar', face_pillar,...
              'upperArm', face_upperArm,...
              'foreArm', face_foreArm,...
              'hand', face_hand,...
              'thumb', face_thumb,...
              'garbage', face_garbage);

robo = struct('V_pillar', V_pillar,...
               'V_upperArm', V_upperArm,...
               'V_foreArm',V_foreArm,...
               'V_hand', V_hand,...
               'V_thumb', V_thumb,...
               'V_garbage', V_garbage,...
               'shoulderK', shoulderK,...
               'elbowK', elbowK,...
               'handK', handK,...
               'fingerK', fingerK,...
               'garbageK', garbageK,...
               'garbageGrabed', false,...
               'pos_angles', [0, 0, 0],...
               'height', 640,...
               'upperArm_len', 500,...
               'foreArm_len', 500,...
               'hand_len', 160);
           
robo_orig = robo;
face_orig = face;

while 1
    clf;
    robo = robo_orig; face = face_orig;

    robo.graphics = initView(robo, face);

    robo = moveRobo(robo, [600, 315, 85]);
    robo = grab(robo);
    robo = moveRobo(robo, [-500, -500, 600]);
    robo = moveRobo(robo, [-500, 500, 700]);
    robo = moveRobo(robo, [500, -500, 500]);

    robo = turnHandFromRoboToK1Motion(robo, robo.elbowK);
    %updateView(robo);
    for i = 1:20
        robo = turnHandAxial(robo, (90 /20));
        updateView(robo);
        pause(0.01)
    end

    robo = moveRobo(robo, [600, -600, 30]);
    robo = letGo(robo);
    robo = moveRobo(robo, [1000, 0, 570 - robo.hand_len]);
    robo = turnHandFromRoboToK1Motion(robo, robo.elbowK);
    updateView(robo);

end

