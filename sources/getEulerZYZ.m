function [z1,y,z2] = getEulerZYZ(K1)
    K1 = tl(-K1(1,1), -K1(2,1), -K1(3,1))*K1;

    z1 = atan2d(K1(2,4), K1(1,4));
    y = atan2d(sqrt(K1(1,4)^2+K1(2,4)^2),K1(3,4));
    K1= ry(-y)*rz(-z1)*K1;
    
    z2 = -atan2d(K1(1,3), K1(2,3));
end