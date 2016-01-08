function robo = rotateElbow(robo, angle)
    elbowK = robo.elbowK;
    handK = robo.handK;
    fingerK = robo.fingerK;
    
    M = tl(elbowK(1,1), elbowK(2,1),elbowK(3,1))*rz(angle)*tl(-elbowK(1,1),-elbowK(2,1),-elbowK(3,1));
    
    robo.V_foreArm = M*robo.V_foreArm;
    robo.V_hand = M*robo.V_hand;
    robo.V_thumb = M*robo.V_thumb;
    
    robo.elbowK = M*elbowK;
    robo.handK = M*handK;
    robo.fingerK = M*fingerK;
    

    if robo.garbageGrabed == true
        robo.V_garbage = M*robo.V_garbage;
        robo.garbageK = M*robo.garbageK;
    end
end