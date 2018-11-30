screw_diameter=5.25;
screwhead_diameter=9.25;
screwhead_depth=3.1;
wall=1.25;
phonex=73; // Width of phone (72) +1 
phoney=60; // From button of phone to just under first side button, this doesn't have to be accurate
phonez=10.75; // Thickness of phone (9.5) +1.25
extx=phonex+wall*2;
exty=phoney+wall;
extz=phonez+screwhead_depth+wall+wall;

rotate([90,0,0]) //Comment out this line to print laying flat
minkowski()
{
	difference(){
		
		//Exterior

																						cube([extx,exty,extz]);
		
		//Phone
		translate([wall,wall,wall+screwhead_depth])										cube([phonex,phoney,phonez]);
			
		//Remove portion blocking screen
		translate([wall*2,wall*2,extz-wall])											cube([extx-wall*4,exty-wall*2,wall]); 
		
		// USB C Power Slot
		hull(){
			translate([extx/2-14/2+8/2,-1,5+9.5/2]) rotate([-90,0,0])					cylinder(h=5,d=8,$fn=50);
			translate([extx/2+14/2-8/2,-1,5+9.5/2]) rotate([-90,0,0])					cylinder(h=5,d=8,$fn=50);
		}
		
		//Screw holes
		//x 43mm between left and right edges of screws
		//y 35mm between top and bottom edges of screws
		//4x screw holes, threaded portion
		screw_yoffset=8;
		translate([extx/2-(43-screw_diameter)/2,screw_yoffset,0])        				cylinder(wall,d=screw_diameter,$fn=50);
		translate([extx/2+(43-screw_diameter)/2,screw_yoffset,0])     					cylinder(wall,d=screw_diameter,$fn=50);
		translate([extx/2-(43-screw_diameter)/2,screw_yoffset+35-screw_diameter,0]) 	cylinder(wall,d=screw_diameter,$fn=50);
		translate([extx/2+(43-screw_diameter)/2,screw_yoffset+35-screw_diameter,0]) 	cylinder(wall,d=screw_diameter,$fn=50);
		//4x screw holes, heads
		translate([extx/2-(43-screw_diameter)/2,screw_yoffset,wall])        			cylinder(screwhead_depth,d=screwhead_diameter,$fn=50);
		translate([extx/2+(43-screw_diameter)/2,screw_yoffset,wall])     				cylinder(screwhead_depth,d=screwhead_diameter,$fn=50);
		translate([extx/2-(43-screw_diameter)/2,screw_yoffset+35-screw_diameter,wall])  cylinder(screwhead_depth,d=screwhead_diameter,$fn=50);
		translate([extx/2+(43-screw_diameter)/2,screw_yoffset+35-screw_diameter,wall])  cylinder(screwhead_depth,d=screwhead_diameter,$fn=50);
	
	
	}
	sphere(1,$fn=25);
}