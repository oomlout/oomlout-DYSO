


include <OPSC-base.scad>




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

module drawDysonV6(color){
    oiii(type="dysonV6Handle");
    oiii(type="dysonV6DustBin");
    oiii(type="dysonV6Battery");
    drawDysonV6Handle();
    drawDysonV6DustBin();
    drawDysonV6Battery();
}

module drawDysonBatteryClipBolt(color){

 
    translate([0,0,20]){
        union(){
            difference(){
                oii("cubeRounded","batteryClipBoltBracket",color=color); 
                drawDysonV6HandleBottomClearance(color); 
//////batteryClipBoltAA oi
                oii("holeM6","batteryClipBoltAA",color=color); 
//////batteryClipBoltAB oi
                oii("holeM6","batteryClipBoltAB",color=color);
            }


            
            intersection(){        
                thick = 70;
                width=120;
                height=35;
                depth=thick;       
                x=-width+65;
                y=0;
                z=thick-10;
    //////cutout dimensions
                cutoutW = width-70;
                cutoutH = height-10;
                cutoutD = depth;
                cutoutX = x-16;
                cutoutY = y;
                cutoutZ = z;

                difference(){
                    oi("cubeRounded",x=x,y=y,z=z,width=width,height=height,depth=depth,color=color);
                    drawDysonBatteryTerminals(color);
                }
                difference(){
                    drawDysonV6Battery(color);
    //////cutout oi
                    //oi("cubeRounded",x=cutoutX,y=cutoutY,z=cutoutZ,width=cutoutW,height=cutoutH,depth=cutoutD,color=color,name="cutout");
                }

            }   
        }
    }
}


module drawDysonV6Handle(color="red", dustBinOnly=false, screwHoleOnly=false){
    difference(){
        union(){
            difference(){
    ////////////Main Handle Assembly    
                union(){
    //////barrel oi    
                    oii("cylinder","barrel",color=color);  
    //////handle oi
                    oii("cubeRounded","handle",color=color);    
    //////frontSupportMain oi
                oii("cube","frontSupportMain",color=color);   
    //////bottom oi
                oii("cube","bottom",color=color);        
                }
    //remove the overhang out the bottom
                oi("cube",x=0,y=0,z=0,width=1000,height=1000,depth=100,color=color);        
            }
    ///////////Insert bottom screw dangle here
//////front screw hole
            drawDysonBatteryFrontScrewPositive(color) ;
//////frontSupportBase oi
    oii("cube","frontSupportBase",color=color);                          
        }
////////////Remove Dustbin here
        drawDysonV6DustBin(color,noCutout=true);
//////frontScrew
            drawDysonBatteryFrontScrewNegative(color);        
    }

}

module drawDysonV6HandleBottomClearance(color){
    linear_extrude(100){
        projection(){
            difference(){
                union(){
                    difference(){
            ////////////Main Handle Assembly    
                        union(){
            //////barrel oi    
                            //oii("cylinder","barrel",color);  
            //////handle oi
                            oii("cubeRounded","handle",color=color);    
            //////frontSupportBase oi
                        oii("cube","frontSupportBase",color=color);          
            //////frontSupportMain oi
                            oii("cube","frontSupportMain",color=color);   
            //////bottom oi
                        oii("cube","bottom",color=color);        
                        }
            //remove the overhang out the bottom
                        oi("cube",x=0,y=0,z=0,width=1000,height=1000,depth=100,color=color);        
                    }
            ///////////Insert bottom screw dangle here

                }
        ////////////Remove Dustbin here
            }
        }
    }

}

module drawDysonV6DustBin(color,noCutout=false){
    difference(){
        union(){
//////dustBin oi
        oii("cylinder","dustBin",color=color);
//////dustbinClip oi
        oii("cube","dustbinClip",color=color);   
//////dustBinPlungerClearance oi
    oii("cube","dustBinPlungerClearance",color=color);        

        }
////////////DustBin Subtractions        
        union(){
//////dustBinCutout oi            
        if(!noCutout){
            oii("cube","dustBinCutout",color=color);                         
        }
        }
    }
}


module drawDysonV6Battery(color){
    difference(){
       drawDysonV6BatteryMain(color);
       union(){
        drawDysonV6DustBin(color);
        
       }
    }
}

