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
## @deftypefn {Function File} {@var{retval} =} getZXYAngles (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Daniel Tschupp <dani@localhost.localdomain>
## Created: 2016-01-04

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


endfunction
