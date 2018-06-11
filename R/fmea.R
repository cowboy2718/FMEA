# Tony Gojanovic
# Failure Mode Effects Analysis with R - Risk Assessment and Risk Management
# June 2018

#' Plotting a disutility or hazard graph of risk.
#' @description  This function uses an imported data set and creates a disutility graph. 
#' @param filename Filename as an imported data frame (usually from an FMEA study). Must possess the fields named item_no, process_step, severity,occurrence, and detection.
#' @return Returns a modified data frame to be used in the graphical depiction of risk.
#' @import dplyr ggplot2 ggrepel magrittr
#' @note Geom_jitter is not needed with this function to allow ggrepel to work more efficiently with labels. Specifically, a random jitter is added to severity, occurence and detection based on a standard normal variable (mean = 0 and sd = 0.25)
#' @export

# Create a disutility or hazard graph based on severity and occurrence.

risk_disutility<-function(filename){
  rme_working<-filename                              # Calculates the number of rows in the FMEA worksheet
  row_value<-nrow(rme_working)                       # Creates a row value variables                  
  df.x<-as.data.frame(rnorm(row_value,0,0.25))       # Random jitter column
  df.y<-as.data.frame(rnorm(row_value,0,0.25))       # Random jitter column
  df.z<-as.data.frame(rnorm(row_value,0,0.25))       # Random jitter colums
  df<-cbind(df.x,df.y,df.z)                          # Create a data frame with three random jitter columns
  colnames(df)<-c("x","y","z")                       # Add column names
  rme_working<-rme_working%>%dplyr::mutate(sev=severity+df$x)%>%mutate(occ=occurrence+df$y)%>%mutate(det=detection+df$z) # Create new jitter variables
                               # return the data set with new columns
  
  p<-ggplot(rme_working,aes(sev,occ))+geom_point(color="red",size=4)+geom_label_repel(aes(label=item_no,fill=process_step), box.padding =  0.5)+theme(legend.position = "bottom",axis.title=element_text(size=14),plot.title = element_text(size=14))
  p<-p+ggtitle("Disutility Graph by Failure Item No.")+xlab("Severity")+ylab("Occurrence")
  p<-p+scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10,11),limits = c(1,11))+scale_y_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11),limits=c(1,11))
  
  # Draw Low Risk Region is created using the segment function in ggplot.
  
  p<-p+geom_segment(aes(x=1,xend=7.5,y=1,yend=1), color="darkgreen")+geom_segment(aes(x=7.5,xend=7.5,y=1,yend=2.5),color="darkgreen")
  p<-p+geom_segment(aes(x=7.5,xend=6.5,y=2.5,yend=2.5),color="darkgreen")+geom_segment(aes(x=6.5,xend=6.5,y=2.5,yend=3.5),color="darkgreen")
  p<-p+geom_segment(aes(x=6.5,xend=6.5,y=3.5,yend=3.5),color="darkgreen")+geom_segment(aes(x=6.5,xend=5.5,y=3.5,yend=3.5),color="darkgreen")
  p<-p+geom_segment(aes(x=5.5,xend=5.5,y=3.5,yend=4.5),color="darkgreen")+geom_segment(aes(x=5.5,xend=4.5,y=4.5,yend=4.5),color="darkgreen")
  p<-p+geom_segment(aes(x=4.5,xend=4.5,y=4.5,yend=5.5),color="darkgreen")+geom_segment(aes(x=4.5,xend=3.5,y=5.5,yend=5.5),color="darkgreen")
  p<-p+geom_segment(aes(x=3.5,xend=3.5,y=5.5,yend=6.5),color="darkgreen")+geom_segment(aes(x=3.5,xend=1,y=6.5,yend=6.5),color="darkgreen")
  p<-p+geom_segment(aes(x=1,xend=1,y=6.5,yend=1),color="darkgreen")
  p<-p + annotate("text", x =2.25, y = 6.75,size=4.5, label = "Lower Risk Region")

  # High Risk Region is created using the segment function in ggplot.
  
  p<-p+geom_segment(aes(x=10,xend=5.5,y=10.5,yend=10.5),color="red")+geom_segment(aes(x=5.5,xend=5.5,y=10.5,yend=7.5),color="red")
  p<-p+geom_segment(aes(x=5.5,xend=6.5,y=7.5,yend=7.5),color="red")+geom_segment(aes(x=6.5,xend=6.5,y=7.5,yend=6.5),color="red")
  p<-p+geom_segment(aes(x=6.5,xend=7.5,y=6.5,yend=6.5),color="red")+geom_segment(aes(x=7.5,xend=7.5,y=6.5,yend=5.5),color="red")
  p<-p+geom_segment(aes(x=7.5,xend=8.5,y=5.5,yend=5.5),color="red")+geom_segment(aes(x=8.5,xend=8.5,y=5.5,yend=1),color="red")
  p<-p+geom_segment(aes(x=8.5,xend=10,y=1,yend=1),color="red")+geom_segment(aes(x=10,xend=10,y=1,yend=10.5),color="red")
  p<-p + annotate("text", x = 8, y = 10.75, label = "Higher Risk Region",size=4.5)
  
  return(p)  
}

