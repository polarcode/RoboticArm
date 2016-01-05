function robo = schwenkSchulter(robo, angle)
    schulternK = robo.SchulterK;
    ellbogenK = robo.EllbogenK;
    handK = robo.HandK;
    fingerK = robo.FingerK;
    
    oberarm = robo.V_Oberarm;
    unterarm = robo.V_Unterarm;
    hand = robo.V_Hand;
    daumen = robo.V_Daumen;
        
    robo.V_Oberarm = rz(angle)*oberarm;
    robo.V_Unterarm = rz(angle)*unterarm;
    robo.V_Hand = rz(angle)*hand;
    robo.V_Daumen = rz(angle)*daumen;
    
    robo.EllbogenK = rz(angle)*ellbogenK;
    robo.HandK = rz(angle)*handK;
    robo.FingerK = rz(angle)*fingerK;
end