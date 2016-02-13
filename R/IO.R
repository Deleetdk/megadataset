#' Abbreviate country and regional names to ISO-3X.
#'
#' To enable easier merging of datasets of international data. You need to download the countrylist.csv file yourself.
#' @param names (character vector) The full names of countries and subcountry units.
#' @param abbrev (data.framea) Optional: A data.frame of abbreviations to use.
#' @param georgia (character scalar) Whether "georgia" is a country or a US state ("state"). Defaults to "country".
#' @export
#' @examples
#' as_abbrev(c("Denmark", "USA", "India", "Thailand", "Russia", "Korea, South"))
as_abbrev = function(names, georgia = "country", abbrev = NA){

  #use built in?
  if (is.na(abbrev)) {
    #get dictionary
    d_names = read.csv("data/abbreviations.csv", sep="\t", row.names=1, encoding = "UTF-8", stringsAsFactors = F)
  } else {
    d_names = abbrev
  }

  #Georgia as state or country?
  if (substr(georgia, 1, 1) == "s") {
    d_names["Georgia", ] = "USA_GA"
  }

  #loop thru and get abbrevs
  abbrevs = character()
  for (name in names){
    abbrevs = c(abbrevs, d_names[name, ])
    if (is.na(d_names[name, ])){
      print(paste(name, "is missing"))
    }
  }
  return(abbrevs)
}


#' Get full country names from ISO-3X.
#'
#' To enable easier merging of datasets of international data. You need to download the countrylist.csv file yourself.
#' @param x (character vector) The ISO-3X codes.
#' @export
#' @examples
#' as_long(c("DNK", "USA", "IND", "THA", "RUS", "KOR"))
as_long = function(x, abbrev = NA) {
  library(stringr)

  #use built in?
  if (is.na(abbrev)) {
    #get dictionary
    d_names = read.csv("data/abbreviations.csv", sep="\t", encoding = "UTF-8", stringsAsFactors = F)
  } else {
    d_names = abbrev
  }

  sapply(x, function(i) {
    # browser()
    indice = (d_names$ISO3X == i) %>% #find matches
      which %>% #their indices
      `[`(1) #get the first
    if(is.na(indice)) message(str_c(i, " could not be found!"))

    return(d_names$Names[indice])
  })
}
as_long(c("DNK", "USA", "IND", "THA", "RUS", "KOR"))

#' Get the abbreviations data.frame.
#'
#' Fetches the abbreviation dictionary and returns it to the user. Useful if one wants to alter it and pass the modified version to as_abbrev() or as_long().
#' @param x (character vector) The ISO-3X codes.
#' @export
#' @examples
#' get_abbrev()
get_abbrev = function() {
  d_names = read.csv("data/abbreviations.csv", sep = "\t", header = T, stringsAsFactors = F, encoding = "UTF-8")
  d_names
}
