'To Boldly Go v0.2.6 - Kopernicus Procedural Galaxy Generator!"
'Copyright (C) 2016  Daniel L."
'
'This program is free software; you can redistribute it and/or modify"
'it under the terms of the GNU General Public License as published by"
'the Free Software Foundation; either version 2 of the License, or"
'(at your option) any later version."
'PRINT
'This program is distributed in the hope that it will be useful,"
'but WITHOUT ANY WARRANTY; without even the implied warranty of"
'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
'PGNU General Public License for more details."
'
'You should have received a copy of the GNU General Public License"
'along with this program; if not, write to the Free Software"
'Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA"

_TITLE "To Boldly Go version 0.2.6"

i& = _LOADIMAGE("Data_Folder/Galaxy-icon.png", 32) '<<<<<<< use your image file name here
IF i& < -1 THEN
    _ICON i&
    _FREEIMAGE i& ' release image handle after setting icon
END IF

888 PRINT
CLS

BROWNSTARNUMBER = 1
REDSTARNUMBER = 1
KSTARNUMBER = 1
YELLOWSTARNUMBER = 1
WHITESTARNUMBER = 1
BLUESTARNUMBER = 1
DWARFSTARNUMBER = 1
NEUTRONSTARNUMBER = 1
BLACKHOLENUMBER = 1
CLUSTERCORENUMBER = 1
CORESTARNUMBER = 1

CLS 'clears the screen
OPEN "galaxy.cfg" FOR OUTPUT AS #1 'Creates the config file

'*******************************************************************************
'*******************************************************************************
DIM Backdrop AS LONG
SCREEN _NEWIMAGE(700, 518, 32)
Backdrop = _LOADIMAGE("Data_folder/Background2.png")
_PUTIMAGE (0, 0), Backdrop

_FONT _LOADFONT("Data_folder/DejaVuSans.ttf", 15, "MONOSPACE") 'select monospace font
_PRINTMODE _KEEPBACKGROUND
'*******************************************************************************
'*******************************************************************************

PRINT ""

778 PRINT
_FONT _LOADFONT("Data_folder/DejaVuSans.ttf", 15, "MONOSPACE") 'select monospace font
_PRINTMODE _KEEPBACKGROUND


IF PTOGGLE = 1 THEN
    PENABLE$ = "y"
END IF

IF ATOGGLE = 1 THEN
    ASTTOG$ = "y"
END IF

FOR i = 1 TO 11
    PRINT ""
NEXT
COLOR _RGB(0, 0, 0), _RGB(255, 255, 255)
PRINT "Please do not use capitalization"
PRINT "for anything other than the Galaxy name."
PRINT ""
INPUT "Name your Galaxy:", GNAME$
2222 INPUT " (CUSTOM/AUTO)(c/a):", CUSTOM$

INPUT " Input Seed:", SEED 'asks the user for a random seed.
RANDOMIZE SEED

REDSTAR = 0
YELLOWSTAR = 0
BLUESTAR = 0
WHITESTAR = 0
BROWNSTAR = 0
DWARFSTAR = 0

IF CUSTOM$ = "c" THEN
    INPUT "Galaxy Age (0-5. 1 is recommended):", AGE
    INPUT "Planets? (y/n):", PENABLE$ 'Asks the user whether they want to have planets or not
    '*******************************************************************************
    INPUT "Asteroids? (y/n):", ASTTOG$ 'Asks the user whether they want to have asteroids or not
    '*******************************************************************************
    PRINT "What Galaxy type do you want?:"
    999 INPUT "Ellipse-0, Disk-1, Cluster-2:", GTYPE 'Asks the user what kind of galaxy they want.
    IF GTYPE > 2 THEN
        GOTO 999
    END IF
    '*******************************************************************************
    INPUT "advanced settings? (y/n):", ADVANCED$

    IF ADVANCED$ = "y" THEN
        '*******************************************************************************
        IF GTYPE = 3 THEN
            INPUT "Clusters:", CLUSTER 'Asks the user how many star clusters they want
        END IF
        PRINT ""
        '*******************************************************************************
        INPUT "Red Dwarves:", REDSTAR 'Asks the user how many red stars they want to generate.
        REDSTAR = REDSTAR + 0
        '*******************************************************************************
        INPUT "Orange Dwarves:", KSTAR 'Asks the user how many orange stars they want to generate.
        KSTAR = KSTAR + 0
        '*******************************************************************************
        INPUT "Yellow Dwarves:", YELLOWSTAR 'Asks the user how many yellow stars they want to generate.
        YELLOWSTAR = YELLOWSTAR + 0
        '*******************************************************************************
        INPUT "White Stars:", WHITESTAR 'Asks the user how many white stars they want to generate.
        WHITESTAR = WHITESTAR + 0
        '*******************************************************************************
        INPUT "Blue Giants:", BLUESTAR 'Asks the user how many blue stars they want to generate.
        BLUESTAR = BLUESTAR + 0
        '*******************************************************************************
        INPUT "Brown Dwarves:", BROWNSTAR 'Asks the user how many brown stars they want to generate.
        BROWNSTAR = BROWNSTAR + 0
        '*******************************************************************************
        INPUT "White Dwarves:", DWARFSTAR 'Asks the user how many white dwarves they want to generate.
        DWARFSTAR = DWARFSTAR + 0
        '*******************************************************************************
        'INPUT " BLACK HOLES:", BLACKHOLE 'Asks the user how many black holes they want to generate.
        'BLACKHOLE = BLACKHOLE + 0
        '*******************************************************************************
        'INPUT " ROGUE PLANETS:", ROGUE 'Asks the user how many rogue planets they want to generate.
        'ROGUE = ROGUE + 0
        '*******************************************************************************
        CLS
        _PUTIMAGE (0, 0), Backdrop
        FOR i = 1 TO 11
            PRINT ""
        NEXT
    ELSE
        'AGE = INT(RND * 5)
        'GTYPE = INT(RND * 2)
        IF GTYPE = 2 THEN
            CLUSTER = INT(RND * 4) + 1
            GTYPE = GTYPE + 1
        ELSE
            GTYPE = GTYPE + 1
        END IF
        SELECT CASE AGE
            CASE 0
                REDSTAR = INT(RND * 20) + 10
                KSTAR = INT(RND * 15) + 20
                YELLOWSTAR = INT(RND * 20) + 5
                WHITESTAR = INT(RND * 15) + 4
                BLUESTAR = INT(RND * 10) + 1
                BROWNSTAR = INT(RND * 40) + 5
            CASE 1
                REDSTAR = INT(RND * 20) + 10
                KSTAR = INT(RND * 15) + 7
                YELLOWSTAR = INT(RND * 10) + 5
                WHITESTAR = INT(RND * 7) + 4
                BLUESTAR = INT(RND * 4) + 1
                BROWNSTAR = INT(RND * 40) + 5
                DWARFSTAR = INT(RND * 5)
            CASE 2
                REDSTAR = INT(RND * 20) + 10
                KSTAR = INT(RND * 12) + 7
                YELLOWSTAR = INT(RND * 3) + 1
                BROWNSTAR = INT(RND * 40) + 5
                DWARFSTAR = INT(RND * 10) + 5
            CASE 3
                REDSTAR = INT(RND * 10) + 10
                KSTAR = INT(RND * 7) + 3
                BROWNSTAR = INT(RND * 30) + 5
                DWARFSTAR = INT(RND * 30) + 10
            CASE 4
                REDSTAR = INT(RND * 3)
                BROWNSTAR = INT(RND * 20) + 5
                DWARFSTAR = INT(RND * 40) + 10
            CASE 5
                BROWNSTAR = INT(RND * 15)
                DWARFSTAR = INT(RND * 60) + 10
        END SELECT
    END IF
ELSE
    IF CUSTOM$ = "a" THEN
        AGE = INT(RND * 5)
        GTYPE = INT(RND * 2)
        IF GTYPE = 2 THEN
            CLUSTER = INT(RND * 4) + 1
            GTYPE = GTYPE + 1
        ELSE
            GTYPE = GTYPE + 1
        END IF
        'IF GTYPE = 0 THEN
        GTYPE = 1
        'END IF
        PENABLE$ = "y"
        ASTTOG$ = "y"

        SELECT CASE AGE
            CASE 0
                REDSTAR = INT(RND * 20) + 10
                KSTAR = INT(RND * 15) + 20
                YELLOWSTAR = INT(RND * 20) + 5
                WHITESTAR = INT(RND * 15) + 4
                BLUESTAR = INT(RND * 10) + 1
                BROWNSTAR = INT(RND * 40) + 5
            CASE 1
                REDSTAR = INT(RND * 20) + 10
                KSTAR = INT(RND * 15) + 7
                YELLOWSTAR = INT(RND * 10) + 5
                WHITESTAR = INT(RND * 7) + 4
                BLUESTAR = INT(RND * 4) + 1
                BROWNSTAR = INT(RND * 40) + 5
                DWARFSTAR = INT(RND * 5)
            CASE 2
                REDSTAR = INT(RND * 20) + 10
                KSTAR = INT(RND * 15) + 7
                YELLOWSTAR = INT(RND * 3) + 1
                BROWNSTAR = INT(RND * 40) + 5
                DWARFSTAR = INT(RND * 25) + 5
            CASE 3
                REDSTAR = INT(RND * 20) + 10
                KSTAR = INT(RND * 7) + 3
                BROWNSTAR = INT(RND * 40) + 5
                DWARFSTAR = INT(RND * 30) + 10
            CASE 4
                REDSTAR = INT(RND * 3)
                BROWNSTAR = INT(RND * 40) + 5
                DWARFSTAR = INT(RND * 40) + 10
            CASE 5
                BROWNSTAR = INT(RND * 15)
                DWARFSTAR = INT(RND * 60) + 10
        END SELECT
        'BLACKHOLE = INT(RND * 3)
        'ROGUE = INT(RND * 10)
    ELSE
        GOTO 2222
    END IF
END IF
'################################
'#Make the cfg header text
'###Insert 10 empty lines
FOR i = 1 TO 10
    PRINT #1, ""
NEXT
PRINT #1, "// WARNING! SPOILERS!"
PRINT #1, "// This file contains spoilers. If you don't want to have your surprises ruined, you should stop reading now."
'###Insert 34 empty lines'
FOR i = 1 TO 34
    PRINT #1, ""
NEXT
PRINT #1, "// Seriously, it's a lot more fun to find this stuff out in the game."
PRINT #1, "// Last chance to turn back."
'###Insert 28 empty lines'
FOR i = 1 TO 28
    PRINT #1, ""
NEXT
PRINT #1, "// I did warn you."
'###Insert 6 empty lines'
FOR i = 1 TO 6
    PRINT #1, ""
NEXT
'#End the cfg header text'
'################################
IF GTYPE = 2 THEN
    CLUSTERNUM = 0
    IF CLUSTER > 0 THEN 'Checks if REDSTAR variable is still above zero, Then carries out an action.
        DO
            
            PRINT #1, "@Kopernicus"
            PRINT #1, "{"
            PRINT #1, "    Body"
            PRINT #1, "    {"
            'CLS
            aName$ = theStarName$ '#Calls the function "theStarName"
            PRINT #1, "        name = "; CLUSTERNUM; ""
            PRINT #1, "        cbNameLater = "; aName$; " Galaxy"
            PRINT #1, "        Template"
            PRINT #1, "        {"
            PRINT #1, "            name = Sun"
            PRINT #1, "        }"
            PRINT #1, "************"
            theProperties$ = fileAsString("propertiesTmp.txt")
            PRINT #1, theProperties$
            PRINT #1, "************"
            PRINT #1, "        Properties"
            PRINT #1, "        {"
            PRINT #1, "            description = "
            PRINT #1, "            radius = 10000"
            PRINT #1, "        }"
            PRINT #1, "        Orbit"
            PRINT #1, "        {"
            PRINT #1, "            referenceBody = Sun"
            PRINT #1, "            semiMajorAxis ="; INT(RND * 1D+16) + 100000000000000#; ""
            
            PRINT #1, "            inclination ="; INT(RND * 50) - 25; ""
            
            PRINT #1, "            argumentOfPeriapsis ="; INT(RND * 1000); ""
            PRINT #1, "            mode = 0"
            PRINT #1, "        }"
            PRINT #1, "        ScaledVersion"
            PRINT #1, "        {"
            PRINT #1, "        Light"
            PRINT #1, "         {"
            PRINT #1, "             sunlightColor = 1,1,1,1.0"
            PRINT #1, "             sunlightIntensity = 0.55"
            PRINT #1, "             scaledSunlightColor = 1,1,1,1.0"
            PRINT #1, "             scaledSunlightIntensity = 0.55"
            PRINT #1, "             IVASunColor = 1,1,1,1.0"
            PRINT #1, "             IVASunIntensity = 0.55"
            PRINT #1, "             sunLensFlareColor = 1,1,1,1.0"
            PRINT #1, "             luminosity = 0"
            PRINT #1, "             ambientLightColor = 0,0,0,1.0"
            PRINT #1, "             givesOffLight = False"
            PRINT #1, "         }"
            PRINT #1, "         Material"
            PRINT #1, "         {"
            PRINT #1, "             emitColor0 = 0,0,0,1"
            PRINT #1, "             emitColor1 = 0,0,0,1"
            PRINT #1, "             sunspotColor = 0,0,0,1"
            PRINT #1, "             rimColor = 0,0,0,1"
            PRINT #1, "         }"
            PRINT #1, "         Coronas"
            PRINT #1, "         {"
            PRINT #1, "            Corona"
            PRINT #1, "            {"
            PRINT #1, "                rotation = 0"
            PRINT #1, "                speed = -1"
            PRINT #1, "                updateInterval = 5"
            PRINT #1, "                scaleLimitX = 5"
            PRINT #1, "                scaleLimitY = 5"
            PRINT #1, "                scaleSpeed = 0.007"
            PRINT #1, ""
            PRINT #1, "                Material"
            PRINT #1, "                {"
            PRINT #1, "                    texture = To_Boldly_Go/coronae/BlackCorona"
            PRINT #1, "                    inverseFade = 2.553731"
            PRINT #1, "                }"
            PRINT #1, "            }"
            PRINT #1, "            Corona"
            PRINT #1, "            {"
            PRINT #1, "                rotation = 0"
            PRINT #1, "                speed = 1"
            PRINT #1, "                updateInterval = 5"
            PRINT #1, "                scaleLimitX = 5"
            PRINT #1, "                scaleLimitY = 5"
            PRINT #1, "                scaleSpeed = 0.009"
            PRINT #1, ""
            PRINT #1, "                Material"
            PRINT #1, "                {"
            PRINT #1, "                      texture = To_Boldly_Go/coronae/BlackCorona"
            PRINT #1, "                      inverseFade = 2.553731"
            PRINT #1, "                }"
            PRINT #1, "            }"
            PRINT #1, "            }"
            PRINT #1, "        }"
            PRINT #1, "    }"
            PRINT #1, "}"
            CLUSTER = CLUSTER - 1
            IF CLUSTER = 0 THEN
                GOTO 111
            END IF
            CLUSTERNUM = CLUSTERNUM + 1
        LOOP
    111 END IF
END IF



PRINT #1, "@Kopernicus"
PRINT #1, "{"
PRINT #1, "    Body"
PRINT #1, "    {"
PRINT #1, "        name = Kerbol"
PRINT #1, "        cbNameLater = Sun"
PRINT #1, "        Template"
PRINT #1, "        {"
PRINT #1, "            name = Sun"
PRINT #1, "        }"
PRINT #1, "        Properties"
PRINT #1, "        {"
PRINT #1, "             sphereOfInfluence = 220118820000"
PRINT #1, "        }"
PRINT #1, "        Orbit"
PRINT #1, "        {"

IF GTYPE = 2 THEN
    '#Cluster'
    PRINT #1, "            referenceBody = "; INT(RND * CLUSTERNUM)
    PRINT #1, "            semiMajorAxis ="; INT(RND * 10000000000000) + 10000000000; ""
    PRINT #1, "            inclination ="; INT(RND * 360); ""
END IF

IF GTYPE = 0 THEN
    '#Ellipse'
    PRINT #1, "            referenceBody = Sun"
    PRINT #1, "            semiMajorAxis ="; INT(RND * 1D+16) + 100000000000000#; ""
    PRINT #1, "            inclination ="; INT(RND * 360); ""
END IF

IF GTYPE = 1 THEN
    '#Disc'
    PRINT #1, "            referenceBody = Sun"
    PRINT #1, "            semiMajorAxis ="; INT(RND * 1D+16) + 100000000000000#; ""
    'PRINT #1, "            inclination ="; INT(RND * 50) - 25; ""
    PRINT #1, "            inclination ="; INT(RND * 25) + 1; ""
END IF


PRINT #1, "            argumentOfPeriapsis ="; INT(RND * 1000); ""
PRINT #1, "            mode = 0"
PRINT #1, "            color = 1,1,0,1"
PRINT #1, "        }"
PRINT #1, "        ScaledVersion"
PRINT #1, "        {"
PRINT #1, "        Light"
PRINT #1, "         {"
PRINT #1, "             sunlightColor = 1,1,1,1.0"
PRINT #1, "             sunlightIntensity = 0.55"
PRINT #1, "             scaledSunlightColor = 1,1,1,1.0"
PRINT #1, "             scaledSunlightIntensity = 0.55"
PRINT #1, "             IVASunColor = 1,1,1,1.0"
PRINT #1, "             IVASunIntensity = 0.55"
PRINT #1, "             sunLensFlareColor = 1,1,1,1.0"
PRINT #1, ""
PRINT #1, "         }"
PRINT #1, "     }"
PRINT #1, "    }"
PRINT #1, "}"

PRINT #1, "@Kopernicus:AFTER[Kopernicus]"
PRINT #1, "{"
PRINT #1, " @Body[Sun]"
PRINT #1, " {"
PRINT #1, "        cbNameLater = Interstellar Space"
PRINT #1, "        @Properties"
PRINT #1, "        {"
PRINT #1, "         description = Interstellar Space is one of the vastest emptiest regions of the Universe, It takes thousands of years to travel just from one star to another at sublight speeds, And is nearly devoid of matter. There are occasional areas of dense gas however, Which are filled with stars. But we cannot track them due to nebula interference."
PRINT #1, "         radius = 10000"
PRINT #1, "        }"
PRINT #1, "        @ScaledVersion"
PRINT #1, "        {"
PRINT #1, "        Light"
PRINT #1, "         {"
PRINT #1, "             sunlightColor = 1,1,1,1.0"
PRINT #1, "             sunlightIntensity = 0.55"
PRINT #1, "             scaledSunlightColor = 1,1,1,1.0"
PRINT #1, "             scaledSunlightIntensity = 0.55"
PRINT #1, "             IVASunColor = 1,1,1,1.0"
PRINT #1, "             IVASunIntensity = 0.55"
PRINT #1, "             sunLensFlareColor = 1,1,1,1.0"
PRINT #1, "             luminosity = 0"
PRINT #1, "             ambientLightColor = 0,0,0,1.0"
PRINT #1, "             givesOffLight = False"
PRINT #1, "         }"
PRINT #1, "         Material"
PRINT #1, "         {"
PRINT #1, "             emitColor0 = 0,0,0,1"
PRINT #1, "             emitColor1 = 0,0,0,1"
PRINT #1, "             sunspotColor = 0,0,0,1"
PRINT #1, "             rimColor = 0,0,0,1"
PRINT #1, "         }"
PRINT #1, "         Coronas"
PRINT #1, "         {"
PRINT #1, "            Corona"
PRINT #1, "            {"
PRINT #1, "                rotation = 0"
PRINT #1, "                speed = -1"
PRINT #1, "                updateInterval = 5"
PRINT #1, "                scaleLimitX = 5"
PRINT #1, "                scaleLimitY = 5"
PRINT #1, "                scaleSpeed = 0.007"
PRINT #1, ""
PRINT #1, "                Material"
PRINT #1, "                {"
PRINT #1, "                    texture = To_Boldly_Go/coronae/BlackCorona"
PRINT #1, "                    inverseFade = 2.553731"
PRINT #1, "                }"
PRINT #1, "            }"
PRINT #1, "            Corona"
PRINT #1, "            {"
PRINT #1, "                rotation = 0"
PRINT #1, "                speed = 1"
PRINT #1, "                updateInterval = 5"
PRINT #1, "                scaleLimitX = 5"
PRINT #1, "                scaleLimitY = 5"
PRINT #1, "                scaleSpeed = 0.009"
PRINT #1, ""
PRINT #1, "                Material"
PRINT #1, "                {"
PRINT #1, "                      texture = To_Boldly_Go/coronae/BlackCorona"
PRINT #1, "                      inverseFade = 2.553731"
PRINT #1, "                }"
PRINT #1, "            }"
PRINT #1, "          }"
PRINT #1, "     }"
PRINT #1, " }"
PRINT #1, " @Body[Moho]"
PRINT #1, " {"
PRINT #1, "     @Orbit"
PRINT #1, "     {"
PRINT #1, "            @referenceBody = Kerbol"
PRINT #1, "     }"
PRINT #1, " }"
PRINT #1, " @Body[Eve]"
PRINT #1, " {"
PRINT #1, "     @Orbit"
PRINT #1, "     {"
PRINT #1, "            @referenceBody = Kerbol"
PRINT #1, "     }"
PRINT #1, " }"
PRINT #1, " @Body[Kerbin]"
PRINT #1, " {"
PRINT #1, "     @Orbit"
PRINT #1, "     {"
PRINT #1, "            @referenceBody = Kerbol"
PRINT #1, "     }"
PRINT #1, " }"
PRINT #1, " @Body[Duna]"
PRINT #1, " {"
PRINT #1, "     @Orbit"
PRINT #1, "     {"
PRINT #1, "            @referenceBody = Kerbol"
PRINT #1, "     }"
PRINT #1, " }"
PRINT #1, " @Body[Dres]"
PRINT #1, " {"
PRINT #1, "     @Orbit"
PRINT #1, "     {"
PRINT #1, "            @referenceBody = Kerbol"
PRINT #1, "     }"
PRINT #1, " }"
PRINT #1, " @Body[Jool]"
PRINT #1, " {"
PRINT #1, "     @Orbit"
PRINT #1, "     {"
PRINT #1, "            @referenceBody = Kerbol"
PRINT #1, "     }"
PRINT #1, " }"
PRINT #1, " @Body[Eeloo]"
PRINT #1, " {"
PRINT #1, "     @Orbit"
PRINT #1, "     {"
PRINT #1, "            @referenceBody = Kerbol"
PRINT #1, "     }"
PRINT #1, " }"
PRINT #1, "}"

