clear()
clf()
[F_staender,V_staender,C_staender] = loadCAD('cad/cad_staender.stl');
[F_oberarm,V_oberarm,C_oberarm] = loadCAD('cad/cad_oberarm.stl');
[F_unterarm,V_unterarm,C_unterarm] = loadCAD('cad/cad_unterarm.stl');
[F_hand, V_hand,C_hand] = loadCAD('cad/cad_Hand.stl');
[F_daumen,V_daumen,C_daumen] = loadCAD('cad/cad_Daumen.stl');
V_staender = rz(-90)*V_staender;
V_oberarm = rz(-90)*V_oberarm;
V_unterarm = rz(-90)*V_unterarm;
V_hand = rz(-90)*V_hand;
V_daumen = rz(-90)*V_daumen;

schulterDP = [0,0,700,1]';
ellbogenDP = [0,500,630,1]';
handDP = [0,1000,640,1]';
handAangle = [0,0,0];

fingerDP = [0,1055,540,1]';

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
              'SchulterDP', schulterDP,...
              'EllbogenDP', ellbogenDP,...
              'HandDP', handDP,...
              'HandA', handAangle,...
              'FingerDP', fingerDP);
Ps = initView(robo)



%for n=0:10:300
%  robo = reposSchulter(robo, -10); 
%  robo = schwenkSchulter(robo, 1);  
%  robo = schwenkEllbogen(robo,-1);
% updateStructView(robo, Ps)
%  usleep(50000)
%end

for n=0:10:90
  robo = Handbewegung(robo, 0,0,-10);
  updateStructView(robo, Ps)
  usleep(500000)
end
for n=0:10:90
  robo = Handbewegung(robo, 0,10,0);
  updateStructView(robo, Ps)
  usleep(500000)
end
for n=0:10:90
  robo = Handbewegung(robo, 10,0,0);
  updateStructView(robo, Ps)
  usleep(500000)
end
for n=0:10:90
  robo = Handbewegung(robo, 0,10,0);
  updateStructView(robo, Ps)
  usleep(500000)
end


