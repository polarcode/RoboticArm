clear
clf

% --- create arm ---
[face_base,V_staender] = loadCAD('cad/cad_base.stl');
[face_upperArm,V_oberarm] = loadCAD('cad/cad_upperArm.stl');
[face_lowerArm,V_unterarm] = loadCAD('cad/cad_lowerArm.stl');
[face_hand, V_hand] = loadCAD('cad/cad_hand.stl');
[face_thumb,V_daumen] = loadCAD('cad/cad_thumb.stl');

% rotating everything for better view
V_staender = rz(-90)*V_staender;
V_oberarm = rz(-90)*V_oberarm;
V_unterarm = rz(-90)*V_unterarm;
V_hand = rz(-90)*V_hand;
V_daumen = rz(-90)*V_daumen;

% setting internal coordinate systems
X = [0, 0, 0, 1;
     1, 0, 0, 1;
     0, 1, 0, 1;
     0, 0, 1, 1]';

schulterK = tl(0,0,700)*X;
ellbogenK = tl(0,-500,640)*X;
handK = tl(0,-1000,640)*X;
fingerK = tl(0,-1055,540)*X;

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
              'pos_angles', [90, 0, 0],...
              'height', 640,...
              'upperArm_len', 500,...
              'lowerArm_len', 500,...
              'hand_len', 150);

robot_graphics = initView(robot, face);


robot = moveRobot(robot, [-500, 200, 100]);
updateView(robot, robot_graphics)
pause(10)
robot = moveRobot(robot, [500, 500, 500]);
updateView(robot, robot_graphics)
pause(10)
robot = moveRobot(robot, [1000, 0, 300]);
updateView(robot, robot_graphics)
