function [robo] = turnHandAxial (robo, angle)
     
      handK = robo.HandK;
      fingerK = robo.FingerK;
      
      hand = robo.V_Hand;
      daumen = robo.V_Daumen;

      WorldKoordinates = [0 0 0 1; 1 0 0 1;0 1 0 1; 0 0 1 1]';
      rotm = getHomogenRotMatrix(WorldKoordinates, handK);
      rotm_ = inv(rotm);
      %[handAngleZ, handAngleY] = getAngles(handK);
    
      %R_ = ry(-handAngleY)*rz(-handAngleZ);  
      %R = rz(handAngleZ)*ry(handAngleY); 
    
      D = rx(angle);     
      T1 = tl(handK(1,1), handK(2,1), handK(3,1));
      T2 = tl(-handK(1,1), -handK(2,1), -handK(3,1)); 
      
      M = T1*rotm*D*rotm_*T2;    % achtung: T1 und T2 sind vertauscht, weil in view ist die Y-Achse im negativen
      %M2 = R_*T2;
      %V=handK;
      %S=T2*handK;
      %N=R_*handK;
      robo.V_Hand = M*hand;
      robo.V_Daumen = M*daumen;
      
      robo.HandK = M*handK;
      robo.FingerK = M*fingerK;
end
