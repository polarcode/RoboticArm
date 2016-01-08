function [robo] = turnHandHorizontal (robo, angle)
    handK = robo.handK;
    fingerK = robo.fingerK;

    WorldCoordinates = [0 0 0 1; 1 0 0 1;0 1 0 1; 0 0 1 1]';
    rotm = getHomogenRotMatrix(WorldCoordinates, handK);
    rotm_ = inv(rotm);

    D = rz(angle);     
    T1 = tl(handK(1,1), handK(2,1), handK(3,1));
    T2 = tl(-handK(1,1), -handK(2,1), -handK(3,1)); 

    M = T1*rotm*D*rotm_*T2;
    robo.V_hand = M*robo.V_hand;
    robo.V_thumb = M*robo.V_thumb;

    robo.handK = M*handK;
    robo.fingerK = M*fingerK;

    if robo.garbageGrabed == true
        robo.V_garbage = M*robo.V_garbage;
        robo.garbageK = M*robo.garbageK;
    end
end