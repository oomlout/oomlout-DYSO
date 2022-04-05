module drawDysonV6old(color="red",bottomClearance=false, dustBinOnly=false, screwHoleOnly=false){

    
    bottomPieceWidth=99;
//////BARREL
    barrelDiameter=70;
    barrelLength=96;
    barrelZ=130;
    barrelX=-(bottomPieceWidth-barrelLength);
//////bottom    
    bottomExtra= bottomClearance ? 100 : 0;
    bottomHeight=gvv("handleDiameter");
    bottomWidth=bottomPieceWidth-gvv("handleDiameter")/2;
    bottomDepth=4.5+bottomExtra;
    bottomZ=bottomDepth;
    bottomX=-bottomWidth/2-gvv("handleDiameter")/2;    
//////base piece
    fsBaseHeight=gvv("handleDiameter");
    fsBaseWidth=13.5;
    fsBaseDepth=20;
    fsBaseZ=18.5;
    fsBaseX=-bottomPieceWidth+fsBaseWidth/2;
    

//////dustBin dimensions
    dustBinR = 107/2;
    dustBinD = 129;
    dustBinX = -barrelLength-dustBinR-3;
    dustBinY = 0;
    dustBinZ = dustBinD-28;
//////dustBinCutout dimensions
    dustBinCutoutW = 10;
    dustBinCutoutH = 12;
    dustBinCutoutD = 30;
    dustBinCutoutX = dustBinX+dustBinR;
    dustBinCutoutY = -dustBinCutoutH/2+3;
    dustBinCutoutZ = dustBinZ-90;
    
    
//////BATTERY SCREW BUMP
//////bsbMain
    bsbMainHeight=gvv("handleDiameter");
    bsbMainWidth=16;
    bsbMainDepth=2.5;
    bsbMainZ=0;
    bsbMainX=-bottomPieceWidth+bsbMainWidth/2;
//////bsbScrew
    bsbScrewHeight=5.5;
    bsbScrewWidth=10;
    bsbScrewDepth=bsbMainDepth+5;
    bsbScrewZ=-bsbMainDepth;
    bsbScrewX=-bottomPieceWidth+bsbScrewWidth/2;    

 //////frontScrewHole dimensions
     frontScrewHoleW = 0;
     frontScrewHoleH = 0;
     frontScrewHoleD = 20;
     frontScrewHoleX = bottomX-bottomWidth/2+frontScrewHoleD-frontScrewHoleD/2;
     frontScrewHoleY = 0;
     frontScrewHoleZ = bsbScrewZ-bsbScrewDepth/2+6;
     frontScrewHoleRotY = 70;
    
    if(!dustBinOnly && !screwHoleOnly){
        difference(){
            union(){ //to add batery screw bump
                difference(){ // to slice off anything below 0
                    union(){
        //barrel                
                        oi("cylinder",x=barrelX,y=0,z=barrelZ,rad=barrelDiameter/2,rotY=90,depth=barrelLength,color=color,name="barrel");
                        
        //HANDLE
                        handleWidth=42.5;
                        
                        //handleDiameter=1;
                        handleDepth = 120;
                        //triangle, 20mm shift over 90mm 12.5 deg
                        //https://www.omnicalculator.com/math/right-triangle-side-angle
                        handleTilt=12.53;
                        handleX=-44;
                        handleZ=(handleDepth-20);
                        oi("cubeRounded",x=handleX,y=0,z=handleZ,rad=gvv("handleDiameter")/2,depth=handleDepth,height=gvv("handleDiameter"),width=handleWidth,rotY=-handleTilt,color=color);
                        
                        //Front Support
    //basePiece
                        oi("cube",x=fsBaseX,y=0,z=fsBaseZ,width=fsBaseWidth,height=fsBaseHeight,depth=fsBaseDepth,color=color,name="basePiece");
                        //main piece            
                        fsExtra=8;
                        fsMainHeight=gvv("handleDiameter");
                        fsMainWidth=9;
                        fsMainDepth=95+fsExtra;
                        fsMainZ=fsMainDepth;
                        fsMainX=fsBaseX-((fsBaseWidth-fsMainWidth)/2);
                        oi("cube",x=fsMainX,y=0,z=fsMainZ,width=fsMainWidth,height=fsMainHeight,depth=fsMainDepth,color=color);
                        
    //bottom
                        oi("cube",x=bottomX,y=0,z=bottomZ,width=bottomWidth,height=bottomHeight,depth=bottomDepth,color=color,name="botom");
                        
                    }   
                    union(){
    //remove the overhang out the bottom
                            oi("cube",x=0,y=0,z=0,width=1000,height=1000,depth=100,color=color);
                    }
                 }
                 //battery screw bump
                 difference(){
                     union(){
    //bsbMain
                        oi("cube",x=bsbMainX,y=0,z=bsbMainZ,width=bsbMainWidth,height=bsbMainHeight,depth=bsbMainDepth,color=color,name="bsbMain");
    //bsbScrew
                        oi("cube",x=bsbScrewX,y=0,z=bsbScrewZ,width=bsbScrewWidth,height=bsbScrewHeight,depth=bsbScrewDepth,color=color,name="bsbScrew");        
                     }
//////frontScrewHole oi
                        //oi("holeM3",x=frontScrewHoleX,y=frontScrewHoleY,z=frontScrewHoleZ,width=frontScrewHoleW,height=frontScrewHoleH,depth=frontScrewHoleD,color=color,name="frontScrewHole",rotY=frontScrewHoleRotY);
                 }
        

            }
        }
        //////dustBin oi
            difference(){    
                oi("cylinder",x=dustBinX,y=dustBinY,z=dustBinZ,rad=dustBinR,depth=dustBinD,color=color,name="dustBin");        
    //////dustBinCutout oi
        oi("cube",x=dustBinCutoutX,y=dustBinCutoutY,z=dustBinCutoutZ,width=dustBinCutoutW,height=dustBinCutoutH,depth=dustBinCutoutD,color=color,name="dustBinCutout");
                     
        }
    }
//////dustbin only    
     if(dustBinOnly){
//////dustBin oi
                difference(){    
                    oi("cylinder",x=dustBinX,y=dustBinY,z=dustBinZ,rad=dustBinR,depth=dustBinD,color=color,name="dustBin");        
//////dustBinCutout oi
            oi("cube",x=dustBinCutoutX,y=dustBinCutoutY,z=dustBinCutoutZ,width=dustBinCutoutW,height=dustBinCutoutH,depth=dustBinCutoutD,color=color,name="dustBinCutout");
                         
            }            
        }
     if(screwHoleOnly){
//////frontScrewHole oi
                        oi("holeM3",x=frontScrewHoleX,y=frontScrewHoleY,z=frontScrewHoleZ,width=frontScrewHoleW,height=frontScrewHoleH,depth=frontScrewHoleD,color=color,name="frontScrewHole",rotY=frontScrewHoleRotY);
     }
     
}