module drawDysonV6BatteryMain(color){

////////////Remove Dyson Base from battery
    difference(){
////////////BatteryBase and bump together
        union(){
//////batteryBase oi
            oii("cubeRounded","batteryBase",color); 
//////batteryBaseBump oi
            oii("cube","batteryBaseBump",color);        
        }
        union(){
            drawDysonV6HandleBottomClearance(color);        
            drawDysonV6Handle(color);
            drawDysonBatteryFrontScrewNegative(color);
        }
    }

//////batteryHandle oi
    difference(){
        //////battery handle positive
        union(){
            oii("cubeRounded","batteryHandle",color);  
////////////Clearance for screw cylinder            
            difference(){
                union(){
    //////screwBracket oi
                oii("cube","screwBracket",color); 
    //////screwBracketDrop oi
                oii("cube","screwBracketDrop",color);   
                }
//////screwBracketSwitchClearance oi
            oii("cube","screwBracketSwitchClearance",color);        
                        }
//////screwBracketCylinder oi
            oii("cylinder","screwBracketCylinder",color);                  
        }
        //////battery handle negative
        union(){            
//////sideCutouts
            oii("cube","sideCutoutLeftFront",color); 
            oii("cube","sideCutoutLeftRear",color);  
            oii("cube","sideCutoutRightFront",color);  
            oii("cube","sideCutoutRightRear",color);  
//////rearCutouts  
            oii("cube","rearCutoutLeft",color);                                 
            oii("cube","rearCutoutRight",color);
//////batteryTerminalCutouts
            drawDysonBatteryTerminals(color);

//////screwHoleUpper oi
            oii("holeM25D","screwHoleUpper",color);   
//////screwHoleUpperCountersink oi
            //Not needed as it passes through
            //oii("capscrewM25D","screwHoleUpperCountersink",color);                
                   

        }
    }
}

module drawDysonBatteryFrontScrewPositive(color){
    difference(){
//////frontScrewBump oi
    oii("cubeRounded","frontScrewBump",color);
////////////Clipping Boxes
        oi("cube",x=0,y=0,z=10+0.25,width=1000,height=1000,depth=10,color=color);
        oi("cube",x=gvv("frontScrewBumpX")-10-9-100/2,y=0,z=1000/2
        ,width=110,height=1000,depth=1000,color=color);
////////////Front Angle Clip   
//////frontScrewAngleClipper oi
        oii("cube","frontScrewAngleClipper",color);     
    }
}

module drawDysonBatteryFrontScrewNegative(color){
//////frontScrewHole oi
difference(){
    union(){
        oii("holeM25D","frontScrewHole",color); 
    //////frontScrewHoleCountersink oi
        oii("capscrewM25D","frontScrewHoleCountersink",color);    
    }
    
////////////Clipping Boxes
    oi("cube",x=0,y=0,z=10+0.25,width=1000,height=1000,depth=10,color=color);
}

}

module drawDysonBatteryTerminals(color){
//////batteryTerminalCutouts
            oii("cube","batteryTerminalLeft",color);
            oii("cube","batteryTerminalRight",color);
}


module oiii(type,name,color){
   oii(type,x=gvv(str(name,"X")),y=gvv(str(name,"Y")),z=gvv(str(name,"Z")),rotX=gvv(str(name,"RotX")),rotY=gvv(str(name,"RotY")),rotZ=gvv(str(name,"RotZ")),color=color); 
}

module oii(type,name,color="gray",x=0,y=0,z=0,ex=0,length=0,rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,rad2=0,alpha=1,OOwidth=0,OOheight=0,holes=true,negative=true){
    color(color,alpha){
        translate([x,y,z]){
                rotate([rotX,rotY,rotZ]){
                    if(type=="TEST"){
                        t = 0;
                    }else if(type=="TEST2"){
                        t = 0;
                    }
//@@@@@@dysonV6 Asembly                    
                    else if(type=="dysonV6"){
                        oiii(type="dysonV6Handle",color=color);
                        oiii(type="dysonV6DustBin",color=color);
                        oiii(type="dysonV6Battery",color=color);
                    }                                           
//@@@@@@dysonV6Handle Asembly                    
                    else if(type=="dysonV6Handle"){ 
                        drawDysonV6Handle(color=color);                           
                    }

//@@@@@@dysonV6DustBin Asembly                                            
                    else if(type=="dysonV6DustBin"){ 
                        drawDysonV6DustBin(color=color);
                    }
                    
//@@@@@@dysonV6Battery Asembly                                            
                    else if(type=="dysonV6Battery"){
                        drawDysonV6Battery(color=color);
                    }                        
                    else{    
                        oi(type,x=gvv(str(name,"X")),y=gvv(str(name,"Y")),z=gvv(str(name,"Z")),width=gvv(str(name,"W")),height=gvv(str(name,"H")),depth=gvv(str(name,"D")),rad=gvv(str(name,"Radius")),rotX=gvv(str(name,"RotX")),rotY=gvv(str(name,"RotY")),rotZ=gvv(str(name,"RotZ")),color=color,name=name);
                    }
                }
        }
    }
}

