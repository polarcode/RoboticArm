function robo = reposSchulter(robo, relheight)
  schulternK = robo.SchulterK;
  ellbogenK = robo.EllbogenK;
  handK = robo.HandK;
  fingerK = robo.FingerK;
  
  oberarm = robo.V_Oberarm;
  unterarm = robo.V_Unterarm;
  hand = robo.V_Hand;
  daumen = robo.V_Daumen;
  
    
  robo.V_Oberarm = tl(0,0,relheight)*oberarm;
  robo.V_Unterarm = tl(0,0,relheight)*unterarm;
  robo.V_Hand = tl(0,0,relheight)*hand;
  robo.V_Daumen = tl(0,0,relheight)*daumen;
  
  robo.SchulterK = tl(0,0,relheight)*schulternK;
  robo.EllbogenK = tl(0,0,relheight)*ellbogenK;
  robo.HandK = tl(0,0,relheight)*handK;
  robo.FingerK = tl(0,0,relheight)*fingerK;

end