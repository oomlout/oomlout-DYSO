
module drawDysonV6(color){
    oiiiD(type="dysonV6Handle");
    oiiiD(type="dysonV6DustBin");
    oiiiD(type="dysonV6Battery");
    drawDysonV6Handle();
    drawDysonV6DustBin();
    drawDysonV6Battery();
}

module drawDysonBatteryClipBolt(color){

 
    translate([0,0,20]){
        union(){
            difference(){
                oiiD("cubeRounded","batteryClipBoltBracket",color=color); 
                drawDysonV6HandleBottomClearance(color); 
//////batteryClipBoltAA oi
                oiiD("holeM6","batteryClipBoltAA",color=color); 
//////batteryClipBoltAB oi
                oiiD("holeM6","batteryClipBoltAB",color=color);
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
                    #drawDysonV6Battery(color);
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
                    oiiD("cylinder","barrel",color=color);  
    //////handle oi
                    oiiD("cubeRounded","handle",color=color);    
    //////frontSupportMain oi
                oiiD("cube","frontSupportMain",color=color);   
    //////bottom oi
                oiiD("cube","bottom",color=color);        
                }
    //remove the overhang out the bottom
                oi("cube",x=0,y=0,z=0,width=1000,height=1000,depth=100,color=color);        
            }
    ///////////Insert bottom screw dangle here
//////front screw hole
            drawDysonBatteryFrontScrewPositive(color) ;
//////frontSupportBase oi
    oiiD("cube","frontSupportBase",color=color);                          
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
                            //oiiD("cylinder","barrel",color);  
            //////handle oi
                            oiiD("cubeRounded","handle",color=color);    
            //////frontSupportBase oi
                        oiiD("cube","frontSupportBase",color=color);          
            //////frontSupportMain oi
                            oiiD("cube","frontSupportMain",color=color);   
            //////bottom oi
                        oiiD("cube","bottom",color=color);        
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
        oiiD("cylinder","dustBin",color=color);
//////dustbinClip oi
        oiiD("cube","dustbinClip",color=color);   
//////dustBinPlungerClearance oi
    oiiD("cube","dustBinPlungerClearance",color=color);        

        }
////////////DustBin Subtractions        
        union(){
//////dustBinCutout oi            
        if(!noCutout){
            oiiD("cube","dustBinCutout",color=color);                         
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
            oiiD("cubeRounded","batteryBase",color); 
//////batteryBaseBump oi
            oiiD("cube","batteryBaseBump",color);        
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
            oiiD("cubeRounded","batteryHandle",color);  
////////////Clearance for screw cylinder            
            difference(){
                union(){
    //////screwBracket oi
                oiiD("cube","screwBracket",color); 
    //////screwBracketDrop oi
                oiiD("cube","screwBracketDrop",color);   
                }
//////screwBracketSwitchClearance oi
            oiiD("cube","screwBracketSwitchClearance",color);        
                        }
//////screwBracketCylinder oi
            oiiD("cylinder","screwBracketCylinder",color);                  
        }
        //////battery handle negative
        union(){            
//////sideCutouts
            oiiD("cube","sideCutoutLeftFront",color); 
            oiiD("cube","sideCutoutLeftRear",color);  
            oiiD("cube","sideCutoutRightFront",color);  
            oiiD("cube","sideCutoutRightRear",color);  
//////rearCutouts  
            oiiD("cube","rearCutoutLeft",color);                                 
            oiiD("cube","rearCutoutRight",color);
//////batteryTerminalCutouts
            drawDysonBatteryTerminals(color);

//////screwHoleUpper oi
            oiiD("holeM25D","screwHoleUpper",color);   
//////screwHoleUpperCountersink oi
            //Not needed as it passes through
            //oiiD("capscrewM25D","screwHoleUpperCountersink",color);                
                   

        }
    }
}

module drawDysonBatteryFrontScrewPositive(color){
    difference(){
//////frontScrewBump oi
    oiiD("cubeRounded","frontScrewBump",color);
////////////Clipping Boxes
        oi("cube",x=0,y=0,z=10+0.25,width=1000,height=1000,depth=10,color=color);
        oi("cube",x=gvvD("frontScrewBumpX")-10-9-100/2,y=0,z=1000/2
        ,width=110,height=1000,depth=1000,color=color);
////////////Front Angle Clip   
//////frontScrewAngleClipper oi
        oiiD("cube","frontScrewAngleClipper",color);     
    }
}

