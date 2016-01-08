function [robo] = turnHandFromRobotoK1 (robo, K1)
    handK = robo.HandK;
    fingerK = robo.FingerK;

    rotm = getHomogenRotMatrix(handK,K1);

    %EA = SpinConv('DCMtoEA123',rotm(1:3,1:3),100*eps,0)
    
    %rot2 = rx(EA(1))*ry(EA(2))*rz(EA(3))   

    T1 = tl(handK(1,1), handK(2,1), handK(3,1));
    T2 = tl(-handK(1,1), -handK(2,1), -handK(3,1)); 

    M = T1*rotm*T2;

    robo.V_Hand = M*robo.V_Hand;
    robo.V_Daumen = M*robo.V_Daumen;
    
    robo.HandK = M*handK;
    robo.FingerK = M*fingerK;
    
    if robo.garbageGrabed == true
        robo.V_Garbage = M*robo.V_Garbage;
        robo.GarbageK = M*robo.GarbageK;
    end
end
