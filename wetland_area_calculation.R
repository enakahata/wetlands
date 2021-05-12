# install packages
install.packages("rgdal")
library(rgdal)
install.packages("raster")
library(raster)
library(magrittr)
library(dplyr)

# importing Pamunkey Watershed shapefile to get area in acres
#NWI_pamunkey <- shapefile('DATA/Pamunkey/HU8_02080106_Watershed/HU8_02080106_Watershed.shp')
#A_huc_p <- NWI_pamunkey$AREAACRES

# importing Middle James-Willis Watershed shapefile to get area in acres
NWI_james <- shapefile('DATA/Middle_James_Willis/HU8_02080205_Watershed/HU8_02080205_Watershed.shp')
A_huc_j <- NWI_james$AREAACRES

# importing Pamunkey Watershed wetlands shapefile to get acres from NWI inventory (all wetland types)
#NWI_pamunkey2 <- shapefile('DATA/Pamunkey/HU8_02080106_Watershed/HU8_02080106_Wetlands.shp')
#pamunkey_wotus <- NWI_pamunkey2$ACRES
#A_wotus_p <- sum(pamunkey_wotus)

# importing Middle James-Willis Wetlands shapefile to get acres from NWI inventory (all wetland types)
NWI_james2 <- shapefile('DATA/Middle_James_Willis/HU8_02080205_Watershed/HU8_02080205_Wetlands.shp')
james_wotus <- NWI_james2$ACRES
A_wotus_j <- sum(james_wotus)

#area by wetland type Mid-James Willis Watershed
NWI_james2 <- as.data.frame(NWI_james2)
wotus_type_j <- NWI_james2 %>%
  group_by(WETLAND_TY) %>%
  summarise(sum = sum(ACRES))
print(wotus_type) #should we remove lake, pond or riverine types from total?

#area by wetland type Pamunkey Watershed
#NWI_pamunkey2 <- as.data.frame(NWI_pamunkey2)
#wotus_type_p <- NWI_pamunkey2 %>%
#  group_by(WETLAND_TY) %>%
#  summarise(sum = sum(ACRES))
#print(wotus_type_p) #should we remove lake, pond or riverine types from total?
##estuarine wetlands might make this more complicated

