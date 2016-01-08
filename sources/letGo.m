function [robo] = letGo(robo)
    steps = 50;

    robo.garbageGrabed = false;

    for i = 1:steps
        robo = moveSqueezer(robo, (-40 / steps));
        updateView(robo);
        pause(0.001)
    end

    for i = 1:steps
        robo = reposSchulter(robo, ((robo.hand_len/2) /steps));
        updateView(robo);
        pause(0.01)
    end
    
    robo = turnHandFromRobotoK1(robo, robo.HandK);
    updateView(robo);
end