module drawDysonBatteryFrontScrewNegative(color){
//////frontScrewHole oi
difference(){
    union(){
        oiiD("holeM25D","frontScrewHole",color); 
    //////frontScrewHoleCountersink oi
        oiiD("capscrewM25D","frontScrewHoleCountersink",color);    
    }
    
////////////Clipping Boxes
    oi("cube",x=0,y=0,z=10+0.25,width=1000,height=1000,depth=10,color=color);
}

}

module drawDysonBatteryTerminals(color){
//////batteryTerminalCutouts
            oiiD("cube","batteryTerminalLeft",color);
            oiiD("cube","batteryTerminalRight",color);
}


module oiiiD(type,name,color){
   oiiD(type,x=gvvD(str(name,"X")),y=gvvD(str(name,"Y")),z=gvvD(str(name,"Z")),rotX=gvvD(str(name,"RotX")),rotY=gvvD(str(name,"RotY")),rotZ=gvvD(str(name,"RotZ")),color=color); 
}

module oiiD(type,name,color="gray",x=0,y=0,z=0,ex=0,length=0,rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,rad2=0,alpha=1,OOwidth=0,OOheight=0,holes=true,negative=true){
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
                        oiiiD(type="dysonV6Handle",color=color);
                        oiiiD(type="dysonV6DustBin",color=color);
                        oiiiD(type="dysonV6Battery",color=color);
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

//@@@@@@dyonHandleClearance Asembly                                            
                    else if(type=="dysonHandleClearance"){
                        drawDysonV6HandleBottomClearance(color);                       
                    }

//@@@@@@dysonV6FrontScrewNegative Asembly                                            
                    else if(type=="dysonV6FrontScrewNegative"){
                        drawDysonBatteryFrontScrewNegative(color);                            
                    }                                            
//@@@@@@dysonV6batteryTerminals Asembly                                            
                    else if(type=="dysonV6batteryTerminals"){
                        drawDysonBatteryTerminals(color);                 
                    }                        
                    else{    
                        oi(type,x=gvvD(str(name,"X")),y=gvvD(str(name,"Y")),z=gvvD(str(name,"Z")),width=gvvD(str(name,"W")),height=gvvD(str(name,"H")),depth=gvvD(str(name,"D")),rad=gvvD(str(name,"Radius")),rotX=gvvD(str(name,"RotX")),rotY=gvvD(str(name,"RotY")),rotZ=gvvD(str(name,"RotZ")),color=color,name=name);
                    }
                }
        }
    }
}


function gvvD(name) =
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
        name=="barrelX" ? -(gvvD("bottomPieceWidth")-gvvD("barrelD")) :
        name=="barrelY" ? 0 :
        name=="barrelZ" ? 130 :
        name=="barrelRadius" ? 70/2 : 
        name=="barrelRotY"  ?   90 :   
    //////handle dimensions
        name=="handleW"     ? 42.5 :
        name=="handleH"     ? gvvD("handleDiameter") :
        name=="handleD"     ? 120 :
        name=="handleX"     ? -40.5 :
        name=="handleY"     ? 0 :
        name=="handleZ"     ? gvvD("handleD")-20 :
        name=="handleRadius"    ? gvvD("handleDiameter")/2 :
        name=="handleRotX"      ? 0 :
        name=="handleRotY"      ? gvvD("handleTilt") :
        name=="handleRotZ"      ? 0 :  
    //////bottom dimensions
        name=="bottomW"     ? gvvD("bottomPieceWidth")-gvvD("handleDiameter")/2 :
        name=="bottomH"     ? gvvD("handleDiameter") :
        name=="bottomD"     ? 4.5 :
        name=="bottomX"     ? -gvvD("bottomW")/2-gvvD("handleDiameter")/2 :
        name=="bottomY"     ? 0 :
        name=="bottomZ"     ? gvvD("bottomD") :
        name=="bottomRadius"        ? 0 :
        name=="bottomRotX"      ? 0 :
        name=="bottomRotY"      ? 0 :
        name=="bottomRotZ"      ? 0 :
    //////frontSupportBase dimensions
        name=="frontSupportBaseExtra"   ? 2  :
        name=="frontSupportBaseW"       ? 13.5 + gvvD("frontSupportBaseExtra") :
        name=="frontSupportBaseH"       ? gvvD("handleDiameter") :
        name=="frontSupportBaseD"       ? 20 :
        name=="frontSupportBaseX"       ? -gvvD("bottomPieceWidth")+gvvD("frontSupportBaseW")/2 - gvvD("frontSupportBaseExtra") :
        name=="frontSupportBaseY"       ? 0 :
        name=="frontSupportBaseZ"       ? 18.5 :
        name=="frontSupportBaseRadius"      ? 0 :
        name=="frontSupportBaseRotX"        ? 0 :
        name=="frontSupportBaseRotY"        ? 0 :
        name=="frontSupportBaseRotZ"        ? 0 :       
    //////frontSupportMain dimensions
        name=="frontSupportMainW"       ? 9 :
        name=="frontSupportMainH"       ? gvvD("handleDiameter") :
        name=="frontSupportMainD"       ? 95+gvvD("frontSupportExtra") :
        name=="frontSupportMainX"       ? -gvvD("bottomPieceWidth")+gvvD("frontSupportBaseW")/2 -gvvD("frontSupportBaseW")/2+gvvD("frontSupportMainW")/2:
        name=="frontSupportMainY"       ? 0 :
        name=="frontSupportMainZ"       ? gvvD("frontSupportMainD") :
        name=="frontSupportMainRadius"      ? 0 :
        name=="frontSupportMainRotX"        ? 0 :
        name=="frontSupportMainRotY"        ? 0 :
        name=="frontSupportMainRotZ"        ? 0 :
