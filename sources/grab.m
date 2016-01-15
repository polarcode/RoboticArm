function [robo] = grab(robo)
    steps = 20;
    robo = turnHandFromRoboToK1Motion(robo, robo.garbageK);
    updateView(robo);
    
    for i = 1:steps
        robo = turnHandHorizontal(robo, (90 / steps));
        updateView(robo);
        pause(0.001)
    end
    
    for i = 1:steps
        robo = turnHandVertical(robo, (-90 / steps));
        updateView(robo);
        pause(0.001)
    end

    for i = 1:steps
        robo = reposShoulder(robo, (-(robo.hand_len/2) /steps));
        updateView(robo);
        pause(0.01)
    end
    
    for i = 1:steps
        robo = moveSqueezer(robo, (40 / steps));
        updateView(robo);
        pause(0.001)
    end
    
    robo.garbageGrabed = true;
end