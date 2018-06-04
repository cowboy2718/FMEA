# FMEA
Failure Mode and Effects Analysis (FMEA) with R  
Tony Gojanovic


## Background

This package creates a set of graphs depicting the risk of an FMEA.  Specifically, severity, occurrence and detection of an FMEA exercise are plotted.

## Create an Example Package in R 

Package: FMEA   
GitHub:  https://github.com/cowboy2718/FMEA

## Data Source

Data for this function is input by the user (typically the FMEA session is captured in an Excel workbook).  The following fields are what the FMEA package will use when imported.  Data must be tidy.

|Field          | Description                                 | Data type                           |
 -------------- | --------------------------------------------| ------------------------------------|  
|item_no        | risk item identifier                        | Character string                    |
|process_step   | process or design phase                     | Character string                    |
|function       | what the item's function does               | Character string                    |
|requirements   | what are criteria for success               | Character string                    |
|failure        | how the item might fail                     | Character string                    |
|effect         | what is the effect of failure               | Character string                    |
|severity       | the failure severity rating                 | Integer (typically between 1 and 10)|
|cause          | cause of the failure                        | Character string                    |
|occurrence     | the likelihood of the cause                 | Integer (typically between 1 and 10)|
|hazard         | hazard = severity x occurrence              | Calculated numeric                  |
|controls       | what will detect the failure or cause       | Character string                    |
|detection      | the effectiveness of the controls           | Integer (typically between 1 and 10)|
|rpn            | rpn = severity x occurrence x detection     | Calculated numeric                  |
|mitigation     | how to mitigate the failure                 | Character string                    |
|responsibility | who owns the mitigation activity            | Character string                    |
|date           | when the mitigation will be completed       | Date                                |
|car_status     | status of the mitigation activity           | Character string                    |
|sev_1          | updated severity after mitigation           | Integer (typically between 1 and 10)|
|occ_1          | updated occurrence after mitigation         | Integer (typically between 1 and 10)|
|det_1          | updated detection after mitigation          | Integer (typically between 1 and 10)|
|RPN            | updated risk priority number                | Calculated numeric                  |

### Travis Badge

The following indicates the status of the most recent build with Travis:

### References

## Useful Links in the Development of this Package:

The following were very useful links used in the development of this project.

* [Building R Packages in R Studio, John Muschelli](https://www.youtube.com/watch?v=OIirKRgIsdc) 
* [Putting your R Package on Github, Karl Broman](http://kbroman.org/pkg_primer/pages/github.html) 
* [RStudio & Github Integration, James Dayhuff](https://www.youtube.com/watch?v=E2d91v1Twcc&t=597s) 
* [Creating RStudio projects from GitHub Repositories, Nicholas Reich ](https://www.youtube.com/watch?v=YxZ8J2rqhEM) 
* [Developing R Packages | Part 7: Unit Testing, Colin Pistell](https://www.youtube.com/watch?v=u2KDSY_8Ay4) 
* [Travis CI Tutorial - How to Use Travis CI with Github for Continuous Integration, Full Stack Academy](https://www.youtube.com/watch?v=Uft5KBimzyk)