function [alpha, beta] = calcArmAngles(x, lenA, lenB)
    % This calculates the required angles of each segment of
    % a two segmented robotic arm to get the position 'x'
    % in respect to the x axis
    % len(A,B) are the lengths of each segment
    % and 'x' a vector to the destination
    % angle 'alpha' will correspond to the segment 'A' with length 'lenA'
    % and 'beta' will corresond to the segment 'B' with length 'lenB'

    if norm(x) > (lenA + lenB)
        return
    end

    syms A1 A2 B1 B2
    
    eqn1 = B1 + A1 == x(1);
    eqn2 = B2 + A2 == x(2);
    eqn3 = sqrt(A1^2 + A2^2) == lenA;
    eqn4 = sqrt(B1^2 + B2^2) == lenB;
    
    [solvA1, solvA2, solvB1, solvB2] = solve([eqn1, eqn2, eqn3, eqn4], [A1, A2, B1, B2]);
    alpha = atan(solvA2./solvA1);
    beta = atan(solvB2./solvB1);
end