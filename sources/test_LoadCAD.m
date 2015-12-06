clear()
[F_staender,V_staender,C_staender] = loadCAD('cad_staender.stl');
[F_oberarm,V_oberarm,C_oberarm] = loadCAD('cad_oberarm.stl');
[F_unterarm,V_unterarm,C_unterarm] = loadCAD('cad_unterarm.stl');
[F_hand, V_hand,C_hand] = loadCAD('cad_Hand.stl');
[F_daumen,V_daumen,C_daumen] = loadCAD('cad_Daumen.stl');
V_staender = rz(-90)*V_staender;
V_oberarm = rz(-90)*V_oberarm;
V_unterarm = rz(-90)*V_unterarm;
V_hand = rz(-90)*V_hand;
V_daumen = rz(-90)*V_daumen;


Vd_staender = V_staender(1:3,:)';
Vd_oberarm = V_oberarm(1:3,:)';
Vd_unterarm = V_unterarm(1:3,:)';
Vd_hand = V_hand(1:3,:)';
Vd_daumen = V_daumen(1:3,:)';
clf;

view(3)  

p_staender = patch('Faces', F_staender, 'Vertices' ,Vd_staender);
set(p_staender, 'facec', 'red');              % Set the face color (force it)
%set(p_staender, 'facec', 'flat');            % Set the face color flat
daspect([1 1 1])                    % Setting the aspect ratio

p_oberarm = patch('Faces', F_oberarm, 'Vertices' ,Vd_oberarm);
set(p_oberarm, 'facec', 'blue');              % Set the face color (force it)
%set(p_oberarm, 'facec', 'flat');            % Set the face color flat
daspect([1 1 1])                    % Setting the aspect ratio

p_unterarm = patch('Faces', F_unterarm, 'Vertices' ,Vd_unterarm);
set(p_unterarm, 'facec', 'green');              % Set the face color (force it)
%set(p_unterarm, 'facec', 'flat');            % Set the face color flat
daspect([1 1 1])                    % Setting the aspect ratio

p_hand = patch('Faces', F_hand, 'Vertices' ,Vd_hand);
set(p_hand, 'facec', 'blue');              % Set the face color (force it)
%set(p_hand, 'facec', 'flat');            % Set the face color flat
daspect([1 1 1])                    % Setting the aspect ratio

p_daumen = patch('Faces', F_daumen, 'Vertices' ,Vd_daumen);
set(p_daumen, 'facec', 'blue');              % Set the face color (force it)
%set(p_daumen, 'facec', 'flat');            % Set the face color flat
daspect([1 1 1])                    % Setting the aspect ratio


xlabel('X'), ylabel('Y'), zlabel('Z');
title(['My awesome Robot']);
axis([-600,600,-1200,100,0,1200]);

drawnow





function Rx = rx(THETA)
% ROTATION ABOUT THE X-AXIS
%
% Rx = rx(THETA)
%
% This is the homogeneous transformation for
% rotation about the X-axis.
%
%	    NOTE:  The angle THETA must be in DEGREES.
%
THETA = THETA*pi/180;  % Note: THETA in radians.
c = cos(THETA);
s = sin(THETA);
Rx = [1 0 0 0; 0 c -s 0; 0 s c 0; 0 0 0 1];
end
%
function Ry = ry(THETA)
% ROTATION ABOUT THE Y-AXIS
%
% Ry = ry(THETA)
%
% This is the homogeneous transformation for
% rotation about the Y-axis.
%
%		NOTE: The angel THETA must be in DEGREES.
%
THETA = THETA*pi/180;  %Note: THETA is in radians.
c = cos(THETA);
s = sin(THETA);
Ry = [c 0 s 0; 0 1 0 0; -s 0 c 0; 0 0 0 1];
end
%
function Rz = rz(THETA)
% ROTATION ABOUT THE Z-AXIS
%
% Rz = rz(THETA)
%
% This is the homogeneous transformation for
% rotation about the Z-axis.
%
%		NOTE:  The angle THETA must be in DEGREES.
%
THETA = THETA*pi/180;  %Note: THETA is in radians.
c = cos(THETA);
s = sin(THETA);
Rz = [c -s 0 0; s c 0 0; 0 0 1 0; 0 0 0 1];
end
%
function T = tl(x,y,z)
% TRANSLATION ALONG THE X, Y, AND Z AXES
%
% T = tl(x,y,z)
%
% This is the homogeneous transformation for
% translation along the X, Y, and Z axes.
%
T = [1 0 0 x; 0 1 0 y; 0 0 1 z; 0 0 0 1];
end
%