////////////Dyson V6 Dust Bin
    //////dustBin dimensions
        name=="dustBinW"        ? 0 :
        name=="dustBinH"        ? 0 :
        name=="dustBinD"        ? 129 :
        name=="dustBinX"        ? -gvvD("bottomPieceWidth")-gvvD("dustBinRadius") +0.5:
        name=="dustBinY"        ? 0 :
        name=="dustBinZ"        ? gvvD("dustBinD")-28 :
        name=="dustBinRadius"       ? 107/2 :
        name=="dustBinRotX"     ? 0 :
        name=="dustBinRotY"     ? 0 :
        name=="dustBinRotZ"     ? 0 :
    //////dustBinCutout dimensions
        name=="dustBinCutoutW"      ? 8 :
        name=="dustBinCutoutH"      ? 12 :
        name=="dustBinCutoutD"      ? 30 :
        name=="dustBinCutoutX"      ? gvvD("dustBinX")+gvvD("dustBinRadius") :
        name=="dustBinCutoutY"      ? -gvvD("dustBinCutoutH/2")-3 :
        name=="dustBinCutoutZ"      ? gvvD("dustBinZ")-90 :
        name=="dustBinCutoutRadius"     ? 0 :
        name=="dustBinCutoutRotX"       ? 0 :
        name=="dustBinCutoutRotY"       ? 0 :
        name=="dustBinCutoutRotZ"       ? 0 :
//////dustbinClip dimensions
    name=="dustbinClipW"        ? 10 :
    name=="dustbinClipH"        ? 3 :
    name=="dustbinClipD"        ? 26 :
    name=="dustbinClipX"        ? gvvD("dustBinX")+gvvD("dustBinRadius")+gvvD("dustbinClipW")/2-2 :
    name=="dustbinClipY"        ? -12 :
    name=="dustbinClipZ"        ? gvvD("dustBinZ")-80 :
    name=="dustbinClipRadius"       ? 0 :
    name=="dustbinClipRotX"     ? 0 :
    name=="dustbinClipRotY"     ? 0 :
    name=="dustbinClipRotZ"     ? 0 :
//////dustBinPlungerClearance dimensions
    name=="dustBinPlungerClearanceW"        ? 8 :
    name=="dustBinPlungerClearanceH"        ? 8 :
    name=="dustBinPlungerClearanceD"        ? 65 :
    name=="dustBinPlungerClearanceX"        ? gvvD("dustBinX")+gvvD("dustBinRadius")+gvvD("dustbinClipW")/2-3 :
    name=="dustBinPlungerClearanceY"        ? 8 :
    name=="dustBinPlungerClearanceZ"        ? gvvD("dustBinZ")-63 :
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
    name=="batteryShiftX"        ? gvvD("batteryBaseBumpShift")+gvvD("handleShift")+gvvD("plasticThickness")-2 :    


