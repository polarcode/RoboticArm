function robo = schwenkEllbogen(robo, angle)
      unterarm = robo.V_Unterarm;
      hand = robo.V_Hand;
      daumen = robo.V_Daumen;
      ellbogenDP = robo.EllbogenDP;
      handDP = robo.HandDP;
      fingerDP = robo.FingerDP;
        
      M = tl(-ellbogenDP(1), -ellbogenDP(2),0)*rz(angle)*tl(ellbogenDP(1),ellbogenDP(2),0);
      robo.V_Unterarm = M*unterarm;
      robo.V_Hand = M*hand;
      robo.V_Daumen = M*daumen;
      robo.HandDP = M*handDP;
      robo.FingerDP = M*fingerDP;
end