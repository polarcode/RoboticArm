function [robo] = moveSqueezer (robo, moveRelative)

  %handK = robo.handK;
  fingerK = robo.fingerK;
  %hand = robo.V_hand;
  thumb = robo.V_thumb;
  
  
  WorldCoordinates = [0 0 0 1; 1 0 0 1;0 1 0 1; 0 0 1 1]';
  rotm = getHomogenRotMatrix(WorldCoordinates, fingerK);
  rotm_ = inv(rotm);
  %[handAngleZ, handAngleY] = getAngles(handK)
    
  %R = ry(-handAngleY)*rz(-handAngleZ);  
  %R_ = rz(-handAngleZ)*ry(-handAngleY);
  %[SqueezerAngleZ, SqueezerAngleY] = getAngles(fingerK)
  
  %R = ry(-SqueezerAngleY)*rz(-SqueezerAngleZ);  
  %R_ = rz(-SqueezerAngleZ)*ry(-SqueezerAngleY); 
  
  T = tl(0,0,moveRelative);  
  %T1 = tl(handK(1,1), handK(2,1), handK(3,1));
  %T2 = tl(-handK(1,1), -handK(2,1), -handK(3,1));  
  T1 = tl(fingerK(1,1), fingerK(2,1), fingerK(3,1));
  T2 = tl(-fingerK(1,1), -fingerK(2,1), -fingerK(3,1)); 
  
  M = T1*rotm*T*rotm_*T2;
  %M = T2;
  
  robo.V_thumb = M*thumb;
  robo.fingerK = M*fingerK;

end