'#############################
'###Read in the string templates
thePropertiesTemplate$ = fileAsString("propertiesTmp.txt")
theOrbitTemplate$ = fileAsString("orbitTmp.txt")
theLightTemplate$ = fileAsString("lightTmp.txt")
theMaterialTemplate$ = fileAsString("materialTmp.txt")
theCoronasTemplate$ = fileAsString("coronaTmp.txt")
theGasGiantTemplate$ = fileAsString("gasGiantScaledVersionTmp.txt")
theRingsTemplate$ = fileAsString("ringsTmp.txt")
thePlanetTemplate$ = fileAsString("planetTmp.txt")
theStarTmp$ = fileAsString("starTmp.txt")


IF REDSTAR > 0 THEN 'Checks if REDSTAR variable is still above zero, Then carries out an action.
    DO
        IF PENABLE$ = "y" THEN
            
            SPN = INT(RND * 4)
        ELSE
            SPN = 1
        END IF
        '###These print statements can go away once the starTemplate can be used
        '###Need to get planet and moon template generation working in basic first
        '###STH 2017-0127
        PRINT #1, "@Kopernicus"
        PRINT #1, "{"
        PRINT #1, "    Body"
        PRINT #1, "    {"
        aStarName$ = theStarName$ '#Calls the function "theStarName"
        PRINT #1, "        name = "; aStarName$
        PRINT #1, "        Template"
        PRINT #1, "        {"
        PRINT #1, "            name = Sun"
        PRINT #1, "        }"
        '########################'
        '###Fill in property data'
        theDescription$ = "Dim light, Yet so bright. A lonely outpost in the deep dark night. Travelers come far shall know where they are. A new land, A new star, How much pain and suffering it must have took to go this far. For at " + aStarName$ + " your journey might be done. And you will be free."
        theRadius$ = STR$(INT(RND * 30000000) + 15000000)
        theSphereOfInfluence$ = STR$(90118820000)
        aPropertiesTemplate$ = thePropertiesTemplate$
        aPropertiesNode$ = propertyNode$(aPropertiesTemplate$, theDescription$, theRadius$, theSphereOfInfluence$, "")
        PRINT #1, aPropertiesNode$
        '###End property data'
        '########################'
        '########################'
        '###Fill in orbit data'
        theMode$ = STR$(0)
        theColor$ = "1,0,0,1"
        aOrbitTemp$ = theOrbitTemplate$
        aOrbitNode$ = orbitNode$(aOrbitTemp$, GTYPE, theColor$, theMode$)
        PRINT #1, aOrbitNode$
        '###End orbit data'
        '########################'
        PRINT #1, "        ScaledVersion"
        PRINT #1, "        {"
        '########################'
        '###Fill in light data'
        sunlightColor$ = "1.0,0.188,0.00,1.0"
        sunlightIntensity$ = "0.50"
        scaledSunlightColor$ = "1.0,0.188,0.00,1.0"
        scaledSunlightIntensity$ = "0.30"
        IVASuncolor$ = "1.0,0.188,0.00,1.0"
        IVASunIntensity$ = "1"
        sunLensFlareColor$ = "0.3,0,0,1.0"
        ambientLightColor$ = "0,0,0,1"
        sunAU$ = "13599840"
        luminosity$ = "0"
        givesOffLight$ = "True"
        aLightTemp$ = theLightTemplate$
        aLightNode$ = lightNode$(aLightTemp$, sunlightColor$, sunlightIntensity$, scaledSunlightColor$, scaledSunlightIntensity$, IVASuncolor$, IVASunIntensity$, sunLensFlareColor$, ambientLightColor$, sunAU$, luminosity$, givesOffLight$)
        PRINT #1, aLightNode$
        '###End light data'
        '########################'
        '########################'
        '###Fill in material data'
        emitColorZero$ = "0.6,0.3,0.0,1.0"
        emitColorOne$ = "0.9,0.1,0.0,1.0"
        sunspotColor$ = "1.0,0,0,1.0"
        rimColor$ = "0.68,0.05,0.05,1.0"
        rimPower$ = "1"
        rimBlend$ = "1"
        aMaterialTemp$ = theMaterialTemplate$
        aMaterialNode$ = materialNode$(aMaterialTemp$, emitColorZero$, emitColorOne$, sunspotColor$, rimColor$, rimPower$, rimBlend$)
        PRINT #1, aMaterialNode$
        '###End material data'
        '########################'
        '########################'
        '###Fill in coronas data'
        starColour$ = "Red"
        aCoronaTemp$ = theCoronasTemplate$
        aCoronaNode$ = coronaNode$(aCoronaTemp$, starColour$)
        PRINT #1, aCoronaNode$
        '###End coronas data'
        '########################'
        PRINT #1, "        }"
        PRINT #1, "    }"
        IF SPN = 0 THEN
            GAS = INT(RND * 5)
            GASNUMBER = 1
            IF GAS > 0 THEN
                SEMIMAJORAXIS = INT(RND * 10000000000) + 10000000
                INCLINATION = INT(RND * 360)
                DO
                    PRINT #1, "    Body"
                    PRINT #1, "    {"
                    IF GASNUMBER = 1 THEN
                        PRINT #1, "         name = "; aStarName$; " I"
                        PNM$ = " I"
                    END IF
                    IF GASNUMBER = 2 THEN
                        PRINT #1, "         name = "; aStarName$; " II"
                        PNM$ = " II"
                    END IF
                    IF GASNUMBER = 3 THEN
                        PRINT #1, "         name = "; aStarName$; " III"
                        PNM$ = " III"
                    END IF
                    IF GASNUMBER = 4 THEN
                        PRINT #1, "         name = "; aStarName$; " IV"
                        PNM$ = " IV"
                    END IF
                    IF GASNUMBER = 5 THEN
                        PRINT #1, "         name = "; aStarName$; " V"
                        PNM$ = " V"
                    END IF
                    PRINT #1, "         Orbit"
                    PRINT #1, "         {"
                    PRINT #1, "             referenceBody = "; aStarName$; ""




                    PRINT #1, "            semiMajorAxis ="; SEMIMAJORAXIS; ""
                    SEMIMAJORAXIS = SEMIMAJORAXIS * 1.5

                    PRINT #1, "            longitudeOfAscendingNode = 0"
                    
                    PRINT #1, "            argumentOfPeriapsis ="; INT(RND * 1000); ""
                    PRINT #1, "            meanAnomalyAtEpoch = 0"
                    PRINT #1, "            meanAnomalyAtEpochD = 0"
                    PRINT #1, "            epoch = 0"

                    PRINT #1, "            inclination ="; INCLINATION; ""

                    PRINT #1, "         }"
                    PRINT #1, "         Template"
                    PRINT #1, "         {"

                    
                    PLANETTYPE = INT(RND * 13)
                    SELECT CASE PLANETTYPE
                        CASE 0
                            PLANETTYPE$ = "Moho"
                        CASE 1
                            PLANETTYPE$ = "Eve"
                        CASE 2
                            PLANETTYPE$ = "Mun"
                        CASE 3
                            PLANETTYPE$ = "Minmus"
                        CASE 4
                            PLANETTYPE$ = "Duna"
                        CASE 5
                            PLANETTYPE$ = "Ike"
                        CASE 6
                            PLANETTYPE$ = "Dres"
                        CASE 7
                            PLANETTYPE$ = "Jool"
                        CASE 8
                            PLANETTYPE$ = "Laythe"
                        CASE 9
                            PLANETTYPE$ = "Vall"
                        CASE 10
                            PLANETTYPE$ = "Tylo"
                        CASE 11
                            PLANETTYPE$ = "Jool"
                        CASE 12
                            PLANETTYPE$ = "Jool"
                        CASE 13
                            PLANETTYPE$ = "Eeloo"
                    END SELECT
                    IF PLANETTYPE$ = "Moho" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"



                        PRINT #1, "            description = A red rocky world. Dull and barren, But here in the void. It is all a blessing just to find this world."
                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.1,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Eve" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"



                        PRINT #1, "            description = A world with a thick purple sky. And a great ocean. Vast rocky plains. And great winds."
                        
                        PRINT #1, "            radius ="; INT(RND * 1500000) + 300000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.1,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Mun" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"



                        PRINT #1, "            description = A dull rocky cratered planet. Probably not worth it, But if your desparate, Then this is your place."
                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.1,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Minmus" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"



                        PRINT #1, "            description = A small planet covered in ice plains and salt flats."
                        
                        PRINT #1, "                     radius ="; INT(RND * 120000) + 80000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.1,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Duna" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"



                        PRINT #1, "            description = A red world. Quite uninviting to Kerbals due to it's red shade of ground."
                        
                        PRINT #1, "            radius ="; INT(RND * 700000) + 270000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.1,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Ike" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"



                        PRINT #1, "            description = A dull grey little planet covered in basic rocky plains."
                        
                        PRINT #1, "            radius ="; INT(RND * 250000) + 50000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.1,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Dres" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"



                        PRINT #1, "            description = A dull grey little planet covered in basic rocky plains."
                        
                        PRINT #1, "            radius ="; INT(RND * 250000) + 50000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.1,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Laythe" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"



                        PRINT #1, "            description = A beautiful ocean planet. Complete with drinkabla water, Breathable air, And plenty of unseen pathogens to prevent you from removing your helmet."
                        
                        PRINT #1, "            radius ="; INT(RND * 1000000) + 300000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.1,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Vall" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"



                        PRINT #1, "            description = A small ice planet, May or may not have a subsurface ocean."
                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.1,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Tylo" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"



                        PRINT #1, "            description = A rather rocky planet with a dense iron core."
                        
                        PRINT #1, "            radius ="; INT(RND * 1500000) + 300000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.1,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Bop" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 100000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.1,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Pol" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 100000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.1,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Eeloo" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"



                        PRINT #1, "            description = A small ice planet, May or may not have a subsurface ocean."
                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.1,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Jool" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         ScaledVersion"
                        PRINT #1, "         {"
                        PRINT #1, "             Material"
                        PRINT #1, "             {"
                        
                        PRINT #1, "                 texture = To_Boldly_Go/gastextures/-"; INT(RND * 16); ".jpg"
                        PRINT #1, "             }"
                        PRINT #1, "         }"
                        PRINT #1, "         Properties"
                        PRINT #1, "         {"



                        PRINT #1, "            description = In the starlight light, Floats a gas giant, "; aStarName$; ""; PNM$; " is a large planet with several moons."
                        
                        PRINT #1, "            radius ="; INT(RND * 10000000) + 700000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 1)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.1,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    
                    MOON = INT(RND * 4)
                    MOONUMBER = 1
                    IF MOON > 0 THEN
                        DO
                            PRINT #1, "    Body"
                            PRINT #1, "    {"
                            PRINT #1, "        name = "; aStarName$; ""; PNM$; " "; MOONNUMBER; ""
                            PRINT #1, ""
                            PRINT #1, "        Orbit"
                            PRINT #1, "        {"
                            PRINT #1, "            referenceBody = "; aStarName$; ""; PNM$; ""
                            
                            PRINT #1, "            inclination ="; INT(RND * 360)
                            
                            PRINT #1, "            semiMajorAxis ="; INT(RND * 50000000) + 11000000
                            PRINT #1, "        }"
                            IF PLANETTYPE$ = "Jool" THEN
                                
                                MOONTYPE = INT(RND * 13)
                                SELECT CASE MOONTYPE
                                    CASE 0
                                        MOONTYPE$ = "Moho"
                                    CASE 1
                                        MOONTYPE$ = "Eve"
                                    CASE 2
                                        MOONTYPE$ = "Mun"
                                    CASE 3
                                        MOONTYPE$ = "Minmus"
                                    CASE 4
                                        MOONTYPE$ = "Duna"
                                    CASE 5
                                        MOONTYPE$ = "Ike"
                                    CASE 6
                                        MOONTYPE$ = "Dres"
                                    CASE 7
                                        MOONTYPE$ = "Gilly"
                                    CASE 8
                                        MOONTYPE$ = "Laythe"
                                    CASE 9
                                        MOONTYPE$ = "Vall"
                                    CASE 10
                                        MOONTYPE$ = "Tylo"
                                    CASE 11
                                        MOONTYPE$ = "Bop"
                                    CASE 12
                                        MOONTYPE$ = "Pol"
                                    CASE 13
                                        MOONTYPE$ = "Eeloo"
                                END SELECT
                                PRINT #1, "        Template"
                                PRINT #1, "        {"
                                PRINT #1, "            name = "; MOONTYPE$
                                PRINT #1, "        }"
                            ELSE
                                PRINT #1, "        Template"
                                PRINT #1, "        {"
                                PRINT #1, "            name = Gilly"
                                PRINT #1, "        }"
                            END IF
                            PRINT #1, "    }"
                            'PRINT #1, "}"
                            'PRINT #1, "}"
                            MOON = MOON - 1
                            MOONNUMBER = MOONNUMBER + 1
                            MOBJECTNUMBER = MOBJECTNUMBER + 1
                            IF MOON = 0 THEN
                                GOTO 14
                            END IF
                        LOOP
                    14 END IF

                    GAS = GAS - 1
                    GASNUMBER = GASNUMBER + 1
                    POBJECTNUMBER = POBJECTNUMBER + 1
                    IF GAS = 0 THEN
                        GOTO 10
                    END IF

                LOOP
            END IF
        10 END IF

        IF ASTTOG$ = "y" THEN
            
            AST = INT(RND * 2)
            ASTNUMBER = 1
            IF AST > 0 THEN
                DO
                    'PRINT #1, "@Kopernicus:AFTER[KOPERNICUS]"
                    'PRINT #1, "{"
                    PRINT #1, "    Body"
                    PRINT #1, "    {"
                    PRINT #1, "        name = "; aStarName$; ASTNUMBER; ""
                    PRINT #1, ""
                    PRINT #1, "        Template"
                    PRINT #1, "        {"
                    PRINT #1, "            name = Gilly"
                    PRINT #1, ""
                    'PRINT #1, "            removePQSMods = PQSLandControl"
                    PRINT #1, "        }"
                    PRINT #1, "        Properties"
                    PRINT #1, "        {"
                    PRINT #1, "            description = When Jeb was originally shown a map of our galaxy he said 'Wow! Thats big! Dont suppose we get any rest stops out there do we?' This statement encouraged our scientists to look closer, And eventually this asteroid among many, Was discovered. Dont expect vending machines, And if you do find them... Dont expect candy. "
                    PRINT #1, ""
                    
                    PRINT #1, "            radius ="; INT(RND * 80000) + 5000
                    PRINT #1, ""
                    'PRINT #1, "            sphereOfInfluence = 117915"
                    PRINT #1, "        }"
                    PRINT #1, ""
                    PRINT #1, "        Orbit"
                    PRINT #1, "        {"
                    PRINT #1, "            referenceBody = "; aStarName$; ""
                    
                    PRINT #1, "            inclination ="; INT(RND * 360)
                    
                    PRINT #1, "            semiMajorAxis ="; INT(RND * 10000000000) + 10000000
                    PRINT #1, "        }"
                    PRINT #1, "        PQS"
                    PRINT #1, "        {"
                    PRINT #1, "            Mods"
                    PRINT #1, "            {"
                    PRINT #1, "                VertexSimplexHeightAbsolute"
                    PRINT #1, "                {"
                    
                    PRINT #1, "                    seed ="; INT(RND * 100000)
                    PRINT #1, "                }"
                    PRINT #1, "                VertexHeightNoise"
                    PRINT #1, "                {"
                    'PRINT #1, "                    persistence = 0.5"
                    
                    PRINT #1, "                    seed ="; INT(RND * 100000)
                    PRINT #1, "                }"
                    PRINT #1, "            }"
                    PRINT #1, "        }"
                    PRINT #1, "    }"
                    'PRINT #1, "}"
                    PRINT #1, ""
                    AST = AST - 1
                    ASTNUMBER = ASTNUMBER + 1
                    AOBJECTNUMBER = AOBJECTNUMBER + 1
                    IF AST = 0 THEN
                        GOTO 151
                    END IF
                LOOP

            151 END IF
        END IF

        PRINT #1, "}"
        REDSTAR = REDSTAR - 1
        SOBJECTNUMBER = SOBJECTNUMBER + 1
        IF REDSTAR = 0 THEN
            GOTO 1
        END IF
        REDSTARNUMBER = REDSTARNUMBER + 1
    LOOP
1 END IF

'******************************************************************************
'******************************************************************************
'******************************************************************************
'******************************************************************************
'******************************************************************************



