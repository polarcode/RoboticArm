function robo = Handbewegung(robo, angleX, angleY, angleZ)
      elbowK = robo.elbowK;
      handK = robo.handK;
      fingerK = robo.fingerK;
      
      upperArm = robo.V_upperArm;
      foreArm = robo.V_foreArm;
      hand = robo.V_hand;
      thumb = robo.V_thumb;

      %[handAngleZ, handAngleY] = getAngles(handK);
      WorldCoordinates = [0 0 0 1; 1 0 0 1;0 1 0 1; 0 0 1 1]';
      rotm = getHomogenRotMatrix(WorldCoordinates, handK);
      rotm_ = inv(rotm);
      %R_ = ry(-handAngleY)*rz(-handAngleZ);  
      %R = rz(handAngleZ)*ry(handAngleY); 
    
      D = ry(angleX)*rx(-angleY)*rz(angleZ);     
      T1 = tl(handK(1,1), handK(2,1), handK(3,1));
      T2 = tl(-handK(1,1), -handK(2,1), -handK(3,1)); 
      
      M = T1*rotm*D*rotm_*T2;
      %M2 = R_*T2;
      %V=handK;
      %S=T2*handK;
      %N=R_*handK;
      robo.V_hand = M*hand;
      robo.V_thumb = M*thumb;
      
      %robo.elbowK = M*elbowK;
      robo.handK = M*handK;
      robo.fingerK = M*fingerK;
end