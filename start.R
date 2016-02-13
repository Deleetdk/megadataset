library(devtools)

# save data files ---------------------------------------------------------

megadataset = read.csv("inst/extdata/megadataset.csv", sep = "\t", row.names = 1, encoding = "UTF-8")
devtools::use_data(megadataset, overwrite = T)

