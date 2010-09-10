###########################################################################################
##                         NASA_global_2x2_grid_lota_map/R                               ##
## Read NASA GISS global temp anom file for month, anom data in 2 degree grid cells      ##
## D Kelly O'Day       - http://chartsgraphs.wordpress.com                               ## 
## Uses R's powerfull geospatial analysis tools                                          ##
## R script help provided by Andy South of UK's NERC                                     ##
## Orig script: 9/2/10;  Corrected 9/4/10 based on comments from Stefan Muthers          ##                                                                   ##
## modified by yutakashino 9/10/10
###########################################################################################
# Load map related libraries
library(fields)    # needed for image.plot()
library(sp)        # needed for coordinates, SpatialPointsDataFrame
library(maptools)  # neeed for wrld_simpl map

# Get world shape for map background
data(wrld_simpl)            ## from maptools package
shp <- wrld_simpl

# Read source data file
# link to NASA gistemps map page: http://data.giss.nasa.gov/gistemp/maps/
link <- "http://processtrends.com/Files/global_2x2_lota_data_latest.csv"

which_mo <- "July, 2010" 
rdf <- read.table(link, skip = 1, sep = ",", header=T)
names(rdf) <- c("i", "j", "lon", "lat", "anom")

###############################
# Convert all anom data with 9999.0000 to NA
rdf$anom[rdf$anom==9999.0000] <- NA         # convert all 9999.0000 to NA

## Promote to SpatialPointsDataFrame
points_df <- rdf          # make copy of original file
coordinates(points_df) = c("lon", "lat")     # convert to sp file with lon/lat cordinates

## Promote to SpatialPixelsDataFrame
pixel_df <- points_df
gridded(pixel_df) <- TRUE

## Promote to SpatialGridDataFrame
rdf_sp = as(pixel_df, "SpatialGridDataFrame")
main_title <- paste("GISS Temp Anomaly ", which_mo, sep="")

png("globaltempanorm.png", widt=8, height=5, units="in", res=72)
par(mar=c(2.5,2,1,1)) ; par(oma=c(0,0,0,0))  # set plot par(mar=)
par(pty="s") #square
leg_title <- expression(paste("Anomaly - ",degree*C, " (Baseline: 1951-1980)", sep=""))
g_plot <- as.image.SpatialGridDataFrame(rdf_sp["anom"])
image.plot(g_plot, main=main_title, nlevel=12,las=1,
    axes=T, horizontal=T,  ylim=c(-90,90), xlim=c(-181,180), zlim = c(-6,6),
    legend.lab = leg_title, legend.mar=4,legend.shrink=0.5)
plot(shp, border="black", add=T)
grid(col = "lightgrey", lty=1)    # optional grid on/off?
dev.off()