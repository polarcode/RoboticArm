function robo = Handbewegung(robo, angleX, angleY, angleZ)
      handDP = robo.HandDP;
      handAngleX = robo.HandA(1,1);
      handAngleY = robo.HandA(1,2);
      handAngleZ = robo.HandA(1,3);
      fingerDP = robo.FingerDP;
      hand = robo.V_Hand;
      daumen = robo.V_Daumen;
  
      robo.HandA(1,1) = angleX+handAngleX;
      robo.HandA(1,2) = angleY+handAngleY;
      robo.HandA(1,3) = angleZ+handAngleZ;
   
      D = rz(angleZ)*ry(angleY)*rx(angleX);     
      T1 = tl(handDP(1), -handDP(2), handDP(3));
      T2 = tl(-handDP(1), handDP(2), -handDP(3)); 
      
      M = T1*D*T2;    % achtung: T1 und T2 sind vertauscht, weil in view ist die Y-Achse im negativen
      robo.V_Hand = M*hand;
      robo.V_Daumen = M*daumen;
      robo.FingerDP = M*fingerDP;
end