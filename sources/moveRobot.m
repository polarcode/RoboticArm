function [robot] = moveRobot(robot, dest_pos)
    % adjust height
    diff_height = dest_pos(3) - robot.height;
    robot.height = dest_pos(3);

    % adjust orientation
    dest_angles = calcArmAngles(dest_pos, robot.upperArm_len, robot.lowerArm_len, robot.hand_len);
    angles = dest_angles - robot.pos_angles;
    robot.pos_angles = dest_angles;
    
    if angles(1) >= 0 & abs(angles(2)) > 90
        angles(2) = 360 + angles(2);
    elseif angles(1) < 0 & abs(angles(2)) > 90
        angles(2) = angles(2) - 360;
    end
    
    steps = 50;
    for i = 1:steps
        robot = reposSchulter(robot, (diff_height /steps));
        robot = schwenkSchulter(robot, (angles(1) /steps));
        robot = schwenkEllbogen(robot, (angles(2) /steps));
        updateView(robot);
        pause(0.01)
    end
    
    robot = turnHandFromRobotoK1(robot, robot.GarbageK);
    updateView(robot);
    
    for i = 1:steps
        robot = turnHandHorizontal(robot, (90 / steps));
        updateView(robot);
        pause(0.001)
    end
    
    for i = 1:steps
        robot = turnHandVertical(robot, (-90 / steps));
        updateView(robot);
        pause(0.001)
    end
    robot = turnHandFromRobotoK1(robot, robot.EllbogenK);
    updateView(robot);
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

    syms A1 A2 B1 B2
    eqn1 = B1 + A1 == dest2D(1);
    eqn2 = B2 + A2 == dest2D(2);
    eqn3 = sqrt(A1^2 + A2^2) == lenA;
    eqn4 = sqrt(B1^2 + B2^2) == lenB;
    
    [solvA1, solvA2, solvB1, solvB2] = solve([eqn1, eqn2, eqn3, eqn4], [A1, A2, B1, B2]);
    alpha = atan2(solvA2,solvA1);
    beta = atan2(solvB2,solvB1) - alpha;
    
    angles = double([alpha(1), beta(1), 0]).*(180/pi);
end