IF KSTAR > 0 THEN 'Checks if KSTAR variable is still above zero, Then carries out an action.



    DO
        IF PENABLE$ = "y" THEN
            
            SPN = INT(RND * 4)
        ELSE
            SPN = 1
        END IF
        '###These print statements can go away once the starTemplate can be used
        '###Need to get planet and moon template generation working in basic first
        '###STH 2017-0127
        PRINT #1, "@Kopernicus"
        PRINT #1, "{"
        PRINT #1, "    Body"
        PRINT #1, "    {"
        aStarName$ = theStarName$ '#Calls the function "theStarName"
        PRINT #1, "        name = "; aStarName$
        PRINT #1, "        Template"
        PRINT #1, "        {"
        PRINT #1, "            name = Sun"
        PRINT #1, "        }"
        '########################'
        '###Fill in property data'
        theDescription$ = "BILL -" + STR$(KSTARNUMBER) + " is a main sequence orange dwarf star."
        theRadius$ = STR$(INT(RND * 30000000) + 15000000)
        theSphereOfInfluence$ = STR$(90118820000)
        aPropertiesTemplate$ = thePropertiesTemplate$
        aPropertiesNode$ = propertyNode$(aPropertiesTemplate$, theDescription$, theRadius$, theSphereOfInfluence$, "")
        PRINT #1, aPropertiesNode$
        '###End property data'
        '########################'
        '########################'
        '###Fill in orbit data'
        theMode$ = STR$(0)
        theColor$ = "1,0.5,0,1"
        aOrbitTemp$ = theOrbitTemplate$
        aOrbitNode$ = orbitNode$(aOrbitTemp$, GTYPE, theColor$, theMode$)
        PRINT #1, aOrbitNode$
        '###End orbit data'
        '########################'
        PRINT #1, "        ScaledVersion"
        PRINT #1, "        {"
        '########################'
        '###Fill in light data'
        sunlightColor$ = "1.0,0.7,0.00,1.0"
        sunlightIntensity$ = "0.50"
        scaledSunlightColor$ = "1.0,0.7,0.00,1.0"
        scaledSunlightIntensity$ = "1.0"
        IVASuncolor$ = "1.0,0.7,0.00,1.0"
        IVASunIntensity$ = "1"
        sunLensFlareColor$ = "1,0.5,0,1.0"
        ambientLightColor$ = "0,0,0,1"
        sunAU$ = "113599840"
        luminosity$ = "0"
        givesOffLight$ = "True"
        aLightTemp$ = theLightTemplate$
        aLightNode$ = lightNode$(aLightTemp$, sunlightColor$, sunlightIntensity$, scaledSunlightColor$, scaledSunlightIntensity$, IVASuncolor$, IVASunIntensity$, sunLensFlareColor$, ambientLightColor$, sunAU$, luminosity$, givesOffLight$)
        PRINT #1, aLightNode$
        '###End light data'
        '########################'
        '########################'
        '###Fill in material data'
        emitColorZero$ = "1,1,0.0,1.0"
        emitColorOne$ = "1,0.5,0.0,1.0"
        sunspotColor$ = "1.0,0,0,1.0"
        rimColor$ = "0.9833707,0.6516854,0.05,1.0"
        rimPower$ = "1"
        rimBlend$ = "1"
        aMaterialTemp$ = theMaterialTemplate$
        aMaterialNode$ = materialNode$(aMaterialTemp$, emitColorZero$, emitColorOne$, sunspotColor$, rimColor$, rimPower$, rimBlend$)
        PRINT #1, aMaterialNode$
        '###End material data'
        '########################'
        '########################'
        '###Fill in coronas data'
        starColour$ = "K"
        aCoronaTemp$ = theCoronasTemplate$
        aCoronaNode$ = coronaNode$(aCoronaTemp$, starColour$)
        PRINT #1, aCoronaNode$
        '###End coronas data'
        '########################'
        PRINT #1, "        }"
        PRINT #1, "    }"

        IF SPN = 0 THEN
            
            GAS = INT(RND * 5)
            GASNUMBER = 1
            IF GAS > 0 THEN
                
                SEMIMAJORAXIS = INT(RND * 10000000000) + 10000000
                
                INCLINATION = INT(RND * 360)
                DO
                    'PRINT #1, "@Kopernicus"
                    'PRINT #1, "{"
                    PRINT #1, "    Body"
                    PRINT #1, "    {"
                    IF GASNUMBER = 1 THEN
                        PRINT #1, "         name = "; aStarName$; " I"
                        PNM$ = " I"
                    END IF
                    IF GASNUMBER = 2 THEN
                        PRINT #1, "         name = "; aStarName$; " II"
                        PNM$ = " II"
                    END IF
                    IF GASNUMBER = 3 THEN
                        PRINT #1, "         name = "; aStarName$; " III"
                        PNM$ = " III"
                    END IF
                    IF GASNUMBER = 4 THEN
                        PRINT #1, "         name = "; aStarName$; " IV"
                        PNM$ = " IV"
                    END IF
                    IF GASNUMBER = 5 THEN
                        PRINT #1, "         name = "; aStarName$; " V"
                        PNM$ = " V"
                    END IF
                    PRINT #1, "         Orbit"
                    PRINT #1, "         {"
                    PRINT #1, "             referenceBody = "; aStarName$; ""




                    PRINT #1, "            semiMajorAxis ="; SEMIMAJORAXIS; ""
                    SEMIMAJORAXIS = SEMIMAJORAXIS * 1.5

                    PRINT #1, "            longitudeOfAscendingNode = 0"
                    
                    PRINT #1, "            argumentOfPeriapsis ="; INT(RND * 1000); ""
                    PRINT #1, "            meanAnomalyAtEpoch = 0"
                    PRINT #1, "            meanAnomalyAtEpochD = 0"
                    PRINT #1, "            epoch = 0"


                    PRINT #1, "            inclination ="; INCLINATION; ""

                    PRINT #1, "         }"
                    PRINT #1, "         Template"
                    PRINT #1, "         {"

                    
                    PLANETTYPE = INT(RND * 20)
                    SELECT CASE PLANETTYPE
                        CASE 0
                            PLANETTYPE$ = "Moho"
                        CASE 1
                            PLANETTYPE$ = "Eve"
                        CASE 2
                            PLANETTYPE$ = "Mun"
                        CASE 3
                            PLANETTYPE$ = "Minmus"
                        CASE 4
                            PLANETTYPE$ = "Duna"
                        CASE 5
                            PLANETTYPE$ = "Ike"
                        CASE 6
                            PLANETTYPE$ = "Dres"
                        CASE 7
                            PLANETTYPE$ = "Jool"
                        CASE 8
                            PLANETTYPE$ = "Laythe"
                        CASE 9
                            PLANETTYPE$ = "Vall"
                        CASE 10
                            PLANETTYPE$ = "Tylo"
                        CASE 11
                            PLANETTYPE$ = "Jool"
                        CASE 12
                            PLANETTYPE$ = "Jool"
                        CASE 13
                            PLANETTYPE$ = "Eeloo"
                        CASE 14
                            PLANETTYPE$ = "Jool"
                        CASE 15
                            PLANETTYPE$ = "Jool"
                        CASE 16
                            PLANETTYPE$ = "Jool"
                        CASE 17
                            PLANETTYPE$ = "Jool"
                        CASE 18
                            PLANETTYPE$ = "Jool"
                        CASE 19
                            PLANETTYPE$ = "Jool"
                        CASE 20
                            PLANETTYPE$ = "Jool"
                    END SELECT
                    IF PLANETTYPE$ = "Moho" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.5,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Eve" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 1500000) + 300000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.5,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Mun" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.5,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Minmus" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "                     radius ="; INT(RND * 120000) + 80000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.5,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Duna" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 700000) + 270000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.5,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Ike" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 250000) + 50000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.5,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Dres" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 250000) + 50000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.5,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Laythe" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 1000000) + 300000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.5,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Vall" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.5,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Tylo" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 1500000) + 300000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.5,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Bop" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 100000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.5,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Pol" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 100000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.5,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Eeloo" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.5,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Jool" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         ScaledVersion"
                        PRINT #1, "         {"
                        PRINT #1, "             Material"
                        PRINT #1, "             {"
                        
                        PRINT #1, "                 texture = To_Boldly_Go/gastextures/-"; INT(RND * 16); ".jpg"
                        PRINT #1, "             }"
                        PRINT #1, "         }"
                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 10000000) + 700000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 1)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.5,0.1,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    
                    MOON = INT(RND * 4)
                    MOONUMBER = 1
                    IF MOON > 0 THEN
                        DO
                            'PRINT #1, "@Kopernicus:AFTER[KOPERNICUS]"
                            'PRINT #1, "{"
                            PRINT #1, "    Body"
                            PRINT #1, "    {"
                            PRINT #1, "        name = "; aStarName$; ""; PNM$; " "; MOONNUMBER; ""
                            PRINT #1, ""
                            PRINT #1, "        Orbit"
                            PRINT #1, "        {"
                            PRINT #1, "            referenceBody = "; aStarName$; ""; PNM$; ""
                            
                            PRINT #1, "            inclination ="; INT(RND * 360)
                            
                            PRINT #1, "            semiMajorAxis ="; INT(RND * 50000000) + 11000000
                            PRINT #1, "        }"
                            IF PLANETTYPE$ = "Jool" THEN
                                
                                MOONTYPE = INT(RND * 13)
                                SELECT CASE MOONTYPE
                                    CASE 0
                                        MOONTYPE$ = "Moho"
                                    CASE 1
                                        MOONTYPE$ = "Eve"
                                    CASE 2
                                        MOONTYPE$ = "Mun"
                                    CASE 3
                                        MOONTYPE$ = "Minmus"
                                    CASE 4
                                        MOONTYPE$ = "Duna"
                                    CASE 5
                                        MOONTYPE$ = "Ike"
                                    CASE 6
                                        MOONTYPE$ = "Dres"
                                    CASE 7
                                        MOONTYPE$ = "Gilly"
                                    CASE 8
                                        MOONTYPE$ = "Laythe"
                                    CASE 9
                                        MOONTYPE$ = "Vall"
                                    CASE 10
                                        MOONTYPE$ = "Tylo"
                                    CASE 11
                                        MOONTYPE$ = "Bop"
                                    CASE 12
                                        MOONTYPE$ = "Pol"
                                    CASE 13
                                        MOONTYPE$ = "Eeloo"
                                END SELECT
                                PRINT #1, "        Template"
                                PRINT #1, "        {"
                                PRINT #1, "            name = "; MOONTYPE$
                                PRINT #1, "        }"
                            ELSE
                                PRINT #1, "        Template"
                                PRINT #1, "        {"
                                PRINT #1, "            name = Gilly"
                                PRINT #1, "        }"
                            END IF
                            PRINT #1, "    }"
                            'PRINT #1, "}"

                            PRINT #1, ""
                            MOON = MOON - 1
                            MOONNUMBER = MOONNUMBER + 1
                            MOBJECTNUMBER = MOBJECTNUMBER + 1
                            IF MOON = 0 THEN
                                GOTO 141
                            END IF
                        LOOP
                    141 END IF

                    GAS = GAS - 1
                    GASNUMBER = GASNUMBER + 1
                    POBJECTNUMBER = POBJECTNUMBER + 1
                    IF GAS = 0 THEN
                        GOTO 102
                    END IF

                LOOP
            END IF
        102 END IF

        IF ASTTOG$ = "y" THEN
            
            AST = INT(RND * 2)
            ASTNUMBER = 1
            IF AST > 0 THEN
                DO
                    'PRINT #1, "@Kopernicus:AFTER[KOPERNICUS]"
                    'PRINT #1, "{"
                    PRINT #1, "    Body"
                    PRINT #1, "    {"
                    PRINT #1, "        name = "; aStarName$; ASTNUMBER; ""
                    PRINT #1, ""
                    PRINT #1, "        Template"
                    PRINT #1, "        {"
                    PRINT #1, "            name = Gilly"
                    PRINT #1, ""
                    'PRINT #1, "            removePQSMods = PQSLandControl"
                    PRINT #1, "        }"
                    PRINT #1, "        Properties"
                    PRINT #1, "        {"
                    PRINT #1, "            description = When Jeb was originally shown a map of our galaxy he said 'Wow! Thats big! Dont suppose we get any rest stops out there do we?' This statement encouraged our scientists to look closer, And eventually this asteroid among many, Was discovered. Dont expect vending machines, And if you do find them... Dont expect candy. "
                    PRINT #1, ""
                    
                    PRINT #1, "            radius ="; INT(RND * 80000) + 5000
                    PRINT #1, ""
                    'PRINT #1, "            sphereOfInfluence = 117915"
                    PRINT #1, "        }"
                    PRINT #1, ""
                    PRINT #1, "        Orbit"
                    PRINT #1, "        {"
                    PRINT #1, "            referenceBody = "; aStarName$; ""
                    
                    PRINT #1, "            inclination ="; INT(RND * 360)
                    
                    PRINT #1, "            semiMajorAxis ="; INT(RND * 10000000000) + 10000000
                    PRINT #1, "        }"
                    PRINT #1, "        PQS"
                    PRINT #1, "        {"
                    PRINT #1, "            Mods"
                    PRINT #1, "            {"
                    PRINT #1, "                VertexSimplexHeightAbsolute"
                    PRINT #1, "                {"
                    
                    PRINT #1, "                    seed ="; INT(RND * 100000)
                    PRINT #1, "                }"
                    PRINT #1, "                VertexHeightNoise"
                    PRINT #1, "                {"
                    'PRINT #1, "                    persistence = 0.5"
                    
                    PRINT #1, "                    seed ="; INT(RND * 100000)
                    PRINT #1, "                }"
                    PRINT #1, "            }"
                    PRINT #1, "        }"
                    PRINT #1, "    }"
                    'PRINT #1, "}"
                    PRINT #1, ""
                    AST = AST - 1
                    ASTNUMBER = ASTNUMBER + 1
                    AOBJECTNUMBER = AOBJECTNUMBER + 1
                    IF AST = 0 THEN
                        GOTO 152
                    END IF
                LOOP

            152 END IF
        END IF
        PRINT #1, "}"
        KSTAR = KSTAR - 1
        SOBJECTNUMBER = SOBJECTNUMBER + 1
        IF KSTAR = 0 THEN
            GOTO 101
        END IF
        KSTARNUMBER = KSTARNUMBER + 1
    LOOP
101 END IF

'******************************************************************************
'******************************************************************************
'******************************************************************************
'******************************************************************************
'******************************************************************************



IF YELLOWSTAR > 0 THEN 'Checks if YELLOWSTAR variable is still above zero, Then carries out an action.

    DO
        IF PENABLE$ = "y" THEN
            
            SPN = INT(RND * 4)
        ELSE
            SPN = 1
        END IF
        '###These print statements can go away once the starTemplate can be used
        '###Need to get planet and moon template generation working in basic first
        '###STH 2017-0127
        PRINT #1, "@Kopernicus"
        PRINT #1, "{"
        PRINT #1, "    Body"
        PRINT #1, "    {"
        aStarName$ = theStarName$ '#Calls the function "theStarName"
        PRINT #1, "        name = "; aStarName$
        PRINT #1, "        Template"
        PRINT #1, "        {"
        PRINT #1, "            name = Sun"
        PRINT #1, "        }"
        '########################'
        '###Fill in property data'
        theDescription$ = "KERMAN -" + STR$(YELLOWSTARNUMBER) + " is a main sequence yellow dwarf star."
        theRadius$ = STR$(INT(RND * 300000000) + 100000000)
        theSphereOfInfluence$ = STR$(220118820000)
        aPropertiesTemplate$ = thePropertiesTemplate$
        aPropertiesNode$ = propertyNode$(aPropertiesTemplate$, theDescription$, theRadius$, theSphereOfInfluence$, "")
        PRINT #1, aPropertiesNode$
        '###End property data'
        '########################'
        '########################'
        '###Fill in orbit data'
        theMode$ = STR$(0)
        theColor$ = "1,1,0,1"
        aOrbitTemp$ = theOrbitTemplate$
        aOrbitNode$ = orbitNode$(aOrbitTemp$, GTYPE, theColor$, theMode$)
        PRINT #1, aOrbitNode$
        '###End orbit data'
        '########################'
        PRINT #1, "        ScaledVersion"
        PRINT #1, "        {"
        '########################'
        '###Fill in light data'
        sunlightColor$ = "1,1,1,1.0"
        sunlightIntensity$ = "0.55"
        scaledSunlightColor$ = "1,1,1,1.0"
        scaledSunlightIntensity$ = "0.55"
        IVASuncolor$ = "1,1,1,1.0"
        IVASunIntensity$ = "0.55"
        sunLensFlareColor$ = "1,1,1,1.0"
        ambientLightColor$ = "0,0,0,1"
        sunAU$ = "113599840"
        luminosity$ = "0"
        givesOffLight$ = "True"
        aLightTemp$ = theLightTemplate$
        aLightNode$ = lightNode$(aLightTemp$, sunlightColor$, sunlightIntensity$, scaledSunlightColor$, scaledSunlightIntensity$, IVASuncolor$, IVASunIntensity$, sunLensFlareColor$, ambientLightColor$, sunAU$, luminosity$, givesOffLight$)
        PRINT #1, aLightNode$
        '###End light data'
        '########################'
        '########################'
        '###Fill in material data'
        emitColorZero$ = "1,1,0.0,1.0"
        emitColorOne$ = "1,0.5,0.0,1.0"
        sunspotColor$ = "1.0,0,0,1.0"
        rimColor$ = "0.9833707,0.6516854,0.05,1.0"
        rimPower$ = "1"
        rimBlend$ = "1"
        aMaterialTemp$ = theMaterialTemplate$
        aMaterialNode$ = materialNode$(aMaterialTemp$, emitColorZero$, emitColorOne$, sunspotColor$, rimColor$, rimPower$, rimBlend$)
        PRINT #1, aMaterialNode$
        '###End material data'
        '########################'
        '###Fill in coronas data'
        starColour$ = "Yellow"
        aCoronaTemp$ = theCoronasTemplate$
        aCoronaNode$ = coronaNode$(aCoronaTemp$, starColour$)
        PRINT #1, aCoronaNode$
        '###End coronas data'
        '########################'
        PRINT #1, "        }"
        PRINT #1, "    }"

        IF SPN = 0 THEN
            
            GAS = INT(RND * 5)
            GASNUMBER = 1
            IF GAS > 0 THEN
                
                SEMIMAJORAXIS = INT(RND * 100000000000) + 100000000
                
                INCLINATION = INT(RND * 360)
                DO
                    PRINT #1, "    Body"
                    PRINT #1, "    {"
                    IF GASNUMBER = 1 THEN
                        PRINT #1, "         name = "; aStarName$; " I"
                        PNM$ = " I"
                    END IF
                    IF GASNUMBER = 2 THEN
                        PRINT #1, "         name = "; aStarName$; " II"
                        PNM$ = " II"
                    END IF
                    IF GASNUMBER = 3 THEN
                        PRINT #1, "         name = "; aStarName$; " III"
                        PNM$ = " III"
                    END IF
                    IF GASNUMBER = 4 THEN
                        PRINT #1, "         name = "; aStarName$; " IV"
                        PNM$ = " IV"
                    END IF
                    IF GASNUMBER = 5 THEN
                        PRINT #1, "         name = "; aStarName$; " V"
                        PNM$ = " V"
                    END IF
                    PRINT #1, "         Orbit"
                    PRINT #1, "         {"
                    PRINT #1, "             referenceBody = "; aStarName$; ""




                    PRINT #1, "            semiMajorAxis ="; SEMIMAJORAXIS; ""
                    SEMIMAJORAXIS = SEMIMAJORAXIS * 1.5

                    PRINT #1, "            longitudeOfAscendingNode = 0"
                    
                    PRINT #1, "            argumentOfPeriapsis ="; INT(RND * 1000); ""
                    PRINT #1, "            meanAnomalyAtEpoch = 0"
                    PRINT #1, "            meanAnomalyAtEpochD = 0"
                    PRINT #1, "            epoch = 0"


                    PRINT #1, "            inclination ="; INCLINATION; ""

                    PRINT #1, "         }"
                    PRINT #1, "         Template"
                    PRINT #1, "         {"

                    
                    PLANETTYPE = INT(RND * 20)
                    SELECT CASE PLANETTYPE
                        CASE 0
                            PLANETTYPE$ = "Moho"
                        CASE 1
                            PLANETTYPE$ = "Eve"
                        CASE 2
                            PLANETTYPE$ = "Mun"
                        CASE 3
                            PLANETTYPE$ = "Minmus"
                        CASE 4
                            PLANETTYPE$ = "Duna"
                        CASE 5
                            PLANETTYPE$ = "Ike"
                        CASE 6
                            PLANETTYPE$ = "Dres"
                        CASE 7
                            PLANETTYPE$ = "Jool"
                        CASE 8
                            PLANETTYPE$ = "Laythe"
                        CASE 9
                            PLANETTYPE$ = "Vall"
                        CASE 10
                            PLANETTYPE$ = "Tylo"
                        CASE 11
                            PLANETTYPE$ = "Jool"
                        CASE 12
                            PLANETTYPE$ = "Jool"
                        CASE 13
                            PLANETTYPE$ = "Eeloo"
                        CASE 14
                            PLANETTYPE$ = "Jool"
                        CASE 15
                            PLANETTYPE$ = "Jool"
                        CASE 16
                            PLANETTYPE$ = "Jool"
                        CASE 17
                            PLANETTYPE$ = "Jool"
                        CASE 18
                            PLANETTYPE$ = "Jool"
                        CASE 19
                            PLANETTYPE$ = "Jool"
                        CASE 20
                            PLANETTYPE$ = "Jool"
                    END SELECT
                    IF PLANETTYPE$ = "Moho" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,1.0,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Eve" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 1500000) + 300000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,1.0,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Mun" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,1.0,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Minmus" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 120000) + 80000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,1.0,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Duna" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 700000) + 270000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,1.0,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Ike" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 250000) + 50000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,1.0,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Dres" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 250000) + 50000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,1.0,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Laythe" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 1000000) + 300000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,1.0,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Vall" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,1.0,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Tylo" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 1500000) + 300000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,1.0,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Bop" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 100000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,1.0,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Pol" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 100000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,1.0,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Eeloo" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,1.0,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Jool" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         ScaledVersion"
                        PRINT #1, "         {"
                        PRINT #1, "             Material"
                        PRINT #1, "             {"
                        
                        PRINT #1, "                 texture = To_Boldly_Go/gastextures/-"; INT(RND * 16); ".jpg"
                        PRINT #1, "             }"
                        PRINT #1, "         }"
                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 10000000) + 700000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 1)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,1.0,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    
                    MOON = INT(RND * 4)
                    MOONUMBER = 1
                    IF MOON > 0 THEN
                        DO
                            'PRINT #1, "@Kopernicus:AFTER[KOPERNICUS]"
                            'PRINT #1, "{"
                            PRINT #1, "    Body"
                            PRINT #1, "    {"
                            PRINT #1, "        name = "; aStarName$; ""; PNM$; " "; MOONNUMBER; ""
                            PRINT #1, ""

                            IF PLANETTYPE$ = "Jool" THEN
                                
                                MOONTYPE = INT(RND * 13)
                                SELECT CASE MOONTYPE
                                    CASE 0
                                        MOONTYPE$ = "Moho"
                                    CASE 1
                                        MOONTYPE$ = "Eve"
                                    CASE 2
                                        MOONTYPE$ = "Mun"
                                    CASE 3
                                        MOONTYPE$ = "Minmus"
                                    CASE 4
                                        MOONTYPE$ = "Duna"
                                    CASE 5
                                        MOONTYPE$ = "Ike"
                                    CASE 6
                                        MOONTYPE$ = "Dres"
                                    CASE 7
                                        MOONTYPE$ = "Gilly"
                                    CASE 8
                                        MOONTYPE$ = "Laythe"
                                    CASE 9
                                        MOONTYPE$ = "Vall"
                                    CASE 10
                                        MOONTYPE$ = "Tylo"
                                    CASE 11
                                        MOONTYPE$ = "Bop"
                                    CASE 12
                                        MOONTYPE$ = "Pol"
                                    CASE 13
                                        MOONTYPE$ = "Eeloo"
                                END SELECT
                                PRINT #1, "        Template"
                                PRINT #1, "        {"
                                PRINT #1, "            name = "; MOONTYPE$
                                PRINT #1, "        }"
                            ELSE
                                PRINT #1, "        Template"
                                PRINT #1, "        {"
                                PRINT #1, "            name = Gilly"
                                PRINT #1, "        }"
                            END IF
                            PRINT #1, "        Orbit"
                            PRINT #1, "        {"
                            PRINT #1, "            referenceBody = "; aStarName$; ""; PNM$; ""
                            
                            PRINT #1, "            inclination ="; INT(RND * 360)
                            
                            PRINT #1, "            semiMajorAxis ="; INT(RND * 50000000) + 10000000
                            PRINT #1, "        }"

                            PRINT #1, "    }"
                            'PRINT #1, "}"
                            MOON = MOON - 1
                            MOONNUMBER = MOONNUMBER + 1
                            MOBJECTNUMBER = MOBJECTNUMBER + 1
                            IF MOON = 0 THEN
                                GOTO 15
                            END IF
                        LOOP
                    15 END IF

                    GAS = GAS - 1
                    GASNUMBER = GASNUMBER + 1
                    POBJECTNUMBER = POBJECTNUMBER + 1
                    IF GAS = 0 THEN
                        GOTO 20
                    END IF

                LOOP
            END IF
        20 END IF

        IF ASTTOG$ = "y" THEN
            
            AST = INT(RND * 2)
            ASTNUMBER = 1
            IF AST > 0 THEN
                DO
                    'PRINT #1, "@Kopernicus:AFTER[KOPERNICUS]"
                    'PRINT #1, "{"
                    PRINT #1, "    Body"
                    PRINT #1, "    {"
                    PRINT #1, "        name = "; aStarName$; ASTNUMBER; ""
                    PRINT #1, ""
                    PRINT #1, "        Template"
                    PRINT #1, "        {"
                    PRINT #1, "            name = Gilly"
                    PRINT #1, ""
                    'PRINT #1, "            removePQSMods = PQSLandControl"
                    PRINT #1, "        }"
                    PRINT #1, "        Properties"
                    PRINT #1, "        {"
                    PRINT #1, "            description = When Jeb was originally shown a map of our galaxy he said 'Wow! Thats big! Dont suppose we get any rest stops out there do we?' This statement encouraged our scientists to look closer, And eventually this asteroid among many, Was discovered. Dont expect vending machines, And if you do find them... Dont expect candy. "
                    PRINT #1, ""
                    
                    PRINT #1, "            radius ="; INT(RND * 80000) + 5000
                    PRINT #1, ""
                    'PRINT #1, "            sphereOfInfluence = 117915"
                    PRINT #1, "        }"
                    PRINT #1, ""
                    PRINT #1, "        Orbit"
                    PRINT #1, "        {"
                    PRINT #1, "            referenceBody = "; aStarName$; ""
                    
                    PRINT #1, "            inclination ="; INT(RND * 360)
                    
                    PRINT #1, "            semiMajorAxis ="; INT(RND * 100000000000) + 100000000
                    PRINT #1, "        }"
                    PRINT #1, "        PQS"
                    PRINT #1, "        {"
                    PRINT #1, "            Mods"
                    PRINT #1, "            {"
                    PRINT #1, "                VertexSimplexHeightAbsolute"
                    PRINT #1, "                {"
                    
                    PRINT #1, "                    seed ="; INT(RND * 100000)
                    PRINT #1, "                }"
                    PRINT #1, "                VertexHeightNoise"
                    PRINT #1, "                {"
                    'PRINT #1, "                    persistence = 0.5"
                    
                    PRINT #1, "                    seed ="; INT(RND * 100000)
                    PRINT #1, "                }"
                    PRINT #1, "            }"
                    PRINT #1, "        }"
                    PRINT #1, "    }"
                    'PRINT #1, "}"
                    PRINT #1, ""
                    AST = AST - 1
                    ASTNUMBER = ASTNUMBER + 1
                    AOBJECTNUMBER = AOBJECTNUMBER + 1
                    IF AST = 0 THEN
                        GOTO 153
                    END IF
                LOOP

            153 END IF
        END IF

        PRINT #1, "}"
        YELLOWSTAR = YELLOWSTAR - 1
        SOBJECTNUMBER = SOBJECTNUMBER + 1
        IF YELLOWSTAR = 0 THEN
            GOTO 2
        END IF
        YELLOWSTARNUMBER = YELLOWSTARNUMBER + 1
    LOOP
