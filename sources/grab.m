function [robo] = grab(robo)
    steps = 50;
    robo = turnHandFromRobotoK1(robo, robo.GarbageK);
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
    
    robo.garbageGrabed = true;
end