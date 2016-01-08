function [robo] = letGo(robo)
    steps = 20;

    robo.garbageGrabed = false;

    for i = 1:steps
        robo = moveSqueezer(robo, (-40 / steps));
        updateView(robo);
        pause(0.001)
    end
    
    for i = 1:steps
        robo = reposShoulder(robo, (150 /steps));
        updateView(robo);
        pause(0.01)
    end
end