% 3D Rotation about axis 
% Marx Stampfli 18.11.2011


function main
% Angle Theta, Rotation Axis
v=[2,1,3];
e=[0,0,1];
s2=dot(v,e)/norm(v);
c2=sqrt(1-s2^2);
phi=atan2(s2,c2);
% Angle Phi axis z
vx=v(1:2);
ex=[1,0];
c3=dot(vx,ex)/norm(vx);
s3=sqrt(1-c3^2);
psi=atan2(s3,c3);
%Projection
PA=Proj*Axon;

%Object and rotated object
P=[1.2,1.4,1,1]';
Pp=PA*P;
LP=[Pp(1),Pp(2)]';
Q=ROTz(c3,s3)*P;
Qp=PA*Q;
LQ=[Qp(1),Qp(2)]';
R=ROTy(c2,s2)*Q;
Rp=PA*R;
LR=[Rp(1),Rp(2)]';

%Rotation axis 2 
w=ROTz(c3,s3)*[v,1]';
vp=PA*[v,1]';
wp=PA*w;

%Rotation v w x
n=50;
for i=1:n
  alpha=4/2*pi*i/n;
  c1= cos(alpha);
  s1= sin(alpha);
  M=PA*inv(ROTz(c3,s3))*inv(ROTy(c2,s2))*ROTx(c1,s1)*ROTy(c2,s2)*ROTz(c3,s3)*P;
  LP=[LP,[M(1),M(2)]'];
  M=PA*inv(ROTy(c2,s2))*ROTx(c1,s1)*ROTy(c2,s2)*Q;
  LQ=[LQ,[M(1),M(2)]'];
  M=PA*ROTx(c1,s1)*R;
  LR=[LR,[M(1),M(2)]'];
end;

%Coordinate Axes and Rotation axis 3
e1=PA*[3,0,0,1]';
e2=PA*[0,3,0,1]';
e3=PA*[0,0,3,1]';

%Center of rotation v
C=1/2*(P+inv(ROTz(c3,s3))*inv(ROTy(c2,s2))*ROTx(-1,0)*ROTy(c2,s2)*ROTz(c3,s3)*P);
Cp=PA*C;
Cy=PA*[0,C(2),0,1]';
Cx=PA*[C(1),C(2),0,1]';


%Center of rotation w
D=1/2*(Q+inv(ROTy(c2,s2))*ROTx(-1,0)*ROTy(c2,s2)*Q);
Dp=PA*D;
Dx=PA*[D(1),D(2),0,1]';

LZ=[Dp(1),Dp(2)]';
LY=[Cp(1),Cp(2)]';
%Rotation z w y
n=50;
for i=1:n
  alpha=psi*i/n;
  c1= cos(alpha);
  s1= sin(alpha);
  M=PA*ROTz(c1,s1)*C;
  LY=[LY,[M(1),M(2)]'];
  alpha=phi*i/n;
  c1= cos(alpha);
  s1= sin(alpha);
  M=PA*ROTy(c1,s1)*D;
  LZ=[LZ,[M(1),M(2)]'];
end;

%Center of rotation x
E=1/2*(R+ROTx(-1,0)*R);
Ep=PA*E;


%Center of rotation z
Fp=PA*[0,0,C(3),1]';

%Graphics
plot([Cp(1),LP(1,10),Cp(1),LP(1,20)],[Cp(2),LP(2,10),Cp(2),LP(2,20)],'r','linewidth',1)
hold on

plot(LP(1,:),LP(2,:),'r','linewidth',5,'MarkerSize',2)
plot([LP(1,10),LP(1,20)],[LP(2,10),LP(2,20)],'ok','linewidth',5,'MarkerSize',2)
%plot(LR(1,:),LR(2,:),'ob','linewidth',2,'MarkerSize',2)

%plot(LZ(1,:),LZ(2,:),'k','linewidth',1)
%plot(LY(1,:),LY(2,:),'k','linewidth',1)


plot([0,vp(1)],[0,vp(2)],'b','LineWidth',5)
%plot([0,wp(1)],[0,wp(2)],'g','linewidth',3)
plot([0,e1(1)],[0,e1(2)],'k','linewidth',1)
plot([0,e2(1)],[0,e2(2)],'k','linewidth',1)
plot([0,e3(1)],[0,e3(2)],'k','linewidth',1)

plot(Cp(1),Cp(2),'ok','linewidth',5,'MarkerSize',2)
% plot([0,Cy(1)],[0,Cy(2)],'k','LineWidth',1)
 plot([Cy(1),Cx(1)],[Cy(2),Cx(2)],'k','LineWidth',1)
 plot([Cx(1),Cp(1)],[Cx(2),Cp(2)],'k','LineWidth',1)

%plot(Dp(1),Dp(2),'og','linewidth',5,'MarkerSize',2)
%plot([0,Dx(1)],[0,Dx(2)],'k','LineWidth',1)
%plot([Dx(1),Dp(1)],[Dx(2),Dp(2)],'k','LineWidth',1)

%plot(Ep(1),Ep(2),'ob','linewidth',5,'MarkerSize',2)
%plot([0,Ep(1)],[0,Ep(2)],'k','LineWidth',1)

%plot([Cp(1),Fp(1),Dp(1)],[Cp(2),Fp(2),Dp(2)],'k','LineWidth',1)

axis([-2,2,-1.5,2.5],'square')

% %print
% %set (gca(), "XTickLabel", "","YTickLabel","")
% print('figRotation3Ddid.png','-dpng')
hold off
end

function T=ROTx(c1,s1)

T  =     [ 1  0   0  0;
           0  c1 -s1 0;
           0  s1  c1 0; 
           0  0   0  1];
end   
function T=ROTy(c2,s2)       
T   =    [ c2  0  s2 0;
           0   1  0  0;  
          -s2  0  c2 0;
           0   0  0  1];
end
function T=ROTz(c3,s3)
T	=	 [ c3  s3 0  0;
		  -s3  c3 0  0;
           0   0  1  0;  
           0   0  0  1];
end
function T=Axon
T	=	 [-1/sqrt(2)   1/sqrt(2) 0         0;
		  -1/sqrt(6)  -1/sqrt(6) sqrt(2/3) 0;
           1/sqrt(3)   1/sqrt(3) 1/sqrt(3) 0;  
           0           0         0         1];
end
function T=Proj
T	=	 [1 0 0 0;
          0 1 0 0];
end