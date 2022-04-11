
//Style used for choosing clearances
s="3DPR";       //extra clearance added
//s="LAZE";       //tight tolerance

//Ouput used for choosing  output
o="3D";       //STL (3d) 
//o="LAZE";       //DXF (2d)

//i=5;    //Build all
//m="NONE";

namePieces = false;

i=1;    //Build all#m="ALL";

//i=1;    //Build all
//m="XXXX";

//i=2;    //Build all
//m="XXXX";

//i=3;    //Build all
//m="XXXX";

//i=4;    //Build all
//m="XXXX";

//i=5;    //Build all
//m="XXXX";

//i=6;    //Build all
//m="XXXX"; 

//i=7;    //Build all
//m="XXXX";

//i=8;    //Build all
//m="XXXX";

//i=9;    //Build all
//m="XXXX";

//i=10;    //Build all
//m="XXXX";

include <DYSON-working.scad>


module DYSONbuild(){

            shift = 200;

            translate([shift*0,0,0]){
                rotate([0,0,0]){
                    draw1();
                }
            }
            translate([shift*0,0,0]){
                rotate([0,0,0]){
                    draw2();
                }
            }
            translate([shift*0,0,]){
                rotate([0,0,0]){
                    draw3();
                }
            }
            translate([shift*0,0,0]){
                rotate([0,0,0]){
                    draw4();
                }
            }
            translate([shift*0,0,0]){
                rotate([0,0,0]){
                    draw5();
                }
            }
            translate([shift*0,0,]){
                rotate([0,0,0]){
                    draw6();
                }
            }
            translate([shift*0,0,0]){
                rotate([0,0,0]){                    
                    draw7();
                }
            }
            translate([shift*0,0,0]){
                rotate([0,0,0]){
                    draw8();
                }
            }
            translate([shift*0,0,0]){
                rotate([0,0,0]){
                    draw9();
                }
            }
            translate([shift*0,0,0]){
                rotate([0,0,0]){
                    draw10();
                }
            }        

}

//i=-1;
//DYSONbuild();
