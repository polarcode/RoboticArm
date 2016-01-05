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
## @deftypefn {Function File} {@var{rotm} =} getHomogenRotMatix (@var{K0}, @var{K1})
##
## @seealso{}
## @end deftypefn

## Author: Daniel Tschupp <dani@localhost.localdomain>
## Created: 2016-01-05

function [rotm] = getHomogenRotMatrix (K0, K1)

K0 = tl(-K0(1,1), -K0(2,1), -K0(3,1))*K0;
K1 = tl(-K1(1,1), -K1(2,1), -K1(3,1))*K1;

K0 = K0(:,2:4);
K1 = K1(:,2:4);

A = [K0(1,1:3)',K0(2,1:3)',K0(3,1:3)'];

b = [K1(1,1);K1(1,2);K1(1,3)];
c = [K1(2,1);K1(2,2);K1(2,3)];
d = [K1(3,1);K1(3,2);K1(3,3)];


rotm = [(A\b)';(A\c)';(A\d)'];
rotm = [rotm ; [0 0 0]];
rotm = [rotm, [0 0 0 1]'];


endfunction
