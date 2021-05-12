# Model for Wetlands Final Project

## Using the Middle James-Willis sub-basin

## Packages
install.packages("readr")
library(readr)

## Variables
### initial stocks
A_huc_j # area of Middle James-Willis river sub-basin (HUC code: 02080205); source:USFWS National Wetlands Inventory mapper (see wetland_area_calculation.R for data cleaning)
A_wotus_j #area of wetlands in Mid-James Willis river sub-basin; source:USFWS National Wetlands Inventory mapper (see wetland_area_calculation.R for data cleaning)
A_upl_j <- A_huc_j - A_wotus_j
  
### conversion parameters
#conv_rate <- _____ #annual rate of wetland loss; assuming that this rate remained constant
#A_conv <- _____ #area of wetland impacted or converted by development
n <- 1 #compensatory wetland mitigation ratio (choice variable)
#A_mitig <- n*A_conv #area of wetland created to meet compensatory mitigation requirements

### economic benefits

### costs
c_permitting <-30000 #approximate cost of hiring a consultant to handle permitting of up to 1 acre of wetland in central Virginia (DeBerry pers. comm.)
#c_construction <- #need to find an estimate for this
#c_mitigation <- 50000*A_conv #approximate cost of 1 acre of wetland mitigation credits in the Richmond area
#^this was my first instinct but I realized that it should change with demand

## Constraints

## Model