2 END IF

'******************************************************************************
'******************************************************************************
'******************************************************************************
'******************************************************************************
'******************************************************************************

COLOR _RGB(0, 0, 255)

IF BLUESTAR > 0 THEN 'Checks if BLUESTAR variable is still above zero, Then carries out an action.

    DO
        IF PENABLE$ = "y" THEN
            
            SPN = INT(RND * 4)
        ELSE
            SPN = 1
        END IF
        '###These print statements can go away once the starTemplate can be used
        '###Need to get planet and moon template generation working in basic first
        '###STH 2017-0127
        PRINT #1, "@Kopernicus"
        PRINT #1, "{"
        PRINT #1, "    Body"
        PRINT #1, "    {"
        aStarName$ = theStarName$ '#Calls the function "theStarName"
        PRINT #1, "        name = "; aStarName$
        PRINT #1, "        Template"
        PRINT #1, "        {"
        PRINT #1, "            name = Sun"
        PRINT #1, "        }"
        '########################'
        '###Fill in property data'
        theDescription$ = "VAL -" + STR$(BLUESTARNUMBER) + " is a main sequence blue giant star."
        theRadius$ = STR$(INT(RND * 5000000000) + 2000000000)
        theSphereOfInfluence$ = STR$(500118820000)
        aPropertiesTemplate$ = thePropertiesTemplate$
        aPropertiesNode$ = propertyNode$(aPropertiesTemplate$, theDescription$, theRadius$, theSphereOfInfluence$, "")
        PRINT #1, aPropertiesNode$
        '###End property data'
        '########################'
        '########################'
        '###Fill in orbit data'
        theMode$ = STR$(0)
        theColor$ = "0,0,1,1"
        aOrbitTemp$ = theOrbitTemplate$
        aOrbitNode$ = orbitNode$(aOrbitTemp$, GTYPE, theColor$, theMode$)
        PRINT #1, aOrbitNode$
        '###End orbit data'
        '########################'
        PRINT #1, "        ScaledVersion"
        PRINT #1, "        {"
        '########################'
        '###Fill in light data'
        sunlightColor$ = "0.0,0.15,0.6,1.0"
        sunlightIntensity$ = "3.0"
        scaledSunlightColor$ = "0.0,0.15,0.6,1.0"
        scaledSunlightIntensity$ = "3.0"
        IVASuncolor$ = "0.0,0.15,0.6,1.0"
        IVASunIntensity$ = "3.0"
        sunLensFlareColor$ = "0,0.5,1,1.0"
        ambientLightColor$ = "0,0,0,1"
        sunAU$ = "1359984025666"
        luminosity$ = "0"
        givesOffLight$ = "True"
        aLightTemp$ = theLightTemplate$
        aLightNode$ = lightNode$(aLightTemp$, sunlightColor$, sunlightIntensity$, scaledSunlightColor$, scaledSunlightIntensity$, IVASuncolor$, IVASunIntensity$, sunLensFlareColor$, ambientLightColor$, sunAU$, luminosity$, givesOffLight$)
        PRINT #1, aLightNode$
        '###End light data'
        '########################'
        '########################'
        '###Fill in material data'
        emitColorZero$ = "0.2,0.99,0.99,1.0"
        emitColorOne$ = "0.139,0.061,1.0,1.0"
        sunspotColor$ = "0,0,0,1.0"
        rimColor$ = "0.0,0.636,1.0,1.0"
        rimPower$ = "3"
        rimBlend$ = "3"
        aMaterialTemp$ = theMaterialTemplate$
        aMaterialNode$ = materialNode$(aMaterialTemp$, emitColorZero$, emitColorOne$, sunspotColor$, rimColor$, rimPower$, rimBlend$)
        PRINT #1, aMaterialNode$
        '###End material data'
        '########################'
        '########################'
        '###Fill in coronas data'
        starColour$ = "Blue"
        aCoronaTemp$ = theCoronasTemplate$
        aCoronaNode$ = coronaNode$(aCoronaTemp$, starColour$)
        PRINT #1, aCoronaNode$
        '###End coronas data'
        '########################'
        PRINT #1, "        }"
        PRINT #1, "    }"

        IF SPN = 0 THEN
            
            GAS = INT(RND * 5)
            GASNUMBER = 1
            IF GAS > 0 THEN
                
                SEMIMAJORAXIS = INT(RND * 1000000000000) + 400000000
                
                INCLINATION = INT(RND * 360)
                DO
                    PRINT #1, "    Body"
                    PRINT #1, "    {"
                    IF GASNUMBER = 1 THEN
                        PRINT #1, "         name = "; aStarName$; " I"
                        PNM$ = " I"
                    END IF
                    IF GASNUMBER = 2 THEN
                        PRINT #1, "         name = "; aStarName$; " II"
                        PNM$ = " II"
                    END IF
                    IF GASNUMBER = 3 THEN
                        PRINT #1, "         name = "; aStarName$; " III"
                        PNM$ = " III"
                    END IF
                    IF GASNUMBER = 4 THEN
                        PRINT #1, "         name = "; aStarName$; " IV"
                        PNM$ = " IV"
                    END IF
                    IF GASNUMBER = 5 THEN
                        PRINT #1, "         name = "; aStarName$; " V"
                        PNM$ = " V"
                    END IF
                    PRINT #1, "         Orbit"
                    PRINT #1, "         {"
                    PRINT #1, "             referenceBody = "; aStarName$; ""




                    PRINT #1, "            semiMajorAxis ="; SEMIMAJORAXIS; ""
                    SEMIMAJORAXIS = SEMIMAJORAXIS * 1.5

                    PRINT #1, "            longitudeOfAscendingNode = 0"
                    
                    PRINT #1, "            argumentOfPeriapsis ="; INT(RND * 1000); ""
                    PRINT #1, "            meanAnomalyAtEpoch = 0"
                    PRINT #1, "            meanAnomalyAtEpochD = 0"
                    PRINT #1, "            epoch = 0"


                    PRINT #1, "            inclination ="; INCLINATION; ""

                    PRINT #1, "         }"
                    PRINT #1, "         Template"
                    PRINT #1, "         {"

                    
                    PLANETTYPE = INT(RND * 13)
                    SELECT CASE PLANETTYPE
                        CASE 0
                            PLANETTYPE$ = "Moho"
                        CASE 1
                            PLANETTYPE$ = "Eve"
                        CASE 2
                            PLANETTYPE$ = "Mun"
                        CASE 3
                            PLANETTYPE$ = "Moho"
                        CASE 4
                            PLANETTYPE$ = "Duna"
                        CASE 5
                            PLANETTYPE$ = "Ike"
                        CASE 6
                            PLANETTYPE$ = "Dres"
                        CASE 7
                            PLANETTYPE$ = "Jool"
                        CASE 8
                            PLANETTYPE$ = "Jool"
                        CASE 9
                            PLANETTYPE$ = "Jool"
                        CASE 10
                            PLANETTYPE$ = "Tylo"
                        CASE 11
                            PLANETTYPE$ = "Bop"
                        CASE 12
                            PLANETTYPE$ = "Pol"
                        CASE 13
                            PLANETTYPE$ = "Jool"
                    END SELECT
                    IF PLANETTYPE$ = "Moho" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 0.1,0.1,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Eve" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 1500000) + 300000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 0.1,0.1,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Mun" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 0.1,0.1,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Minmus" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 120000) + 80000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 0.1,0.1,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Duna" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 700000) + 270000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 0.1,0.1,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Ike" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 250000) + 50000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 0.1,0.1,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Dres" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 250000) + 50000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 0.1,0.1,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Laythe" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 1000000) + 300000; ""


                        PRINT #1, "         }"

                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 0.1,0.1,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Vall" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 0.1,0.1,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Tylo" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 1500000) + 300000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 0.1,0.1,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Bop" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 100000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 0.1,0.1,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Pol" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 100000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 0.1,0.1,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Eeloo" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 0.1,0.1,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Jool" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         ScaledVersion"
                        PRINT #1, "         {"
                        PRINT #1, "             Material"
                        PRINT #1, "             {"
                        
                        PRINT #1, "                 texture = To_Boldly_Go/gastextures/-"; INT(RND * 16); ".jpg"
                        PRINT #1, "             }"
                        PRINT #1, "         }"
                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 10000000) + 700000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 1)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 0.1,0.1,1.0,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    
                    MOON = INT(RND * 4)
                    MOONUMBER = 1
                    IF MOON > 0 THEN
                        DO
                            'PRINT #1, "@Kopernicus:AFTER[KOPERNICUS]"
                            'PRINT #1, "{"
                            PRINT #1, "    Body"
                            PRINT #1, "    {"
                            PRINT #1, "        name = "; aStarName$; ""; PNM$; " "; MOONNUMBER; ""
                            PRINT #1, ""
                            PRINT #1, "        Orbit"
                            PRINT #1, "        {"
                            PRINT #1, "            referenceBody = "; aStarName$; ""; PNM$; ""
                            
                            PRINT #1, "            inclination ="; INT(RND * 360)
                            
                            PRINT #1, "            semiMajorAxis ="; INT(RND * 50000000) + 16000000
                            PRINT #1, "        }"
                            IF PLANETTYPE$ = "Jool" THEN
                                
                                MOONTYPE = INT(RND * 13)
                                SELECT CASE MOONTYPE
                                    CASE 0
                                        MOONTYPE$ = "Moho"
                                    CASE 1
                                        MOONTYPE$ = "Eve"
                                    CASE 2
                                        MOONTYPE$ = "Mun"
                                    CASE 3
                                        MOONTYPE$ = "Minmus"
                                    CASE 4
                                        MOONTYPE$ = "Duna"
                                    CASE 5
                                        MOONTYPE$ = "Ike"
                                    CASE 6
                                        MOONTYPE$ = "Dres"
                                    CASE 7
                                        MOONTYPE$ = "Gilly"
                                    CASE 8
                                        MOONTYPE$ = "Laythe"
                                    CASE 9
                                        MOONTYPE$ = "Vall"
                                    CASE 10
                                        MOONTYPE$ = "Tylo"
                                    CASE 11
                                        MOONTYPE$ = "Bop"
                                    CASE 12
                                        MOONTYPE$ = "Pol"
                                    CASE 13
                                        MOONTYPE$ = "Eeloo"
                                END SELECT
                                PRINT #1, "        Template"
                                PRINT #1, "        {"
                                PRINT #1, "            name = "; MOONTYPE$
                                PRINT #1, "        }"
                            ELSE
                                PRINT #1, "        Template"
                                PRINT #1, "        {"
                                PRINT #1, "            name = Gilly"
                                PRINT #1, "        }"
                            END IF
                            PRINT #1, "    }"
                            'PRINT #1, "}"

                            PRINT #1, ""
                            MOON = MOON - 1
                            MOONNUMBER = MOONNUMBER + 1
                            MOBJECTNUMBER = MOBJECTNUMBER + 1
                            IF MOON = 0 THEN
                                GOTO 16
                            END IF
                        LOOP
                    16 END IF

                    GAS = GAS - 1
                    GASNUMBER = GASNUMBER + 1
                    POBJECTNUMBER = POBJECTNUMBER + 1
                    IF GAS = 0 THEN
                        GOTO 30
                    END IF

                LOOP
            END IF
        30 END IF

        IF ASTTOG$ = "y" THEN
            
            AST = INT(RND * 2)
            ASTNUMBER = 1
            IF AST > 0 THEN
                DO
                    'PRINT #1, "@Kopernicus:AFTER[KOPERNICUS]"
                    'PRINT #1, "{"
                    PRINT #1, "    Body"
                    PRINT #1, "    {"
                    PRINT #1, "        name = "; aStarName$; ASTNUMBER; ""
                    PRINT #1, ""
                    PRINT #1, "        Template"
                    PRINT #1, "        {"
                    PRINT #1, "            name = Gilly"
                    PRINT #1, ""
                    'PRINT #1, "            removePQSMods = PQSLandControl"
                    PRINT #1, "        }"
                    PRINT #1, "        Properties"
                    PRINT #1, "        {"
                    PRINT #1, "            description = When Jeb was originally shown a map of our galaxy he said 'Wow! Thats big! Dont suppose we get any rest stops out there do we?' This statement encouraged our scientists to look closer, And eventually this asteroid among many, Was discovered. Dont expect vending machines, And if you do find them... Dont expect candy. "
                    PRINT #1, ""
                    
                    PRINT #1, "            radius ="; INT(RND * 80000) + 5000
                    PRINT #1, ""
                    'PRINT #1, "            sphereOfInfluence = 117915"
                    PRINT #1, "        }"
                    PRINT #1, ""
                    PRINT #1, "        Orbit"
                    PRINT #1, "        {"
                    PRINT #1, "            referenceBody = "; aStarName$; ""
                    
                    PRINT #1, "            inclination ="; INT(RND * 360)
                    
                    PRINT #1, "            semiMajorAxis ="; INT(RND * 100000000000) + 100000000
                    PRINT #1, "        }"
                    PRINT #1, "        PQS"
                    PRINT #1, "        {"
                    PRINT #1, "            Mods"
                    PRINT #1, "            {"
                    PRINT #1, "                VertexSimplexHeightAbsolute"
                    PRINT #1, "                {"
                    
                    PRINT #1, "                    seed ="; INT(RND * 100000)
                    PRINT #1, "                }"
                    PRINT #1, "                VertexHeightNoise"
                    PRINT #1, "                {"
                    'PRINT #1, "                    persistence = 0.5"
                    
                    PRINT #1, "                    seed ="; INT(RND * 100000)
                    PRINT #1, "                }"
                    PRINT #1, "            }"
                    PRINT #1, "        }"
                    PRINT #1, "    }"
                    'PRINT #1, "}"
                    PRINT #1, ""
                    AST = AST - 1
                    ASTNUMBER = ASTNUMBER + 1
                    AOBJECTNUMBER = AOBJECTNUMBER + 1
                    IF AST = 0 THEN
                        GOTO 154
                    END IF
                LOOP

            154 END IF
        END IF

        PRINT #1, "}"

        BLUESTAR = BLUESTAR - 1
        SOBJECTNUMBER = SOBJECTNUMBER + 1
        IF BLUESTAR = 0 THEN
            GOTO 3
        END IF
        BLUESTARNUMBER = BLUESTARNUMBER + 1
    LOOP
3 END IF


'******************************************************************************
'******************************************************************************
'******************************************************************************
'******************************************************************************
'******************************************************************************

