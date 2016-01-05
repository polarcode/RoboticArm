function robo = schwenkEllbogen(robo, angle)
    ellbogenK = robo.EllbogenK;
    handK = robo.HandK;
    fingerK = robo.FingerK;
    
    oberarm = robo.V_Oberarm;
    unterarm = robo.V_Unterarm;
    hand = robo.V_Hand;
    daumen = robo.V_Daumen;
    
    %[x,y,z] = getAngles(ellbogenK);
    
    %R = rx(x)*ry(y)*rz(z);
    %R_ = rx(-x)*ry(y)*rz(-z);
    
    M = tl(ellbogenK(1,1), ellbogenK(2,1),ellbogenK(3,1))*rz(angle)*tl(-ellbogenK(1,1),-ellbogenK(2,1),-ellbogenK(3,1));
    
    robo.V_Unterarm = M*unterarm;
    robo.V_Hand = M*hand;
    robo.V_Daumen = M*daumen;
    
    robo.HandK = M*handK;
    robo.FingerK = M*fingerK;
end