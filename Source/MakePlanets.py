
# SUB MakePlanets (star_Name$,star_MassKSP,star_RadiusKSP,parentInclination,Max_num_planets,planet_distanceMax,star_FrostLineM):
# 	# Planet Gen Start
# 	#Note that star_FrostLineM is in meters
# 	maxPlanets = INT(RND * Max_num_planets) #how many planets in this system? Max of 5
# 	'maxPlanets = 10
# 	IF maxPlanets > 0 THEN
# 		planetNumb = 1		
# 		theSemiMajorAxis = 0
# 		FOR aPlanet = 1 TO maxPlanets
# 			########################'
# 			#Pick a random planet template from what is read in'
# 			keyIndex = 1 + INT(RND * (UBOUND(planetKey$))) 'want the range to be from 1 to end. Index 0 is the header
# 			PLANETTYPE$ = planetKey$(keyIndex)
# 			PLANETDESC$ = thePlanetDesc$(keyIndex)
# 			PLANETRADIUS = thePlanetRadius(keyIndex)
# 			PLANETMASS = thePlanetMass(keyIndex)
# 			PLANETSTOCK$ = thePlanetStock$(keyIndex)
# 			PLANETSOI = thePlanetSOI(keyIndex) 'really, this should be calculated from mass'
# 			########################'
# 			###Fill in basic body data'
# 			IF PLANETSTOCK$ = "TRUE" THEN
# 				aBodyNode$ = "Body"+chr$(13)
# 				templateNode$ = "Template"+chr$(13)+"        {"+chr$(13)+"            name = "+ PLANETTYPE$+chr$(13)+"        }"
# 			END IF
# 			# ELSE statements don't seem to work in included code
# 			IF NOT (PLANETSTOCK$ = "TRUE") THEN
# 				aBodyNode$ = "+Body[" + PLANETTYPE$ + "]"+chr$(13)
# 				templateNode$ = ""
# 			END IF
# 			########################'
# 			###Planet name
# 			#2017-0201 STH This could be turned into a CSV file of roman numerals read into an array
# 			IF planetNumb = 1 THEN PNM$ = "I"
# 			IF planetNumb = 2 THEN PNM$ = "II"
# 			IF planetNumb = 3 THEN PNM$ = "III"
# 			IF planetNumb = 4 THEN PNM$ = "IV"
# 			IF planetNumb = 5 THEN PNM$ = "V"
# 			IF planetNumb = 6 THEN PNM$ = "VI"
# 			IF planetNumb = 7 THEN PNM$ = "VII"
# 			IF planetNumb = 8 THEN PNM$ = "VIII"
# 			IF planetNumb = 9 THEN PNM$ = "IX"
# 			IF planetNumb = 10 THEN PNM$ = "X"
# 			thePlanetName$ = star_Name$ +" "+ PNM$
# 			########################'
# 			###Fill in orbit data'
# 			theReferenceBody$ = star_Name$
# 			theColour$ = ""
# 			theMode$ = ""
# 			#the inclination of the planet should be close to the plane of the parent star
# 			#https://en.wikipedia.org/wiki/Orbital_inclination
# 			tempVar=int(rnd*0.5)
# 			theInclination$=str$(int(parentInclination+tempVar))
# 			#allow rare planets to have orbits that deviate a lot from the orbital planet'
# 			if RND>0.9 then
# 				tempVar=int(rnd*45.0)
# 				theInclination$=str$(parentInclination+tempVar)
# 			end if
# 			theEccentricity$ = ""
# 			#Calculate the Roche Limit
# 			#imported things in QBasic don't like else statements
# 			if (str$(PLANETMASS)="" OR str$(PLANETRADIUS)="") then
# 				planet_distanceMin = simpleRocheLimit(star_Mass)
# 			end if
# 			if NOT(str$(PLANETMASS)="" OR str$(PLANETRADIUS)="") then
# 				planet_distanceMin = rocheLimit(star_MassKSP, PLANETMASS, star_RadiusKSP, PLANETRADIUS)
# 			end if
# 			IF theSemiMajorAxis = 0 then
# 				#let the first planet fall somewhere between the roche limit and the frostline'
# 				theSemiMajorAxis = planet_distanceMin + (RND(1) * (star_FrostLineM- planet_distanceMin))
# 			END IF 	
# 			IF NOT(theSemiMajorAxis = 0) then
# 				theSemiMajorAxis = theSemiMajorAxis+(theSemiMajorAxis * 1.5) 'should be a value between 1.4 and 2.0
# 			END IF 
# 			#The planet's semimajoraxis should not be larger than the star's SOI
# 			# 'star_RadiusKSP and star_SOI are shared variables
# 			'theSemiMajorAxis = star_RadiusKSP + (RND(1) * (star_SOI - star_RadiusKSP))
# 			'theSemiMajorAxis = INT(RND * 10000000000) + 10000000
# 			theLongitudeOfAscendingNode$ = "0"
# 			theArgumentOfPeriapsis$ = STR$(INT(RND * 1000))
# 			theMeanAnomalyAtEpoch$ = STR$(0)
# 			theEpoch$ = STR$(0)
# 			########################'
# 			###Fill in property data'
# 			#moved the property data code to take advantage of orbital values in description'
# 			if PLANETDESC$ = "" then
# 				PLANETDESC$ = "Semimajor axis:\\nn "+str$(theSemiMajorAxis)+"m\\nn \\nnArg. of periapsis: "+theArgumentOfPeriapsis$+"°\\nn \\nnInclination: "+theInclination$+"°\\nn \\nnTidal locked: unknown\\nn \\nnHabitable zone: unknown"
# 			end if
# 			aPropertiesTemplate$ = thePropertiesTemplate$
# 			aPropertiesNode$ = propertyNode$(aPropertiesTemplate$, PLANETDESC$, STR$(PLANETRADIUS), STR$(PLANETMASS), "", "", "", "", "", "", "", STR$(PLANETSOI))
# 			########################'
# 			aOrbitTemp$ = theOrbitTemplate$
# 			aOrbitNode$ = orbitNode$(aOrbitTemp$, theReferenceBody$, theColour$, theMode$, theInclination$, theEccentricity$, STR$(theSemiMajorAxis), theLongitudeOfAscendingNode$, theArgumentOfPeriapsis$, theMeanAnomalyAtEpoch$, theEpoch$)		
# 			########################'
# 			###10% chance of having a ring
# 			RINGS = INT(RND * 10)
# 			'RINGS = 0
# 			IF RINGS = 0 THEN
# 				#theAngle$ = "0"
# 				theAngle$ = theInclination$
# 				theOuterRadius$ = "3000"
# 				theInnerRadius$ = "2000"
# 				theRingTexture$ = ltrim$(str$(INT(RND * 3) + 1))
# 				theColour$ = "1.0,0.1,0.1,1.0"
# 				theLockRotation$ = "false"
# 				theUnlit$ = "false"
# 				aRingsTemp$ = theRingsTemplate$
# 				aRingNode$ = ringNode$(aRingsTemp$, theAngle$, theOuterRadius$, theInnerRadius$, theRingTexture$, theColour$, theLockRotation$, theUnlit$)
# 			END IF
# 			########################'
# 			#Give all planets oceans just as a test. STH 2018-0531
# 			#Eventually there has to be a check to see if the body is in the habitable zone of the star.

