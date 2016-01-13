function [robo] = turnHandFromRoboToK1Motion (robo, K1)
    steps = 10;
    
    handK = robo.handK;
    fingerK = robo.fingerK;
    garbageK = robo.garbageK;
    V_hand = robo.V_hand;
    V_thumb = robo.V_thumb;
    V_garbage = robo.V_garbage;
    
    [z1,y,z2] = getEulerZYZ(robo.handK)
    [z12,y2,z22] = getEulerZYZ(K1)
    
    %rot2 = rz(z12)*ry(y2)*rz(-z2+z22)*ry(-y)*rz(-z1);
    T1 = tl(robo.handK(1,1), robo.handK(2,1), robo.handK(3,1));
    T2 = tl(-robo.handK(1,1), -robo.handK(2,1), -robo.handK(3,1));
    
    for n=1:steps
        rot2 = rz(n*z12/steps)*ry(n*y2/steps)*rz(n*(-z2+z22)/steps)*ry(n*-y/steps)*rz(n*-z1/steps);
        M=T1*rot2*T2;
        robo.V_hand = M*V_hand;
        robo.V_thumb = M*V_thumb;
    
        robo.handK = M*handK;
        robo.fingerK = M*fingerK;
    
        if robo.garbageGrabed == true
            robo.V_garbage = M*V_garbage;
            robo.garbageK = M*garbageK;
        end 
        updateView(robo)
        pause(0.001)
    end
    
end