//////////// Parts    
//////batteryHandle dimensions
    name=="batteryHandleW"      ? 39-2 :
    name=="batteryHandleH"      ? gvvD("handleDiameterBattery") :
    name=="batteryHandleD"      ? 20+32-6+gvvD("batteryBaseBumpCutoutDepth") :
    name=="batteryHandleX"      ? 27+gvvD("batteryBaseBumpShift")+gvvD("handleShift")+gvvD("batteryShiftX")+2 :
    name=="batteryHandleY"      ? 0 :
    name=="batteryHandleZ"      ? gvvD("batteryHandleD")-20 :
    name=="batteryHandleRadius"     ? gvvD("handleDiameterBattery")/2 :
    name=="batteryHandleRotX"       ? 0 :
    name=="batteryHandleRotY"       ? gvvD("handleTilt") :
    name=="batteryHandleRotZ"       ? 0 :
//////batteryBase dimensions
    name=="batteryBaseW"        ? gvvD("batteryBaseBumpW")+17 :
    name=="batteryBaseH"        ? 28 :
    name=="batteryBaseD"        ? 75 :
    name=="batteryBaseX"        ? -gvvD("batteryBaseW")/2-gvvD("batteryShiftX") :
    name=="batteryBaseY"        ? -gvvD("batteryBaseD")/2 :
    name=="batteryBaseZ"        ? -gvvD("batteryBaseH")/2 :
    name=="batteryBaseRadius"       ? gvvD("batteryBaseH")/2 :
    name=="batteryBaseRotX"     ? 90 :
    name=="batteryBaseRotY"     ? 0 :
    name=="batteryBaseRotZ"     ? 0 :
//////batteryBaseBump dimensions
    name=="batteryBaseBumpW"        ? 109 :
    name=="batteryBaseBumpH"        ? 42 :
    name=="batteryBaseBumpD"        ? gvvD("batteryBaseBumpCutoutDepth")+10 :
    name=="batteryBaseBumpX"        ? -gvvD("batteryBaseBumpW")/2+gvvD("batteryBaseBumpShift")-gvvD("batteryShiftX") :
    name=="batteryBaseBumpY"        ? 0 :
    name=="batteryBaseBumpZ"        ? gvvD("batteryBaseBumpCutoutDepth") :
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
    name=="sideCutoutLeftFrontX"        ? gvvD("batteryHandleX")+gvvD("batteryHandleW")/2-gvvD("sideCutoutX") :
    name=="sideCutoutLeftFrontY"        ? -gvvD("handleDiameterBattery")/2+gvvD("sideCutoutLeftFrontHeight")/2-1 :
    name=="sideCutoutLeftFrontZ"        ? gvvD("sideCutoutLeftFrontD")-gvvD("batteryBaseBumpCutoutD")-2 :
    name=="sideCutoutLeftFrontRadius"       ? 0 :
    name=="sideCutoutLeftFrontRotX"     ? 0 :
    name=="sideCutoutLeftFrontRotY"     ? gvvD("handleTilt") :
    name=="sideCutoutLeftFrontRotZ"     ? 0 :
//////sideCutoutLeftRear dimensions
    name=="sideCutoutLeftRearW"        ? gvvD("sideCutoutLeftFrontW") :
    name=="sideCutoutLeftRearH"        ? gvvD("sideCutoutLeftFrontH") :
    name=="sideCutoutLeftRearD"        ? gvvD("sideCutoutLeftFrontD") :
    name=="sideCutoutLeftRearX"        ? gvvD("sideCutoutLeftFrontX")-gvvD("sideCutoutCenters") :
    name=="sideCutoutLeftRearY"        ? gvvD("sideCutoutLeftFrontY") :
    name=="sideCutoutLeftRearZ"        ? gvvD("sideCutoutLeftFrontZ") :
    name=="sideCutoutLeftRearRotY"     ? gvvD("handleTilt") :
