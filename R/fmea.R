# Tony Gojanovic
# Failure Mode Effects Analysis with R
# June 2018

#' Data prep for a graphical depiction of risk based on an FMEA.
#' @description  This function uses an imported data set and preps it for graphical analysis. Specifically, it adds a random jitter to severity, occurence and detection based on a standard normal variable (mean = 0 and sd = 0.25)
#' @param filename FMEA filename as an imported data frame. 
#' @importFrom dplyr mutate %>%
#' @return Returns a modified data frame to be used in the graphical depiction of risk.
#' @examples df<-prep_data(fmea_worksheet_name)
#' @note Geom_jitter is by-passed with this function to allow ggrepel to work more efficiently.
#' @export

# Create a dataframe for analysis and add a jitter component.

prep_data<-function(filename){
  rme_working<-filename                              # Calculates the number of rows in the FMEA worksheet
  row_value<-nrow(rme_working)                       # Creates a row value variables                  
  df.x<-as.data.frame(rnorm(row_value,0,0.25))       # Random jitter column
  df.y<-as.data.frame(rnorm(row_value,0,0.25))       # Random jitter column
  df.z<-as.data.frame(rnorm(row_value,0,0.25))       # Random jitter colums
  df<-cbind(df.x,df.y,df.z)                          # Create a data frame with three random jitter columns
  colnames(df)<-c("x","y","z")                       # Add column names
  rme_working<-rme_working%>%mutate(sev=severity+df$x)%>%mutate(occ=occurrence+df$y)%>%mutate(det=detection+df$z) # Create new jitter variables
  return(rme_working)                                # return the data set with new columns
}

