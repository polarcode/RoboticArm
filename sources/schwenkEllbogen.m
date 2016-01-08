function robo = schwenkEllbogen(robo, angle)
    ellbogenK = robo.EllbogenK;
    handK = robo.HandK;
    fingerK = robo.FingerK;
    
    M = tl(ellbogenK(1,1), ellbogenK(2,1),ellbogenK(3,1))*rz(angle)*tl(-ellbogenK(1,1),-ellbogenK(2,1),-ellbogenK(3,1));
    
    robo.V_Unterarm = M*robo.V_Unterarm;
    robo.V_Hand = M*robo.V_Hand;
    robo.V_Daumen = M*robo.V_Daumen;
    
    robo.HandK = M*handK;
    robo.FingerK = M*fingerK;
    

    if robo.garbageGrabed == true
        robo.V_Garbage = M*robo.V_Garbage;
        robo.GarbageK = M*robo.GarbageK;
    end
end