//////sideCutoutRightFront dimensions
    name=="sideCutoutRightFrontW"        ? gvvD("sideCutoutLeftFrontW") :
    name=="sideCutoutRightFrontH"        ? gvvD("sideCutoutLeftFrontH") :
    name=="sideCutoutRightFrontD"        ? gvvD("sideCutoutLeftFrontD") :
    name=="sideCutoutRightFrontX"        ? gvvD("sideCutoutLeftFrontX") :
    name=="sideCutoutRightFrontY"        ? -gvvD("sideCutoutLeftFrontY") :
    name=="sideCutoutRightFrontZ"        ? gvvD("sideCutoutLeftFrontZ") :
    name=="sideCutoutRightFrontRotY"     ? gvvD("handleTilt") :
//////sideCutoutRightRear dimensions
    name=="sideCutoutRightRearW"        ? gvvD("sideCutoutLeftFrontW") :
    name=="sideCutoutRightRearH"        ? gvvD("sideCutoutLeftFrontH") :
    name=="sideCutoutRightRearD"        ? gvvD("sideCutoutLeftFrontD") :
    name=="sideCutoutRightRearX"        ? gvvD("sideCutoutLeftFrontX")-gvvD("sideCutoutCenters") :
    name=="sideCutoutRightRearY"        ? -gvvD("sideCutoutLeftFrontY") :
    name=="sideCutoutRightRearZ"        ? gvvD("sideCutoutLeftFrontZ") :
    name=="sideCutoutRightRearRotY"     ? gvvD("handleTilt") :

////////////Rear Cutouts
//////rearCutoutCenters variable
    name=="rearCutoutCenters"       ? 9.5 :
//////rearCutoutLeft dimensions
    name=="rearCutoutLeftW"     ? 4 :
    name=="rearCutoutLeftH"     ? 2 :
    name=="rearCutoutLeftD"     ? 34+1 :
    name=="rearCutoutLeftX"     ? gvvD("batteryHandleX")-gvvD("batteryHandleW")/2+gvvD("rearCutoutLeftW")/2-2 :
    name=="rearCutoutLeftY"     ? gvvD("rearCutoutCenters")/2 :
    name=="rearCutoutLeftZ"     ? gvvD("rearCutoutLeftD")-gvvD("batteryBaseBumpCutoutD")-2 :
    name=="rearCutoutLeftRadius"        ? 0 :
    name=="rearCutoutLeftRotX"      ? 0 :
    name=="rearCutoutLeftRotY"      ? gvvD("handleTilt") :
    name=="rearCutoutLeftRotZ"      ? 0 :      
//////rearCutoutRight dimensions
    name=="rearCutoutRightW"     ? gvvD("rearCutoutLeftW") :
    name=="rearCutoutRightH"     ? gvvD("rearCutoutLeftH") :
    name=="rearCutoutRightD"     ? gvvD("rearCutoutLeftD") :
    name=="rearCutoutRightX"     ? gvvD("rearCutoutLeftX") :
    name=="rearCutoutRightY"     ? -gvvD("rearCutoutCenters")/2 :
    name=="rearCutoutRightZ"     ? gvvD("rearCutoutLeftZ") :
    name=="rearCutoutRightRadius"        ? 0 :
    name=="rearCutoutRightRotX"      ? 0 :
    name=="rearCutoutRightRotY"      ? gvvD("handleTilt") :
    name=="rearCutoutRightRotZ"      ? 0 :      

////////////Battery Terminal Cutouts
//////batteryTerminalExtra variable
    name=="batteryTerminalExtra"        ? 4 :
    name=="batteryTerminalExtraZ"        ? 50 :
//////batteryTerminalCenters variable
    name=="batteryTerminalCenters"      ? 9 :    
//////batteryTerminalLeft dimensions
    name=="batteryTerminalLeftW"        ? 8+gvvD("batteryTerminalExtra") :
    name=="batteryTerminalLeftH"        ? 1+gvvD("batteryTerminalExtra") :
    name=="batteryTerminalLeftD"        ? 30+gvvD("batteryTerminalExtraZ") :
    name=="batteryTerminalLeftX"        ? gvvD("batteryHandleX")+gvvD("batteryHandleW")/2-27 :
    name=="batteryTerminalLeftY"        ? gvvD("batteryTerminalCenters")/2 :
    name=="batteryTerminalLeftZ"        ? gvvD("batteryTerminalLeftD")-gvvD("batteryTerminalExtraZ")-1 :
    name=="batteryTerminalLeftRotY"     ? gvvD("handleTilt") :
