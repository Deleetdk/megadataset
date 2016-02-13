### Use this file to merge new data into mega. Beware, the last step overwrites the dataset. If you need to roll back, use Github.

#load from clipboard
d = read.delim("clipboard")

#names
d$abbrev = as_abbrev2(d$Names)

#subset by missing names
d = d[!is.na(d$abbrev), ]

#rownames
rownames(d) = d$abbrev
d$abbrev = NULL
d$Names = NULL

#colnames
colnames(d) = "X0024_" + colnames(d)

#merge rows
#useful when an error has been found and two units have been given the same abbreviation
# merge_rows(megadataset)
#
#
#
# mega = megadataset
#
# #merge rows
# mega_2 = merge_rows_by_name(mega, )

mega_2 = merge_datasets2(megadataset, d)

# write to mega -----------------------------------------------------------
write_mega(mega_2, filename = "inst/extdata/megadataset.csv")