IF WHITESTAR > 0 THEN 'Checks if WHITESTAR variable is still above zero, Then carries out an action.

    DO
        IF PENABLE$ = "y" THEN
            
            SPN = INT(RND * 4)
        ELSE
            SPN = 1
        END IF
        '###These print statements can go away once the starTemplate can be used
        '###Need to get planet and moon template generation working in basic first
        '###STH 2017-0127
        PRINT #1, "@Kopernicus"
        PRINT #1, "{"
        PRINT #1, "    Body"
        PRINT #1, "    {"
        aStarName$ = theStarName$ '#Calls the function "theStarName"
        PRINT #1, "        name = "; aStarName$
        PRINT #1, "        Template"
        PRINT #1, "        {"
        PRINT #1, "            name = Sun"
        PRINT #1, "        }"
        '########################'
        '###Fill in property data'
        theDescription$ = "KIRRIM -" + STR$(WHITESTARNUMBER) + " is a yellow-white dwarf star."
        theRadius$ = STR$(INT(RND * 1500000000) + 1000000000)
        theSphereOfInfluence$ = STR$(330118820000)
        aPropertiesTemplate$ = thePropertiesTemplate$
        aPropertiesNode$ = propertyNode$(aPropertiesTemplate$, theDescription$, theRadius$, theSphereOfInfluence$, "")
        PRINT #1, aPropertiesNode$
        '###End property data'
        '########################'
        '########################'
        '###Fill in orbit data'
        theMode$ = STR$(0)
        theColor$ = "1.0,1.0,0.67,1.0"
        aOrbitTemp$ = theOrbitTemplate$
        aOrbitNode$ = orbitNode$(aOrbitTemp$, GTYPE, theColor$, theMode$)
        PRINT #1, aOrbitNode$
        '###End orbit data'
        '########################'
        PRINT #1, "        ScaledVersion"
        PRINT #1, "        {"
        '########################'
        '###Fill in light data'
        sunlightColor$ = "1.0,1.0,0.67,1.0"
        sunlightIntensity$ = "0.5"
        scaledSunlightColor$ = "1.0,1.0,0.67,1.0"
        scaledSunlightIntensity$ = "1.0"
        IVASuncolor$ = "1.0,1.0,0.67,1.0"
        IVASunIntensity$ = "1.0"
        sunLensFlareColor$ = "0.2303371,0.4494382,1,1.0"
        ambientLightColor$ = "0,0,0,1"
        sunAU$ = "135998402566"
        luminosity$ = "0"
        givesOffLight$ = "True"
        aLightTemp$ = theLightTemplate$
        aLightNode$ = lightNode$(aLightTemp$, sunlightColor$, sunlightIntensity$, scaledSunlightColor$, scaledSunlightIntensity$, IVASuncolor$, IVASunIntensity$, sunLensFlareColor$, ambientLightColor$, sunAU$, luminosity$, givesOffLight$)
        PRINT #1, aLightNode$
        '###End light data'
        '########################'
        '########################'
        '###Fill in material data'
        emitColorZero$ = "0.2640449,0.258427,0.2752809,1.0"
        emitColorOne$ = "0.6516854,0.6460674,0.6573034,1.0"
        sunspotColor$ = "0,0,0,1.0"
        rimColor$ = "0.6011236,0.5955056,0.6292135,1.0"
        rimPower$ = "1"
        rimBlend$ = "1"
        aMaterialTemp$ = theMaterialTemplate$
        aMaterialNode$ = materialNode$(aMaterialTemp$, emitColorZero$, emitColorOne$, sunspotColor$, rimColor$, rimPower$, rimBlend$)
        PRINT #1, aMaterialNode$
        '###End material data'
        '########################'
        '########################'
        '###Fill in coronas data'
        starColour$ = "White"
        aCoronaTemp$ = theCoronasTemplate$
        aCoronaNode$ = coronaNode$(aCoronaTemp$, starColour$)
        PRINT #1, aCoronaNode$
        '###End coronas data'
        '########################'
        PRINT #1, "        }"
        PRINT #1, "    }"



        IF SPN = 0 THEN
            
            GAS = INT(RND * 5)
            GASNUMBER = 1
            IF GAS > 0 THEN
                
                SEMIMAJORAXIS = INT(RND * 100000000000) + 150000000
                
                INCLINATION = INT(RND * 360)
                DO
                    PRINT #1, "    Body"
                    PRINT #1, "    {"
                    IF GASNUMBER = 1 THEN
                        PRINT #1, "         name = "; aStarName$; " I"
                        PNM$ = " I"
                    END IF
                    IF GASNUMBER = 2 THEN
                        PRINT #1, "         name = "; aStarName$; " II"
                        PNM$ = " II"
                    END IF
                    IF GASNUMBER = 3 THEN
                        PRINT #1, "         name = "; aStarName$; " III"
                        PNM$ = " III"
                    END IF
                    IF GASNUMBER = 4 THEN
                        PRINT #1, "         name = "; aStarName$; " IV"
                        PNM$ = " IV"
                    END IF
                    IF GASNUMBER = 5 THEN
                        PRINT #1, "         name = "; aStarName$; " V"
                        PNM$ = " V"
                    END IF
                    PRINT #1, "         Orbit"
                    PRINT #1, "         {"
                    PRINT #1, "             referenceBody = "; aStarName$; ""




                    PRINT #1, "            semiMajorAxis ="; SEMIMAJORAXIS; ""
                    SEMIMAJORAXIS = SEMIMAJORAXIS * 1.5

                    PRINT #1, "            longitudeOfAscendingNode = 0"
                    
                    PRINT #1, "            argumentOfPeriapsis ="; INT(RND * 1000); ""
                    PRINT #1, "            meanAnomalyAtEpoch = 0"
                    PRINT #1, "            meanAnomalyAtEpochD = 0"
                    PRINT #1, "            epoch = 0"


                    PRINT #1, "            inclination ="; INCLINATION; ""

                    PRINT #1, "         }"
                    PRINT #1, "         Template"
                    PRINT #1, "         {"

                    
                    PLANETTYPE = INT(RND * 20)
                    SELECT CASE PLANETTYPE
                        CASE 0
                            PLANETTYPE$ = "Moho"
                        CASE 1
                            PLANETTYPE$ = "Eve"
                        CASE 2
                            PLANETTYPE$ = "Mun"
                        CASE 3
                            PLANETTYPE$ = "Moho"
                        CASE 4
                            PLANETTYPE$ = "Duna"
                        CASE 5
                            PLANETTYPE$ = "Ike"
                        CASE 6
                            PLANETTYPE$ = "Dres"
                        CASE 7
                            PLANETTYPE$ = "Jool"
                        CASE 8
                            PLANETTYPE$ = "Jool"
                        CASE 9
                            PLANETTYPE$ = "Jool"
                        CASE 10
                            PLANETTYPE$ = "Tylo"
                        CASE 11
                            PLANETTYPE$ = "Jool"
                        CASE 12
                            PLANETTYPE$ = "Jool"
                        CASE 13
                            PLANETTYPE$ = "Jool"
                        CASE 14
                            PLANETTYPE$ = "Jool"
                        CASE 15
                            PLANETTYPE$ = "Jool"
                        CASE 16
                            PLANETTYPE$ = "Jool"
                        CASE 17
                            PLANETTYPE$ = "Jool"
                        CASE 18
                            PLANETTYPE$ = "Jool"
                        CASE 19
                            PLANETTYPE$ = "Jool"
                        CASE 20
                            PLANETTYPE$ = "Jool"
                    END SELECT
                    IF PLANETTYPE$ = "Moho" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Eve" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 1500000) + 300000; ""


                        PRINT #1, "         }"
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Mun" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Minmus" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 120000) + 80000; ""


                        PRINT #1, "         }"
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Duna" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 700000) + 270000; ""


                        PRINT #1, "         }"
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Ike" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 250000) + 50000; ""


                        PRINT #1, "         }"
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Dres" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 250000) + 50000; ""


                        PRINT #1, "         }"
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Laythe" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 1000000) + 300000; ""


                        PRINT #1, "         }"
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Vall" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Tylo" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 1500000) + 300000; ""


                        PRINT #1, "         }"
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Bop" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 100000) + 70000; ""


                        PRINT #1, "         }"
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Pol" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 100000) + 70000; ""


                        PRINT #1, "         }"
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Eeloo" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Jool" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         ScaledVersion"
                        PRINT #1, "         {"
                        PRINT #1, "             Material"
                        PRINT #1, "             {"
                        
                        PRINT #1, "                 texture = To_Boldly_Go/gastextures/-"; INT(RND * 16); ".jpg"
                        PRINT #1, "             }"
                        PRINT #1, "         }"
                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 10000000) + 700000; ""


                        PRINT #1, "         }"
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    
                    MOON = INT(RND * 4)
                    MOONUMBER = 1
                    IF MOON > 0 THEN
                        DO
                            PRINT #1, "    Body"
                            PRINT #1, "    {"
                            PRINT #1, "        name = "; aStarName$; ""; PNM$; " "; MOONNUMBER; ""
                            PRINT #1, ""
                            PRINT #1, "        Orbit"
                            PRINT #1, "        {"
                            PRINT #1, "            referenceBody = "; aStarName$; ""; PNM$; ""
                            
                            PRINT #1, "            inclination ="; INT(RND * 360)
                            
                            PRINT #1, "            semiMajorAxis ="; INT(RND * 50000000) + 11000000
                            PRINT #1, "        }"
                            IF PLANETTYPE$ = "Jool" THEN
                                
                                MOONTYPE = INT(RND * 13)
                                SELECT CASE MOONTYPE
                                    CASE 0
                                        MOONTYPE$ = "Moho"
                                    CASE 1
                                        MOONTYPE$ = "Eve"
                                    CASE 2
                                        MOONTYPE$ = "Mun"
                                    CASE 3
                                        MOONTYPE$ = "Minmus"
                                    CASE 4
                                        MOONTYPE$ = "Duna"
                                    CASE 5
                                        MOONTYPE$ = "Ike"
                                    CASE 6
                                        MOONTYPE$ = "Dres"
                                    CASE 7
                                        MOONTYPE$ = "Gilly"
                                    CASE 8
                                        MOONTYPE$ = "Laythe"
                                    CASE 9
                                        MOONTYPE$ = "Vall"
                                    CASE 10
                                        MOONTYPE$ = "Tylo"
                                    CASE 11
                                        MOONTYPE$ = "Bop"
                                    CASE 12
                                        MOONTYPE$ = "Pol"
                                    CASE 13
                                        MOONTYPE$ = "Eeloo"
                                END SELECT
                                PRINT #1, "        Template"
                                PRINT #1, "        {"
                                PRINT #1, "            name = "; MOONTYPE$
                                PRINT #1, "        }"
                            ELSE
                                PRINT #1, "        Template"
                                PRINT #1, "        {"
                                PRINT #1, "            name = Gilly"
                                PRINT #1, "        }"
                            END IF
                            PRINT #1, "    }"
                            'PRINT #1, "}"
                            MOON = MOON - 1
                            MOONNUMBER = MOONNUMBER + 1
                            MOBJECTNUMBER = MOBJECTNUMBER + 1
                            IF MOON = 0 THEN
                                GOTO 17
                            END IF
                        LOOP
                    17 END IF

                    GAS = GAS - 1
                    GASNUMBER = GASNUMBER + 1
                    POBJECTNUMBER = POBJECTNUMBER + 1
                    IF GAS = 0 THEN
                        GOTO 40
                    END IF

                LOOP
            END IF
        40 END IF

        IF ASTTOG$ = "y" THEN
            
            AST = INT(RND * 2)
            ASTNUMBER = 1
            IF AST > 0 THEN
                DO
                    'PRINT #1, "@Kopernicus:AFTER[KOPERNICUS]"
                    'PRINT #1, "{"
                    PRINT #1, "    Body"
                    PRINT #1, "    {"
                    PRINT #1, "        name = "; aStarName$; ASTNUMBER; ""
                    PRINT #1, ""
                    PRINT #1, "        Template"
                    PRINT #1, "        {"
                    PRINT #1, "            name = Gilly"
                    PRINT #1, ""
                    'PRINT #1, "            removePQSMods = PQSLandControl"
                    PRINT #1, "        }"
                    PRINT #1, "        Properties"
                    PRINT #1, "        {"
                    PRINT #1, "            description = When Jeb was originally shown a map of our galaxy he said 'Wow! Thats big! Dont suppose we get any rest stops out there do we?' This statement encouraged our scientists to look closer, And eventually this asteroid among many, Was discovered. Dont expect vending machines, And if you do find them... Dont expect candy. "
                    PRINT #1, ""
                    
                    PRINT #1, "            radius ="; INT(RND * 80000) + 5000
                    PRINT #1, ""
                    'PRINT #1, "            sphereOfInfluence = 117915"
                    PRINT #1, "        }"
                    PRINT #1, ""
                    PRINT #1, "        Orbit"
                    PRINT #1, "        {"
                    PRINT #1, "            referenceBody = "; aStarName$; ""
                    
                    PRINT #1, "            inclination ="; INT(RND * 360)
                    
                    PRINT #1, "            semiMajorAxis ="; INT(RND * 100000000000) + 100000000
                    PRINT #1, "        }"
                    PRINT #1, "        PQS"
                    PRINT #1, "        {"
                    PRINT #1, "            Mods"
                    PRINT #1, "            {"
                    PRINT #1, "                VertexSimplexHeightAbsolute"
                    PRINT #1, "                {"
                    
                    PRINT #1, "                    seed ="; INT(RND * 100000)
                    PRINT #1, "                }"
                    PRINT #1, "                VertexHeightNoise"
                    PRINT #1, "                {"
                    'PRINT #1, "                    persistence = 0.5"
                    
                    PRINT #1, "                    seed ="; INT(RND * 100000)
                    PRINT #1, "                }"
                    PRINT #1, "            }"
                    PRINT #1, "        }"
                    PRINT #1, "    }"
                    'PRINT #1, "}"
                    PRINT #1, ""
                    AST = AST - 1
                    ASTNUMBER = ASTNUMBER + 1
                    AOBJECTNUMBER = AOBJECTNUMBER + 1
                    IF AST = 0 THEN
                        GOTO 155
                    END IF
                LOOP

            155 END IF
        END IF

        PRINT #1, "}"

        WHITESTAR = WHITESTAR - 1
        SOBJECTNUMBER = SOBJECTNUMBER + 1
        IF WHITESTAR = 0 THEN
            GOTO 4
        END IF
        WHITESTARNUMBER = WHITESTARNUMBER + 1
    LOOP
4 END IF