//////batteryTerminalRight dimensions
    name=="batteryTerminalRightW"        ? gvvD("batteryTerminalLeftW") :
    name=="batteryTerminalRightH"        ? gvvD("batteryTerminalLeftH") :
    name=="batteryTerminalRightD"        ? gvvD("batteryTerminalLeftD") :
    name=="batteryTerminalRightX"        ? gvvD("batteryTerminalLeftX") :
    name=="batteryTerminalRightY"        ? -gvvD("batteryTerminalCenters")/2 :
    name=="batteryTerminalRightZ"        ? gvvD("batteryTerminalLeftZ") :
    name=="batteryTerminalRightRotY"     ? gvvD("handleTilt") :
//////batteryTerminalLeft dimensions
    name=="batteryTerminalLeftW"        ? 8+gvvD("batteryTerminalExtra") :
    name=="batteryTerminalLeftH"        ? 1+gvvD("batteryTerminalExtra") :
    name=="batteryTerminalLeftD"        ? 30+gvvD("batteryTerminalExtra") :
    name=="batteryTerminalLeftX"        ? gvvD("batteryHandleX")+gvvD("batteryHandleW")/2-27 :
    name=="batteryTerminalLeftY"        ? gvvD("batteryTerminalCenters")/2 :
    name=="batteryTerminalLeftZ"        ? gvvD("batteryTerminalLeftD") :
    name=="batteryTerminalLeftRotY"     ? gvvD("handleTilt") :
//////batteryTerminalRight dimensions
    name=="batteryTerminalRightW"        ? gvvD("batteryTerminalLeftW") :
    name=="batteryTerminalRightH"        ? gvvD("batteryTerminalLeftH") :
    name=="batteryTerminalRightD"        ? gvvD("batteryTerminalLeftD") :
    name=="batteryTerminalRightX"        ? gvvD("batteryTerminalLeftX") :
    name=="batteryTerminalRightY"        ? -gvvD("batteryTerminalCenters")/2 :
    name=="batteryTerminalRightZ"        ? gvvD("batteryTerminalLeftZ") :
    name=="batteryTerminalRightRotY"     ? gvvD("handleTilt") :    

////////////Screw Bracket
//////screwBracketDrop variable
    name=="screwBracketDrop"        ? 5 :

//////screwBracket dimensions
    name=="screwBracketW"       ? 3 :
    name=="screwBracketH"       ? 10 :
    name=="screwBracketD"       ? gvvD("screwHoleUpperZ")+5-gvvD("screwBracketCylinderRadius") :
    name=="screwBracketX"       ? gvvD("batteryHandleX")+gvvD("batteryHandleW")/2-10-5-2 :
    name=="screwBracketY"       ? 0 :
    name=="screwBracketZ"       ? gvvD("screwBracketD") :
//////screwBracketDrop dimensions
    name=="screwBracketDropW"       ? 10 :
    name=="screwBracketDropH"       ? gvvD("screwBracketH") :
    name=="screwBracketDropD"       ? gvvD("screwBracketD")-gvvD("screwBracketDrop") :
    name=="screwBracketDropX"       ? gvvD("screwBracketX") :
    name=="screwBracketDropY"       ? 0 :
    name=="screwBracketDropZ"       ? gvvD("screwBracketZ")-gvvD("screwBracketDrop") :
//////screwBracketSwitchClearance dimensions
    name=="screwBracketSwitchClearanceW"        ? 10 :
    name=="screwBracketSwitchClearanceH"        ? 10 :
    name=="screwBracketSwitchClearanceD"        ? 30 :
    name=="screwBracketSwitchClearanceX"        ? gvvD("screwBracketDropX") :
    name=="screwBracketSwitchClearanceY"        ? gvvD("screwBracketDropY")+7 :
    name=="screwBracketSwitchClearanceZ"        ? gvvD("screwBracketDropZ")+20 :
