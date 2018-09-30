# SUB makeAStar (star_MassKG, star_Name$, star_Description$):
#     #consder moving this to an imported file. STH 2017-0403
#     SHARED star_RadiusKSP
#     SHARED star_SOI
#     SHARED star_MassKSP
#     SHARED star_HillSphereRadius
#     SHARED star_FrostLineKSP
#     SHARED star_semimajorAxis
#     star_MassKSP = sol2Kerbol_kg(star_MassKG)
#     star_MassSolar = kg2solarMass(star_MassKG)
#     star_RadiusSolar = solarRadiusFromSolarMass(star_MassSolar)
#     star_RadiusKm = solarRadius2km(star_RadiusSolar)
#     star_RadiusKSP = sol2Kerbol_km(star_RadiusKm * 1000) #return m, so multiply by 1000 to get km
#     star_Lum = luminosityFromSolarMass(star_MassSolar)
#     star_AbsMag = absMagFromLuminosity(star_Lum)
#     #####################################################'
#     #Calculate the apparent magnitude of the star
#     starY1 = pol2cartY(KerbolDistanceToCore, CoreArgPeriapsis)
#     starX1 = pol2cartX(KerbolDistanceToCore, CoreArgPeriapsis)
#     starY2 = pol2cartY(star_semimajorAxis, theArgumentOfPeriapsis)
#     starX2 = pol2cartX(star_semimajorAxis, theArgumentOfPeriapsis)
#     star_distToKerbol = theStarDistance(starX1,starX2,starY1,starY2) #in meters
#     #####TO CALCULATE APPARENT MAGNITUDE
#     star_distToKerbolRLkm = kerbinKM2realKM(star_distToKerbol/1000) #in rl km
#     star_distToKerbolParsec = realKM2Parsec(star_distToKerbolRLkm)
#     ##########
#     #unit test for Kerbol to Kerbin
#     #star_AbsMag = 4.7388854 #Kerbol absolute magnitude
#     #star_distToKerbolParsec = 0.000005
#     ##########
#     #qb64 doesn't have a log10 function
#     theLogTen# = log(star_distToKerbolParsec/10)/log(10.#)
#     star_ApparentMag = (5*theLogTen#)+star_AbsMag
#     #END Calculate the apparent magnitude of the star
#     #####################################################'
#     star_FrostLineAU = solFrostLine(star_Lum) #return in AU'
#     star_FrostLineKm = AU2km(star_FrostLineAU)
#     star_FrostLineKSP = realKM2kerbinKM(star_FrostLineKm)
#     star_TempK = solarTemp(star_Lum, star_RadiusSolar)
#     temp2RGB (star_TempK) #I would rather get the colour back as a list, but I guess qbasic doesn't have lists? #STH 2017-0216'
#     theR = REDgb / 255.0
#     theG = rGREENb / 255.0
#     theB = rgBLUE / 255.0
#     #===convert to hex and prefix with zero if needed'
#     hexR$ = HEX$(REDgb)
#     hexG$ = HEX$(rGREENb)
#     hexB$ = HEX$(rgBLUE)
#     IF LEN(hexR$) = 1 THEN hexR$ = "0" + hexR$
#     IF LEN(hexG$) = 1 THEN hexG$ = "0" + hexG$
#     IF LEN(hexB$) = 1 THEN hexB$ = "0" + hexB$
#     #======='
#     star_HTMLColour$ = hexR$ + hexG$ + hexB$
#     star_Circumference = starCircumference(star_RadiusKSP) #use KSP size
#     star_SurfaceArea = starSurfaceArea(star_RadiusKSP) #use KSP size
#     star_Volume = starVolume(star_RadiusKSP) #use KSP size
#     star_Density = starDensity(star_MassKSP, star_RadiusKSP / 1000.0) #use KSP size
#     star_stdGravitationalParameter = stdGravitationalParameter(star_MassKSP) #use KSP size
#     star_surfaceGravity = surfaceGravity(star_MassKSP, star_RadiusKSP) #use KSP size. radius should be in km
#     star_escapeVelocity = escapeVelocity(star_MassKSP, star_RadiusKSP) #use KSP size. radius should be in km
#     star_RotationalPeriod = 432000.00 ##20 days in hours. Kerbol. This needs to be more random. Younger stars spin faster. #could do another normalized curve for rotation speeds
#     star_siderealRotationalVel = siderealRotationalVel(star_RadiusKSP, star_RotationalPeriod) #m/s
#     star_theSynchronousOrbit = synchronousOrbit(star_RadiusKSP, star_MassKSP, star_RotationalPeriod) / 1000 #km
#     #the Roche Limit of the black hole will be the minimum distance an objct can orbit it
#     blackHole_RocheLimit = rocheLimit(blackHole_MassKSP, star_MassKSP, blackHole_RadiusKSP, star_RadiusKSP)
#     #lower limit in picking the semimajor axis has to put the star radius outside the Roche limit
#     #add a million to put a bit more distance in
#     #Milky Way has a radius around 6.62251e+17km
#     #KSP galaxy radius would be 6.62251e+17km/2.6594=6.62251e+17
#     'star_semimajorAxis = random.randint(int(blackHole_RocheLimit+star_RadiusKSP+1e6), 6.62251e17)
#     star_orbitMin = INT(blackHole_RocheLimit + star_RadiusKSP + 1E6)
#     #star_orbitMax = 1E16 '6.62251E17
#     star_orbitMax = galaxy_RadiusKSP
#     star_semimajorAxis = star_orbitMin + (RND(1) * (star_orbitMax - star_orbitMin))
#     ###if Kerbol is an analog of Sol, it is ~26kly from the galactic center
#     ###1ly = 9.461e+12km
#     ###therefore 26*9.461e12km = 2.45986e14km from center.
#     ###stellar distances seem 10.95x smaller in KSP
#     'star_semimajorAxis = 2.25e16 #in m
#     star_HillSphereRadius = hillSphere(blackHole_MassKSP, star_MassKSP, 0, star_semimajorAxis)
#     star_SOI = kspSOI(blackHole_MassKSP, star_MassKSP, star_semimajorAxis)
#     ###END star characteristic calculation
#     ##############################