function gvv(name) =
name=="TEST" ? "TEST":
//////////////////Dyson V6 Handle
    ////////////Variables
    //////handleDiameter variable
        name=="handleDiameter"      ? 28.5 :
    //////bottomPieceWidth variable
        name=="bottomPieceWidth"    ? 99-2.5:   
    //////handleTilt variable
        name=="handleTilt"      ? -13 :
    //////frontSupportExtra variable
        name=="frontSupportExtra"       ? 8 :    
    ////////////Parts
    //////barrel dimensions
        name=="barrelW" ? 0 :
        name=="barrelH" ? 0 :
        name=="barrelD" ? 96 :
        name=="barrelX" ? -(gvv("bottomPieceWidth")-gvv("barrelD")) :
        name=="barrelY" ? 0 :
        name=="barrelZ" ? 130 :
        name=="barrelRadius" ? 70/2 : 
        name=="barrelRotY"  ?   90 :   
    //////handle dimensions
        name=="handleW"     ? 42.5 :
        name=="handleH"     ? gvv("handleDiameter") :
        name=="handleD"     ? 120 :
        name=="handleX"     ? -40.5 :
        name=="handleY"     ? 0 :
        name=="handleZ"     ? gvv("handleD")-20 :
        name=="handleRadius"    ? gvv("handleDiameter")/2 :
        name=="handleRotX"      ? 0 :
        name=="handleRotY"      ? gvv("handleTilt") :
        name=="handleRotZ"      ? 0 :  
    //////bottom dimensions
        name=="bottomW"     ? gvv("bottomPieceWidth")-gvv("handleDiameter")/2 :
        name=="bottomH"     ? gvv("handleDiameter") :
        name=="bottomD"     ? 4.5 :
        name=="bottomX"     ? -gvv("bottomW")/2-gvv("handleDiameter")/2 :
        name=="bottomY"     ? 0 :
        name=="bottomZ"     ? gvv("bottomD") :
        name=="bottomRadius"        ? 0 :
        name=="bottomRotX"      ? 0 :
        name=="bottomRotY"      ? 0 :
        name=="bottomRotZ"      ? 0 :
    //////frontSupportBase dimensions
        name=="frontSupportBaseExtra"   ? 2  :
        name=="frontSupportBaseW"       ? 13.5 + gvv("frontSupportBaseExtra") :
        name=="frontSupportBaseH"       ? gvv("handleDiameter") :
        name=="frontSupportBaseD"       ? 20 :
        name=="frontSupportBaseX"       ? -gvv("bottomPieceWidth")+gvv("frontSupportBaseW")/2 - gvv("frontSupportBaseExtra") :
        name=="frontSupportBaseY"       ? 0 :
        name=="frontSupportBaseZ"       ? 18.5 :
        name=="frontSupportBaseRadius"      ? 0 :
        name=="frontSupportBaseRotX"        ? 0 :
        name=="frontSupportBaseRotY"        ? 0 :
        name=="frontSupportBaseRotZ"        ? 0 :       
    //////frontSupportMain dimensions
        name=="frontSupportMainW"       ? 9 :
        name=="frontSupportMainH"       ? gvv("handleDiameter") :
        name=="frontSupportMainD"       ? 95+gvv("frontSupportExtra") :
        name=="frontSupportMainX"       ? -gvv("bottomPieceWidth")+gvv("frontSupportBaseW")/2 -gvv("frontSupportBaseW")/2+gvv("frontSupportMainW")/2:
        name=="frontSupportMainY"       ? 0 :
        name=="frontSupportMainZ"       ? gvv("frontSupportMainD") :
        name=="frontSupportMainRadius"      ? 0 :
        name=="frontSupportMainRotX"        ? 0 :
        name=="frontSupportMainRotY"        ? 0 :
        name=="frontSupportMainRotZ"        ? 0 :
