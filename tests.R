library(pacman)
p_load(megadataset, kirkegaard)

# as_abbrev ---------------------------------------------------------------

stopifnot({
  as_abbrev2(c("Denmark", "USA", "India", "Thailand", "Russia", "Korea, South")) == c("DNK", "USA", "IND", "THA", "RUS", "KOR")
})


# as long -----------------------------------------------------------------

stopifnot({
  as_long2(c("DNK", "USA", "IND", "THA", "RUS", "KOR")) == c("Denmark", "United States", "India", "Thailand", "Russia", "South Korea")
})


# get_abbrev -------------------------------------------------------

stopifnot({
  is.data.frame(get_abbrev2())
})