#     ########################'
#     ###Fill in property data'
#     aPropertiesTemplate$ = thePropertiesTemplate$
#     aPropertiesNode$ = propertyNode$(aPropertiesTemplate$, star_Description$, STR$(star_RadiusKSP), STR$(star_MassKSP), STR$(star_stdGravitationalParameter), STR$(star_surfaceGravity), "True", STR$(star_RotationalPeriod), "", "", "", STR$(star_SOI))
#     'PRINT #1, aPropertiesNode$
#     ###End property data'
#     ########################'


#     ########################'
#     ###Fill in orbit data'
#     IF (GTYPE = 0 OR GTYPE = 1) THEN
#         theReferenceBody$ = "Core"
#         IF GTYPE = 0 THEN theInclination$ = STR$(INT(RND * 360))
#         IF GTYPE = 1 THEN theInclination$ = STR$(INT(RND * 25) + 1)
#         theSemiMajorAxis$ = STR$(star_semimajorAxis)
#     END IF
#     IF (GTYPE = 2) THEN
#         theReferenceBody$ = STR$(INT(RND * CLUSTERNUM))
#         theInclination$ = STR$(INT(RND * 360))
#         theSemiMajorAxis$ = STR$(star_semimajorAxis)
#     END IF
#     theArgumentOfPeriapsis = INT(RND * 360)
#     theMeanAnomalyAtEpoch$ = STR$(0)
#     theEpoch$ = STR$(0)
#     theMode$ = "0" 'STR$(0)
#     theColour$ = STR$(theR) + "," + STR$(theG) + "," + STR$(theB) + ",1.0"
#     aOrbitTemp$ = theOrbitTemplate$
#     #FUNCTION orbitNode$ (aTemplate$, theReferenceBody$, theColour$, theMode$, theInclination$, theEccentricity$, theSemiMajorAxis$, theLongitudeOfAscendingNode$, STR$(theArgumentOfPeriapsis), theMeanAnomalyAtEpoch$, theEpoch$)
#     aOrbitNode$ = orbitNode$(aOrbitTemp$, theReferenceBody$, theColour$, theMode$, theInclination$, theEccentricity$, theSemiMajorAxis$, theLongitudeOfAscendingNode$, str$(theArgumentOfPeriapsis), theMeanAnomalyAtEpoch$, theEpoch$)
#     ###End orbit data'
#     ########################'