////////////Dyson V6 Dust Bin
    //////dustBin dimensions
        name=="dustBinW"        ? 0 :
        name=="dustBinH"        ? 0 :
        name=="dustBinD"        ? 129 :
        name=="dustBinX"        ? -gvv("bottomPieceWidth")-gvv("dustBinRadius") +0.5:
        name=="dustBinY"        ? 0 :
        name=="dustBinZ"        ? gvv("dustBinD")-28 :
        name=="dustBinRadius"       ? 107/2 :
        name=="dustBinRotX"     ? 0 :
        name=="dustBinRotY"     ? 0 :
        name=="dustBinRotZ"     ? 0 :
    //////dustBinCutout dimensions
        name=="dustBinCutoutW"      ? 8 :
        name=="dustBinCutoutH"      ? 12 :
        name=="dustBinCutoutD"      ? 30 :
        name=="dustBinCutoutX"      ? gvv("dustBinX")+gvv("dustBinRadius") :
        name=="dustBinCutoutY"      ? -gvv("dustBinCutoutH/2")-3 :
        name=="dustBinCutoutZ"      ? gvv("dustBinZ")-90 :
        name=="dustBinCutoutRadius"     ? 0 :
        name=="dustBinCutoutRotX"       ? 0 :
        name=="dustBinCutoutRotY"       ? 0 :
        name=="dustBinCutoutRotZ"       ? 0 :
//////dustbinClip dimensions
    name=="dustbinClipW"        ? 10 :
    name=="dustbinClipH"        ? 3 :
    name=="dustbinClipD"        ? 26 :
    name=="dustbinClipX"        ? gvv("dustBinX")+gvv("dustBinRadius")+gvv("dustbinClipW")/2-2 :
    name=="dustbinClipY"        ? -12 :
    name=="dustbinClipZ"        ? gvv("dustBinZ")-80 :
    name=="dustbinClipRadius"       ? 0 :
    name=="dustbinClipRotX"     ? 0 :
    name=="dustbinClipRotY"     ? 0 :
    name=="dustbinClipRotZ"     ? 0 :
//////dustBinPlungerClearance dimensions
    name=="dustBinPlungerClearanceW"        ? 8 :
    name=="dustBinPlungerClearanceH"        ? 8 :
    name=="dustBinPlungerClearanceD"        ? 65 :
    name=="dustBinPlungerClearanceX"        ? gvv("dustBinX")+gvv("dustBinRadius")+gvv("dustbinClipW")/2-3 :
    name=="dustBinPlungerClearanceY"        ? 8 :
    name=="dustBinPlungerClearanceZ"        ? gvv("dustBinZ")-63 :
    name=="dustBinPlungerClearanceRadius"       ? 0 :
    name=="dustBinPlungerClearanceRotX"     ? 0 :
    name=="dustBinPlungerClearanceRotY"     ? 0 :
    name=="dustBinPlungerClearanceRotZ"     ? 0 :        
            
////////////Dyson V6 Battery
    //////handleDiameterBattery variable
    name=="handleDiameterBattery"           ? 23-2 :
//////batteryBaseBumpShift variable
    name=="batteryBaseBumpShift"            ? -20 :    
//////batteryBaseBumpCutoutDepth variable
    name=="batteryBaseBumpCutoutDepth"      ? 4 :    
//////plasticThickness variable
    name=="plasticThickness"                ? 2.5 :
//////handleShift variable
    name=="handleShift"                     ? -8 :        
//////vacuumShift variable
    name=="batteryShiftX"        ? gvv("batteryBaseBumpShift")+gvv("handleShift")+gvv("plasticThickness")-2 :    


//////////// Parts    
//////batteryHandle dimensions
    name=="batteryHandleW"      ? 39-2 :
    name=="batteryHandleH"      ? gvv("handleDiameterBattery") :
    name=="batteryHandleD"      ? 20+32-6+gvv("batteryBaseBumpCutoutDepth") :
    name=="batteryHandleX"      ? 27+gvv("batteryBaseBumpShift")+gvv("handleShift")+gvv("batteryShiftX")+2 :
    name=="batteryHandleY"      ? 0 :
    name=="batteryHandleZ"      ? gvv("batteryHandleD")-20 :
    name=="batteryHandleRadius"     ? gvv("handleDiameterBattery")/2 :
    name=="batteryHandleRotX"       ? 0 :
    name=="batteryHandleRotY"       ? gvv("handleTilt") :
    name=="batteryHandleRotZ"       ? 0 :
//////batteryBase dimensions
    name=="batteryBaseW"        ? gvv("batteryBaseBumpW")+17 :
    name=="batteryBaseH"        ? 28 :
    name=="batteryBaseD"        ? 75 :
    name=="batteryBaseX"        ? -gvv("batteryBaseW")/2-gvv("batteryShiftX") :
    name=="batteryBaseY"        ? -gvv("batteryBaseD")/2 :
    name=="batteryBaseZ"        ? -gvv("batteryBaseH")/2 :
    name=="batteryBaseRadius"       ? gvv("batteryBaseH")/2 :
    name=="batteryBaseRotX"     ? 90 :
    name=="batteryBaseRotY"     ? 0 :
    name=="batteryBaseRotZ"     ? 0 :
