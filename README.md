# tempTolat
Latitude vs altitude: is there a good rule of thumb conversion factor for temperature?
Factors that influence elevational and latitudinal range limits for species can be vastly different. Yet when we study range boundaries & conduct transplant experiments across an environmental gradient, a researcher will usually choose only one of these two dimensions (elevation or latitude). This is usually because of cost, time, logistics, or other interests ect. But often, we want to know a general conversion between units of latitude and altitude (i.e. Had a given study been conducted across a latitudinal range boundary rather than an altitudinal range boundary, where would study sites need to be to experience similar temperature conditions?). This has been important for several review articles attempting to make broad conclusions, as well as for individual researchers attempting to generalize their results further to either latitude or altitude range boundaries.

The most common general conversion that has been suggested is ~ -1oC for every 100 m gained in elevation & ~ -1oC for every 100 km towards the poles. 

But how accurate is this? 
With this short blog post I show how this general rule of thumb conversion factor compares to actual climate data from ClimateWNA. I then look at an older study (Angert and Schemske, 2005) that transplanted Mimulus cardinalis across its elevational range limit in California and show were sites would have to be located to experience similar temperature conditions if the study was conducted across the species northern latitudinal range limit rather than the elevational range limit. 


Immediately, from the figure above, we can see the immense geographic distances (across a latitude gradient) that are needed, to be equivalent to the elevational gains. For mean annual temperature at 415 m, you would need to drive from San Francisco all the way up to YK, NWT or northern BC to experience similar conditions at 3010 m. But, what's more interesting are the temperature extremes. Notice the continental/oceanic buffering. The interior gets either too hot or cold so its difficult choose a single latitudinal value depending on what environmental variable you are interested in/ most relevant to study system.


What is a good general conversion (altitude to latitude) for this study region?
When we regress temperature against latitude for each of the sites from the Angert and Schemske (2005) study-as we move further north-we can get an appropriate conversion factor for this region and compare it to the one mentioned above. 

Mean Annual Temperature: -0.55oC/100km north 

Mean Coldest Month Temperature:
-0.65oC/100km 

Mean Warmest Month Temperature:
-0.51oC/100km 

Take home message: The values I got here were quite different from the standard (-1oC for every 100 km). I would avoid the altitude-latitude conversion factors altogether; but if absolutely necessary, try to calculate regional coefficients for the specific area of interest using a program such as ClimateWNA & watch out for seasonal variable differences (don't simply rely on MAT). 

Download Code From GitHub:

