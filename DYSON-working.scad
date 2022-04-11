


include <OPSC-base.scad>
include <DYSON-library.scad>




OPSCbuild(shift=200);

// ZZZZ
// Description
module draw1(){
    color="green";
    oiii(type="dysonV6", color= color);  
}

// ZZZZ
// Description
module draw2(){
    color="orange";
    drawDysonV6Battery(color);
    
}

// ZZZZ
// Description
module draw3(){
    color="yellow";
    drawDysonV6Handle(color);
}

// ZZZZ
// Description
module draw4(){
    color="yellow";
    drawDysonV6DustBin(color);
}

// ZZZZ
// Description
module draw5(){
    color="blue";
    drawDysonBatteryClipBolt(color);
    
}

// ZZZZ
// Description
module draw6(){
    color="purple";
    translate([0,0,30]){
    intersection(){
        //testBlock Dimensions
        testBlockWidth = 30;
        testBlockHeight = 15;
        testBlockDepth = 14;
        testBlockX = -90;
        testBlockY = 0;
        testBlockZ = 4;
        oi("cubeRounded",x=testBlockX,y=testBlockY,z=testBlockZ,width=testBlockWidth,height=testBlockHeight,depth=testBlockDepth,color=color);
        drawDysonV6Battery(color);
        
    }
    }
}
// ZZZZ
// Description
module draw7(){
    color="gray";
     translate([0,0,100]){
        intersection(){
            //testBlock Dimensions
            testBlockWidth = 60;
            testBlockHeight = 40;
            testBlockDepth = 150;
            testBlockX = -115;
            testBlockY = 0;
            testBlockZ = testBlockDepth-12;
            oi("cubeRounded",x=testBlockX,y=testBlockY,z=testBlockZ,width=testBlockWidth,height=testBlockHeight,depth=testBlockDepth,color=color);
            difference(){
                drawDysonV6Battery(color);
                //drawDysonV6Battery(color,batteryTerminalClearance=true);
            }
        }
    }
}

// ZZZZ
// Description
module draw8(){
    color="white";
    //////test5 oi
    oii("cube","test5",color);

    translate([0,0,40]){
        intersection(){        
            thick = 100;
            width=60;
            height=35;
            depth=thick;       
            x=-width+33;
            y=0;
            z=thick-3;
//////cutout dimensions
            cutoutW = width-70;
            cutoutH = height-10;
            cutoutD = depth;
            cutoutX = x-16;
            cutoutY = y;
            cutoutZ = z;
         
            oi("cubeRounded",x=x,y=y,z=z,width=width,height=height,depth=depth,color=color);
            difference(){
                drawDysonV6Battery(color);
//////cutout oi
                oi("cubeRounded",x=cutoutX,y=cutoutY,z=cutoutZ,width=cutoutW,height=cutoutH,depth=cutoutD,color=color,name="cutout");
        }

        }
    }
}

// ZZZZ
// Description
module draw9(){
    color="orange";
    translate([0,0,30]){
    intersection(){
        //testBlock Dimensions
        testBlockWidth = 30;
        testBlockHeight = 40;
        testBlockDepth = 14;
        testBlockX = -90;
        testBlockY = 0;
        testBlockZ = 4;
        oi("cubeRounded",x=testBlockX,y=testBlockY,z=testBlockZ,width=testBlockWidth,height=testBlockHeight,depth=testBlockDepth,color=color);
        drawDysonV6Battery(color);
        
    }
    }
}

// ZZZZ
// Description
module draw10(){
    color="pink";
    //////test5 oi
    oii("cube","test5",color);

//////mainPiece dimensions
    mainPieceW = 110;
    mainPieceH = 35;
    mainPieceD = 15;
    mainPieceX = -mainPieceW+60;
    mainPieceY = 0;
    mainPieceZ = mainPieceD-10;
//////cutout dimensions
    cutoutW = mainPieceW;
    cutoutH = mainPieceH;
    cutoutD = 100;
    cutoutX = mainPieceW/2-80;
    cutoutY = 0;
    cutoutZ = mainPieceZ-6;

    


    translate([0,0,20]){
        intersection(){ 
//////mainPiece oi            
            oi("cubeRounded",x=mainPieceX,y=mainPieceY,z=mainPieceZ,width=mainPieceW,height=mainPieceH,depth=mainPieceD,color=color,name="mainPiece");
            difference(){
                drawDysonV6Battery(color);
//////cutout oi
                #oi("cube",x=cutoutX,y=cutoutY,z=cutoutZ,width=cutoutW,height=cutoutH,depth=cutoutD,color=color,name="cutout");
        }

        }
    }
}



module test(){
    //OPSCInsert("OSPCHole",100,0,0);
    //OPSCInsert("holeM3");
    //OPSCInsert("OPSCHoleSlot",x=50,rad=5,rotZ=45);
    //OPSCInsert("M3SocketHeadFull",0,0,0);
    //OPSCInsert("M3SocketHead",0,0,0,length=25);
    //OPSCInsert("cubeRounded",width=20,height=20,depth=6,rad=5);
   //OPSCInsert("cylinder",rad=20,depth=6); //OPSCInsert("cube",width=20,height=20,depth=6,rad=5,alpha=0.3,color="red");
    
}

module ZZZZinsert(item,x=0,y=0,z=0,ex=0,length=0,rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=0,rad=0,color="gray",alpha=1,clearance=0,offset=0){
    color(color,alpha){
            translate([x,y,z]){
                rotate([rotX,rotY,rotZ]){    
                    if(item=="OPSCtest"){
                }
            }
        }
    }
}