//////screwBracketCylinder dimensions
    name=="screwBracketCylinderW"       ? 0 :
    name=="screwBracketCylinderH"       ? 0 :
    name=="screwBracketCylinderD"       ? gvvD("screwBracketW") :
    name=="screwBracketCylinderX"       ? gvvD("screwBracketX")+gvvD("screwBracketCylinderD")/2 :
    name=="screwBracketCylinderY"       ? 0 :
    name=="screwBracketCylinderZ"       ? gvvD("screwHoleUpperZ") :
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
    name=="screwHoleUpperCountersinkX"      ? gvvD("screwBracketCylinderX")+0:
    name=="screwHoleUpperCountersinkY"      ? 0 :
    name=="screwHoleUpperCountersinkZ"      ? gvvD("screwHoleUpperZ") :
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
    name=="frontScrewBumpW"     ? 5+gvvD("frontScrewClearance") :
    name=="frontScrewBumpH"     ? 11+gvvD("frontScrewClearance") :
    name=="frontScrewBumpD"     ? 25+gvvD("frontScrewClearance") :
    name=="frontScrewBumpX"     ? -gvvD("bottomPieceWidth")+14 :
    name=="frontScrewBumpY"     ? 0 :
    name=="frontScrewBumpZ"     ? 4.25 :
    name=="frontScrewBumpRadius"        ? 5/2 :
    name=="frontScrewBumpRotX"      ? gvvD("frontScrewTilt") :
    name=="frontScrewBumpRotY"      ? 0 :
    name=="frontScrewBumpRotZ"      ? 90 :   
//////frontScrewHole dimensions
    name=="frontScrewHoleW"     ? 0 :
    name=="frontScrewHoleH"     ? 0 :
    name=="frontScrewHoleD"     ? 30 :
    name=="frontScrewHoleX"     ? gvvD("frontScrewBumpX") :
    name=="frontScrewHoleY"     ? gvvD("frontScrewBumpY") :
    name=="frontScrewHoleZ"     ? gvvD("frontScrewBumpZ")-2 :
    name=="frontScrewHoleRadius"        ? 0 :
    name=="frontScrewHoleRotX"      ? 0 :
    name=="frontScrewHoleRotY"      ? gvvD("frontScrewTilt") :
    name=="frontScrewHoleRotZ"      ? 0 :
//////frontScrewHoleCountersink dimensions
    name=="frontScrewHoleCountersinkW"      ? 0 :
    name=="frontScrewHoleCountersinkH"      ? 0 :
    name=="frontScrewHoleCountersinkD"      ? 10 :
    name=="frontScrewHoleCountersinkX"      ? gvvD("frontScrewHoleX")-15 :
    name=="frontScrewHoleCountersinkY"      ? 0 :
    name=="frontScrewHoleCountersinkZ"      ? gvvD("frontScrewHoleZ")-8.5 :
    name=="frontScrewHoleCountersinkRadius"     ? 0 :
    name=="frontScrewHoleCountersinkRotX"       ? 0 :
    name=="frontScrewHoleCountersinkRotY"       ? gvvD("frontScrewTilt") :
    name=="frontScrewHoleCountersinkRotZ"       ? 0 :       
//////frontScrewAngleClipper dimensions
    name=="frontScrewAngleClipperW"     ? 10 :
    name=="frontScrewAngleClipperH"     ? 100 :
    name=="frontScrewAngleClipperD"     ? 100 :
    name=="frontScrewAngleClipperX"     ? gvvD("frontScrewBumpX")-23.25-gvvD("frontScrewAngleClipperW")/2 :
    name=="frontScrewAngleClipperY"     ? 0 :
    name=="frontScrewAngleClipperZ"     ? gvvD("frontScrewHoleZ")+gvvD("frontScrewAngleClipperD")/2 :
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
    name=="batteryClipBoltBracketZ"     ? gvvD("batteryBaseBumpCutoutDepth") :
    name=="batteryClipBoltBracketRadius"        ? 0 :
    name=="batteryClipBoltBracketRotX"      ? 0 :
    name=="batteryClipBoltBracketRotY"      ? 0 :
    name=="batteryClipBoltBracketRotZ"      ? 0 :    
//////batteryClipBoltAA dimensions
    name=="batteryClipBoltAAX"      ? gvvD("batteryClipBoltBracketX") :
    name=="batteryClipBoltAAY"      ? 25 :
    name=="batteryClipBoltAAZ"      ? 0 :
//////batteryClipBoltAB dimensions
    name=="batteryClipBoltABX"      ? gvvD("batteryClipBoltBracketX") :
    name=="batteryClipBoltABY"      ? -25 :
    name=="batteryClipBoltABZ"      ? 0 :
    
    

0;