//////batteryBaseBump dimensions
    name=="batteryBaseBumpW"        ? 109 :
    name=="batteryBaseBumpH"        ? 42 :
    name=="batteryBaseBumpD"        ? gvv("batteryBaseBumpCutoutDepth")+10 :
    name=="batteryBaseBumpX"        ? -gvv("batteryBaseBumpW")/2+gvv("batteryBaseBumpShift")-gvv("batteryShiftX") :
    name=="batteryBaseBumpY"        ? 0 :
    name=="batteryBaseBumpZ"        ? gvv("batteryBaseBumpCutoutDepth") :
    name=="batteryBaseBumpRadius"       ? 0 :
    name=="batteryBaseBumpRotX"     ? 0 :
    name=="batteryBaseBumpRotY"     ? 0 :
    name=="batteryBaseBumpRotZ"     ? 0 :


////////////Side Cutouts
//////sideCutoutX variable
    name=="sideCutoutX"     ? 24.5 :
//////sideCutoutCenters variable
    name=="sideCutoutCenters"       ? 4 :    
//////sideCutoutLeftFront dimensions
    name=="sideCutoutLeftFrontW"        ? 3 :
    name=="sideCutoutLeftFrontH"        ? 4 :
    name=="sideCutoutLeftFrontD"        ? 44 :
    name=="sideCutoutLeftFrontX"        ? gvv("batteryHandleX")+gvv("batteryHandleW")/2-gvv("sideCutoutX") :
    name=="sideCutoutLeftFrontY"        ? -gvv("handleDiameterBattery")/2+gvv("sideCutoutLeftFrontHeight")/2-1 :
    name=="sideCutoutLeftFrontZ"        ? gvv("sideCutoutLeftFrontD")-gvv("batteryBaseBumpCutoutD")-2 :
    name=="sideCutoutLeftFrontRadius"       ? 0 :
    name=="sideCutoutLeftFrontRotX"     ? 0 :
    name=="sideCutoutLeftFrontRotY"     ? gvv("handleTilt") :
    name=="sideCutoutLeftFrontRotZ"     ? 0 :
//////sideCutoutLeftRear dimensions
    name=="sideCutoutLeftRearW"        ? gvv("sideCutoutLeftFrontW") :
    name=="sideCutoutLeftRearH"        ? gvv("sideCutoutLeftFrontH") :
    name=="sideCutoutLeftRearD"        ? gvv("sideCutoutLeftFrontD") :
    name=="sideCutoutLeftRearX"        ? gvv("sideCutoutLeftFrontX")-gvv("sideCutoutCenters") :
    name=="sideCutoutLeftRearY"        ? gvv("sideCutoutLeftFrontY") :
    name=="sideCutoutLeftRearZ"        ? gvv("sideCutoutLeftFrontZ") :
    name=="sideCutoutLeftRearRotY"     ? gvv("handleTilt") :
//////sideCutoutRightFront dimensions
    name=="sideCutoutRightFrontW"        ? gvv("sideCutoutLeftFrontW") :
    name=="sideCutoutRightFrontH"        ? gvv("sideCutoutLeftFrontH") :
    name=="sideCutoutRightFrontD"        ? gvv("sideCutoutLeftFrontD") :
    name=="sideCutoutRightFrontX"        ? gvv("sideCutoutLeftFrontX") :
    name=="sideCutoutRightFrontY"        ? -gvv("sideCutoutLeftFrontY") :
    name=="sideCutoutRightFrontZ"        ? gvv("sideCutoutLeftFrontZ") :
    name=="sideCutoutRightFrontRotY"     ? gvv("handleTilt") :
//////sideCutoutRightRear dimensions
    name=="sideCutoutRightRearW"        ? gvv("sideCutoutLeftFrontW") :
    name=="sideCutoutRightRearH"        ? gvv("sideCutoutLeftFrontH") :
    name=="sideCutoutRightRearD"        ? gvv("sideCutoutLeftFrontD") :
    name=="sideCutoutRightRearX"        ? gvv("sideCutoutLeftFrontX")-gvv("sideCutoutCenters") :
    name=="sideCutoutRightRearY"        ? -gvv("sideCutoutLeftFrontY") :
    name=="sideCutoutRightRearZ"        ? gvv("sideCutoutLeftFrontZ") :
    name=="sideCutoutRightRearRotY"     ? gvv("handleTilt") :

