# install packages
install.packages("rgdal")
install.packages("raster")

# load packages
library(rgdal)
library(raster)
library(magrittr)
library(dplyr)

# importing Middle James-Willis Watershed shapefile to get area in acres
watershed <- shapefile('DATA/Middle_James_Willis/HU8_02080205_Watershed/HU8_02080205_Watershed.shp')
A_huc <- watershed$AREAACRES

# importing Middle James-Willis Wetlands shapefile to get acres from NWI inventory (all wetland types)
NWI_james <- shapefile('DATA/Middle_James_Willis/HU8_02080205_Watershed/HU8_02080205_Wetlands.shp')

#area by wetland type Mid-James Willis Watershed
NWI_james <- as.data.frame(NWI_james)
wotus_type <- NWI_james %>%
  group_by(WETLAND_TY) %>%
  summarise(sum = sum(ACRES))
print(wotus_type) #should we remove lake, pond or riverine types from total?
lakes <- wotus_type[4,2]
rivers <- wotus_type[6,2]

# developable area
A_dev <- A_huc - lakes - rivers

# wetland area
A_wet <- sum(wotus_type[,2]) - lakes - rivers

# importing Pamunkey Watershed shapefile to get area in acres
#NWI_pamunkey <- shapefile('DATA/Pamunkey/HU8_02080106_Watershed/HU8_02080106_Watershed.shp')
#A_huc_p <- NWI_pamunkey$AREAACRES

# importing Pamunkey Watershed wetlands shapefile to get acres from NWI inventory (all wetland types)
#NWI_pamunkey2 <- shapefile('DATA/Pamunkey/HU8_02080106_Watershed/HU8_02080106_Wetlands.shp')
#pamunkey_wotus <- NWI_pamunkey2$ACRES
#A_wotus_p <- sum(pamunkey_wotus)

#area by wetland type Pamunkey Watershed
#NWI_pamunkey2 <- as.data.frame(NWI_pamunkey2)
#wotus_type_p <- NWI_pamunkey2 %>%
#  group_by(WETLAND_TY) %>%
#  summarise(sum = sum(ACRES))
#print(wotus_type_p) #should we remove lake, pond or riverine types from total?
##estuarine wetlands might make this more complicated

