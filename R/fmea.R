# Tony Gojanovic
# Failure Mode Effects Analysis with R
# June 2018

#' Reading a FARS data set
#' 
#' @description
#' This function reads in data set from the NHTSA Fatality Analysis Reporting System (FARS).
#' @param filename FARS character filename in csv format to be read. If the filename is incorrect or not located, a message is issued.
#' @return Returns a data frame from a csv file in tabular format.
#' @note dplyr and tbl_df is used to format the returned data frame
#' @importFrom dplyr tbl_df
#' @importFrom readr read_csv
#' @references  National Highway Traffic Safety Administration's Fatality Analysis Reporting System data set. https://www.nhtsa.gov/research-data/fatality-analysis-reporting-system-fars
#' @export

fmea <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}