////////////Rear Cutouts
//////rearCutoutCenters variable
    name=="rearCutoutCenters"       ? 9.5 :
//////rearCutoutLeft dimensions
    name=="rearCutoutLeftW"     ? 4 :
    name=="rearCutoutLeftH"     ? 2 :
    name=="rearCutoutLeftD"     ? 34+1 :
    name=="rearCutoutLeftX"     ? gvv("batteryHandleX")-gvv("batteryHandleW")/2+gvv("rearCutoutLeftW")/2-2 :
    name=="rearCutoutLeftY"     ? gvv("rearCutoutCenters")/2 :
    name=="rearCutoutLeftZ"     ? gvv("rearCutoutLeftD")-gvv("batteryBaseBumpCutoutD")-2 :
    name=="rearCutoutLeftRadius"        ? 0 :
    name=="rearCutoutLeftRotX"      ? 0 :
    name=="rearCutoutLeftRotY"      ? gvv("handleTilt") :
    name=="rearCutoutLeftRotZ"      ? 0 :      
//////rearCutoutRight dimensions
    name=="rearCutoutRightW"     ? gvv("rearCutoutLeftW") :
    name=="rearCutoutRightH"     ? gvv("rearCutoutLeftH") :
    name=="rearCutoutRightD"     ? gvv("rearCutoutLeftD") :
    name=="rearCutoutRightX"     ? gvv("rearCutoutLeftX") :
    name=="rearCutoutRightY"     ? -gvv("rearCutoutCenters")/2 :
    name=="rearCutoutRightZ"     ? gvv("rearCutoutLeftZ") :
    name=="rearCutoutRightRadius"        ? 0 :
    name=="rearCutoutRightRotX"      ? 0 :
    name=="rearCutoutRightRotY"      ? gvv("handleTilt") :
    name=="rearCutoutRightRotZ"      ? 0 :      

////////////Battery Terminal Cutouts
//////batteryTerminalExtra variable
    name=="batteryTerminalExtra"        ? 4 :
    name=="batteryTerminalExtraZ"        ? 50 :
//////batteryTerminalCenters variable
    name=="batteryTerminalCenters"      ? 9 :    
//////batteryTerminalLeft dimensions
    name=="batteryTerminalLeftW"        ? 8+gvv("batteryTerminalExtra") :
    name=="batteryTerminalLeftH"        ? 1+gvv("batteryTerminalExtra") :
    name=="batteryTerminalLeftD"        ? 30+gvv("batteryTerminalExtraZ") :
    name=="batteryTerminalLeftX"        ? gvv("batteryHandleX")+gvv("batteryHandleW")/2-27 :
    name=="batteryTerminalLeftY"        ? gvv("batteryTerminalCenters")/2 :
    name=="batteryTerminalLeftZ"        ? gvv("batteryTerminalLeftD")-gvv("batteryTerminalExtraZ")-1 :
    name=="batteryTerminalLeftRotY"     ? gvv("handleTilt") :
//////batteryTerminalRight dimensions
    name=="batteryTerminalRightW"        ? gvv("batteryTerminalLeftW") :
    name=="batteryTerminalRightH"        ? gvv("batteryTerminalLeftH") :
    name=="batteryTerminalRightD"        ? gvv("batteryTerminalLeftD") :
    name=="batteryTerminalRightX"        ? gvv("batteryTerminalLeftX") :
    name=="batteryTerminalRightY"        ? -gvv("batteryTerminalCenters")/2 :
    name=="batteryTerminalRightZ"        ? gvv("batteryTerminalLeftZ") :
    name=="batteryTerminalRightRotY"     ? gvv("handleTilt") :
//////batteryTerminalLeft dimensions
    name=="batteryTerminalLeftW"        ? 8+gvv("batteryTerminalExtra") :
    name=="batteryTerminalLeftH"        ? 1+gvv("batteryTerminalExtra") :
    name=="batteryTerminalLeftD"        ? 30+gvv("batteryTerminalExtra") :
    name=="batteryTerminalLeftX"        ? gvv("batteryHandleX")+gvv("batteryHandleW")/2-27 :
    name=="batteryTerminalLeftY"        ? gvv("batteryTerminalCenters")/2 :
    name=="batteryTerminalLeftZ"        ? gvv("batteryTerminalLeftD") :
    name=="batteryTerminalLeftRotY"     ? gvv("handleTilt") :
