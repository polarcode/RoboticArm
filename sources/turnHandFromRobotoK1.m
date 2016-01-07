function [robo] = turnHandFromRobotoK1 (robo, K1)
      handK = robo.HandK;
      fingerK = robo.FingerK;
      
      hand = robo.V_Hand;
      daumen = robo.V_Daumen;

      rotm = getHomogenRotMatrix(handK,K1)
        
      EA = SpinConv('DCMtoEA123',rotm(1:3,1:3),100*eps,0)
      
      rot2 = rx(EA(1))*ry(EA(2))*rz(EA(3))   
      
      T1 = tl(handK(1,1), handK(2,1), handK(3,1));
      T2 = tl(-handK(1,1), -handK(2,1), -handK(3,1)); 
      
      M = T1*rotm*T2;
      
      robo.V_Hand = M*hand;
      robo.V_Daumen = M*daumen;
      robo.HandK = M*handK;
      robo.FingerK = M*fingerK;
      
end
