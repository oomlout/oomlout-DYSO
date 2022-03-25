


include <OPSC-base.scad>




OPSCbuild(shift=200);

// ZZZZ
// Description
module draw1(){
    color="green";
    drawDysonV6(color);    
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
    
}

// ZZZZ
// Description
module draw4(){
    color="green";
    
}

// ZZZZ
// Description
module draw5(){
    color="blue";
    
}

// ZZZZ
// Description
module draw6(){
    color="purple";
    
}

// ZZZZ
// Description
module draw7(){
    color="gray";
    
}

// ZZZZ
// Description
module draw8(){
    color="white";
    translate([0,0,100]){
        intersection(){
            //testBlock Dimensions
            testBlockWidth = 60-8;
            testBlockHeight = 40-12;
            testBlockDepth = 150;
            testBlockX = -55;
            testBlockY = 0;
            testBlockZ = testBlockDepth-6+2.25;
            oi("cubeRounded",x=testBlockX,y=testBlockY,z=testBlockZ,width=testBlockWidth,height=testBlockHeight,depth=testBlockDepth,color=color);
            difference(){
                drawDysonV6Battery(color);
                drawDysonV6Battery(color,batteryTerminalClearance=true);
            }
        }
    }
}

// ZZZZ
// Description
module draw9(){
    color="gray";
    difference(){
        //testBlock Dimensions
        testBlockWidth = 50;
        testBlockHeight = 40;
        testBlockDepth = 10;
        testBlockX = -52;
        testBlockY = 0;
        testBlockZ = 6;
        oi("cubeRounded",x=testBlockX,y=testBlockY,z=testBlockZ,width=testBlockWidth,height=testBlockHeight,depth=testBlockDepth,color=color);
        
        drawDysonV6Battery(color,clearance=0.5);
    }
}