IF BROWNSTAR > 0 THEN 'Checks if BROWNSTAR variable is still above zero, Then carries out an action.

    DO
        IF PENABLE$ = "y" THEN
            
            SPN = INT(RND * 4)
        ELSE
            SPN = 1
        END IF
        '###These print statements can go away once the starTemplate can be used
        '###Need to get planet and moon template generation working in basic first
        '###STH 2017-0127
        PRINT #1, "@Kopernicus"
        PRINT #1, "{"
        PRINT #1, "    Body"
        PRINT #1, "    {"
        aStarName$ = theStarName$ '#Calls the function "theStarName"
        PRINT #1, "        name = "; aStarName$
        PRINT #1, "        Template"
        PRINT #1, "        {"
        PRINT #1, "            name = Sun"
        PRINT #1, "        }"
        '########################'
        '###Fill in property data'
        theDescription$ = "A brown dwarf stellar object"
        theRadius$ = STR$(INT(RND * 30000000) + 1500000)
        theSphereOfInfluence$ = STR$(50118820000)
        aPropertiesTemplate$ = thePropertiesTemplate$
        aPropertiesNode$ = propertyNode$(aPropertiesTemplate$, theDescription$, theRadius$, theSphereOfInfluence$, "")
        PRINT #1, aPropertiesNode$
        '###End property data'
        '########################'
        '########################'
        '###Fill in orbit data'
        theMode$ = STR$(0)
        theColor$ = "1,0,1,1"
        aOrbitTemp$ = theOrbitTemplate$
        aOrbitNode$ = orbitNode$(aOrbitTemp$, GTYPE, theColor$, theMode$)
        PRINT #1, aOrbitNode$
        '###End orbit data'
        '########################'
        PRINT #1, "        ScaledVersion"
        PRINT #1, "        {"
        '########################'
        '###Fill in light data'
        sunlightColor$ = "0.7,0.0,0.5,1.0"
        sunlightIntensity$ = "0.10"
        scaledSunlightColor$ = "0.7,0.0,0.5,1.0"
        scaledSunlightIntensity$ = "0.20"
        IVASuncolor$ = "0.7,0.0,0.5,1.0"
        IVASunIntensity$ = "0.10"
        sunLensFlareColor$ = "0.6,0,1,1.0"
        ambientLightColor$ = "0,0,0,1"
        sunAU$ = "135998402"
        luminosity$ = "0"
        givesOffLight$ = "True"
        aLightTemp$ = theLightTemplate$
        aLightNode$ = lightNode$(aLightTemp$, sunlightColor$, sunlightIntensity$, scaledSunlightColor$, scaledSunlightIntensity$, IVASuncolor$, IVASunIntensity$, sunLensFlareColor$, ambientLightColor$, sunAU$, luminosity$, givesOffLight$)
        PRINT #1, aLightNode$
        '###End light data'
        '########################'
        '########################'
        '###Fill in material data'
        emitColorZero$ = "0.7,0.0,0.5,1.0"
        emitColorOne$ = "0.7,0.0,0.5,1.0"
        sunspotColor$ = "0.0,0,0,1.0"
        rimColor$ = "0.7,0.0,0.5,1.0"
        rimPower$ = "1"
        rimBlend$ = "1"
        aMaterialTemp$ = theMaterialTemplate$
        aMaterialNode$ = materialNode$(aMaterialTemp$, emitColorZero$, emitColorOne$, sunspotColor$, rimColor$, rimPower$, rimBlend$)
        PRINT #1, aMaterialNode$
        '###End material data'
        '########################'
        '########################'
        '###Fill in coronas data'
        starColour$ = "Black"
        aCoronaTemp$ = theCoronasTemplate$
        aCoronaNode$ = coronaNode$(aCoronaTemp$, starColour$)
        PRINT #1, aCoronaNode$
        '###End coronas data'
        '########################'
        PRINT #1, "        }"
        PRINT #1, "    }"

        IF SPN = 0 THEN
            
            GAS = INT(RND * 5)
            GASNUMBER = 1
            IF GAS > 0 THEN
                
                SEMIMAJORAXIS = INT(RND * 1000000000) + 25000000
                
                INCLINATION = INT(RND * 360)
                DO
                    PRINT #1, "    Body"
                    PRINT #1, "    {"
                    IF GASNUMBER = 1 THEN
                        PRINT #1, "         name = "; aStarName$; " I"
                        PNM$ = " I"
                    END IF
                    IF GASNUMBER = 2 THEN
                        PRINT #1, "         name = "; aStarName$; " II"
                        PNM$ = " II"
                    END IF
                    IF GASNUMBER = 3 THEN
                        PRINT #1, "         name = "; aStarName$; " III"
                        PNM$ = " III"
                    END IF
                    IF GASNUMBER = 4 THEN
                        PRINT #1, "         name = "; aStarName$; " IV"
                        PNM$ = " IV"
                    END IF
                    IF GASNUMBER = 5 THEN
                        PRINT #1, "         name = "; aStarName$; " V"
                        PNM$ = " V"
                    END IF
                    PRINT #1, "         Orbit"
                    PRINT #1, "         {"
                    PRINT #1, "             referenceBody = "; aStarName$; ""




                    PRINT #1, "            semiMajorAxis ="; SEMIMAJORAXIS; ""
                    SEMIMAJORAXIS = SEMIMAJORAXIS * 1.5


                    PRINT #1, "            inclination ="; INCLINATION; ""

                    PRINT #1, "         }"
                    PRINT #1, "         Template"
                    PRINT #1, "         {"

                    
                    PLANETTYPE = INT(RND * 9)
                    SELECT CASE PLANETTYPE
                        CASE 0
                            PLANETTYPE$ = "Moho"
                        CASE 1
                            PLANETTYPE$ = "Mun"
                        CASE 2
                            PLANETTYPE$ = "Minmus"
                        CASE 3
                            PLANETTYPE$ = "Ike"
                        CASE 4
                            PLANETTYPE$ = "Dres"
                        CASE 5
                            PLANETTYPE$ = "Vall"
                        CASE 6
                            PLANETTYPE$ = "Tylo"
                        CASE 7
                            PLANETTYPE$ = "Bop"
                        CASE 8
                            PLANETTYPE$ = "Pol"
                        CASE 9
                            PLANETTYPE$ = "Eeloo"
                    END SELECT
                    IF PLANETTYPE$ = "Moho" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.0,0.6,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Eve" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 1500000) + 300000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.0,0.6,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Mun" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.0,0.6,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Minmus" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 120000) + 80000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.0,0.6,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Duna" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 700000) + 270000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.0,0.6,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Ike" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 250000) + 50000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.0,0.6,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Dres" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 250000) + 50000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.0,0.6,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Laythe" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 1000000) + 300000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.0,0.6,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Vall" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.0,0.6,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Tylo" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 1500000) + 300000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.0,0.6,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Bop" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 100000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.0,0.6,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Pol" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 100000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.0,0.6,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Eeloo" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.0,0.6,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    IF PLANETTYPE$ = "Jool" THEN
                        PRINT #1, "             name = "; PLANETTYPE$
                        PRINT #1, "         }"

                        PRINT #1, "         ScaledVersion"
                        PRINT #1, "         {"
                        PRINT #1, "             Material"
                        PRINT #1, "             {"
                        
                        PRINT #1, "                 texture = To_Boldly_Go/gastextures/-"; INT(RND * 16); ".jpg"
                        PRINT #1, "             }"
                        PRINT #1, "         }"
                        PRINT #1, "         Properties"
                        PRINT #1, "         {"




                        
                        PRINT #1, "            radius ="; INT(RND * 10000000) + 700000; ""


                        PRINT #1, "         }"
                        
                        RINGS = INT(RND * 3)
                        IF RINGS = 0 THEN
                            PRINT #1, "         Rings"
                            PRINT #1, "         {"
                            PRINT #1, "             Ring"
                            PRINT #1, "             {"
                            PRINT #1, "                 angle = 0"
                            PRINT #1, "                 outerRadius = 3000"
                            PRINT #1, "                 innerRadius = 2000"
                            
                            PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                            PRINT #1, "                 color = 1.0,0.0,0.6,1.0"
                            PRINT #1, "                 lockRotation = false"
                            PRINT #1, "                 unlit = false"
                            PRINT #1, "             }"
                            PRINT #1, "          }"
                        END IF
                        PRINT #1, "    }"
                        'PRINT #1, "}"
                    END IF
                    
                    MOON = INT(RND * 4)
                    MOONUMBER = 1
                    IF MOON > 0 THEN
                        DO
                            PRINT #1, "    Body"
                            PRINT #1, "    {"
                            PRINT #1, "        name = "; aStarName$; ""; PNM$; " "; MOONNUMBER; ""
                            PRINT #1, ""
                            PRINT #1, "        Orbit"
                            PRINT #1, "        {"
                            PRINT #1, "            referenceBody = "; aStarName$; ""; PNM$; ""
                            
                            PRINT #1, "            inclination ="; INT(RND * 360)
                            
                            PRINT #1, "            semiMajorAxis ="; INT(RND * 5000000) + 1500000
                            PRINT #1, "        }"
                            IF PLANETTYPE$ = "Jool" THEN
                                
                                MOONTYPE = INT(RND * 13)
                                SELECT CASE MOONTYPE
                                    CASE 0
                                        MOONTYPE$ = "Moho"
                                    CASE 1
                                        MOONTYPE$ = "Eve"
                                    CASE 2
                                        MOONTYPE$ = "Mun"
                                    CASE 3
                                        MOONTYPE$ = "Minmus"
                                    CASE 4
                                        MOONTYPE$ = "Duna"
                                    CASE 5
                                        MOONTYPE$ = "Ike"
                                    CASE 6
                                        MOONTYPE$ = "Dres"
                                    CASE 7
                                        MOONTYPE$ = "Gilly"
                                    CASE 8
                                        MOONTYPE$ = "Laythe"
                                    CASE 9
                                        MOONTYPE$ = "Vall"
                                    CASE 10
                                        MOONTYPE$ = "Tylo"
                                    CASE 11
                                        MOONTYPE$ = "Bop"
                                    CASE 12
                                        MOONTYPE$ = "Pol"
                                    CASE 13
                                        MOONTYPE$ = "Eeloo"
                                END SELECT
                                PRINT #1, "        Template"
                                PRINT #1, "        {"
                                PRINT #1, "            name = "; MOONTYPE$
                                PRINT #1, "        }"
                            ELSE
                                PRINT #1, "        Template"
                                PRINT #1, "        {"
                                PRINT #1, "            name = Gilly"
                                PRINT #1, "        }"
                            END IF
                            PRINT #1, "    }"
                            'PRINT #1, "}"
                            MOON = MOON - 1
                            MOONNUMBER = MOONNUMBER + 1
                            MOBJECTNUMBER = MOBJECTNUMBER + 1
                            IF MOON = 0 THEN
                                GOTO 114
                            END IF
                        LOOP
                    114 END IF

                    GAS = GAS - 1
                    GASNUMBER = GASNUMBER + 1
                    POBJECTNUMBER = POBJECTNUMBER + 1
                    IF GAS = 0 THEN
                        GOTO 200
                    END IF

                LOOP
            END IF
        200 END IF

        IF ASTTOG$ = "y" THEN
            
            AST = INT(RND * 2)
            ASTNUMBER = 1
            IF AST > 0 THEN
                DO
                    'PRINT #1, "@Kopernicus:AFTER[KOPERNICUS]"
                    'PRINT #1, "{"
                    PRINT #1, "    Body"
                    PRINT #1, "    {"
                    PRINT #1, "        name = "; aStarName$; ASTNUMBER; ""
                    PRINT #1, ""
                    PRINT #1, "        Template"
                    PRINT #1, "        {"
                    PRINT #1, "            name = Gilly"
                    PRINT #1, ""
                    'PRINT #1, "            removePQSMods = PQSLandControl"
                    PRINT #1, "        }"
                    PRINT #1, "        Properties"
                    PRINT #1, "        {"
                    PRINT #1, "            description = When Jeb was originally shown a map of our galaxy he said 'Wow! Thats big! Dont suppose we get any rest stops out there do we?' This statement encouraged our scientists to look closer, And eventually this asteroid among many, Was discovered. Dont expect vending machines, And if you do find them... Dont expect candy. "
                    PRINT #1, ""
                    
                    PRINT #1, "            radius ="; INT(RND * 80000) + 5000
                    PRINT #1, ""
                    'PRINT #1, "            sphereOfInfluence = 117915"
                    PRINT #1, "        }"
                    PRINT #1, ""
                    PRINT #1, "        Orbit"
                    PRINT #1, "        {"
                    PRINT #1, "            referenceBody = "; aStarName$; ""
                    
                    PRINT #1, "            inclination ="; INT(RND * 360)
                    
                    PRINT #1, "            semiMajorAxis ="; INT(RND * 1000000000) + 25000000
                    PRINT #1, "        }"
                    PRINT #1, "        PQS"
                    PRINT #1, "        {"
                    PRINT #1, "            Mods"
                    PRINT #1, "            {"
                    PRINT #1, "                VertexSimplexHeightAbsolute"
                    PRINT #1, "                {"
                    
                    PRINT #1, "                    seed ="; INT(RND * 100000)
                    PRINT #1, "                }"
                    PRINT #1, "                VertexHeightNoise"
                    PRINT #1, "                {"
                    'PRINT #1, "                    persistence = 0.5"
                    
                    PRINT #1, "                    seed ="; INT(RND * 100000)
                    PRINT #1, "                }"
                    PRINT #1, "            }"
                    PRINT #1, "        }"
                    PRINT #1, "    }"
                    'PRINT #1, "}"
                    PRINT #1, ""
                    AST = AST - 1
                    ASTNUMBER = ASTNUMBER + 1
                    AOBJECTNUMBER = AOBJECTNUMBER + 1
                    IF AST = 0 THEN
                        GOTO 157
                    END IF
                LOOP

            157 END IF
        END IF

        PRINT #1, "}"
        BROWNSTAR = BROWNSTAR - 1
        SOBJECTNUMBER = SOBJECTNUMBER + 1
        IF BROWNSTAR = 0 THEN
            GOTO 5
        END IF
        BROWNSTARNUMBER = BROWNSTARNUMBER + 1
    LOOP
5 END IF


IF DWARFSTAR > 0 THEN 'Checks if DWARFSTAR variable is still above zero, Then carries out an action.

    DO
        IF PENABLE$ = "y" THEN
            
            SPN = INT(RND * 4)
        ELSE
            SPN = 1
        END IF
        '###These print statements can go away once the starTemplate can be used
        '###Need to get planet and moon template generation working in basic first
        '###STH 2017-0127
        PRINT #1, "@Kopernicus"
        PRINT #1, "{"
        PRINT #1, "    Body"
        PRINT #1, "    {"
        aStarName$ = theStarName$ '#Calls the function "theStarName"
        PRINT #1, "        name = "; aStarName$
        PRINT #1, "        Template"
        PRINT #1, "        {"
        PRINT #1, "            name = Sun"
        PRINT #1, "        }"
        '########################'
        '###Fill in property data'
        theDescription$ = "NEIL -" + STR$(DWARFSTARNUMBER) + " is a white dwarf stellar core remnant."
        theRadius$ = STR$(INT(RND * 700000) + 300000)
        theSphereOfInfluence$ = STR$(90118820000.5)
        aPropertiesTemplate$ = thePropertiesTemplate$
        aPropertiesNode$ = propertyNode$(aPropertiesTemplate$, theDescription$, theRadius$, theSphereOfInfluence$, "")
        PRINT #1, aPropertiesNode$
        '###End property data'
        '########################'
        '########################'
        '###Fill in orbit data'
        theMode$ = STR$(0)
        theColor$ = "1,1,1,1"
        aOrbitTemp$ = theOrbitTemplate$
        aOrbitNode$ = orbitNode$(aOrbitTemp$, GTYPE, theColor$, theMode$)
        PRINT #1, aOrbitNode$
        '###End orbit data'
        '########################'
        PRINT #1, "        ScaledVersion"
        PRINT #1, "        {"
        '########################'
        '###Fill in light data'
        sunlightColor$ = "1.0,1.0,1.0,1.0"
        sunlightIntensity$ = "0.1"
        scaledSunlightColor$ = "1.0,1.0,1.0,1.0"
        scaledSunlightIntensity$ = "0.10"
        IVASuncolor$ = "1.0,1.0,1.0,1.0"
        IVASunIntensity$ = "0.1"
        sunLensFlareColor$ = "0.2303371,0.4494382,1,1.0"
        ambientLightColor$ = "0,0,0,1"
        sunAU$ = "135998402"
        luminosity$ = "0"
        givesOffLight$ = "True"
        aLightTemp$ = theLightTemplate$
        aLightNode$ = lightNode$(aLightTemp$, sunlightColor$, sunlightIntensity$, scaledSunlightColor$, scaledSunlightIntensity$, IVASuncolor$, IVASunIntensity$, sunLensFlareColor$, ambientLightColor$, sunAU$, luminosity$, givesOffLight$)
        PRINT #1, aLightNode$
        '###End light data'
        '########################'
        '########################'
        '###Fill in material data'
        emitColorZero$ = "1.0,1.0,1.0,1.0"
        emitColorOne$ = "1.0,1.0,1.0,1.0"
        sunspotColor$ = "1.0,1.0,1.0,1.0"
        rimColor$ = "0.7,0.7,0.7,1.0"
        rimPower$ = "1"
        rimBlend$ = "1"
        aMaterialTemp$ = theMaterialTemplate$
        aMaterialNode$ = materialNode$(aMaterialTemp$, emitColorZero$, emitColorOne$, sunspotColor$, rimColor$, rimPower$, rimBlend$)
        PRINT #1, aMaterialNode$
        '###End material data'
        '########################'
        '########################'
        '###Fill in coronas data'
        starColour$ = "White"
        aCoronaTemp$ = theCoronasTemplate$
        aCoronaNode$ = coronaNode$(aCoronaTemp$, starColour$)
        PRINT #1, aCoronaNode$
        '###End coronas data'
        '########################'
        PRINT #1, "        }"
        PRINT #1, "    }"

        IF ASTTOG$ = "y" THEN
            
            AST = INT(RND * 2)
            ASTNUMBER = 1
            IF AST > 0 THEN
                DO
                    PRINT #1, "@Kopernicus:AFTER[KOPERNICUS]"
                    PRINT #1, "{"
                    PRINT #1, "    Body"
                    PRINT #1, "    {"
                    PRINT #1, "        name = "; aStarName$; ASTNUMBER; ""
                    PRINT #1, ""
                    PRINT #1, "        Template"
                    PRINT #1, "        {"
                    PRINT #1, "            name = Gilly"
                    PRINT #1, ""
                    'PRINT #1, "            removePQSMods = PQSLandControl"
                    PRINT #1, "        }"
                    PRINT #1, "        Properties"
                    PRINT #1, "        {"
                    PRINT #1, "            description = When Jeb was originally shown a map of our galaxy he said 'Wow! Thats big! Dont suppose we get any rest stops out there do we?' This statement encouraged our scientists to look closer, And eventually this asteroid among many, Was discovered. Dont expect vending machines, And if you do find them... Dont expect candy. "
                    PRINT #1, ""
                    
                    PRINT #1, "            radius ="; INT(RND * 80000) + 5000
                    PRINT #1, ""
                    'PRINT #1, "            sphereOfInfluence = 117915"
                    PRINT #1, "        }"
                    PRINT #1, ""
                    PRINT #1, "        Orbit"
                    PRINT #1, "        {"
                    PRINT #1, "            referenceBody = "; aStarName$; ""
                    
                    PRINT #1, "            inclination ="; INT(RND * 360)
                    
                    PRINT #1, "            semiMajorAxis ="; INT(RND * 100000000000) + 100000000
                    PRINT #1, "        }"
                    PRINT #1, "        PQS"
                    PRINT #1, "        {"
                    PRINT #1, "            Mods"
                    PRINT #1, "            {"
                    PRINT #1, "                VertexSimplexHeightAbsolute"
                    PRINT #1, "                {"
                    
                    PRINT #1, "                    seed ="; INT(RND * 100000)
                    PRINT #1, "                }"
                    PRINT #1, "                VertexHeightNoise"
                    PRINT #1, "                {"
                    'PRINT #1, "                    persistence = 0.5"
                    
                    PRINT #1, "                    seed ="; INT(RND * 100000)
                    PRINT #1, "                }"
                    PRINT #1, "            }"
                    PRINT #1, "        }"
                    PRINT #1, "    }"
                    PRINT #1, "}"
                    PRINT #1, ""
                    AST = AST - 1
                    ASTNUMBER = ASTNUMBER + 1
                    AOBJECTNUMBER = AOBJECTNUMBER + 1
                    IF AST = 0 THEN
                        GOTO 158
                    END IF
                LOOP

            158 END IF
        END IF
        PRINT #1, "}"
        DWARFSTAR = DWARFSTAR - 1
        SOBJECTNUMBER = SOBJECTNUMBER + 1
        IF DWARFSTAR = 0 THEN
            GOTO 6
        END IF
        DWARFSTARNUMBER = DWARFSTARNUMBER + 1
    LOOP
6 END IF

IF BLACKHOLE > 0 THEN 'Checks if BLACKHOLE variable is still above zero, Then carries out an action.

    DO
        IF PENABLE$ = "y" THEN
            
            SPN = INT(RND * 4)
        ELSE
            SPN = 1
        END IF
        '###These print statements can go away once the starTemplate can be used
        '###Need to get planet and moon template generation working in basic first
        '###STH 2017-0127
        PRINT #1, "@Kopernicus"
        PRINT #1, "{"
        PRINT #1, "    Body"
        PRINT #1, "    {"
        aStarName$ = theStarName$ '#Calls the function "theStarName"
        PRINT #1, "        name = "; aStarName$
        PRINT #1, "        Template"
        PRINT #1, "        {"
        PRINT #1, "            name = Sun"
        PRINT #1, "        }"
        '########################'
        '###Fill in property data'
        theDescription$ = "BILLYBOB -" + STR$(BLACKHOLENUMBER) + "is a black hole. An infinitely dense singularity encapsulated by the event horizon."
        theRadius$ = STR$(INT(RND * 700000) + 300000)
        theSphereOfInfluence$ = STR$(90118820000.5)
        theGeeASL$ = STR$(1000000)
        aPropertiesTemplate$ = thePropertiesTemplate$
        aPropertiesNode$ = propertyNode$(aPropertiesTemplate$, theDescription$, theRadius$, theSphereOfInfluence$, theGeeASL$)
        PRINT #1, aPropertiesNode$
        '###End property data'
        '########################'
        '########################'
        '###Fill in orbit data'
        theMode$ = STR$(0)
        theColor$ = "0.2,0.2,0.2,1"
        aOrbitTemp$ = theOrbitTemplate$
        aOrbitNode$ = orbitNode$(aOrbitTemp$, GTYPE, theColor$, theMode$)
        PRINT #1, aOrbitNode$
        '###End orbit data'
        '########################'
        '###Fill in Ring Data'
        theAngle$ = "0"
        theOuterRadius$ = "72000"
        theInnerRadius$ = "200"
        theRingTexture$ = "BH_ring"
        theColour$ = "0.100, 1.000, 1.000, 1.000"
        theLockRotation$ = "True"
        theUnlit$ = "True"
        aRingsTemp$ = theRingsTemplate$
        aRingsNode$ = ringNode$(aRingsTemp$, theAngle$, theOuterRadius$, theInnerRadius$, theRingTexture$, theColour$, theLockRotation$, theUnlit$)
        PRINT #1, aRingsNode$
        '###End ring data'
        '########################'
        PRINT #1, "        ScaledVersion"
        PRINT #1, "        {"
        '########################'
        '###Fill in light data'
        sunlightColor$ = "1.0,1.0,1.0,1.0"
        sunlightIntensity$ = "0.45"
        scaledSunlightColor$ = "1.0,1.0,1.0,1.0"
        scaledSunlightIntensity$ = "0.45"
        IVASuncolor$ = "1.0, 0.977, 0.896, 1.0"
        IVASunIntensity$ = "0.34"
        sunLensFlareColor$ = "0.0, 0.0, 0.0, 1.0"
        ambientLightColor$ = "0,0,0,1"
        sunAU$ = "13599840256"
        luminosity$ = "0"
        givesOffLight$ = "False"
        aLightTemp$ = theLightTemplate$
        aLightNode$ = lightNode$(aLightTemp$, sunlightColor$, sunlightIntensity$, scaledSunlightColor$, scaledSunlightIntensity$, IVASuncolor$, IVASunIntensity$, sunLensFlareColor$, ambientLightColor$, sunAU$, luminosity$, givesOffLight$)
        PRINT #1, aLightNode$
        '###End light data'
        '########################'
        '########################'
        '###Fill in material data'
        emitColorZero$ = "0.0,0.0,0.0,1.0"
        emitColorOne$ = "0.0,0.0,0.0,1.0"
        sunspotColor$ = "0.0,0.0,0.0,1.0"
        rimColor$ = "0.0,0.0,0.0,1.0"
        rimPower$ = "1.5"
        rimBlend$ = "1.8"
        aMaterialTemp$ = theMaterialTemplate$
        aMaterialNode$ = materialNode$(aMaterialTemp$, emitColorZero$, emitColorOne$, sunspotColor$, rimColor$, rimPower$, rimBlend$)
        PRINT #1, aMaterialNode$
        '###End material data'
        '########################'
        '########################'
        '###Fill in coronas data'
        starColour$ = "BlackHoleCorona"
        aCoronaTemp$ = theCoronasTemplate$
        aCoronaNode$ = coronaNode$(aCoronaTemp$, starColour$)
        PRINT #1, aCoronaNode$
        '###End coronas data'
        '########################'
        PRINT #1, "        }"
        PRINT #1, "    }"

        IF ASTTOG$ = "y" THEN
            
            AST = INT(RND * 2)
            ASTNUMBER = 1
            IF AST > 0 THEN
                DO
                    PRINT #1, "@Kopernicus:AFTER[KOPERNICUS]"
                    PRINT #1, "{"
                    PRINT #1, "    Body"
                    PRINT #1, "    {"
                    PRINT #1, "        name = "; aStarName$; ASTNUMBER; ""
                    PRINT #1, ""
                    PRINT #1, "        Template"
                    PRINT #1, "        {"
                    PRINT #1, "            name = Gilly"
                    PRINT #1, ""
                    'PRINT #1, "            removePQSMods = PQSLandControl"
                    PRINT #1, "        }"
                    PRINT #1, "        Properties"
                    PRINT #1, "        {"
                    PRINT #1, "            description = When Jeb was originally shown a map of our galaxy he said 'Wow! Thats big! Dont suppose we get any rest stops out there do we?' This statement encouraged our scientists to look closer, And eventually this asteroid among many, Was discovered. Dont expect vending machines, And if you do find them... Dont expect candy. "
                    PRINT #1, ""
                    
                    PRINT #1, "            radius ="; INT(RND * 80000) + 5000
                    PRINT #1, ""
                    'PRINT #1, "            sphereOfInfluence = 117915"
                    PRINT #1, "        }"
                    PRINT #1, ""
                    PRINT #1, "        Orbit"
                    PRINT #1, "        {"
                    PRINT #1, "            referenceBody = "; aStarName$; ""
                    
                    PRINT #1, "            inclination ="; INT(RND * 360)
                    
                    PRINT #1, "            semiMajorAxis ="; INT(RND * 1000000000) + 1000000000
                    PRINT #1, "        }"
                    PRINT #1, "        PQS"
                    PRINT #1, "        {"
                    PRINT #1, "            Mods"
                    PRINT #1, "            {"
                    PRINT #1, "                VertexSimplexHeightAbsolute"
                    PRINT #1, "                {"
                    
                    PRINT #1, "                    seed ="; INT(RND * 100000)
                    PRINT #1, "                }"
                    PRINT #1, "                VertexHeightNoise"
                    PRINT #1, "                {"
                    'PRINT #1, "                    persistence = 0.5"
                    
                    PRINT #1, "                    seed ="; INT(RND * 100000)
                    PRINT #1, "                }"
                    PRINT #1, "            }"
                    PRINT #1, "        }"
                    PRINT #1, "    }"
                    PRINT #1, "}"
                    PRINT #1, ""
                    AST = AST - 1
                    ASTNUMBER = ASTNUMBER + 1
                    AOBJECTNUMBER = AOBJECTNUMBER + 1
                    IF AST = 0 THEN
                        GOTO 159
                    END IF
                LOOP

            159 END IF
        END IF


        BLACKHOLE = BLACKHOLE - 1
        SOBJECTNUMBER = SOBJECTNUMBER + 1
        IF BLACKHOLE = 0 THEN
            GOTO 66
        END IF
        BLACKHOLENUMBER = BLACKHOLENUMBER + 1
    LOOP