#     ########################'
#     ###Fill in light data'
#     sunlightColor$ = STR$(theR) + "," + STR$(theG) + "," + STR$(theB) + ",1.0"
#     sunlightIntensity$ = "0.50"
#     scaledSunlightColor$ = STR$(theR) + "," + STR$(theG) + "," + STR$(theB) + ",1.0"
#     scaledSunlightIntensity$ = "0.30"
#     IVASuncolor$ = STR$(theR) + "," + STR$(theG) + "," + STR$(theB) + ",1.0"
#     IVASunIntensity$ = "1.0"
#     'sunLensFlareColor$ = "0.3,0,0,1.0"
#     #adjust some values to cover over the default yellow'
#     IF theB >= 0.9 THEN
#         theRFlare = theR / 2
#         sunLensFlareColor$ = STR$(theRFlare) + "," + STR$(theG) + "," + STR$(theB) + ",1.0"
#     END IF
#     IF NOT (theB >= 0.9) THEN
#         sunLensFlareColor$ = STR$(theR) + "," + STR$(theG) + "," + STR$(theB) + ",1.0"
#     END IF
#     ambientLightColor$ = "0,0,0,1"
#     'New star radius/Kerbol radius
#     sunAUMultiplier = (star_RadiusKSP/261600000.0)
#     # 13599840256m = Kerbin SMA
#     sunAU$ = str$(sunAUMultiplier*13599840256)
#     luminosity$ = str$(star_Lum*1367) #just multiply the star's solar luminosity by solar constant for earth (1367)
#     givesOffLight$ = "True"
#     #############################################################################
#     #new routine to alter the apparent magnitude of stars in the Kerbin night sky
#     #skyBrightness = e^(-3.897121 - 0.1868262*apparentMagnitude) where e is 2.718282
#     #0.005 is ~ the lowest value to be seen in Kerbin's night sky
#     #3.0 is ~ the size of Kerbol in the sky
#     skyBrightness = 2.718282^(-3.897121 - 0.1868262*star_ApparentMag)
#     if skyBrightness <0.005 then
#         skyBrightness = 0.0045
#     end if 
#     #############################################################################
#     aLightTemp$ = theLightTemplate$
#     aLightNode$ = lightNode$(aLightTemp$, sunlightColor$, sunlightIntensity$, scaledSunlightColor$, scaledSunlightIntensity$, IVASuncolor$, IVASunIntensity$, sunLensFlareColor$, ambientLightColor$, sunAU$, luminosity$, givesOffLight$, str$(skyBrightness))
#     ###End light data'
#     ########################'


#     ########################'
#     ###Fill in material data'
#     'emitColorZero$ = "0.6,0.3,0.0,1.0"
#     emitColorZero$ = STR$(theR) + "," + STR$(theG) + "," + STR$(theB) + ",1.0"
#     'emitColorOne$ = "0.9,0.1,0.0,1.0"
#     emitColorOne$ = STR$(theR * 0.4) + "," + STR$(theG * 0.4) + "," + STR$(theB * 0.4) + ",1.0"
#     'sunspotColor$ = "1.0,0,0,1.0"
#     sunspotColor$ = "0.23,0.23,0.23,1.0"
#     'rimColor$ = "0.68,0.05,0.05,1.0"
#     rimColor$ = STR$(theR) + "," + STR$(theG) + "," + STR$(theB) + ",1.0"
#     rimPower$ = "1"
#     rimBlend$ = "1"
#     aMaterialTemp$ = theMaterialTemplate$
#     aMaterialNode$ = materialNode$(aMaterialTemp$, emitColorZero$, emitColorOne$, sunspotColor$, rimColor$, rimPower$, rimBlend$)
#     ###End material data'
#     ########################'