//////batteryTerminalRight dimensions
    name=="batteryTerminalRightW"        ? gvv("batteryTerminalLeftW") :
    name=="batteryTerminalRightH"        ? gvv("batteryTerminalLeftH") :
    name=="batteryTerminalRightD"        ? gvv("batteryTerminalLeftD") :
    name=="batteryTerminalRightX"        ? gvv("batteryTerminalLeftX") :
    name=="batteryTerminalRightY"        ? -gvv("batteryTerminalCenters")/2 :
    name=="batteryTerminalRightZ"        ? gvv("batteryTerminalLeftZ") :
    name=="batteryTerminalRightRotY"     ? gvv("handleTilt") :    

////////////Screw Bracket
//////screwBracketDrop variable
    name=="screwBracketDrop"        ? 5 :

//////screwBracket dimensions
    name=="screwBracketW"       ? 3 :
    name=="screwBracketH"       ? 10 :
    name=="screwBracketD"       ? gvv("screwHoleUpperZ")+5-gvv("screwBracketCylinderRadius") :
    name=="screwBracketX"       ? gvv("batteryHandleX")+gvv("batteryHandleW")/2-10-5-2 :
    name=="screwBracketY"       ? 0 :
    name=="screwBracketZ"       ? gvv("screwBracketD") :
//////screwBracketDrop dimensions
    name=="screwBracketDropW"       ? 10 :
    name=="screwBracketDropH"       ? gvv("screwBracketH") :
    name=="screwBracketDropD"       ? gvv("screwBracketD")-gvv("screwBracketDrop") :
    name=="screwBracketDropX"       ? gvv("screwBracketX") :
    name=="screwBracketDropY"       ? 0 :
    name=="screwBracketDropZ"       ? gvv("screwBracketZ")-gvv("screwBracketDrop") :
//////screwBracketSwitchClearance dimensions
    name=="screwBracketSwitchClearanceW"        ? 10 :
    name=="screwBracketSwitchClearanceH"        ? 10 :
    name=="screwBracketSwitchClearanceD"        ? 30 :
    name=="screwBracketSwitchClearanceX"        ? gvv("screwBracketDropX") :
    name=="screwBracketSwitchClearanceY"        ? gvv("screwBracketDropY")+7 :
    name=="screwBracketSwitchClearanceZ"        ? gvv("screwBracketDropZ")+20 :
//////screwBracketCylinder dimensions
    name=="screwBracketCylinderW"       ? 0 :
    name=="screwBracketCylinderH"       ? 0 :
    name=="screwBracketCylinderD"       ? gvv("screwBracketW") :
    name=="screwBracketCylinderX"       ? gvv("screwBracketX")+gvv("screwBracketCylinderD")/2 :
    name=="screwBracketCylinderY"       ? 0 :
    name=="screwBracketCylinderZ"       ? gvv("screwHoleUpperZ") :
    name=="screwBracketCylinderRadius"      ? 5 :
    name=="screwBracketCylinderRotX"        ? 0 :
    name=="screwBracketCylinderRotY"        ? 90 :
    name=="screwBracketCylinderRotZ"        ? 0 :  
//////screwHoleUpper dimensions
    name=="screwHoleUpperW"     ? 0 :
    name=="screwHoleUpperH"     ? 0 :
    name=="screwHoleUpperD"     ? 0 :
    name=="screwHoleUpperX"     ? 0 :
    name=="screwHoleUpperY"     ? 0 :
    name=="screwHoleUpperZ"     ? 56 :
    name=="screwHoleUpperRadius"        ? 0 :
    name=="screwHoleUpperRotX"      ? 0 :
    name=="screwHoleUpperRotY"      ? 90 :
    name=="screwHoleUpperRotZ"      ? 0 :   
//////screwHoleUpperCountersink dimensions
    name=="screwHoleUpperCountersinkW"      ? 0 :
    name=="screwHoleUpperCountersinkH"      ? 0 :
    name=="screwHoleUpperCountersinkD"      ? 0 :
    name=="screwHoleUpperCountersinkX"      ? gvv("screwBracketCylinderX")+0:
    name=="screwHoleUpperCountersinkY"      ? 0 :
    name=="screwHoleUpperCountersinkZ"      ? gvv("screwHoleUpperZ") :
    name=="screwHoleUpperCountersinkRadius"     ? 0 :
    name=="screwHoleUpperCountersinkRotX"       ? 0 :
    name=="screwHoleUpperCountersinkRotY"       ? 90 :
    name=="screwHoleUpperCountersinkRotZ"       ? 0 :
////////////Front Screw Hole
//////frontScrewClearance variable
    name=="frontScrewClearance"     ? 0.5 :
//////frontScrewTilt variable
    name=="frontScrewTilt"      ? 90-30 :    
