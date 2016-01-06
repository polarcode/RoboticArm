function [robot] = moveRobot(robot, dest_pos)
    % adjust height
    diff_height = dest_pos(3) - robot.height;
    robot = reposSchulter(robot, diff_height);
    robot.height = dest_pos(3);

    % adjust orientation
    dest_angles = calcArmAngles(dest_pos, robot.upperArm_len, robot.lowerArm_len, robot.hand_len);
    
    angles = dest_angles - robot.pos_angles;
    robot = schwenkSchulter(robot, angles(1));
    robot = schwenkEllbogen(robot, angles(2));
    robot = turnHandHorizontal(robot, angles(3));
    robot.angles = dest_angles;
end

function [angles] = calcArmAngles(dest, lenA, lenB, lenC)
    % This calculates the required angles of each segment of
    % a two segmented robotic arm to get the position 'dest'
    %
    % len(A,B,C) are the lengths of each segment
    % and 'dest' a vector to the destination
    % angle 'alpha' will correspond to the segment 'A' with length 'lenA'
    % and 'beta' will corresond to the segment 'B' with length 'lenB'
    % the same goes for gamma

    R = lenA + lenB + (lenC/2);
    dest2D = [dest(1), dest(2)];

    if norm(dest2D) > R
        return
    end

    syms A1 A2 B1 B2 X1 X2
    
    eqnX1 = dot(dest2D, [X1,X2]) == norm(dest2D) * (lenC/2) * cosd((norm(dest2D) / R) * 180);
    eqnX2 = norm([X1,X2]) == (lenC/2);
    [solvX1, solvX2] = solve([eqnX1, eqnX2], [X1, X2]);
    pos_offset = double([solvX1(1), solvX2(1)]);
    
    dest2D = dest2D + pos_offset;
    eqn1 = B1 + A1 == dest2D(1);
    eqn2 = B2 + A2 == dest2D(2);
    eqn3 = sqrt(A1^2 + A2^2) == lenA;
    eqn4 = sqrt(B1^2 + B2^2) == lenB;
    
    [solvA1, solvA2, solvB1, solvB2] = solve([eqn1, eqn2, eqn3, eqn4], [A1, A2, B1, B2]);
    alpha = atan(solvA2./solvA1);
    beta = atan(solvB2./solvB1) - alpha;
    gamma = atan(solvX2./solvX1) - beta;
    
    % only return first solution
    %alpha = double(alpha(1)*(180/pi));
    %beta = double(beta(1)*(180/pi));
    %gamma = double(gamma(1)*(180/pi));
    
    angles = double([alpha(1), beta(1), gamma(1)]).*(180/pi);
end