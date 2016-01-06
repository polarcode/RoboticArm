module Staender()
{
    color("red"){
        translate([-50,-500,0]) cube([1000,1000,5], centre=false);
        translate([0, 0, 5]) cylinder(h=1000, r=50, center=     false);
    }
}
module Oberarm()
{
    color("orange"){
        translate([0, 0, 700]) rotate([0,90,0]) cylinder(h=500,     r=30, center=false);
        translate([500, 0, 600])  cylinder(h=140, r=30, center=      false);
    }
}
module Unterarm()
{
    color("yellow"){
        translate([500, 0, 640]) rotate([0,90,0]) cylinder(h=500     , r=30, center=false);
        translate([1000, 0, 640]) sphere(r=50, center=false);
    }
}
module Hand()
{
    color("blue"){
        translate([1000, 0, 640]) rotate([0,90,0]) cylinder(h=50     , r=30, center=false);
        translate([1050, 0, 540]) cube([5,10,125], center=false);
        translate([1050, 5, 660]) cube([100,10,5], center=false);
        translate([1050, -15, 660]) cube([100,10,5], center=false);
    }
}
module Finger()
{
    color("purple"){
        translate([1055, -5, 540]) cube([95,10,5], center=false);
    }
}
module Garbage1()
{
    color("black"){
        translate([500, 300, 45]) rotate([90,0,90]) cylinder(h=200,r=40, center=false);
    }
}
module Robo()
{
    Staender();
    Oberarm();
    Unterarm();
    Hand();
    Finger();
    Garbage1();
}
$fa=40;
//Garbage1();
Robo();
//Staender();
//Oberarm();
//Unterarm();
//Hand();
//Finger();
