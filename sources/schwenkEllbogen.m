function robot = schwenkEllbogen(robot, angle)
    ellbogenK = robot.EllbogenK;
    handK = robot.HandK;
    fingerK = robot.FingerK;
    
    M = tl(ellbogenK(1,1), ellbogenK(2,1),ellbogenK(3,1))*rz(angle)*tl(-ellbogenK(1,1),-ellbogenK(2,1),-ellbogenK(3,1));
    
    robot.V_Unterarm = M*robot.V_Unterarm;
    robot.V_Hand = M*robot.V_Hand;
    robot.V_Daumen = M*robot.V_Daumen;
    
    robot.HandK = M*handK;
    robot.FingerK = M*fingerK;
    

    if robot.garbageGrabed == true
        robot.V_Garbage = M*robot.V_Garbage;
        robot.GarbageK = M*robot.GarbageK;
    end
end