#     ########################'
#     ###Fill in coronas data'
#     #https://en.wikipedia.org/wiki/Stellar_classification
#     # ELSE statements don't seem to work in included code
#     IF (star_MassSolar >= 16) THEN
#         starColour$ = "Blue"
#     END IF
#     IF (star_MassSolar < 16 AND star_MassSolar >= 2.1) THEN
#         starColour$ = "Blue"
#     END IF
#     IF (star_MassSolar < 2.1 AND star_MassSolar >= 1.4) THEN
#         starColour$ = "White"
#     END IF
#     IF (star_MassSolar < 1.4 AND star_MassSolar >= 1.04) THEN
#         starColour$ = "Yellow"
#     END IF
#     IF (star_MassSolar < 1.04 AND star_MassSolar >= 0.8) THEN
#         starColour$ = "Orange"
#     END IF
#     IF (star_MassSolar < 0.8 AND star_MassSolar >= 0.45) THEN
#         starColour$ = "Red"
#     END IF
#     IF (star_MassSolar < 0.45 AND star_MassSolar >= 0.08) THEN
#         starColour$ = "Brown"
#     END IF
#     IF (star_MassSolar < 0.08) THEN
#         starColour$ = "BlackHole"
#     END IF

#     aCoronaTemp$ = theCoronasTemplate$
#     aCoronaNode$ = coronaNode$(aCoronaTemp$, starColour$)
#     ###End coronas data'
#     ########################'


#     aStarTemp$ = theStarTmp$
#     'FUNCTION starTempSubstitution$ (aTemplate$, aName$, aPropertiesNode$, aOrbitNode$, aRingNode$, aLightNode$, aMaterialNode$, aCoronaNode$, aSolarPowerCurve$)
#     aStarTmp$ = starTempSubstitution$(aStarTemp$, star_Name$, aPropertiesNode$, aOrbitNode$, "", aLightNode$, aMaterialNode$, aCoronaNode$, "")
#     PRINT #1, aStarTmp$


#     ########################
#     ###Generate file for ResearchBodies
#     normalCutoff = 7.0
#     mediumCutoff = 5.5
#     hardCutoff = 4.5
#     if (star_ApparentMag >=normalCutoff) then
#         theIgnoreLevel$ = "true false false false"
#     end if
#     if (star_ApparentMag <normalCutoff AND star_ApparentMag >=mediumCutoff) then
#         theIgnoreLevel$ = "true true false false"
#     end if
#     if (star_ApparentMag <mediumCutoff AND star_ApparentMag >=hardCutoff) then
#         theIgnoreLevel$ = "true true true false"
#     end if
#     if (star_ApparentMag <hardCutoff) then
#         theIgnoreLevel$ = "true true true true"
#     end if

#     #Maybe make the discovery text more like the wiki entries?
#     #STH 2018-0704
#     localizationText$ = localizationText$+ "        #autoLOC_RBodies_discovery_"+star_Name$+" = "+star_Name$ + ": Approximately" + str$(star_distToKerbol/1e9) +" Gm from Kerbol. Apparent magnitude of"+str$(star_ApparentMag)+". "+ star_Description$ +chr$(10)
#     discoveryText$ = discoveryText$+"        #autoLOC_RBodies_discovery_"+star_Name$+chr$(10)
#     ignoreLevels$ = ignoreLevels$ + "        "+star_Name$ +" = "+theIgnoreLevel$+chr$(10)


#     ########################
#     ###Fill in the wiki data
#     aWikiTemplate$ = theWikiTemplate$
#     aWikiTemplate$ = wikiEntry$(aWikiTemplate$, star_HTMLColour$, star_Name$, star_RadiusKSP, star_Circumference, star_SurfaceArea, star_MassKSP, star_stdGravitationalParameter, star_Density, star_surfaceGravity, star_escapeVelocity, star_RotationalPeriod, star_siderealRotationalVel, star_theSynchronousOrbit, star_SOI, star_FrostLineKSP*1000, star_TempK, star_Lum, star_AbsMag, star_semimajorAxis, star_distToKerbol, star_ApparentMag)
#     PRINT #10, aWikiTemplate$
# END SUB