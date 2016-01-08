function robo = reposShoulder(robo, relHeight)
    robo.V_upperArm = tl(0,0,relHeight)*robo.V_upperArm;
    robo.V_foreArm = tl(0,0,relHeight)*robo.V_foreArm;
    robo.V_hand = tl(0,0,relHeight)*robo.V_hand;
    robo.V_thumb = tl(0,0,relHeight)*robo.V_thumb;

    robo.shoulderK = tl(0,0,relHeight)*robo.shoulderK;
    robo.elbowK = tl(0,0,relHeight)*robo.elbowK;
    robo.handK = tl(0,0,relHeight)*robo.handK;
    robo.fingerK = tl(0,0,relHeight)*robo.fingerK;

    if robo.garbageGrabed == true
        robo.V_garbage = tl(0,0,relHeight)*robo.V_garbage;
        robo.garbageK = tl(0,0,relHeight)*robo.garbageK;
    end
end