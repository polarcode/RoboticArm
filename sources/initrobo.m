clear
clf

% --- create arm ---
[face_base,V_staender] = loadCAD('cad/cad_base.stl');
[face_upperArm,V_oberarm] = loadCAD('cad/cad_upperArm.stl');
[face_lowerArm,V_unterarm] = loadCAD('cad/cad_lowerArm.stl');
[face_hand, V_hand] = loadCAD('cad/cad_hand.stl');
[face_thumb,V_daumen] = loadCAD('cad/cad_thumb.stl');

% setting internal coordinate systems
X = [0, 1, 0, 0;
     0, 0, 1, 0;
     0, 0, 0, 1;
     1, 1, 1, 1];

schulterK = tl(0,0,700)*X;
ellbogenK = tl(500,0,640)*X;
handK = tl(1000,0,640)*X;
fingerK = tl(1055,0,540)*X;


face = struct('base', face_base,...
              'upperArm', face_upperArm,...
              'lowerArm', face_lowerArm,...
              'hand', face_hand,...
              'thumb', face_thumb);

robot = struct('V_Staender', V_staender,...
              'V_Oberarm', V_oberarm,...
              'V_Unterarm',V_unterarm,...
              'V_Hand', V_hand,...
              'V_Daumen', V_daumen,...
              'SchulterK', schulterK,...
              'EllbogenK', ellbogenK,...
              'HandK', handK,...
              'FingerK', fingerK,...
              'pos_angles', [0, 0, 0],...
              'height', 640,...
              'upperArm_len', 500,...
              'lowerArm_len', 500,...
              'hand_len', 150);

robot.graphics = initView(robot, face);
robot = moveRobot(robot, [-500, 200, 100]);
pause(1)
robot = moveRobot(robot, [500, 500, 500]);
pause(1)
robot = moveRobot(robot, [1000, 0, 300]);

steps = 50;
for i = 1:steps
    %robot = reposSchulter(robot, (diff_height /steps));
    %robot = schwenkSchulter(robot, (angles(1) /steps));
    %robot = schwenkEllbogen(robot, (angles(2) /steps));
    %robot = turnHandHorizontal(robot, (angles(3) /steps));
    robot = turnHandVertical(robot, (90 /steps));
    robot = turnHandAxial(robot, (90 /steps));
    
    updateView(robot);
    pause(0.01)
end

robot = turnHandFromRobotoK1(robot, robot.EllbogenK);
updateView(robot);