# 			'if PLANETTYPE$ <> "Jool" then
# 			''	#Planets that use Jool as a template can't have oceans
# 			''	#This could be tricky to work out for planet packs
# 			''	aOceanTemp$ = theOceanTemplate$
# 			''	#call to the oceanNode string replacement routine will go here. STH 2018-0531
# 			''	aOceanNode$ = aOceanTemp$
# 			'end if



# 			########################'
# 			aPlanetTemp$ = thePlanetTemplate$
# 			'FUNCTION planetTempSubstitution$ (aTemplate$, aBodyNode$, aName$, aTemplateNode$, aPropertiesNode$, aOrbitNode$, aScaledVerionNode$, aRingNode$, aAtmosphereNode$, aPQSNode$, aOceanNode$)
# 			#Pieces are in place for scaledVersion, atmosphere, PQS, and ocean nodes'
# 			aPlanetTemp$ = planetTempSubstitution$ (aPlanetTemp$, aBodyNode$, thePlanetName$, templateNode$, aPropertiesNode$, aOrbitNode$, "", aRingNode$, "", "", aOceanNode$)
# 			#Clear out the nodes so they are not populated next iteration
# 			#Failing to do so led to oddities with ocean and ring nodes appearing everywhere
# 			aBodyNode$ = ""
# 			templateNode$ = ""
# 			aPropertiesNode$ = ""
# 			aOrbitNode$ = ""
# 			aRingNode$ = ""
# 			aOceanNode$ = ""
# 			print #1, aPlanetTemp$

# 			########################
# 			#add planet to the researchBody file
# 			ignoreLevels$ = ignoreLevels$ + "        "+thePlanetName$ +" = true false false false"+chr$(10)
# 			if PLANETRADIUS>=300500 then
# 				localizationText$ = localizationText$+ "        #autoLOC_RBodies_discovery_"+thePlanetName$+ " = " + thePlanetName$ + " -- Orbiting: "+star_Name$+"\\nn  \\nnSemimajor axis: "+str$(theSemiMajorAxis)+"m\\nn \\nnArg. of periapsis: "+theArgumentOfPeriapsis$+"°\\nn \\nnInclination: "+theInclination$+"°\\nn \\nnTidal locked: unknown\\nn \\nnHabitable zone: unknown"+chr$(10)
				
# 				discoveryText$ = discoveryText$+"        #autoLOC_RBodies_discovery_"+thePlanetName$+chr$(10)
#     		end if
#     		if PLANETRADIUS<300500 then
# 				discoveryText$ = discoveryText$+"        //"+thePlanetName$+" is too small"+chr$(10)
# 			end if
# 			########################'
# 			####
# 			#25% chance of there being a moon
# 			CALL MakeMoons (thePlanetName$,parentInclination,PLANETRADIUS,4)
			
# 			planetNumb = planetNumb + 1
# 			POBJECTNUMBER = POBJECTNUMBER + 1

# 		NEXT

# 		IF ASTTOG$ = "y" THEN
# 			CALL MakeAsteroids(star_Name$,2)
# 		END IF
# 	END IF
	
		
# END SUB