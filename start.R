#libs
library(pacman)
p_load(devtools, roxygen2, stringr, kirkegaard, megadataset)

try({setwd("./megadataset")}, silent = T) #if this fails, it probably means we are already in the right dir

# save data files ---------------------------------------------------------

#megadata
megadataset = read.csv("inst/extdata/megadataset.csv", sep = ";", row.names = 1, encoding = "UTF-8")
devtools::use_data(megadataset, overwrite = T)


# make documentation ------------------------------------------------------
document()

#install
setwd("..")
install("megadataset")

#load
library(megadataset)

#go back
try({setwd("./megadataset")}, silent = T) #if this fails, it probably means we are already in the right dir

# tests -------------------------------------------------------------------
source("tests.R")

message("DONE! If you see this, there were probably no errors.")
