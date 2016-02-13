

d_altinok = read.csv("../altinok_data.csv", row.names = 2)[-1]
colnames(d_altinok) = "X0023_" + colnames(d_altinok)

rownames(d_altinok) = as_abbrev2(rownames(d_altinok))
head(d_altinok)

newmega = merge_datasets2(megadataset, d_altinok)

newmega$old_altinok = NULL


# write to mega -----------------------------------------------------------
write_mega(newmega, filename = "inst/extdata/megadataset.csv")
