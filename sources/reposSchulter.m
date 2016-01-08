function robo = reposSchulter(robo, relheight)
    robo.V_Oberarm = tl(0,0,relheight)*robo.V_Oberarm;
    robo.V_Unterarm = tl(0,0,relheight)*robo.V_Unterarm;
    robo.V_Hand = tl(0,0,relheight)*robo.V_Hand;
    robo.V_Daumen = tl(0,0,relheight)*robo.V_Daumen;

    robo.SchulterK = tl(0,0,relheight)*robo.SchulterK;
    robo.EllbogenK = tl(0,0,relheight)*robo.EllbogenK;
    robo.HandK = tl(0,0,relheight)*robo.HandK;
    robo.FingerK = tl(0,0,relheight)*robo.FingerK;

    if robo.garbageGrabed == true
        robo.V_Garbage = tl(0,0,relheight)*robo.V_Garbage;
        robo.GarbageK = tl(0,0,relheight)*robo.GarbageK;
    end
end