66 END IF



IF ROGUE > 0 THEN
    DO
        
        aStarName$ = theStarName$ '#Calls the function "theStarName"
        PRINT #1, "@Kopernicus"
        PRINT #1, "{"
        PRINT #1, "    Body"
        PRINT #1, "    {"
        PRINT #1, "         name = "; aStarName$
        '########################'
        '###Fill in orbit data'
        theMode$ = STR$(0)
        theColor$ = "1,1,0,1"
        aOrbitTemp$ = theOrbitTemplate$
        aOrbitNode$ = orbitNode$(aOrbitTemp$, GTYPE, theColor$, theMode$)
        PRINT #1, aOrbitNode$
        '###End property data'
        '########################'

        PRINT #1, "         Template"
        PRINT #1, "         {"

        
        PLANETTYPE = INT(RND * 13)
        SELECT CASE PLANETTYPE
            CASE 0
                PLANETTYPE$ = "Moho"
            CASE 1
                PLANETTYPE$ = "Eve"
            CASE 2
                PLANETTYPE$ = "Mun"
            CASE 3
                PLANETTYPE$ = "Minmus"
            CASE 4
                PLANETTYPE$ = "Duna"
            CASE 5
                PLANETTYPE$ = "Ike"
            CASE 6
                PLANETTYPE$ = "Dres"
            CASE 7
                PLANETTYPE$ = "Jool"
            CASE 8
                PLANETTYPE$ = "Laythe"
            CASE 9
                PLANETTYPE$ = "Vall"
            CASE 10
                PLANETTYPE$ = "Tylo"
            CASE 11
                PLANETTYPE$ = "Jool"
            CASE 12
                PLANETTYPE$ = "Jool"
            CASE 13
                PLANETTYPE$ = "Eeloo"
        END SELECT
        IF PLANETTYPE$ = "Moho" THEN
            PRINT #1, "             name = "; PLANETTYPE$
            PRINT #1, "         }"

            PRINT #1, "         Properties"
            PRINT #1, "         {"




            
            PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""
            PRINT #1, "            sphereOfInfluence = 50118820000"

            PRINT #1, "         }"
            
            RINGS = INT(RND * 3)
            IF RINGS = 0 THEN
                PRINT #1, "         Rings"
                PRINT #1, "         {"
                PRINT #1, "             Ring"
                PRINT #1, "             {"
                PRINT #1, "                 angle = 0"
                PRINT #1, "                 outerRadius = 3000"
                PRINT #1, "                 innerRadius = 2000"
                
                PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                PRINT #1, "                 color = 1.0,1,1,1.0"
                PRINT #1, "                 lockRotation = false"
                PRINT #1, "                 unlit = false"
                PRINT #1, "             }"
                PRINT #1, "          }"
            END IF
            PRINT #1, "    }"
            PRINT #1, "}"
        END IF
        IF PLANETTYPE$ = "Eve" THEN
            PRINT #1, "             name = "; PLANETTYPE$
            PRINT #1, "         }"

            PRINT #1, "         Properties"
            PRINT #1, "         {"




            
            PRINT #1, "            radius ="; INT(RND * 1500000) + 300000; ""
            PRINT #1, "            sphereOfInfluence = 50118820000"

            PRINT #1, "         }"
            
            RINGS = INT(RND * 3)
            IF RINGS = 0 THEN
                PRINT #1, "         Rings"
                PRINT #1, "         {"
                PRINT #1, "             Ring"
                PRINT #1, "             {"
                PRINT #1, "                 angle = 0"
                PRINT #1, "                 outerRadius = 3000"
                PRINT #1, "                 innerRadius = 2000"
                
                PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                PRINT #1, "                 color = 1.0,1,1,1.0"
                PRINT #1, "                 lockRotation = false"
                PRINT #1, "                 unlit = false"
                PRINT #1, "             }"
                PRINT #1, "          }"
            END IF
            PRINT #1, "    }"
            PRINT #1, "}"
        END IF
        IF PLANETTYPE$ = "Mun" THEN
            PRINT #1, "             name = "; PLANETTYPE$
            PRINT #1, "         }"

            PRINT #1, "         Properties"
            PRINT #1, "         {"




            
            PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""
            PRINT #1, "            sphereOfInfluence = 50118820000"

            PRINT #1, "         }"
            
            RINGS = INT(RND * 3)
            IF RINGS = 0 THEN
                PRINT #1, "         Rings"
                PRINT #1, "         {"
                PRINT #1, "             Ring"
                PRINT #1, "             {"
                PRINT #1, "                 angle = 0"
                PRINT #1, "                 outerRadius = 3000"
                PRINT #1, "                 innerRadius = 2000"
                
                PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                PRINT #1, "                 color = 1.0,1,1,1.0"
                PRINT #1, "                 lockRotation = false"
                PRINT #1, "                 unlit = false"
                PRINT #1, "             }"
                PRINT #1, "          }"
            END IF
            PRINT #1, "    }"
            PRINT #1, "}"
        END IF
        IF PLANETTYPE$ = "Minmus" THEN
            PRINT #1, "             name = "; PLANETTYPE$
            PRINT #1, "         }"

            PRINT #1, "         Properties"
            PRINT #1, "         {"




            
            PRINT #1, "                     radius ="; INT(RND * 120000) + 80000; ""
            PRINT #1, "            sphereOfInfluence = 50118820000"

            PRINT #1, "         }"
            
            RINGS = INT(RND * 3)
            IF RINGS = 0 THEN
                PRINT #1, "         Rings"
                PRINT #1, "         {"
                PRINT #1, "             Ring"
                PRINT #1, "             {"
                PRINT #1, "                 angle = 0"
                PRINT #1, "                 outerRadius = 3000"
                PRINT #1, "                 innerRadius = 2000"
                
                PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                PRINT #1, "                 color = 1.0,1,1,1.0"
                PRINT #1, "                 lockRotation = false"
                PRINT #1, "                 unlit = false"
                PRINT #1, "             }"
                PRINT #1, "          }"
            END IF
            PRINT #1, "    }"
            PRINT #1, "}"
        END IF
        IF PLANETTYPE$ = "Duna" THEN
            PRINT #1, "             name = "; PLANETTYPE$
            PRINT #1, "         }"

            PRINT #1, "         Properties"
            PRINT #1, "         {"




            
            PRINT #1, "            radius ="; INT(RND * 700000) + 270000; ""
            PRINT #1, "            sphereOfInfluence = 50118820000"

            PRINT #1, "         }"
            
            RINGS = INT(RND * 3)
            IF RINGS = 0 THEN
                PRINT #1, "         Rings"
                PRINT #1, "         {"
                PRINT #1, "             Ring"
                PRINT #1, "             {"
                PRINT #1, "                 angle = 0"
                PRINT #1, "                 outerRadius = 3000"
                PRINT #1, "                 innerRadius = 2000"
                
                PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                PRINT #1, "                 color = 1.0,1,1,1.0"
                PRINT #1, "                 lockRotation = false"
                PRINT #1, "                 unlit = false"
                PRINT #1, "             }"
                PRINT #1, "          }"
            END IF
            PRINT #1, "    }"
            PRINT #1, "}"
        END IF
        IF PLANETTYPE$ = "Ike" THEN
            PRINT #1, "             name = "; PLANETTYPE$
            PRINT #1, "         }"

            PRINT #1, "         Properties"
            PRINT #1, "         {"




            
            PRINT #1, "            radius ="; INT(RND * 250000) + 50000; ""
            PRINT #1, "            sphereOfInfluence = 50118820000"

            PRINT #1, "         }"
            
            RINGS = INT(RND * 3)
            IF RINGS = 0 THEN
                PRINT #1, "         Rings"
                PRINT #1, "         {"
                PRINT #1, "             Ring"
                PRINT #1, "             {"
                PRINT #1, "                 angle = 0"
                PRINT #1, "                 outerRadius = 3000"
                PRINT #1, "                 innerRadius = 2000"
                
                PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                PRINT #1, "                 color = 1.0,1,1,1.0"
                PRINT #1, "                 lockRotation = false"
                PRINT #1, "                 unlit = false"
                PRINT #1, "             }"
                PRINT #1, "          }"
            END IF
            PRINT #1, "    }"
            PRINT #1, "}"
        END IF
        IF PLANETTYPE$ = "Dres" THEN
            PRINT #1, "             name = "; PLANETTYPE$
            PRINT #1, "         }"

            PRINT #1, "         Properties"
            PRINT #1, "         {"




            
            PRINT #1, "            radius ="; INT(RND * 250000) + 50000; ""
            PRINT #1, "            sphereOfInfluence = 50118820000"

            PRINT #1, "         }"
            
            RINGS = INT(RND * 3)
            IF RINGS = 0 THEN
                PRINT #1, "         Rings"
                PRINT #1, "         {"
                PRINT #1, "             Ring"
                PRINT #1, "             {"
                PRINT #1, "                 angle = 0"
                PRINT #1, "                 outerRadius = 3000"
                PRINT #1, "                 innerRadius = 2000"
                
                PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                PRINT #1, "                 color = 1.0,1,1,1.0"
                PRINT #1, "                 lockRotation = false"
                PRINT #1, "                 unlit = false"
                PRINT #1, "             }"
                PRINT #1, "          }"
            END IF
            PRINT #1, "    }"
            PRINT #1, "}"
        END IF
        IF PLANETTYPE$ = "Laythe" THEN
            PRINT #1, "             name = "; PLANETTYPE$
            PRINT #1, "         }"

            PRINT #1, "         Properties"
            PRINT #1, "         {"




            
            PRINT #1, "            radius ="; INT(RND * 1000000) + 300000; ""
            PRINT #1, "            sphereOfInfluence = 50118820000"

            PRINT #1, "         }"
            
            RINGS = INT(RND * 3)
            IF RINGS = 0 THEN
                PRINT #1, "         Rings"
                PRINT #1, "         {"
                PRINT #1, "             Ring"
                PRINT #1, "             {"
                PRINT #1, "                 angle = 0"
                PRINT #1, "                 outerRadius = 3000"
                PRINT #1, "                 innerRadius = 2000"
                
                PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                PRINT #1, "                 color = 1.0,1,1,1.0"
                PRINT #1, "                 lockRotation = false"
                PRINT #1, "                 unlit = false"
                PRINT #1, "             }"
                PRINT #1, "          }"
            END IF
            PRINT #1, "    }"
            PRINT #1, "}"
        END IF
        IF PLANETTYPE$ = "Vall" THEN
            PRINT #1, "             name = "; PLANETTYPE$
            PRINT #1, "         }"

            PRINT #1, "         Properties"
            PRINT #1, "         {"




            
            PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""
            PRINT #1, "            sphereOfInfluence = 50118820000"

            PRINT #1, "         }"
            
            RINGS = INT(RND * 3)
            IF RINGS = 0 THEN
                PRINT #1, "         Rings"
                PRINT #1, "         {"
                PRINT #1, "             Ring"
                PRINT #1, "             {"
                PRINT #1, "                 angle = 0"
                PRINT #1, "                 outerRadius = 3000"
                PRINT #1, "                 innerRadius = 2000"
                
                PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                PRINT #1, "                 color = 1.0,1,1,1.0"
                PRINT #1, "                 lockRotation = false"
                PRINT #1, "                 unlit = false"
                PRINT #1, "             }"
                PRINT #1, "          }"
            END IF
            PRINT #1, "    }"
            PRINT #1, "}"
        END IF
        IF PLANETTYPE$ = "Tylo" THEN
            PRINT #1, "             name = "; PLANETTYPE$
            PRINT #1, "         }"

            PRINT #1, "         Properties"
            PRINT #1, "         {"




            
            PRINT #1, "            radius ="; INT(RND * 1500000) + 300000; ""
            PRINT #1, "            sphereOfInfluence = 50118820000"

            PRINT #1, "         }"
            
            RINGS = INT(RND * 3)
            IF RINGS = 0 THEN
                PRINT #1, "         Rings"
                PRINT #1, "         {"
                PRINT #1, "             Ring"
                PRINT #1, "             {"
                PRINT #1, "                 angle = 0"
                PRINT #1, "                 outerRadius = 3000"
                PRINT #1, "                 innerRadius = 2000"
                
                PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                PRINT #1, "                 color = 1.0,1,1,1.0"
                PRINT #1, "                 lockRotation = false"
                PRINT #1, "                 unlit = false"
                PRINT #1, "             }"
                PRINT #1, "          }"
            END IF
            PRINT #1, "    }"
            PRINT #1, "}"
        END IF
        IF PLANETTYPE$ = "Bop" THEN
            PRINT #1, "             name = "; PLANETTYPE$
            PRINT #1, "         }"

            PRINT #1, "         Properties"
            PRINT #1, "         {"




            
            PRINT #1, "            radius ="; INT(RND * 100000) + 70000; ""
            PRINT #1, "            sphereOfInfluence = 50118820000"

            PRINT #1, "         }"
            
            RINGS = INT(RND * 3)
            IF RINGS = 0 THEN
                PRINT #1, "         Rings"
                PRINT #1, "         {"
                PRINT #1, "             Ring"
                PRINT #1, "             {"
                PRINT #1, "                 angle = 0"
                PRINT #1, "                 outerRadius = 3000"
                PRINT #1, "                 innerRadius = 2000"
                
                PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                PRINT #1, "                 color = 1.0,1,1,1.0"
                PRINT #1, "                 lockRotation = false"
                PRINT #1, "                 unlit = false"
                PRINT #1, "             }"
                PRINT #1, "          }"
            END IF
            PRINT #1, "    }"
            PRINT #1, "}"
        END IF
        IF PLANETTYPE$ = "Pol" THEN
            PRINT #1, "             name = "; PLANETTYPE$
            PRINT #1, "         }"

            PRINT #1, "         Properties"
            PRINT #1, "         {"




            
            PRINT #1, "            radius ="; INT(RND * 100000) + 70000; ""
            PRINT #1, "            sphereOfInfluence = 50118820000"

            PRINT #1, "         }"
            
            RINGS = INT(RND * 3)
            IF RINGS = 0 THEN
                PRINT #1, "         Rings"
                PRINT #1, "         {"
                PRINT #1, "             Ring"
                PRINT #1, "             {"
                PRINT #1, "                 angle = 0"
                PRINT #1, "                 outerRadius = 3000"
                PRINT #1, "                 innerRadius = 2000"
                
                PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                PRINT #1, "                 color = 1.0,1,1,1.0"
                PRINT #1, "                 lockRotation = false"
                PRINT #1, "                 unlit = false"
                PRINT #1, "             }"
                PRINT #1, "          }"
            END IF
            PRINT #1, "    }"
            PRINT #1, "}"
        END IF
        IF PLANETTYPE$ = "Eeloo" THEN
            PRINT #1, "             name = "; PLANETTYPE$
            PRINT #1, "         }"

            PRINT #1, "         Properties"
            PRINT #1, "         {"




            
            PRINT #1, "            radius ="; INT(RND * 300000) + 70000; ""
            PRINT #1, "            sphereOfInfluence = 50118820000"

            PRINT #1, "         }"
            
            RINGS = INT(RND * 3)
            IF RINGS = 0 THEN
                PRINT #1, "         Rings"
                PRINT #1, "         {"
                PRINT #1, "             Ring"
                PRINT #1, "             {"
                PRINT #1, "                 angle = 0"
                PRINT #1, "                 outerRadius = 3000"
                PRINT #1, "                 innerRadius = 2000"
                
                PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                PRINT #1, "                 color = 1.0,1,1,1.0"
                PRINT #1, "                 lockRotation = false"
                PRINT #1, "                 unlit = false"
                PRINT #1, "             }"
                PRINT #1, "          }"
            END IF
            PRINT #1, "    }"
            PRINT #1, "}"
        END IF
        IF PLANETTYPE$ = "Jool" THEN
            PRINT #1, "             name = "; PLANETTYPE$
            PRINT #1, "         }"

            PRINT #1, "         ScaledVersion"
            PRINT #1, "         {"
            PRINT #1, "             Material"
            PRINT #1, "             {"
            
            PRINT #1, "                 texture = To_Boldly_Go/gastextures/-"; INT(RND * 16); ".jpg"
            PRINT #1, "             }"
            PRINT #1, "         }"
            PRINT #1, "         Properties"
            PRINT #1, "         {"




            
            PRINT #1, "            radius ="; INT(RND * 10000000) + 700000; ""
            PRINT #1, "            sphereOfInfluence = 50118820000"

            PRINT #1, "         }"
            
            RINGS = INT(RND * 1)
            IF RINGS = 0 THEN
                PRINT #1, "         Rings"
                PRINT #1, "         {"
                PRINT #1, "             Ring"
                PRINT #1, "             {"
                PRINT #1, "                 angle = 0"
                PRINT #1, "                 outerRadius = 3000"
                PRINT #1, "                 innerRadius = 2000"
                
                PRINT #1, "                 texture = To_Boldly_Go/ringtextures/-"; INT(RND * 3); "-.png"
                PRINT #1, "                 color = 1.0,1,1,1.0"
                PRINT #1, "                 lockRotation = false"
                PRINT #1, "                 unlit = false"
                PRINT #1, "             }"
                PRINT #1, "          }"
            END IF
            PRINT #1, "    }"
            PRINT #1, "}"
        END IF
        POBJECTNUMBER = POBJECTNUMBER + 1
        ROGUE = ROGUE - 1
        IF ROGUE = 0 THEN
            GOTO 80
        END IF
    LOOP
80 END IF

PRINT ""
PRINT ""; SOBJECTNUMBER; "Stars"
PRINT ""; POBJECTNUMBER; "Planets"
PRINT ""; MOBJECTNUMBER; "Moons"
PRINT ""; AOBJECTNUMBER; "Asteroids"
TOTAL = SOBJECTNUMBER + POBJECTNUMBER + MOBJECTNUMBER + AOBJECTNUMBER
PRINT ""; SOBJECTNUMBER + POBJECTNUMBER + MOBJECTNUMBER + AOBJECTNUMBER; " Total"
PRINT ""
INPUT "Are you satisfied with these results? (y/n):", AGAIN$

