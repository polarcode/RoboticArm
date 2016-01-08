function robot = schwenkSchulter(robot, angle)
    robot.V_Oberarm = rz(angle)*robot.V_Oberarm;
    robot.V_Unterarm = rz(angle)*robot.V_Unterarm;
    robot.V_Hand = rz(angle)*robot.V_Hand;
    robot.V_Daumen = rz(angle)*robot.V_Daumen;
    
    robot.EllbogenK = rz(angle)*robot.EllbogenK;
    robot.HandK = rz(angle)*robot.HandK;
    robot.FingerK = rz(angle)*robot.FingerK;
    
    if robot.garbageGrabed == true
        robot.V_Garbage = rz(angle)*robot.V_Garbage;
        robot.GarbageK = rz(angle)*robot.GarbageK;
    end
end