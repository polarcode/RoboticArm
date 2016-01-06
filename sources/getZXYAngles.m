function [r_z r_x r_y] = getZXYAngles(KoordinatSystem)

KoordinatSystem = tl(-KoordinatSystem(1,1), -KoordinatSystem(2,1), -KoordinatSystem(3,1))*KoordinatSystem;
  
  a = KoordinatSystem(1:3,2);
  %ap = a;
  %ap(3) = 0;

 
  y=a(2);
  x=a(1);
  r_z = atan2d(y,x);
  
  a = [a;1];
  a = rz(-r_z)*a;
  

  z=a(3);
  x=a(1);
  r_x = atan2d(z,x);
  
  a = rx(-r_x)*a;
  
  z=a(3);
  x=a(1);
  r_y = -atan2d(z,x);


end