// ZZZZ
// Description
module draw10(){
    color="pink";
    translate([0,0,20]){
        difference(){        
            thick = 5;
            width=110;
            height=35;
            depth=thick;       
            x=-width/2+5;
            y=0;
            z=thick/2;
            
            oi("cubeRounded",x=x,y=y,z=z,width=width,height=height,depth=depth,color=color);
            drawDysonV6(color,bottomClearance=true);
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

module drawDysonV6(color="red",bottomClearance=false){
    handleDiameter=28.5;
    bottomPieceWidth=99;
    
    union(){ //to add batery screw bump
        difference(){ // to slice off anything below 0
            union(){
//BARREL
                barrelDiameter=70;
                barrelLength=96;
                barrelZ=130;
                barrelX=-(bottomPieceWidth-barrelLength);
                oi("cylinder",x=barrelX,y=0,z=barrelZ,rad=barrelDiameter/2,rotY=90,depth=barrelLength,color=color);
                
//HANDLE
                handleWidth=42.5;
                
                //handleDiameter=1;
                handleDepth = 120;
                //triangle, 20mm shift over 90mm 12.5 deg
                //https://www.omnicalculator.com/math/right-triangle-side-angle
                handleTilt=12.53;
                handleX=-44;
                handleZ=(handleDepth-20);
                oi("cubeRounded",x=handleX,y=0,z=handleZ,rad=handleDiameter/2,depth=handleDepth,height=handleDiameter,width=handleWidth,rotY=-handleTilt,color=color);
                
                //Front Support
                //base piece
                fsBaseHeight=handleDiameter;
                fsBaseWidth=13.5;
                fsBaseDepth=20;
                fsBaseZ=18.5;
                fsBaseX=-bottomPieceWidth+fsBaseWidth/2;
                oi("cube",x=fsBaseX,y=0,z=fsBaseZ,width=fsBaseWidth,height=fsBaseHeight,depth=fsBaseDepth,color=color);
                //main piece            
                fsExtra=8;
                fsMainHeight=handleDiameter;
                fsMainWidth=9;
                fsMainDepth=95+fsExtra;
                fsMainZ=fsMainDepth;
                fsMainX=fsBaseX-((fsBaseWidth-fsMainWidth)/2);
                oi("cube",x=fsMainX,y=0,z=fsMainZ,width=fsMainWidth,height=fsMainHeight,depth=fsMainDepth,color=color);
                
                //bottom Piece
                bottomExtra= bottomClearance ? 100 : 0;
                bottomHeight=handleDiameter;
                bottomWidth=bottomPieceWidth-handleDiameter/2;
                bottomDepth=4.5+bottomExtra;
                bottomZ=bottomDepth;
                bottomX=-bottomWidth/2-handleDiameter/2;
                oi("cube",x=bottomX,y=0,z=bottomZ,width=bottomWidth,height=bottomHeight,depth=bottomDepth,color=color);
                
                
            }   
                //remove the overhang out the bottom
                oi("cube",x=0,y=0,z=0,width=1000,height=1000,depth=100,color=color);
        }
        //battery screw bump
        //main
        bsbMainHeight=handleDiameter;
        bsbMainWidth=13.5;
        bsbMainDepth=2.5;
        bsbMainZ=0;
        bsbMainX=-bottomPieceWidth+bsbMainWidth/2;
        oi("cube",x=bsbMainX,y=0,z=bsbMainZ,width=bsbMainWidth,height=bsbMainHeight,depth=bsbMainDepth,color=color);
        //screw
        bsbScrewHeight=5.5;
        bsbScrewWidth=10;
        bsbScrewDepth=bsbMainDepth+5;
        bsbScrewZ=-bsbMainDepth;
        bsbScrewX=-bottomPieceWidth+bsbScrewWidth/2;
        oi("cube",x=bsbScrewX,y=0,z=bsbScrewZ,width=bsbScrewWidth,height=bsbScrewHeight,depth=bsbScrewDepth,color=color);
    }
}

module drawDysonV6Battery(color,clearance=0,batteryTerminalClearance=false){

    batteryBaseBumpShift = -18-2;

//HANDLE
    handleExtra=20;
    handleDepth = handleExtra+32-6; //63; //to screw;
    handleWidth=42.5-6+2+1;
    handleShift = -9;
    handleDiameter=24-0.5+clearance+1;
    //triangle, 20mm shift over 90mm 12.5 deg
    //https://www.omnicalculator.com/math/right-triangle-side-angle
    handleTilt=11.5+3.3; //angle
    handleX=-27+batteryBaseBumpShift+handleShift-1.5;
    handleZ=(handleDepth-20);
//batteryBaseBump (6 total 4 to the lip
    //handleShift = -9;
    plasticThickness = 2.5;
//batteryBaseBump Dimensions
    batteryBaseBumpWidth = 108;
    batteryBaseBumpHeight = 42;
    batteryBaseBumpDepth = 4;
    batteryBaseBumpX = -batteryBaseBumpWidth/2+batteryBaseBumpShift;
    batteryBaseBumpY = 0;
    batteryBaseBumpZ = 0;
//batteryBase Dimensions
    batteryBaseWidth = 123;
    batteryBaseHeight = 28;
    batteryBaseDepth = 75;
    batteryBaseX = -batteryBaseWidth/2;
    batteryBaseY = -batteryBaseDepth/2;
    batteryBaseZ = -batteryBaseHeight/2-batteryBaseBumpDepth;
    screwHoleUpperZ = 55-3;
//screwBracket Dimensions
    screwBracketDrop=10;
    screwBracketWidth = 3;    
    screwBracketDepth = screwHoleUpperZ+5;
    screwBracketX = handleX+handleWidth/2+screwBracketWidth/2-10-5-3;
    screwBracketY = 0;
    screwBracketZ = screwBracketDepth;
    screwBracketDropPieceX = screwBracketX;
    screwBracketDropPieceY = screwBracketY;
    screwBracketDropPieceZ = screwBracketZ-screwBracketDrop;
    

    batteryClipX=handleX-5;
    batteryClipHeight=17+clearance; //measured 19 smaller to fit for sure
    batteryClipWidth=28;
    
    
    rearCutoutX=handleX-handleWidth/2-4;
    
    sideCutoutWidth=1;    
    sideCutoutHeight=25;    
    
    

    //screwBracketDrop=10;
    //screwBracketWidth = 3;
    screwBracketHeight = 10;
    //screwBracketDepth = screwHoleUpperZ+5;
    //screwBracketX = handleX+handleWidth/2+screwBracketWidth/2-10-5;
    //screwBracketY = 0;
    //screwBracketZ = screwBracketDepth;
    //screwBracketDropPieceX = screwBracketX;
    //screwBracketDropPieceY = screwBracketY;
    //screwBracketDropPieceZ = screwBracketZ-screwBracketDrop;
    
    //screwBracket Dimensions
    
    screwBracketClearance = 4;
    screwBracketDropPieceWidth = 10;
    screwBracketDropPieceHeight = screwBracketHeight;
    screwBracketDropPieceDepth = screwBracketDepth-screwBracketDrop;
    //screwBracketDropPieceX = screwBracketX;
    //screwBracketDropPieceY = screwBracketY;
    //screwBracketDropPieceZ = screwBracketZ-screwBracketDrop;

  
//screwBracketSwitchClearance Dimensions
    screwBracketSwitchClearanceSide = 7;
    screwBracketSwitchClearanceDrop = -7;
    screwBracketSwitchClearanceWidth = 10;
    screwBracketSwitchClearanceHeight = 10;
    screwBracketSwitchClearanceDepth = 10;
    screwBracketSwitchClearanceX = screwBracketDropPieceX;
    screwBracketSwitchClearanceY = screwBracketDropPieceY+screwBracketSwitchClearanceSide;
    screwBracketSwitchClearanceZ = screwBracketDropPieceZ+screwBracketDrop+screwBracketSwitchClearanceDrop;
//screwBracketCylinder Dimensions
    screwBracketCylinderRad = 5.25;
    screwBracketCylinderHeight = 0;
    screwBracketCylinderDepth = screwBracketWidth;
    screwBracketCylinderX = screwBracketX+screwBracketCylinderDepth/2;
    screwBracketCylinderY = 0;
    screwBracketCylinderZ = screwHoleUpperZ;
    sideCutoutCenters = 4;
//////  SIDE CUT OUT    
    sideCutoutLeftFrontWidth = 3;
    sideCutoutLeftFrontHeight = 4;
    sideCutoutX=24;    
//sideCutoutLeftFront Dimensions    
    sideCutoutLeftFrontDepth = 43+1;//extra for tilt?
    sideCutoutLeftFrontX = handleX+handleWidth/2-sideCutoutX;
    sideCutoutLeftFrontY = -handleDiameter/2+sideCutoutLeftFrontHeight/2-1;
    sideCutoutLeftFrontZ = sideCutoutLeftFrontDepth-batteryBaseBumpDepth-2;

//sideCutoutLeftRear Dimensions
    sideCutoutLeftRearWidth = sideCutoutLeftFrontWidth;
    sideCutoutLeftRearHeight = sideCutoutLeftFrontHeight;
    sideCutoutLeftRearDepth = sideCutoutLeftFrontDepth;
    sideCutoutLeftRearX = sideCutoutLeftFrontX-sideCutoutCenters;
    sideCutoutLeftRearY = sideCutoutLeftFrontY;
    sideCutoutLeftRearZ = sideCutoutLeftFrontZ;
//sideCutoutRightFront Dimensions
    sideCutoutRightFrontWidth = sideCutoutLeftFrontWidth;
    sideCutoutRightFrontHeight = sideCutoutLeftFrontHeight;
    sideCutoutRightFrontDepth = sideCutoutLeftFrontDepth;
    sideCutoutRightFrontX = sideCutoutLeftFrontX;
    sideCutoutRightFrontY = -sideCutoutLeftFrontY;
    sideCutoutRightFrontZ = sideCutoutLeftFrontZ;
//side cutouts
//sideCutoutRightRear Dimensions
    sideCutoutRightRearWidth = sideCutoutLeftFrontWidth;
    sideCutoutRightRearHeight = sideCutoutLeftFrontHeight;
    sideCutoutRightRearDepth = sideCutoutLeftFrontDepth;
    sideCutoutRightRearX = sideCutoutLeftRearX;
    sideCutoutRightRearY = -sideCutoutLeftFrontY;
    sideCutoutRightRearZ = sideCutoutLeftFrontZ;
//rear cutouts
//rearCutoutLeft Dimensions
    rearCutoutCenters = 9.5;
    rearCutoutLeftWidth = 4;
    rearCutoutLeftHeight = 2;
    rearCutoutLeftDepth = 34+1;
    rearCutoutLeftX = handleX-handleWidth/2+rearCutoutLeftWidth/2-2;
    rearCutoutLeftY = -rearCutoutCenters/2;
    rearCutoutLeftZ = rearCutoutLeftDepth-batteryBaseBumpDepth-2;
//rearCutoutRight Dimensions
    rearCutoutRightWidth = rearCutoutLeftWidth;
    rearCutoutRightHeight = rearCutoutLeftHeight;
    rearCutoutRightDepth = rearCutoutLeftDepth;
    rearCutoutRightX = rearCutoutLeftX;
    rearCutoutRightY = -rearCutoutLeftY;
    rearCutoutRightZ = rearCutoutLeftZ;
//batteryTerminalLeft Dimensions
    batteryTerminalExtra = 2;
    bateryTerminalCenter = 9;
    batteryTerminalLeftWidth = 8+batteryTerminalExtra;
    batteryTerminalLeftHeight = 1+batteryTerminalExtra;
    batteryTerminalLeftDepth = 20+batteryTerminalExtra;
    batteryTerminalLeftX = handleX+handleWidth/2-27;
    batteryTerminalLeftY = bateryTerminalCenter/2;
    batteryTerminalLeftZ = handleDepth-handleExtra;
//batteryTerminalRight Dimensions
    batteryTerminalRightWidth = batteryTerminalLeftWidth;
    batteryTerminalRightHeight = batteryTerminalLeftHeight;
    batteryTerminalRightDepth = batteryTerminalLeftDepth;
    batteryTerminalRightX = batteryTerminalLeftX;
    batteryTerminalRightY = -batteryTerminalLeftY;
    batteryTerminalRightZ = batteryTerminalLeftZ;
//screwHoleUpper Dimensions
    screwHoleUpperWidth = 0;
    screwHoleUpperHeight = 0;
    screwHoleUpperDepth = 0;
    screwHoleUpperX = 0;
    screwHoleUpperY = 0;
    //screwHoleUpperZ = 55;
    //batteryTerminalExtra = 4;
//batteryTerminalClearanceLeft Dimensions
    batteryTerminalClearanceLeftWidth = batteryTerminalLeftWidth+batteryTerminalExtra*.75;
    batteryTerminalClearanceLeftHeight = batteryTerminalLeftHeight+batteryTerminalExtra;
    batteryTerminalClearanceLeftDepth = batteryTerminalLeftDepth+batteryTerminalExtra*5;
    batteryTerminalClearanceLeftX = batteryTerminalLeftX-(batteryTerminalExtra*.75/2);
    batteryTerminalClearanceLeftY = batteryTerminalLeftY;
    batteryTerminalClearanceLeftZ = batteryTerminalLeftZ;
//batteryTerminalClearanceRight Dimensions
    batteryTerminalClearanceRightWidth = batteryTerminalClearanceLeftWidth;
    batteryTerminalClearanceRightHeight = batteryTerminalClearanceLeftHeight;
    batteryTerminalClearanceRightDepth = batteryTerminalClearanceLeftDepth;
    batteryTerminalClearanceRightX = batteryTerminalClearanceLeftX;
    batteryTerminalClearanceRightY = -batteryTerminalClearanceLeftY;
    batteryTerminalClearanceRightZ = batteryTerminalClearanceLeftZ;
    
    if(!batteryTerminalClearance){
        difference(){
//batteryBaseBump oi        
            oi("cube",x=batteryBaseBumpX,y=batteryBaseBumpY,z=batteryBaseBumpZ,width=batteryBaseBumpWidth,height=batteryBaseBumpHeight,depth=batteryBaseBumpDepth,color=color);
            translate([batteryBaseBumpShift+handleShift+plasticThickness,0,-batteryBaseBumpDepth]){
                drawDysonV6(color,bottomClearance=false);
            }
        }
//batteryBase oi    
        oi("cubeRounded",x=batteryBaseX,y=batteryBaseY,z=batteryBaseZ,rad=batteryBaseHeight/2,width=batteryBaseWidth,height=batteryBaseHeight,depth=batteryBaseDepth,rotX=90,color=color);
        difference(){
            union(){
//HANDLE
                oi("cubeRounded",x=handleX,y=0,z=handleZ,rad=handleDiameter/2,depth=handleDepth,height=handleDiameter,width=handleWidth,rotY=-handleTilt,color=color);
                difference(){
                    union(){
                        difference(){
                            union(){
//screwBracket oi                            
                                oi("cube",x=screwBracketX,y=screwBracketY,z=screwBracketZ-screwBracketClearance,width=screwBracketWidth,height=screwBracketHeight,depth=screwBracketDepth-screwBracketClearance,color=color);
//screwBracketDropPiece oi
                                oi("cube",x=screwBracketDropPieceX,y=screwBracketDropPieceY,z=screwBracketDropPieceZ,width=screwBracketDropPieceWidth,height=screwBracketDropPieceHeight,depth=screwBracketDropPieceDepth,color=color);
                            }
//screwBracketSweitchClearance oi
                        oi("cube",x=screwBracketSwitchClearanceX,y=screwBracketSwitchClearanceY,z=screwBracketSwitchClearanceZ,width=screwBracketSwitchClearanceWidth,height=screwBracketSwitchClearanceHeight,depth=screwBracketSwitchClearanceDepth,color=color);
                    }
//screwBracketCylinder oi                
                        oi("cylinder",x=screwBracketCylinderX,y=screwBracketCylinderY,z=screwBracketCylinderZ,rad=screwBracketCylinderRad,height=screwBracketCylinderHeight,depth=screwBracketCylinderDepth,rotY=90,color=color);
                    }   
                }
            }
//sideCutoutLeftFront oi        
            oi("cube",x=sideCutoutLeftFrontX,y=sideCutoutLeftFrontY,z=sideCutoutLeftFrontZ,width=sideCutoutLeftFrontWidth,height=sideCutoutLeftFrontHeight,depth=sideCutoutLeftFrontDepth,rotY=-handleTilt,color=color);
//sideCutoutLeftRear oi
            oi("cube",x=sideCutoutLeftRearX,y=sideCutoutLeftRearY,z=sideCutoutLeftRearZ,width=sideCutoutLeftRearWidth,height=sideCutoutLeftRearHeight,depth=sideCutoutLeftRearDepth,rotY=-handleTilt,color=color);
//sideCutoutRightFront oi        
            oi("cube",x=sideCutoutRightFrontX,y=sideCutoutRightFrontY,z=sideCutoutRightFrontZ,width=sideCutoutRightFrontWidth,height=sideCutoutRightFrontHeight,depth=sideCutoutRightFrontDepth,rotY=-handleTilt,color=color);
//sideCutoutRightRear oi        
            oi("cube",x=sideCutoutRightRearX,y=sideCutoutRightRearY,z=sideCutoutRightRearZ,width=sideCutoutRightRearWidth,height=sideCutoutRightRearHeight,depth=sideCutoutRightRearDepth,rotY=-handleTilt,color=color);
//rearcutoutLeft oi    
            oi("cube",x=rearCutoutLeftX,y=rearCutoutLeftY,z=rearCutoutLeftZ,width=rearCutoutLeftWidth,height=rearCutoutLeftHeight,depth=rearCutoutLeftDepth,rotY=-handleTilt,color=color);
//rearCutoutRight oi        
            oi("cube",x=rearCutoutRightX,y=rearCutoutRightY,z=rearCutoutRightZ,width=rearCutoutRightWidth,height=rearCutoutRightHeight,depth=rearCutoutRightDepth,rotY=-handleTilt,color=color);
//BATTERYTERMINALLEFT        
            oi("cube",x=batteryTerminalLeftX,y=batteryTerminalLeftY,z=batteryTerminalLeftZ,width=batteryTerminalLeftWidth,height=batteryTerminalLeftHeight,depth=batteryTerminalLeftDepth,rotY=-handleTilt,color=color);
//BATTERYTERMINALRIGHT oi        
            oi("cube",x=batteryTerminalRightX,y=batteryTerminalRightY,z=batteryTerminalRightZ,width=batteryTerminalRightWidth,height=batteryTerminalRightHeight,depth=batteryTerminalRightDepth,rotY=-handleTilt,color=color);
//SCREWHOLEUPPER oi
            oi("holeM3",x=screwHoleUpperX,y=screwHoleUpperY,z=screwHoleUpperZ,width=screwHoleUpperWidth,height=screwHoleUpperHeight,depth=screwHoleUpperDepth,rotY=90,color=color);
        }    
    }
//BATTERYTERMINAL CLEARANCE DRAWING ONLY    
    else{
//BATTERYTERMINALCLEARANCELEFT oi        
            oi("cube",x=batteryTerminalClearanceLeftX,y=batteryTerminalClearanceLeftY,z=batteryTerminalClearanceLeftZ,width=batteryTerminalClearanceLeftWidth,height=batteryTerminalClearanceLeftHeight,depth=batteryTerminalClearanceLeftDepth,rotY=-handleTilt,color=color);
//BATTERYTERMINALCLEARANCERIGHT oi        
            oi("cube",x=batteryTerminalClearanceRightX,y=batteryTerminalClearanceRightY,z=batteryTerminalClearanceRightZ,width=batteryTerminalClearanceRightWidth,height=batteryTerminalClearanceRightHeight,depth=batteryTerminalClearanceRightDepth,rotY=-handleTilt,color=color);
            
        }  
}