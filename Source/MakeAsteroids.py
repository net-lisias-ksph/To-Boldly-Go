

# SUB MakeAsteroids (star_Name$,Max_num_asteroids):
# 	MAXAST = INT(RND * Max_num_asteroids)
# 	FOR ASTNUMBER = 1 TO MAXAST
# 		print #1, "//############Making an astroid"
# 		########################'
# 		###Astroid name
# 		theName$ = star_Name$ + STR$(ASTNUMBER)
# 		print #1, "@Kopernicus:FINAL"+chr$(13)+"{"
# 		########################'
# 		###Fill in basic body data'
# 		aBodyNode$ = "    Body"+chr$(13)+"        {"+chr$(13)
# 		print #1, aBodyNode$
# 		print #1, "        %name = "+theName$
# 		PLANETTYPE$ = "Gilly"
# 		templateNode$ = "    Template"+chr$(13)+"        {"+chr$(13)+"            name = "+ PLANETTYPE$+chr$(13)+"        }"
# 		print #1, templateNode$
# 		########################'
# 		###Fill in property data'
# 		theDescription$ = "When Jeb was originally shown a map of our galaxy he said 'Wow! Thats big! Dont suppose we get any rest stops out there do we?' This statement encouraged our scientists to look closer, And eventually this asteroid among many, Was discovered. Dont expect vending machines, And if you do find them... Dont expect candy."
# 		theRadius$ = str$(INT(RND * 80000) + 5000)
# 		aPropertiesTemplate$ = thePropertiesTemplate$
# 		aPropertiesNode$ = propertyNode$(aPropertiesTemplate$, theDescription$, theRadius$, "", "", "", "", "", "", "", "", "")
# 		print #1, aPropertiesNode$
# 		#########################'
# 		###Fill in orbit data'
# 		theReferenceBody$ = star_Name$
# 		theColour$ = ""
# 		theMode$ = ""
# 		theInclination$ = STR$(INT(RND * 360))
# 		theEccentricity$ = ""
# 		theSemiMajorAxis = INT(RND * 10000000000) + 10000000
# 		theLongitudeOfAscendingNode$ = ""
# 		theArgumentOfPeriapsis$ = ""
# 		theMeanAnomalyAtEpoch$ = ""
# 		theEpoch$ = ""
# 		aOrbitTemp$ = theOrbitTemplate$
# 		aOrbitNode$ = orbitNode$(aOrbitTemp$, theReferenceBody$, theColour$, theMode$, theInclination$, theEccentricity$, STR$(theSemiMajorAxis), theLongitudeOfAscendingNode$, theArgumentOfPeriapsis$, theMeanAnomalyAtEpoch$, theEpoch$)
# 		print #1, aOrbitNode$
# 		#########################'
# 		###We don't currently have a method of making PQS data using templates
# 		PRINT #1, "        PQS"
# 		PRINT #1, "        {"
# 		PRINT #1, "            Mods"
# 		PRINT #1, "            {"
# 		PRINT #1, "                VertexSimplexHeightAbsolute"
# 		PRINT #1, "                {"
# 		PRINT #1, "                    seed ="; INT(RND * 100000)
# 		PRINT #1, "                }"
# 		PRINT #1, "                VertexHeightNoise"
# 		PRINT #1, "                {"
# 		PRINT #1, "                    seed ="; INT(RND * 100000)
# 		PRINT #1, "                }"
# 		PRINT #1, "            }"
# 		PRINT #1, "        }"
# 		PRINT #1, "    }"
# 		print #1, "}"

# 		AOBJECTNUMBER = AOBJECTNUMBER + 1
# 	NEXT
	
# END SUB