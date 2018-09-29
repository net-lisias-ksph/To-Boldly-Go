# SUB MakeMoons (thePlanetName$,parentInclination,parentRadius,Max_num_moons):
# 	#Essentially the same as MakePlanets.bm
# 	#Smarter way to to this would be to abstract further and have moon and planet gen call common code'
# 	#STH 2017-0406'
# 	MAXMOON = INT(RND * Max_num_moons)
# 	FOR theMoonNumb = 1 TO MAXMOON
# 		print #1, "//############Making a moon"
# 		moonFound = 0
# 		#This would be nicer if we sorted things by radius first and limited the search scope
# 		#Loop through the list a max of some random value based on length of the list
# 		maxTimes = INT(RND * (UBOUND(planetKey$)))
# 		if maxTimes < 5 then maxTimes = 5
# 		for i = 1 to maxTimes
# 			keyIndex = 1 + INT(RND * (UBOUND(planetKey$))) 'want the range to be from 1 to end. Index 0 is the header
# 			#This is based on radii of parent and moon. Probably should be mass, but this will do for now
# 			#STH 2017.1019
# 			PLANETRADI = thePlanetRadius(keyIndex)
# 			radiiDiff = parentRadius/PLANETRADI
# 			#Earth:Luna is an extreme almost binary planet system
# 			#radius earth/radius moon=3.6678
# 			#This will be our curoff for planet:moon size
# 			if (radiiDiff > 3.6678) then
# 				PLANETTYPE$ = planetKey$(keyIndex)
# 				PLANETDESC$ = thePlanetDesc$(keyIndex)
# 				PLANETRADI = thePlanetRadius(keyIndex)
# 				PLANETMASS = thePlanetMass(keyIndex)
# 				PLANETSTOCK$ = thePlanetStock$(keyIndex)
# 				PLANETSOI = thePlanetSOI(keyIndex) 'really, this should be calculated from mass'
# 				moonFound = 1
# 				exit for
# 			end if
# 			'print #1, radiiDiff
# 			'aBodyNode$ = "Body"+chr$(13)
# 			'templateNode$ = "Template"+chr$(13)+"        {"+chr$(13)+"            name = Gilly"+chr$(13)+"        }"
# 		next
# 		if moonFound = 1 then
# 			########################'
# 			###Fill in basic body data'
# 			IF PLANETSTOCK$ = "True" THEN
# 				aBodyNode$ = "Body"+chr$(13)
# 				templateNode$ = "Template"+chr$(13)+"        {"+chr$(13)+"            name = "+ PLANETTYPE$+chr$(13)+"        }"
# 			END IF
# 			# ELSE statements don't seem to work in included code
# 			IF NOT (PLANETSTOCK$ = "True") THEN
# 				aBodyNode$ = "+Body[" + PLANETTYPE$ + "]"+chr$(13)
# 				templateNode$ = ""
# 			END IF
# 			########################'
# 			###Moon name
# 			#sum theMoonNumb and acsii 96 to get a lowercase letter for the moon name
# 			theMoonName$ = thePlanetName$ + chr$(theMoonNumb+96)
# 			#########################'
# 			###Fill in orbit data'
# 			theReferenceBody$ = thePlanetName$
# 			theColour$ = ""
# 			theMode$ = ""
# 			#the inclination of the planet should be close to the plane of the parent star
# 			#https://en.wikipedia.org/wiki/Orbital_inclination
# 			tempVar=int(rnd*0.5)
# 			theInclination$=str$(int(parentInclination+tempVar))
# 			theEccentricity$ = ""
# 			theMoonSemiMajorAxis = INT(RND * 50000000) + 11000000
# 			theLongitudeOfAscendingNode$ = ""
# 			theArgumentOfPeriapsis$ = STR$(INT(RND * 1000))
# 			theMeanAnomalyAtEpoch$ = STR$(0)
# 			theEpoch$ = STR$(0)
# 			########################'
# 			###Fill in property data'
# 			#moved the property data code to take advantage of orbital values in description'
# 			if PLANETDESC$ = "" then
# 				PLANETDESC$ = "Semimajor axis:\\nn          "+str$(theMoonSemiMajorAxis)+"m\\nn \\nnArg. of periapsis: "+theArgumentOfPeriapsis$+"°\\nn \\nnInclination: "+theInclination$+"°\\nn \\nnTidal locked:\\nn \\nnHabitable zone:"
# 			end if
# 			aPropertiesTemplate$ = thePropertiesTemplate$
# 			aPropertiesNode$ = propertyNode$(aPropertiesTemplate$, PLANETDESC$, STR$(PLANETRADI), STR$(PLANETMASS), "", "", "", "", "", "", "", STR$(PLANETSOI))
# 			########################'
# 			aOrbitTemp$ = theOrbitTemplate$
# 			aOrbitNode$ = orbitNode$(aOrbitTemp$, theReferenceBody$, theColour$, theMode$, theInclination$, theEccentricity$, STR$(theMoonSemiMajorAxis), theLongitudeOfAscendingNode$, theArgumentOfPeriapsis$, theMeanAnomalyAtEpoch$, theEpoch$)
			
# 			aMoonTemp$ = thePlanetTemplate$
# 			aMoonTemp$ = planetTempSubstitution$ (aMoonTemp$, aBodyNode$, theMoonName$, templateNode$, aPropertiesNode$, aOrbitNode$, "", "", "", "", "")
# 			print #1, aMoonTemp$

# 			########################
# 			#add moon to the researchBody file
# 			ignoreLevels$ = ignoreLevels$ + "        "+theMoonName$ +" = true false false false"+chr$(10)
# 			if PLANETRADI>=300500 then
# 				localizationText$ = localizationText$+ "        #autoLOC_RBodies_discovery_"+theMoonName$+ " = " + theMoonName$ + " -- Orbiting: "+star_Name$+"\\nn  \\nnSemimajor axis: "+str$(theSemiMajorAxis)+"m\\nn \\nnArg. of periapsis: "+theArgumentOfPeriapsis$+"°\\nn \\nnInclination: "+theInclination$+"°\\nn \\nnTidal locked: unknown\\nn \\nnHabitable zone: unknown"+chr$(10)
				
# 				discoveryText$ = discoveryText$+"        #autoLOC_RBodies_discovery_"+theMoonName$+chr$(10)
#     		end if
# 			if PLANETRADI<300500 then
# 				discoveryText$ = discoveryText$+"        //"+theMoonName$+" is too small"+chr$(10)
# 			end if
# 			########################'

# 			MOBJECTNUMBER = MOBJECTNUMBER + 1
# 		end if
# 	NEXT
	
		
# END SUB
# 	