CLOSE #1
FILENAME$ = "Galaxygen_Info-" + GNAME$ + ".txt"
OPEN FILENAME$ FOR OUTPUT AS #1
PRINT #1, "  _______      ____        _     _ _          _____"
PRINT #1, " |__   __|    |  _ \      | |   | | |        / ____|"
PRINT #1, "    | | ___   | |_) | ___ | | __| | |_   _  | |  __  ___"
PRINT #1, "    | |/ _ \  |  _ < / _ \| |/ _` | | | | | | | |_ |/ _ \"
PRINT #1, "    | | (_) | | |_) | (_) | | (_| | | |_| | | |__| | (_) |"
PRINT #1, "    |_|\___/  |____/ \___/|_|\__,_|_|\__, |  \_____|\___/"
PRINT #1, "                                      __/ |"
PRINT #1, "                                     |___/"
PRINT #1, "*****"; GNAME$; "***** v0.2.6"
PRINT #1, "Creation Date: "; TIME$; " "; DATE$
PRINT #1, "Generation Mode: "; CUSTOM$
PRINT #1, "Seed:"; SEED
PRINT #1, "Galaxy Type:"; GTYPE
PRINT #1, "Galaxy Age:"; AGE
PRINT #1, "Cluster Number:"; CLUSTERNUM
PRINT #1, "Planets: "; PENABLE$
PRINT #1, "Asteroids: "; ASTTOG$
PRINT #1, "Red Dwarves:"; REDSTARNUMBER
PRINT #1, "Orange Dwarves:"; KSTARNUMBER
PRINT #1, "Yellow Dwarves:"; YELLOWSTARNUMBER
PRINT #1, "White Stars:"; WHITESTARNUMBER
PRINT #1, "Blue Giants:"; BLUESTARNUMBER
PRINT #1, "Brown Dwarves:"; BROWNSTARNUMBER
PRINT #1, "White Dwarves:"; DWARFSTARNUMBER
PRINT #1, "-----------------"
PRINT #1, SOBJECTNUMBER; "Stars"
PRINT #1, POBJECTNUMBER; "Planets"
PRINT #1, MOBJECTNUMBER; "Moons"
PRINT #1, AOBJECTNUMBER; "Asteroids"
PRINT #1, SOBJECTNUMBER + POBJECTNUMBER + MOBJECTNUMBER + AOBJECTNUMBER; " Total"
PRINT #1, "-----------------"
CLOSE #1
'COLOR 15
'PRINT ""
'PRINT "DONE! Remember to place this config file into a folder"
'PRINT "within /Gamedata labeled 'To_Boldly_Go'"

IF AGAIN$ = "n" THEN
    GOTO 888
END IF
SYSTEM

777 PRINT























_FONT _LOADFONT("font.ttf", 12, "MONOSPACE") 'select monospace font
_PRINTMODE _KEEPBACKGROUND

DIM Button(2) AS Button, Mouse(2) AS MouseInfo

VQB_Button_New Button(0), 15, 100, 100, 24, _RGB(0, 0, 0), _RGB(255, 255, 255), "Planets", 1
VQB_Button_New Button(1), 150, 100, 100, 24, _RGB(0, 0, 0), _RGB(255, 255, 255), "Asteroids", 1
VQB_Button_New Button(2), 350, 100, 100, 24, _RGB(0, 0, 0), _RGB(255, 255, 255), "Execute", 1

VQB_Button_Draw Button(0)
VQB_Button_Draw Button(1)
VQB_Button_Draw Button(2)

DIM SPONBUTTON AS LONG
SPONBUTTON = _LOADIMAGE("TOGLIGHTON.png")
_PUTIMAGE (11, 96), SPONBUTTON

DIM SAONBUTTON AS LONG
SAONBUTTON = _LOADIMAGE("ASTOGON.png")
_PUTIMAGE (146, 96), SAONBUTTON


DO
    _LIMIT 30
    VQB_Mouse_GetInfo Mouse(0)
    FOR I% = 0 TO 2
        IF VQB_Button_Click(Button(I%), Mouse(0)) THEN
            SELECT CASE I%
                CASE 0 '// Exit

                    IF PTOGGLE = 0 THEN
                        PTOGGLE = 1
                        DIM PONBUTTON AS LONG
                        PONBUTTON = _LOADIMAGE("TOGLIGHTON.png")
                        _PUTIMAGE (11, 96), PONBUTTON
                        '_SNDPLAYFILE "click.wav", .5
                        'PRINT "1"
                    ELSE
                        PTOGGLE = 0

                        DIM POFFBUTTON AS LONG
                        POFFBUTTON = _LOADIMAGE("TOGLIGHTOFF.png")
                        _PUTIMAGE (11, 96), POFFBUTTON
                        '_SNDPLAYFILE "click.wav", .5
                        'PRINT "0"
                    END IF
                    _DELAY 0.3
                CASE 1 '// another exit

                    IF ATOGGLE = 0 THEN
                        ATOGGLE = 1
                        DIM AONBUTTON AS LONG
                        AONBUTTON = _LOADIMAGE("ASTOGON.png")
                        _PUTIMAGE (146, 96), AONBUTTON
                        '_SNDPLAYFILE "click.wav", .5
                        'PRINT "1"
                    ELSE
                        ATOGGLE = 0

                        DIM AOFFBUTTON AS LONG
                        AOFFBUTTON = _LOADIMAGE("ASTOGOFF.png")
                        _PUTIMAGE (146, 96), AOFFBUTTON
                        '_SNDPLAYFILE "click.wav", .5
                        'PRINT "0"
                    END IF
                    _DELAY 0.3
                CASE 2
                    GOTO 778
            END SELECT
            '_SNDPLAYFILE "click.wav", .5
            EXIT FOR
        END IF
    NEXT
LOOP



TYPE Button
    Shape AS INTEGER '// 1=Square, 2=Ellipse
    X AS INTEGER '// Top left if square, Centre if ellipse
    Y AS INTEGER
    Width AS INTEGER '// Used as XRadius! if ellipse
    Height AS INTEGER '// Used as YRadius! if ellipse
    CLR AS LONG
    TextCLR AS LONG
    Text AS STRING * 24
    State AS INTEGER
END TYPE

TYPE MouseInfo
    X AS LONG
    Y AS LONG
    LMB AS INTEGER
    RMB AS INTEGER
END TYPE

SUB VQB_Frame (X%, Y%, Width%, Height%, CLR&)
OldCLR& = CLR&
LINE (X%, Y%)-(X% + Width%, Y% + Height%), CLR&, BF
FOR Border% = 0 TO 4
    IF CLR& > _RGB(0, 0, 0) THEN
        NewRed& = _RED(CLR&) - (6 * Border%)
        NewGreen& = _GREEN(CLR&) - (6 * Border%)
        NewBlue& = _BLUE(CLR&) - (6 * Border%)
        CLR& = _RGB(NewRed&, NewGreen&, NewBlue&)
    ELSE
        NewRed& = _RED(CLR&) + (6 * Border%)
        NewGreen& = _GREEN(CLR&) + (6 * Border%)
        NewBlue& = _BLUE(CLR&) + (6 * Border%)
        CLR& = _RGBA(NewRed&, NewGreen&, NewBlue&, 120)
    END IF
    LINE (X% - Border%, Y% - Border%)-(X% + Width% + Border%, Y% - Border%), CLR&, BF
    LINE (X% - Border%, Y% + Height% + Border%)-(X% + Width% + Border%, Y% + Height% + Border%), CLR&, BF
    LINE (X% - Border%, Y% - Border%)-(X% - Border%, Y% + Height% + Border%), CLR&, BF
    LINE (X% + Width% + Border%, Y% - Border%)-(X% + Width% + Border%, Y% + Height% + Border%), CLR&, BF
NEXT
CLR& = OldCLR&
END SUB


'// Buttons

SUB VQB_Button_New (Button AS Button, X%, Y%, Width%, Height%, CLR&, TextClr&, Text$, Shape%)
Button.X = X%
Button.Y = Y%
Button.Width = Width%
Button.Height = Height%
Button.CLR = CLR&
Button.TextCLR = TextClr&
Button.Text = Text$
Button.Shape = Shape%
END SUB


SUB VQB_Button_Draw (Button AS Button)
OldClr& = Button.CLR
IF Button.Shape = 1 THEN '// Square button
    VQB_Frame Button.X, Button.Y, Button.Width, Button.Height, Button.CLR
    COLOR Button.TextCLR, _RGBA(0, 0, 0, 0)
    _PRINTSTRING (Button.X + (Button.Width / 2) - (_PRINTWIDTH(RTRIM$(Button.Text)) / 2), Button.Y + (_FONTHEIGHT / 4)), Button.Text
ELSEIF Button.Shape = 2 THEN '// Ellipse button
    EllipseXS Button.X, Button.Y, Button.Width, Button.Height, 1, Button.CLR, _RGB(7, 7, 7)
    PAINT (Button.X, Button.Y), Button.CLR, Button.CLR
    EllipseXS Button.X, Button.Y, Button.Width, Button.Height, 12, Button.CLR, _RGB(7, 7, 7)
    COLOR Button.TextCLR, _RGBA(0, 0, 0, 0)
    _PRINTSTRING (Button.X - (_PRINTWIDTH(RTRIM$(Button.Text)) / 2), Button.Y - (_FONTHEIGHT / 2)), Button.Text
END IF
Button.CLR = OldClr&
END SUB


FUNCTION VQB_Button_Click (Button AS Button, Mouse AS MouseInfo)
IF Mouse.LMB THEN
    IF Button.Shape = 1 THEN
        IF Mouse.X >= Button.X AND Mouse.X <= Button.X + Button.Width THEN
            IF Mouse.Y >= Button.Y AND Mouse.Y <= Button.Y + Button.Height THEN
                VQB_Button_Click = -1
                IF Button.State THEN Button.State = 0 ELSE Button.State = -1
                EXIT FUNCTION
            END IF
        END IF
    ELSEIF Button.Shape = 2 THEN
        '// Ellipse detection adapted from a function created by DarthWho
        '// http://www.qb64.net/forum/index.php?topic=3154.15
        Xrad% = Button.Width + 12
        Yrad% = Button.Height + 12
        IF (Mouse.Y - Button.Y) ^ 2 + ((Mouse.X - Button.X) * Yrad% / Xrad%) ^ 2 <= Yrad% * Yrad% THEN
            VQB_Button_Click = -1
            IF Button.State THEN Button.State = 0 ELSE Button.State = -1
            EXIT FUNCTION
        END IF
    END IF
END IF
VQB_ButtonClick = 0
END FUNCTION


'// Graphics feature extracted from GDK_Draw 01
SUB EllipseXS (X%, Y%, XRadius!, YRadius!, Wide%, CLR&, ShadeClr&)
FOR j% = 0 TO Wide% - 1
    IF _RED(CLR&) <= 255 AND _RED(ShadeClr&) > 0 THEN newred& = _RED(CLR&) - _RED(ShadeClr&)
    IF _BLUE(CLR&) <= 255 AND _BLUE(ShadeClr&) > 0 THEN newblue& = _BLUE(CLR&) - _BLUE(ShadeClr&)
    IF _GREEN(CLR&) <= 255 AND _GREEN(ShadeClr&) > 0 THEN newgreen& = _GREEN(CLR&) - _GREEN(ShadeClr&)
    CLR& = _RGB(newred&, newgreen&, newblue&)
    IF XRadius! > YRadius! THEN Radius! = XRadius! ELSE Radius! = YRadius!
    MinStep! = 1 / (2 * 3.1415926535 * Radius!) '<<< Thanks to CodeGuy for this optimisation.
    FOR i = 0 TO 8 * ATN(1) STEP MinStep!
        pointx% = X% + (XRadius! * COS(i))
        pointy% = Y% + (YRadius! * SIN(i))
        PSET (pointx%, pointy%), CLR&
    NEXT
    XRadius! = XRadius! + 1
    YRadius! = YRadius! + 1
NEXT
END SUB


'// Mouse Input

SUB VQB_Mouse_GetInfo (Mouse AS MouseInfo)
DO
    Mouse.RMB = _MOUSEBUTTON(2)
    Mouse.LMB = _MOUSEBUTTON(1)
    Mouse.X = _MOUSEX
    Mouse.Y = _MOUSEY
LOOP WHILE _MOUSEINPUT
END SUB

FUNCTION theStarName$
'###########################
'#read in star name prefixes
REDIM arrayPrefixes$(0)
theFileName$ = "Data_Folder/TBG_Prefixes.txt"
IF _FILEEXISTS(theFileName$) THEN
    OPEN theFileName$ FOR INPUT AS #2
    filecount% = 0
    DO UNTIL EOF(2)
        LINE INPUT #2, file$ 'read entire text file line
        arrayPrefixes$(filecount%) = file$
        filecount% = filecount% + 1
        REDIM _PRESERVE arrayPrefixes$(filecount%)
    LOOP
    CLOSE #2
END IF
'###########################
'#read in star name suffixes
REDIM arraySuffixes$(0)
theFileName$ = "Data_Folder/TBG_Suffixes.txt"
IF _FILEEXISTS(theFileName$) THEN
    OPEN theFileName$ FOR INPUT AS #2
    filecount% = 0
    DO UNTIL EOF(2)
        LINE INPUT #2, file$ 'read entire text file line
        arraySuffixes$(filecount%) = file$
        filecount% = filecount% + 1
        REDIM _PRESERVE arraySuffixes$(filecount%)
    LOOP
    CLOSE #2
END IF
'########################################################
'# pick a random index from the prefix and suffix arrays'
'# the equiv in python would be:
'# PREFIX = random.choice(thePrefixes)
'# SUFFIX = random.choice(theSuffixes)
lengArrayPrefixes% = UBOUND(arrayPrefixes$)
lengArraySuffixes% = UBOUND(arraySuffixes$)
indexPrefixes% = INT(RND * lengArrayPrefixes%)
indexSuffixes% = INT(RND * lengArraySuffixes%)
PREFIX$ = arrayPrefixes$(indexPrefixes%)
SUFFIX$ = arraySuffixes$(indexSuffixes%)
'##############################################
'# combine the prefix and suffix to make a name
theStarName$ = PREFIX$ + SUFFIX$
END FUNCTION

FUNCTION fileAsString$ (fileName$)
'###########################
'#read in string template
theFileName$ = "Data_Folder/templates/" + fileName$
wholeTxt$ = ""
IF _FILEEXISTS(theFileName$) THEN
    OPEN theFileName$ FOR INPUT AS #3
    DO UNTIL EOF(3)
        LINE INPUT #3, fileLine$ 'read entire text file line
        wholeTxt$ = wholeTxt$ + fileLine$ + CHR$(10)
    LOOP
    CLOSE #3
END IF
fileAsString$ = wholeTxt$
END FUNCTION

'################################################
'########http://www.qb64.net/wiki/index.php/LEFT$
FUNCTION ReplaceStr$ (text$, old$, new$)
DO
    find = INSTR(start + 1, text$, old$) 'find location of a word in text
    IF find THEN
        count = count + 1
        first$ = LEFT$(text$, find - 1) 'text before word including spaces
        last$ = RIGHT$(text$, LEN(text$) - (find + LEN(old$) - 1)) 'text after word
        text$ = first$ + new$ + last$
    END IF
    start = find
LOOP WHILE find
'Replace = count 'function returns the number of replaced words. Comment out in SUB
'Replace = text$
ReplaceStr$ = text$
END FUNCTION

FUNCTION propertyNode$ (aTemplate$, theDescription$, theRadius$, theSphereOfInfluence$, theGeeASL$)
'#####STH 2017-0124. QBasic doesn't have string formatting like python.
'#####Replicated that function with string replacement function.
aTemplate$ = ReplaceStr(aTemplate$, "%(theDescription)s", theDescription$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theRadius)s", theRadius$)
'###########################'
'##Uncomment geeASL property'
IF theGeeALS$ <> "" THEN
    aTemplate$ = ReplaceStr(aTemplate$, "//geeASL", "geeASL")
    aTemplate$ = ReplaceStr(aTemplate$, "%(theGeeASL)s", theGeeASL$)
END IF
'###########################'
aTemplate$ = ReplaceStr(aTemplate$, "%(theSphereOfInfluence)s", theSphereOfInfluence$)
propertyNode$ = aTemplate$
END FUNCTION

FUNCTION orbitNode$ (aTemplate$, GTYPE, theColor$, theMode$)
IF (GTYPE = 0 OR GTYPE = 1) THEN
    theReferenceBody$ = "Sun"
    IF GTYPE = 0 THEN theInclination$ = STR$(INT(RND * 360))
    'if GType = 1 then theInclination$ = str$(INT(RND * 50) - 25)
    '###2017-0202 STH: adjusted the inclination of stars in a disc galaxy to be more in plane'
    IF GTYPE = 1 THEN theInclination$ = STR$(INT(RND * 25) + 1)
    theSemiMajorAxis$ = STR$(INT(RND * 1D+16) + 100000000000000#)
ELSE
    theReferenceBody$ = STR$(INT(RND * CLUSTERNUM))
    theInclination$ = STR$(INT(RND * 360))
    theSemiMajorAxis$ = STR$(INT(RND * 10000000000000) + 10000000000)
END IF
theArgumentOfPeriapsis$ = STR$(INT(RND * 1000))
theMeanAnomalyAtEpoch$ = STR$(0)
theEpoch$ = STR$(INT(RND * 360)) 'STR$(0)
'#####STH 2017-0124. QBasic doesn't have string formatting like python.
'#####Replicated that function with string replacement function.
aTemplate$ = ReplaceStr(aTemplate$, "%(theReferenceBody)s", theReferenceBody$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theColor)s", theColor$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theMode)s", theMode$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theInclination)s", theInclination$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theSemiMajorAxis)s", theSemiMajorAxis$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theArgumentOfPeriapsis)s", theArgumentOfPeriapsis$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theMeanAnomalyAtEpoch)s", theMeanAnomalyAtEpoch$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theEpoch)s", theEpoch$)
orbitNode$ = aTemplate$
END FUNCTION

FUNCTION lightNode$ (aTemplate$, sunlightColor$, sunlightIntensity$, scaledSunlightColor$, scaledSunlightIntensity$, IVASuncolor$, IVASunIntensity$, sunLensFlareColor$, ambientLightColor$, sunAU$, luminosity$, givesOffLight$)
'#####STH 2017-0124. QBasic doesn't have string formatting like python.
'#####Replicated that function with string replacement function.
aTemplate$ = ReplaceStr(aTemplate$, "%(theSunlightColor)s", sunlightColor$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theSunlightIntensity)s", sunlightIntensity$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theScaledSunlightColor)s", scaledSunlightColor$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theScaledSunlightIntensity)s", scaledSunlightIntensity$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theIVASuncolor)s", IVASuncolor$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theIVASunIntensity)s", IVASunIntensity$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theSunLensFlareColor)s", sunLensFlareColor$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theAmbientLightColor)s", ambientLightColor$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theSunAU)s", sunAU$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theLuminosity)s", luminosity$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theGivesOffLight)s", givesOffLight$)
lightNode$ = aTemplate$
END FUNCTION

FUNCTION materialNode$ (aTemplate$, emitColorZero$, emitColorOne$, sunspotColor$, rimColor$, rimPower$, rimBlend$)
'#####STH 2017-0124. QBasic doesn't have string formatting like python.
'#####Replicated that function with string replacement function.
aTemplate$ = ReplaceStr(aTemplate$, "%(theEmitColor0)s", emitColorZero$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theEmitColor1)s", emitColorOne$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theSunspotColor)s", sunspotColor$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theRimColor)s", rimColor$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theRimPower)s", rimPower$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theRimBlend)s", rimBlend$)
materialNode$ = aTemplate$
END FUNCTION

FUNCTION coronaNode$ (aTemplate$, starColour$)
'#####STH 2017-0124. QBasic doesn't have string formatting like python.
'#####Replicated that function with string replacement function.
aTemplate$ = ReplaceStr(aTemplate$, "%(theTexture)s", starColour$)
coronaNode$ = aTemplate$
END FUNCTION

FUNCTION ringNode$ (aTemplate$, theAngle$, theOuterRadius$, theInnerRadius$, theRingTexture$, theColour$, theLockRotation$, theUnlit$)
'#####STH 2017-0124. QBasic doesn't have string formatting like python.
'#####Replicated that function with string replacement function.
aTemplate$ = ReplaceStr(aTemplate$, "%(theAngle)s", theAngle$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theOuterRadius)s", theOuterRadius$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theInnerRadius)s", theInnerRadius$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theRingTexture)s", theRingTexture$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theColour)s", theColour$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theLockRotation)s", theLockRotation$)
aTemplate$ = ReplaceStr(aTemplate$, "%(theUnlit)s", theUnlit$)
ringNode$ = aTemplate$
END FUNCTION