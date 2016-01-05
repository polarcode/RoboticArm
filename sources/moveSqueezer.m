## Copyright (C) 2016 Daniel Tschupp
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{robo} =} moveSqueezer (@var{robo}, @var{moveRelative})
##
## @seealso{}
## @end deftypefn

## Author: Daniel Tschupp <dani@localhost.localdomain>
## Created: 2016-01-03

function [robo] = moveSqueezer (robo, moveRelaive)

  %handK = robo.HandK;
  fingerK = robo.FingerK;
  %hand = robo.V_Hand;
  daumen = robo.V_Daumen;
  
  
  WorldKoordinates = [0 0 0 1; 1 0 0 1;0 1 0 1; 0 0 1 1]';
  rotm = getHomogenRotMatrix(WorldKoordinates, fingerK);
  rotm_ = inv(rotm);
  %[handAngleZ, handAngleY] = getAngles(handK)
    
  %R = ry(-handAngleY)*rz(-handAngleZ);  
  %R_ = rz(-handAngleZ)*ry(-handAngleY);
  %[SqueezerAngleZ, SqueezerAngleY] = getAngles(fingerK)
  
  %R = ry(-SqueezerAngleY)*rz(-SqueezerAngleZ);  
  %R_ = rz(-SqueezerAngleZ)*ry(-SqueezerAngleY); 
  
  T = tl(0,0,moveRelaive);  
  %T1 = tl(handK(1,1), handK(2,1), handK(3,1));
  %T2 = tl(-handK(1,1), -handK(2,1), -handK(3,1));  
  T1 = tl(fingerK(1,1), fingerK(2,1), fingerK(3,1));
  T2 = tl(-fingerK(1,1), -fingerK(2,1), -fingerK(3,1)); 
  
  M = T1*rotm*T*rotm_*T2;
  %M = T2;
  
  robo.V_Daumen = M*daumen;
  robo.FingerK = M*fingerK;

endfunction
