function robo = schwenkSchulter(robo, angle)
  if(angle >= -90)
    if(angle <=90)
      oberarm = robo.V_Oberarm;
      unterarm = robo.V_Unterarm;
      hand = robo.V_Hand;
      daumen = robo.V_Daumen;
      ellbogenDP = robo.EllbogenDP;
      handDP = robo.HandDP;
      fingerDP = robo.FingerDP;
        
      robo.V_Oberarm = rz(angle)*oberarm;
      robo.V_Unterarm = rz(angle)*unterarm;
      robo.V_Hand = rz(angle)*hand;
      robo.V_Daumen = rz(angle)*daumen;
      robo.EllbogenDP = rz(angle)*ellbogenDP;
      robo.HandDP = rz(angle)*handDP;
      robo.FingerDP = rz(angle)*fingerDP;
    end
  end
end