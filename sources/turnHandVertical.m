function [robo] = turnHandVertical (robo, angle)
    handK = robo.HandK;
    fingerK = robo.FingerK;

    WorldKoordinates = [0 0 0 1; 1 0 0 1;0 1 0 1; 0 0 1 1]';
    rotm = getHomogenRotMatrix(WorldKoordinates, handK);
    rotm_ = inv(rotm);

    D = ry(-angle);     
    T1 = tl(handK(1,1), handK(2,1), handK(3,1));
    T2 = tl(-handK(1,1), -handK(2,1), -handK(3,1)); 

    M = T1*rotm*D*rotm_*T2;

    robo.V_Hand = M*robo.V_Hand;
    robo.V_Daumen = M*robo.V_Daumen;

    robo.HandK = M*handK;
    robo.FingerK = M*fingerK;

    if robo.garbageGrabed == true
        robo.V_Garbage = M*robo.V_Garbage;
        robo.GarbageK = M*robo.GarbageK;
    end
end
