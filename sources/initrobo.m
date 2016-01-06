clear
clf

% --- create arm ---
[F_staender,V_staender] = loadCAD('cad/cad_base.stl');
[F_oberarm,V_oberarm] = loadCAD('cad/cad_oberarm.stl');
[F_unterarm,V_unterarm] = loadCAD('cad/cad_unterarm.stl');
[F_hand, V_hand] = loadCAD('cad/cad_Hand.stl');
[F_daumen,V_daumen] = loadCAD('cad/cad_Daumen.stl');

V_staender = rz(-90)*V_staender;
V_oberarm = rz(-90)*V_oberarm;
V_unterarm = rz(-90)*V_unterarm;
V_hand = rz(-90)*V_hand;
V_daumen = rz(-90)*V_daumen;

X = [0,0,0,1; 1,0,0,1;0,1,0,1;0,0,1,1]';

schulterK = tl(0,0,700)*X
ellbogenK = tl(0,-500,640)*X;
handK = tl(0,-1000,640)*X;
fingerK = tl(0,-1055,540)*X;

robo = struct('V_Staender', V_staender,...
              'F_Staender', F_staender,...
              'V_Oberarm', V_oberarm,...
              'F_Oberarm', F_oberarm,...
              'V_Unterarm',V_unterarm,...
              'F_Unterarm',F_unterarm,...
              'V_Hand', V_hand,...
              'F_Hand', F_hand,...
              'V_Daumen', V_daumen,...
              'F_Daumen', F_daumen,...
              'SchulterK', schulterK,...
              'EllbogenK', ellbogenK,...
              'HandK', handK,...
              'FingerK', fingerK);
robot_graphics = initView(robo)



for n=0:10:300
  robo = reposSchulter(robo, -10); 
  robo = schwenkSchulter(robo, 1);  
  robo = schwenkEllbogen(robo,-1);
  updateView(robo, robot_graphics)
  % usleep(50000)
end

%for n=0:10:9 
%  robo = Handbewegung(robo, 50,0,0);   % Auf die seite
%  updateStructView(robo, Ps)
  %%usleep(250000)
%end


for n=0:10:40
  robo = turnHandVertical(robo, 10);    % um eigene achse drehen
  updateView(robo, robot_graphics)
  %usleep(250000)
end
for n=0:10:90
  robo = turnHandHorizontal(robo, -10);    % nach oben
  updateView(robo, robot_graphics)
  %usleep(250000)
end
for n=0:10:90
  robo = turnHandAxial(robo, 10);    % nach oben
  updateView(robo, robot_graphics)
  %usleep(250000)
end

for n=0:10:30
  robo = moveSqueezer(robo, 10);    % nach oben
  updateView(robo, robot_graphics)
  %usleep(250000)
end



WorldKoordinates = [0 0 0 1; 1 0 0 1;0 1 0 1; 0 0 1 1]';
robo = turnHandFromRobotoK1(robo, WorldKoordinates);
updateView(robo, robot_graphics)


for n=0:10:90
  robo = Handbewegung(robo, 10,0,0);    % wieder nach oben (bzw auf der anderen seite wieder runter)
  updateView(robo, robot_graphics)
  %usleep(250000)
end
  


