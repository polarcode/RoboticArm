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
## @deftypefn {Function File} {@var{retval} =} turnFromK0toK1 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Daniel Tschupp <dani@localhost.localdomain>
## Created: 2016-01-05

function [robo] = turnHandFromRobotoK1 (robo, K1)
      handK = robo.HandK;
      fingerK = robo.FingerK;
      
      hand = robo.V_Hand;
      daumen = robo.V_Daumen;

      rotm = getHomogenRotMatrix(handK,K1);

      T1 = tl(handK(1,1), handK(2,1), handK(3,1));
      T2 = tl(-handK(1,1), -handK(2,1), -handK(3,1)); 
      
      M = T1*rotm*T2;
      
      robo.V_Hand = M*hand;
      robo.V_Daumen = M*daumen;
      robo.HandK = M*handK;
      robo.FingerK = M*fingerK;
      
endfunction
