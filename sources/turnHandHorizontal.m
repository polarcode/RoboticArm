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
## @deftypefn {Function File} {@var{retval} =} turnHandHorizonal (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Daniel Tschupp <dani@localhost.localdomain>
## Created: 2016-01-03

function [robo] = turnHandHorizontal (robo, angle)
      
      handK = robo.HandK;
      fingerK = robo.FingerK;
      
      hand = robo.V_Hand;
      daumen = robo.V_Daumen;
      
      WorldKoordinates = [0 0 0 1; 1 0 0 1;0 1 0 1; 0 0 1 1]';
      rotm = getHomogenRotMatrix(WorldKoordinates, handK);
      rotm_ = inv(rotm);
      %[handAngleZ, handAngleY] = getAngles(handK);
    
      %R_ = ry(-handAngleY)*rz(-handAngleZ);  
      %R = rz(handAngleZ)*ry(handAngleY); 
    
      D = rz(angle);     
      T1 = tl(handK(1,1), handK(2,1), handK(3,1));
      T2 = tl(-handK(1,1), -handK(2,1), -handK(3,1)); 
      
      M = T1*rotm*D*rotm_*T2;    % achtung: T1 und T2 sind vertauscht, weil in view ist die Y-Achse im negativen
      %M2 = R_*T2;
      %V=handK;
      %S=T2*handK;
      %N=R_*handK;
      robo.V_Hand = M*hand;
      robo.V_Daumen = M*daumen;
      
      robo.HandK = M*handK;
      robo.FingerK = M*fingerK;
endfunction
