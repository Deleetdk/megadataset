

d_altinok = read.csv("../altinok_data.csv", row.names = 2)[-1]
colnames(d_altinok) = "0023_" + colnames(d_altinok)

rownames(d_altinok) = megadataset::as_abbrev(rownames(d_altinok))
