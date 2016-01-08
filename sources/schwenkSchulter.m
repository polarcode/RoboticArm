function robo = schwenkSchulter(robo, angle)
    robo.V_Oberarm = rz(angle)*robo.V_Oberarm;
    robo.V_Unterarm = rz(angle)*robo.V_Unterarm;
    robo.V_Hand = rz(angle)*robo.V_Hand;
    robo.V_Daumen = rz(angle)*robo.V_Daumen;
    
    robo.EllbogenK = rz(angle)*robo.EllbogenK;
    robo.HandK = rz(angle)*robo.HandK;
    robo.FingerK = rz(angle)*robo.FingerK;
    
    if robo.garbageGrabed == true
        robo.V_Garbage = rz(angle)*robo.V_Garbage;
        robo.GarbageK = rz(angle)*robo.GarbageK;
    end
end