//////frontScrewBump dimensions
    name=="frontScrewBumpW"     ? 5+gvv("frontScrewClearance") :
    name=="frontScrewBumpH"     ? 11+gvv("frontScrewClearance") :
    name=="frontScrewBumpD"     ? 25+gvv("frontScrewClearance") :
    name=="frontScrewBumpX"     ? -gvv("bottomPieceWidth")+14 :
    name=="frontScrewBumpY"     ? 0 :
    name=="frontScrewBumpZ"     ? 4.25 :
    name=="frontScrewBumpRadius"        ? 5/2 :
    name=="frontScrewBumpRotX"      ? gvv("frontScrewTilt") :
    name=="frontScrewBumpRotY"      ? 0 :
    name=="frontScrewBumpRotZ"      ? 90 :   
//////frontScrewHole dimensions
    name=="frontScrewHoleW"     ? 0 :
    name=="frontScrewHoleH"     ? 0 :
    name=="frontScrewHoleD"     ? 30 :
    name=="frontScrewHoleX"     ? gvv("frontScrewBumpX") :
    name=="frontScrewHoleY"     ? gvv("frontScrewBumpY") :
    name=="frontScrewHoleZ"     ? gvv("frontScrewBumpZ")-2 :
    name=="frontScrewHoleRadius"        ? 0 :
    name=="frontScrewHoleRotX"      ? 0 :
    name=="frontScrewHoleRotY"      ? gvv("frontScrewTilt") :
    name=="frontScrewHoleRotZ"      ? 0 :
//////frontScrewHoleCountersink dimensions
    name=="frontScrewHoleCountersinkW"      ? 0 :
    name=="frontScrewHoleCountersinkH"      ? 0 :
    name=="frontScrewHoleCountersinkD"      ? 10 :
    name=="frontScrewHoleCountersinkX"      ? gvv("frontScrewHoleX")-15 :
    name=="frontScrewHoleCountersinkY"      ? 0 :
    name=="frontScrewHoleCountersinkZ"      ? gvv("frontScrewHoleZ")-8.5 :
    name=="frontScrewHoleCountersinkRadius"     ? 0 :
    name=="frontScrewHoleCountersinkRotX"       ? 0 :
    name=="frontScrewHoleCountersinkRotY"       ? gvv("frontScrewTilt") :
    name=="frontScrewHoleCountersinkRotZ"       ? 0 :       
//////frontScrewAngleClipper dimensions
    name=="frontScrewAngleClipperW"     ? 10 :
    name=="frontScrewAngleClipperH"     ? 100 :
    name=="frontScrewAngleClipperD"     ? 100 :
    name=="frontScrewAngleClipperX"     ? gvv("frontScrewBumpX")-23.25-gvv("frontScrewAngleClipperW")/2 :
    name=="frontScrewAngleClipperY"     ? 0 :
    name=="frontScrewAngleClipperZ"     ? gvv("frontScrewHoleZ")+gvv("frontScrewAngleClipperD")/2 :
    name=="frontScrewAngleClipperRadius"        ? 0 :
    name=="frontScrewAngleClipperRotX"      ? 0 :
    name=="frontScrewAngleClipperRotY"      ? -10 :
    name=="frontScrewAngleClipperRotZ"      ? 0 :
//////batteryClipBoltBracket dimensions
    name=="batteryClipBoltBracketW"     ? 20 :
    name=="batteryClipBoltBracketH"     ? 65 :
    name=="batteryClipBoltBracketD"     ? 14 :
    name=="batteryClipBoltBracketX"     ? 0-5 :
    name=="batteryClipBoltBracketY"     ? 0 :
    name=="batteryClipBoltBracketZ"     ? gvv("batteryBaseBumpCutoutDepth") :
    name=="batteryClipBoltBracketRadius"        ? 0 :
    name=="batteryClipBoltBracketRotX"      ? 0 :
    name=="batteryClipBoltBracketRotY"      ? 0 :
    name=="batteryClipBoltBracketRotZ"      ? 0 :    
//////batteryClipBoltAA dimensions
    name=="batteryClipBoltAAX"      ? gvv("batteryClipBoltBracketX") :
    name=="batteryClipBoltAAY"      ? 25 :
    name=="batteryClipBoltAAZ"      ? 0 :
//////batteryClipBoltAB dimensions
    name=="batteryClipBoltABX"      ? gvv("batteryClipBoltBracketX") :
    name=="batteryClipBoltABY"      ? -25 :
    name=="batteryClipBoltABZ"      ? 0 :
    
    

0;
