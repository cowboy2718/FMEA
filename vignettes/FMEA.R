## ----eval=FALSE, warning=FALSE, message=FALSE----------------------------
#  library(ggplot2)
#  library(dplyr)
#  library(ggrepel)

## ----eval=FALSE,warning=FALSE,message=FALSE------------------------------
#  
#  library(ggplot2)
#  library(dplyr)
#  library(ggrepel)
#  
#  # If importing an Excel worksheet, the following code chunk is to be used (based on your working directory).
#  
#  library(readxl)
#  fmea_working_file <- read_excel("~/Data/Statistical Projects/R Projects/FMEA/inst/extdata/fmea_working_file.xls")
#  
#  # To make the hazard or disutility graph (with risk zones)
#  
#  risk_disutility(fmea_working_file)
#  
#  # To make the risk controls graph (no risk zones)
#  
#  risk_controls(fmea_working_file)
#  

