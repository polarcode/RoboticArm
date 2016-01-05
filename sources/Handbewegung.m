function robo = Handbewegung(robo, angleX, angleY, angleZ)
      ellbogenK = robo.EllbogenK;
      handK = robo.HandK;
      fingerK = robo.FingerK;
      
      oberarm = robo.V_Oberarm;
      unterarm = robo.V_Unterarm;
      hand = robo.V_Hand;
      daumen = robo.V_Daumen;

      %[handAngleZ, handAngleY] = getAngles(handK);
      WorldKoordinates = [0 0 0 1; 1 0 0 1;0 1 0 1; 0 0 1 1]';
      rotm = getHomogenRotMatrix(WorldKoordinates, handK);
      rotm_ = inv(rotm);
      %R_ = ry(-handAngleY)*rz(-handAngleZ);  
      %R = rz(handAngleZ)*ry(handAngleY); 
    
      D = ry(angleX)*rx(-angleY)*rz(angleZ);     
      T1 = tl(handK(1,1), handK(2,1), handK(3,1));
      T2 = tl(-handK(1,1), -handK(2,1), -handK(3,1)); 
      
      M = T1*rotm*D*rotm_*T2;    % achtung: T1 und T2 sind vertauscht, weil in view ist die Y-Achse im negativen
      %M2 = R_*T2;
      %V=handK;
      %S=T2*handK;
      %N=R_*handK;
      robo.V_Hand = M*hand;
      robo.V_Daumen = M*daumen;
      
      %robo.EllbogenK = M*ellbogenK;
      robo.HandK = M*handK;
      robo.FingerK = M*fingerK;
end