# Create a graph based on detection and occurrence.

#' Potting a scatterplot of risk management controls.
#' @description  This function uses an imported data set and creates a risk control graph based on detection and occurrence. 
#' @param filename Filename as an imported data frame (usually from an FMEA study). Must possess the fields named item_no, process_step, severity,occurrence, and detection.
#' @return Returns a modified data frame to be used in the graphical depiction of risk controls.
#' @import dplyr ggplot2 ggrepel magrittr
#' @note Geom_jitter is not needed with this function to allow ggrepel to work more efficiently with labels. Specifically, a random jitter is added to severity, occurence and detection based on a standard normal variable (mean = 0 and sd = 0.25)
#' @export

risk_controls<-function(filename){
  
  rme_working<-filename                              # Calculates the number of rows in the FMEA worksheet
  row_value<-nrow(rme_working)                       # Creates a row value variables                  
  df.x<-as.data.frame(rnorm(row_value,0,0.25))       # Random jitter column
  df.y<-as.data.frame(rnorm(row_value,0,0.25))       # Random jitter column
  df.z<-as.data.frame(rnorm(row_value,0,0.25))       # Random jitter colums
  df<-cbind(df.x,df.y,df.z)                          # Create a data frame with three random jitter columns
  colnames(df)<-c("x","y","z")                       # Add column names
  rme_working<-rme_working%>%dplyr::mutate(sev=severity+df$x)%>%mutate(occ=occurrence+df$y)%>%mutate(det=detection+df$z) # Create new jitter variables
  # return the data set with new columns
  
  # Create a risk management scatterplot based on detection (controls) and occurrence of failure mechanisms or causes.
  
  p1<-ggplot(rme_working,aes(det,occ))+geom_point(color="red",size=4)+geom_label_repel(aes(label=item_no,fill=process_step), box.padding =  0.5)+theme(legend.position = "bottom",axis.title=element_text(size=14),plot.title = element_text(size=14))
  p1<-p1+ggtitle("Detection (risk controls) by Failure Item No.")+xlab("Detection (risk controls)")+ylab("Occurrence")
  p1<-p1+scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10,11),limits = c(1,11))+scale_y_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11),limits=c(1,11))
  p1<-p1 + annotate("text", x =2.4, y = 11,size=4.5, label = "Controls")+annotate("text", x = 9, y = 11, label = "Lack of Controls",size=4.5)
  p1<-p1+geom_segment(aes(x = 3.0, y = 11, xend = 8, yend = 11, colour = "red"),arrow = arrow(length = unit(3,"mm")))
  p1

return(p1)

}
