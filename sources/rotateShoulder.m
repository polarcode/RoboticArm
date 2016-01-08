function robo = rotateShoulder(robo, angle)
    robo.V_upperArm = rz(angle)*robo.V_upperArm;
    robo.V_foreArm = rz(angle)*robo.V_foreArm;
    robo.V_hand = rz(angle)*robo.V_hand;
    robo.V_thumb = rz(angle)*robo.V_thumb;
    
    robo.elbowK = rz(angle)*robo.elbowK;
    robo.handK = rz(angle)*robo.handK;
    robo.fingerK = rz(angle)*robo.fingerK;
    
    if robo.garbageGrabed == true
        robo.V_garbage = rz(angle)*robo.V_garbage;
        robo.garbageK = rz(angle)*robo.garbageK;
    end
end