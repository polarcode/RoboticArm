function [robo] = letGo(robo)
    steps = 20;
    
    robo = turnHandFromRobotoK1(robo, robo.EllbogenK);
    updateView(robo);
    
    for i = 1:steps
        robo = turnHandAxial(robo, (90 /steps));
        updateView(robo);
        pause(0.01)
    end
    
    robo.garbageGrabed = false;

    for i = 1:steps
        robo = moveSqueezer(robo, (-40 / steps));
        updateView(robo);
        pause(0.001)
    end
    
    for i = 1:steps
        robo = reposSchulter(robo, (150 /steps));
        updateView(robo);
        pause(0.01)
    end
    
    robo = turnHandFromRobotoK1(robo, robo.EllbogenK);
    updateView(robo);
end