function [alpha, beta, gamma] = calcArmAngles(dest, lenA, lenB, lenC)
    % This calculates the required angles of each segment of
    % a two segmented robotic arm to get the position 'dest'
    % len(A,B,C) are the lengths of each segment
    % and 'dest' a vector to the destination
    % angle 'alpha' will correspond to the segment 'A' with length 'lenA'
    % and 'beta' will corresond to the segment 'B' with length 'lenB'
    % the same goes for gamma

    %R = lenA + lenB + (lenC/2);
    R = lenA + lenB;

    if norm(dest) > R
        return
    end

    syms A1 A2 B1 B2 X1 X2
    
    % Note: it'd be prettier if following calculations could be done using
    % radiant... but we can't due to inaccuracy of 'cos'
    % -> cos(pi/2) does not result in 0
    eqnX1 = dot(dest, [X1,X2]) == norm(dest) * (lenC/2) * cosd((norm(dest) / R) * 180);
    eqnX2 = norm([X1,X2]) == (lenC/2);
    [solvX1, solvX2] = solve([eqnX1, eqnX2], [X1, X2]);
    
    eqn1 = B1 + A1 == dest(1) + solvX1(1);
    eqn2 = B2 + A2 == dest(2) + solvX2(1);
    eqn3 = sqrt(A1^2 + A2^2) == lenA;
    eqn4 = sqrt(B1^2 + B2^2) == lenB;
    
    [solvA1, solvA2, solvB1, solvB2] = solve([eqn1, eqn2, eqn3, eqn4], [A1, A2, B1, B2]);
    alpha = atan(solvA2./solvA1);
    beta = atan(solvB2./solvB1) - alpha;
    gamma = atan(solvX2./solvX1) - beta;
end