#############################################
# TEMPERATURE EQUIVALENT: ELEVATION TO LATITUDE
# 	For the cardinalis transplant project that 
#	transplanted populations across an elevational 
#	gradient to four sites from Jamestown (400m) up 
#	to Timberline (~3000m), what is the latitudinal 
#	equivalent to encounter similar temperature conditions
###############################################
###############################################

## load libraries
library(raster)
library(maptools)
library(dismo)
library(rgdal)
library(rgeos)

###################################
prj.wgs = "+proj=longlat +ellps=WGS84"
prj.aea = "+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0"

###################################
require(maptools)
data(wrld_simpl)
#plot(wrld_simpl)
## Crop to the desired extent, then plot
library(raster)
out <- crop(wrld_simpl, extent(-132, -117, 32, 61))
moot <- gUnaryUnion(out)
plot(moot)
mypoints <- spsample(moot, n = 1000, "regular")
points(mypoints, pch = 19, cex=0.2)

###################################
# BRING POINTS BACK TO DATAFRAME AND ASSIGN ELEVATION VALUES
mypoints <- data.frame(mypoints)
James <- mypoints; Mather <- mypoints; White <- mypoints; Timber <- mypoints
James$el <- 400; James$ID1 <- "JamesTown"
Mather$el <- 1400; Mather$ID1 <- "Mather"
White$el <- 2400; White$ID1 <- "White"
Timber$el <- 3000; Timber$ID1 <- "Timber"
all <- rbind(James, Mather, White, Timber); all$ID2 <- "blank"

###################################
colnames(all)[1] <- "long"
colnames(all)[2] <- "lat"
all <- all[ ,c("ID1", "ID2", "lat", "long", "el")]
###################################
setwd(choose.dir())
#write.csv(all, file = "points.csv")
# EXPORT TO CLIMATE WNA & GET CLIMATE DATAFRAME
###################################
###################################
###################################

climate <- read.csv(file="points_Normal_1961_1990Y.csv")

tapply(climate$MAT, climate$ID1, summary)

climate_low <- climate[ which(climate$Elevation < 500), ] 

coordinates(climate_low) = ~Longitude + Latitude
projection(climate_low) = CRS(prj.wgs)
climate_low1 <- climate[ which(climate$Elevation < 500 & climate$MAT < 11.91), ] 
climate_low2 <- climate[ which(climate$Elevation < 500 & climate$MAT < 8.41), ] 
climate_low3 <- climate[ which(climate$Elevation < 500 & climate$MAT < 2.11), ] 
coordinates(climate_low1) = ~Longitude + Latitude
projection(climate_low1) = CRS(prj.wgs)
coordinates(climate_low2) = ~Longitude + Latitude
projection(climate_low2) = CRS(prj.wgs)
coordinates(climate_low3) = ~Longitude + Latitude
projection(climate_low3) = CRS(prj.wgs)

plot(moot); points(climate_low, pch=19, cex=0.3)

###################################
###################################
###################################

#Create a function to generate a continuous color palette
rbPal <- colorRampPalette(c('blue','red'))
# based on the y values
climate_low$Col <- rbPal(10)[as.numeric(cut(climate_low$MAT,breaks = 10))]
plot(moot)
points(climate_low, pch=19, cex=0.6, col="red")
points(climate_low1, pch=19, cex=0.6, col="orange")
points(climate_low2, pch=19, cex=0.6, col="green")
points(climate_low3, pch=19, cex=0.6, col="blue")

###################################
###################################
###################################

##### MEAN COLDEST MONTH TEMP
##### SITE SPECIFIC RATHER THAN LIMITS
climate_low <- climate[ which(climate$Elevation < 500 & climate$MCMT < 8 & climate$MCMT > 6), ] 
coordinates(climate_low) = ~Longitude + Latitude
projection(climate_low) = CRS(prj.wgs)
climate_low1 <- climate[ which(climate$Elevation < 500 & climate$MCMT < 5.3 & climate$MCMT > 3.3), ] 
climate_low2 <- climate[ which(climate$Elevation < 500 & climate$MCMT < 1.8 & climate$MCMT > -0.8), ] 
climate_low3 <- climate[ which(climate$Elevation < 500 & climate$MCMT < -5.1 & climate$MCMT > -7.1), ] 
coordinates(climate_low1) = ~Longitude + Latitude
projection(climate_low1) = CRS(prj.wgs)
coordinates(climate_low2) = ~Longitude + Latitude
projection(climate_low2) = CRS(prj.wgs)
coordinates(climate_low3) = ~Longitude + Latitude
projection(climate_low3) = CRS(prj.wgs)
plot(moot, main="MEAN COLDEST MONTH TEMP")
points(climate_low, pch=19, cex=0.6, col="red")
points(climate_low1, pch=19, cex=0.6, col="orange")
points(climate_low2, pch=19, cex=0.6, col="green")
points(climate_low3, pch=19, cex=0.6, col="blue")
plot(moot, add=T)

