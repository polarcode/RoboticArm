function robo = reposSchulter(robo, relheight)
schulterDP = robo.SchulterDP;
    if(schulterDP(3)+relheight<1000)
      if(schulterDP(3)+relheight>140)
        oberarm = robo.V_Oberarm;
        unterarm = robo.V_Unterarm;
        hand = robo.V_Hand;
        daumen = robo.V_Daumen;
        ellbogenDP = robo.EllbogenDP;
        handDP = robo.HandDP;
        fingerDP = robo.FingerDP;
        
        robo.V_Oberarm = tl(0,0,relheight)*oberarm;
        robo.V_Unterarm = tl(0,0,relheight)*unterarm;
        robo.V_Hand = tl(0,0,relheight)*hand;
        robo.V_Daumen = tl(0,0,relheight)*daumen;
        robo.EllbogenDP = tl(0,0,relheight)*ellbogenDP;
        robo.HandDP = tl(0,0,relheight)*handDP;
        robo.FingerDP = tl(0,0,relheight)*fingerDP;
      end
    end
end