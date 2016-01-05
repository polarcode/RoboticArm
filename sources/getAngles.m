%function [yz_x xz_y xy_z] = getAngles(KoordinatSystem)
function [r_z, r_y] = getAngles(KoordinatSystem)
  KoordinatSystem = tl(-KoordinatSystem(1,1), -KoordinatSystem(2,1), -KoordinatSystem(3,1))*KoordinatSystem;
  
  a = KoordinatSystem(1:3,2);
  %ap = a;
  %ap(3) = 0;

  if(a(1) ~= 0)
    y=a(2);
    x=a(1);
    r_z = atan2d(y,x);
  else
    if(a(1)<0)
      r_z = -90;
    else
      r_z = 90;
    end
  end
  
  a = [a;1];
  a = rz(-r_z)*a;
  
  if(a(1) ~= 0)
    z=a(3);
    x=a(1);
    r_y = -atan2d(z,x);
  else
    if(a(1)<0)
      r_y = 90;
    else
      r_y = -90;
    end
  end
  
end 