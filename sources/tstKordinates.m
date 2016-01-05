clear%Koordinates = [0 0 0 1; 1 0 0 1; 0 1 0 1; 0 0 1 1]'
clf
P = [0 0 0 1; 10 0 0 1;0 10 0 1; 0 0 10 1]'

P(1,1)
P(1,2)
P(1,3)
P(2,1)
P(2,2)
P(2,3)

%[r_z, r_x, r_y] = getZXYAngles(P)



%M = rz(-r_z)*P
%R = ry(-r_y)*M

%M = ry(-r_y)*rx(-r_x)*rz(-r_z);

%P = M*P

%M = rz(r_z)*rx(r_x)*ry(r_y);

%P= M*P
%E = [0 0 0 1;1 0 0 1]'
%E = rx(30)*ry(40)*rz(50)*E
%[r_z, r_y] = getAngles(E)

M = rz(90)*rx(90)*ry(90)

O = tl(10,20,30)*M*P



rot = getHomogenRotMatrix(P,O)


rot_ = inv(rot)

E = rot_*tl(-10,-20,-30)*O

E-P

M = rot*P

rot = rot./10
O=rot*P
for n=0:1:9
O=rot*O
end
O