###################################
###################################
###################################


##### MEAN WARMEST MONTH TEMP
##### SITE SPECIFIC RATHER THAN LIMITS
climate_low <- climate[ which(climate$Elevation < 500 & climate$MWMT < 26 & climate$MWMT > 24), ] 
coordinates(climate_low) = ~Longitude + Latitude
projection(climate_low) = CRS(prj.wgs)
climate_low1 <- climate[ which(climate$Elevation < 500 & climate$MWMT < 22.6 & climate$MWMT > 20.6), ] 
climate_low2 <- climate[ which(climate$Elevation < 500 & climate$MWMT < 19.4 & climate$MWMT > 17.4), ] 
climate_low3 <- climate[ which(climate$Elevation < 500 & climate$MWMT < 13.3 & climate$MWMT > 11.3), ] 
coordinates(climate_low1) = ~Longitude + Latitude
projection(climate_low1) = CRS(prj.wgs)
coordinates(climate_low2) = ~Longitude + Latitude
projection(climate_low2) = CRS(prj.wgs)
coordinates(climate_low3) = ~Longitude + Latitude
projection(climate_low3) = CRS(prj.wgs)
plot(moot)
points(climate_low, pch=19, cex=0.6, col="red")
points(climate_low1, pch=19, cex=0.6, col="orange")
points(climate_low2, pch=19, cex=0.6, col="green")
points(climate_low3, pch=19, cex=0.6, col="blue")
plot(moot, add=T)


##### MEAN ANNUAL TEMP
##### SITE SPECIFIC RATHER THAN LIMITS
climate_low <- climate[ which(climate$Elevation < 500 & climate$MAT < 16.2 & climate$MAT > 14.2), ] 
coordinates(climate_low) = ~Longitude + Latitude
projection(climate_low) = CRS(prj.wgs)
climate_low1 <- climate[ which(climate$Elevation < 500 & climate$MAT < 12.9 & climate$MAT > 10.9), ] 
climate_low2 <- climate[ which(climate$Elevation < 500 & climate$MAT < 9.4 & climate$MAT > 7.4), ] 
climate_low3 <- climate[ which(climate$Elevation < 500 & climate$MAT < 3.1 & climate$MAT > 1.1), ] 
coordinates(climate_low1) = ~Longitude + Latitude
projection(climate_low1) = CRS(prj.wgs)
coordinates(climate_low2) = ~Longitude + Latitude
projection(climate_low2) = CRS(prj.wgs)
coordinates(climate_low3) = ~Longitude + Latitude
projection(climate_low3) = CRS(prj.wgs)
plot(moot)
points(climate_low, pch=19, cex=0.6, col="red")
points(climate_low1, pch=19, cex=0.6, col="orange")
points(climate_low2, pch=19, cex=0.6, col="green")
points(climate_low3, pch=19, cex=0.6, col="blue")
plot(moot, add=T)

#############################
#############################
#############################

# TEMPERATURE BY LATIUTDE
Jamestown <- climate[ which(climate$ID1=="JamesTown"), ]
Mather <- climate[ which(climate$ID1=="Mather"), ]
Timber <- climate[ which(climate$ID1=="Timber"), ]
White <- climate[ which(climate$ID1=="White"), ]

plot(Jamestown$Latitude, Jamestown$MCMT, ylim=c(-15, 10), xlim=c(35, 53), main="MCMT", ylab="Temperature C", pch=19, cex=0.4, xlab="Latitude", col="red")
points(Mather$Latitude, Mather$MCMT, pch=19, cex=0.4, col="Orange")
points(Timber$Latitude, Timber$MCMT, pch=19, cex=0.4, col="Blue")
points(White$Latitude, White$MCMT, pch=19, cex=0.4, col="Green")
abline(predict(Jamestown$Latitude, Jamestown$MCMT), col='red')

#############################
#############################
#############################

# FIT REGRESSIONS AND FIND SLOPEs

mylist <- c("Jamestown","Mather","White","Timber")
df <- data.frame(Date=as.Date(character()),
                 File=character(), 
                 User=character(), 
                 stringsAsFactors=FALSE) 

for(i in 1:length(mylist)){
	listy <- get(mylist[i])
	listy <- listy[ which(listy$Latitude < 50), ]
	z <- lm(listy$MWMT ~ listy$Latitude)
		temp <- confint(z, 2)
		upper <- temp[2]; lower <- temp[1]
		rate <- coefficients(z, 2); rate <- rate[2]
	lineadd <- cbind(mylist[i], rate, lower, upper)
	df <- rbind(df, lineadd)
	rm(lineadd)
	
}