module drawDysonV6BatteryOld(color,clearance=0,batteryTerminalClearance=false){

    batteryBaseBumpShift = -18-2;
    batteryBaseBumpCutoutDepth = 4;
//////vacuumShift    
    plasticThickness = 2.5;
    handleShift = -9;
    vacuumShiftX = batteryBaseBumpShift+handleShift+plasticThickness-2;
    vacuumShiftY = 0;
    vacuumShiftZ = 0;
//HANDLE
    handleExtra=20;
    handleDepth = handleExtra+32-6; //63; //to screw;
    handleWidth=39.5-.5;//42.5-6+2+1;
    
    //handleDiameter=23.5-0.5;//24-0.5+clearance;
    //triangle, 20mm shift over 90mm 12.5 deg
    //https://www.omnicalculator.com/math/right-triangle-side-angle
    handleTilt=13;//V22//12;//V21//17.5;//v20//90-74.62;//15.4(v19)//11.5+3.3;//13.8(V18) //angle
    handleX=-27+batteryBaseBumpShift+handleShift-1.5;
    handleZ=(handleDepth-20);
//batteryBaseBump (6 total 4 to the lip
    //handleShift = -9;
    
    
//batteryBaseBump Dimensions
    batteryBaseBumpWidth = 109;
    batteryBaseBumpHeight = 42;
    
    batteryBaseBumpDepth = batteryBaseBumpCutoutDepth+10;
    batteryBaseBumpX = -batteryBaseBumpWidth/2+batteryBaseBumpShift;
    batteryBaseBumpY = 0;
    batteryBaseBumpZ = 0;
//batteryBase Dimensions
    batteryBaseWidth = batteryBaseBumpWidth+17;//123;
    batteryBaseHeight = 28;
    batteryBaseDepth = 75;
    batteryBaseX = -batteryBaseWidth/2;
    batteryBaseY = -batteryBaseDepth/2;
    batteryBaseZ = -batteryBaseHeight/2-batteryBaseBumpCutoutDepth;
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
    sideCutoutX=24+.5;    
//sideCutoutLeftFront Dimensions    
    sideCutoutLeftFrontDepth = 43+1;//extra for tilt?
    sideCutoutLeftFrontX = handleX+handleWidth/2-sideCutoutX;
    sideCutoutLeftFrontY = -gvv("handleDiameterBattery")/2+sideCutoutLeftFrontHeight/2-1;
    sideCutoutLeftFrontZ = sideCutoutLeftFrontDepth-batteryBaseBumpCutoutDepth-2;

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
    rearCutoutLeftZ = rearCutoutLeftDepth-batteryBaseBumpCutoutDepth-2;
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
    batteryTerminalLeftDepth = 30+batteryTerminalExtra;
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
    
//////frontScrewBracket dimensions
    frontScrewMinus = 6;
    frontScrewBracketW = 2;
    frontScrewBracketH = batteryBaseBumpHeight;
    frontScrewBracketD = batteryBaseBumpDepth-frontScrewMinus;
    frontScrewBracketX = -batteryBaseWidth-frontScrewBracketW-frontScrewBracketW/2;
    frontScrewBracketY = 0;
    frontScrewBracketZ = -frontScrewMinus/2;
    
    
    if(!batteryTerminalClearance){
        difference(){
            union(){
//batteryBaseBump oi        
                oi("cube",name="batteryBaseBump",x=batteryBaseBumpX,y=batteryBaseBumpY,z=batteryBaseBumpZ,width=batteryBaseBumpWidth,height=batteryBaseBumpHeight,depth=batteryBaseBumpDepth,color=color);
                oi("cubeRounded",name="batteryBase",x=batteryBaseX,y=batteryBaseY,z=batteryBaseZ,rad=batteryBaseHeight/2,width=batteryBaseWidth,height=batteryBaseHeight,depth=batteryBaseDepth,rotX=90,color=color);
        }
            translate([vacuumShiftX,vacuumShiftY,vacuumShiftZ]){
                drawDysonV6(color,bottomClearance=false);
            }
        }
//batteryBase oi    
        
        difference(){
            union(){
//HANDLE
                oi("cubeRounded",name="handle",x=handleX,y=0,z=handleZ,rad=gvv("handleDiameterBattery")/2,depth=handleDepth,height=gvv("handleDiameterBattery"),width=handleWidth,rotY=-handleTilt,color=color);
//////frontScrewBracket oi
    oi("cube",x=frontScrewBracketX,y=frontScrewBracketY,z=frontScrewBracketZ,width=frontScrewBracketW,height=frontScrewBracketH,depth=frontScrewBracketD,color=color,name="frontScrewBracket");

                difference(){
                    union(){
                        difference(){
                            union(){
//screwBracket oi                            
                                oi("cube",name="screwBracket",x=screwBracketX,y=screwBracketY,z=screwBracketZ-screwBracketClearance,width=screwBracketWidth,height=screwBracketHeight,depth=screwBracketDepth-screwBracketClearance,color=color);
//screwBracketDropPiece oi
                                oi("cube",name="screwBracketDropPiece",x=screwBracketDropPieceX,y=screwBracketDropPieceY,z=screwBracketDropPieceZ,width=screwBracketDropPieceWidth,height=screwBracketDropPieceHeight,depth=screwBracketDropPieceDepth,color=color);
                            }
//screwBracketSweitchClearance oi
                        oi("cube",name="screwBracketSweitchClearance",x=screwBracketSwitchClearanceX,y=screwBracketSwitchClearanceY,z=screwBracketSwitchClearanceZ,width=screwBracketSwitchClearanceWidth,height=screwBracketSwitchClearanceHeight,depth=screwBracketSwitchClearanceDepth,color=color);
                    }
//screwBracketCylinder oi                
                        oi("cylinder",name="screwBracketCylinder",x=screwBracketCylinderX,y=screwBracketCylinderY,z=screwBracketCylinderZ,rad=screwBracketCylinderRad,height=screwBracketCylinderHeight,depth=screwBracketCylinderDepth,rotY=90,color=color);
                    }   
                }
            }
//sideCutoutLeftFront oi        
            oi("cube",name="sideCutoutLeftFront",x=sideCutoutLeftFrontX,y=sideCutoutLeftFrontY,z=sideCutoutLeftFrontZ,width=sideCutoutLeftFrontWidth,height=sideCutoutLeftFrontHeight,depth=sideCutoutLeftFrontDepth,rotY=-handleTilt,color=color);
//sideCutoutLeftRear oi
            oi("cube",name="sideCutoutLeftRear",x=sideCutoutLeftRearX,y=sideCutoutLeftRearY,z=sideCutoutLeftRearZ,width=sideCutoutLeftRearWidth,height=sideCutoutLeftRearHeight,depth=sideCutoutLeftRearDepth,rotY=-handleTilt,color=color);
//sideCutoutRightFront oi        
            oi("cube",name="sideCutoutRightFront",x=sideCutoutRightFrontX,y=sideCutoutRightFrontY,z=sideCutoutRightFrontZ,width=sideCutoutRightFrontWidth,height=sideCutoutRightFrontHeight,depth=sideCutoutRightFrontDepth,rotY=-handleTilt,color=color);
//sideCutoutRightRear oi        
            oi("cube",name="sideCutoutRightRear",x=sideCutoutRightRearX,y=sideCutoutRightRearY,z=sideCutoutRightRearZ,width=sideCutoutRightRearWidth,height=sideCutoutRightRearHeight,depth=sideCutoutRightRearDepth,rotY=-handleTilt,color=color);
//rearcutoutLeft oi    
            oi("cube",name="rearcutoutLeft",x=rearCutoutLeftX,y=rearCutoutLeftY,z=rearCutoutLeftZ,width=rearCutoutLeftWidth,height=rearCutoutLeftHeight,depth=rearCutoutLeftDepth,rotY=-handleTilt,color=color);
//rearCutoutRight oi        
            oi("cube",name="rearCutoutRight",x=rearCutoutRightX,y=rearCutoutRightY,z=rearCutoutRightZ,width=rearCutoutRightWidth,height=rearCutoutRightHeight,depth=rearCutoutRightDepth,rotY=-handleTilt,color=color);
//BATTERYTERMINALLEFT        
            oi("cube",name="batteryTerminalLext",x=batteryTerminalLeftX,y=batteryTerminalLeftY,z=batteryTerminalLeftZ,width=batteryTerminalLeftWidth,height=batteryTerminalLeftHeight,depth=batteryTerminalLeftDepth,rotY=-handleTilt,color=color);
//BATTERYTERMINALRIGHT oi        
            oi("cube",name="batteryTerminalRight",x=batteryTerminalRightX,y=batteryTerminalRightY,z=batteryTerminalRightZ,width=batteryTerminalRightWidth,height=batteryTerminalRightHeight,depth=batteryTerminalRightDepth,rotY=-handleTilt,color=color);
//SCREWHOLEUPPER oi
            union(){
            oi("holeM3",x=screwHoleUpperX,y=screwHoleUpperY,z=screwHoleUpperZ,width=screwHoleUpperWidth,height=screwHoleUpperHeight,depth=screwHoleUpperDepth,rotY=90,color=color);
                 translate([vacuumShiftX,0,vacuumShiftZ]){
                drawDysonV6(color,bottomClearance=false,dustBinOnly=true);
                drawDysonV6(color,bottomClearance=false,screwHoleOnly=true);
                     
            }  
            
        }
        } 

    }
//BATTERYTERMINAL CLEARANCE DRAWING ONLY    
    else{
//BATTERYTERMINALCLEARANCELEFT oi        
            oi("cube",name="batteryTerminalClearanceLeft",x=batteryTerminalClearanceLeftX,y=batteryTerminalClearanceLeftY,z=batteryTerminalClearanceLeftZ,width=batteryTerminalClearanceLeftWidth,height=batteryTerminalClearanceLeftHeight,depth=batteryTerminalClearanceLeftDepth,rotY=-handleTilt,color=color);
//BATTERYTERMINALCLEARANCERIGHT oi        
            oi("cube",name="batteryTerminalCelaranceRight",x=batteryTerminalClearanceRightX,y=batteryTerminalClearanceRightY,z=batteryTerminalClearanceRightZ,width=batteryTerminalClearanceRightWidth,height=batteryTerminalClearanceRightHeight,depth=batteryTerminalClearanceRightDepth,rotY=-handleTilt,color=color);
            
        }  
}
