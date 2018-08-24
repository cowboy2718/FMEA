## FMEA
Failure Mode and Effects Analysis (FMEA) with R  
Tony Gojanovic  
June 2018  

### Background

This package creates a set of graphs for risk assessment and risk management. Specifically, severity, occurrence and detection as obtained through, for example, an FMEA exercise, are plotted.  However, other tools may also be used to obtaing severity, occurrence and detection values.

### R Libraries

The libraries ggplot, ggrepel and dplyr are used with this package.

### Disutility Index | Risk Assessment

A **disutility graph** or **hazard graph** is a scatterplot in which the undesirability of a failure is based on failure severity and the occurrence (likelihood) of potential causes or mechanisms of that failure happening.  In this package, random "jitter" is added to the severity and likelihood values in order to provide a more interpretable graph (severity and occurrence values are typically discrete).

### Controls | Risk Management

Detection ability is plotted against occurrence orlikelihood of potential causes or mechanisms of failure.  Essentially, it depicts the state of risk management controls. Random "jitter" is added to the detection and likelihood values in order to provide a more interpretable graph.

### Package Name and Location

Package: FMEA   
GitHub:  https://github.com/cowboy2718/FMEA

### Data Source

Data for this function is input by the user (typically the FMEA session is captured in an Excel workbook).  The following fields are what a typical FMEA worksheet possesses.  Data must be tidy.

|Field            | Description                                 | Data type                           | Required by                     |
 --------------   | --------------------------------------------| ------------------------------------| --------------------------------| 
|item_no          | risk item identifier                        | Character string                    | risk_disutility; risk_controls  |
|process_step     | process or design phase                     | Character string                    | risk_disutility; risk_controls  |
|function         | what the item's function does               | Character string                    |                                 |
|requirements     | what are criteria for success               | Character string                    |                                 |
|failure          | how the item might fail                     | Character string                    |                                 |
|effect           | what is the effect of failure               | Character string                    |                                 |
|severity         | the failure severity rating                 | Integer (typically between 1 and 10)| risk_disutility; risk_controls  |
|cause            | cause of the failure                        | Character string                    |                                 |
|occurrence       | the likelihood of the cause                 | Integer (typically between 1 and 10)| risk_disutility; risk_controls  |
|hazard           | hazard = severity x occurrence              | Calculated numeric                  |                                 |
|controls         | what will detect the failure or cause       | Character string                    |                                 |
|detection        | the effectiveness of the controls           | Integer (typically between 1 and 10)| risk_disutility; risk_controls  |
|rpn              | rpn = severity x occurrence x detection     | Calculated numeric                  |                                 |
|mitigation       | how to mitigate the failure                 | Character string                    |                                 |
|responsibility   | who owns the mitigation activity            | Character string                    |                                 |
|date             | when the mitigation will be completed       | Date                                |                                 |
|mitigation_status| status of the mitigation activity           | Character string                    |                                 |
|sev_1            | updated severity after mitigation           | Integer (typically between 1 and 10)|                                 |
|occ_1            | updated occurrence after mitigation         | Integer (typically between 1 and 10)|                                 |
|det_1            | updated detection after mitigation          | Integer (typically between 1 and 10)|                                 |
|RPN              | updated risk priority number                | Calculated numeric                  |                                 |
|verified         | was the risk mitigation action verified ?   | yes/no                              |                                 |
|validated        | was the risk mitigation action validated?   | yes/no                              |                                 |
|record           | evidence or record type                     | categorical                         |                                 |
|date_1           | update date for mitigation                  | date                                |                                 |

### Validation and Verification

Validation and verification of risk mitigation is the key to a successful risk mitigation program. Specifically,

**Verification** assures that in fact a proper corrective action has been implemented regarding a specific risk mitigation action.
Was the mitigation action completed and was the documentation completed to support all of the necessary changes?  Was the change visible and trained, etc.? 
Note: Verification may involve recreation of the problems to determine if suspect root causes are had been addressed related to the risk. This step can be by-passed since some risk states may be too risky to recreate. 

**Validation** requires proof that the risk mitigation action is sustainable and effective.  Does the mitigation action actually work the way that it should.

•	Systems are in place to sustain corrective action and prevent future occurrences. 

•	Reliable detection controls are in place and are tested. 

•	Does the mitigation action actually work the way that it should. 

•	Must be sustainable and robust.  Makeshift or temporary fixes do not apply as sustainable.  

Note: A “show me” will be a demonstration of validation i.e. that a sustainable system of reliable detection controls exist. 


### Travis Badge

The following indicates the status of the most recent build with Travis:

[![Build Status](https://travis-ci.org/cowboy2718/FMEA.svg?branch=master)](https://travis-ci.org/cowboy2718/FMEA)

### Risk Assessment and Management References:

The following are useful resources in understanding Failure Modes and Effects Analysis and risk assessment and management.

Carlson, Carl S., *Effective FMEAs: Achieving Safe, Reliable, and Economical Products and Processes Using Failure Mode and Effects Analysis*, John Wiley and Sons, New York, 2012, p. 164. 

Dussault, Heather B., "The Evolution and Practical Applications of Failure Modes and Effects Analyses", *RADC-TR-83-73*, Rome Air Development Center, Air Force Systems Command, Griffiss Air Force Base, New York, March 1983.

Haimes, Yacov Y., *Risk Modeling, Assessment, and Management*, 2nd edition, John Wiley & Sons, New York, 2004.

MacKenzie, Cameron, "Summarizing Risk Using Risk Measures and Risk Indices," peer-reviewed draft, Defense Resource Management Institute, Naval Post Graduate Schook, 2015, http://faculty.nps.edu/camacken/docs/MacKenzie%20Summarizing%20Risk%20Using%20Risk%20Measures%20and%20Risk%20Indices.pdf

Roland, Harold E., and Brian Moriarty, *System Safety Engineering and Managements*, John Wiley and Sons, New York, 1983, pp. 187 - 193.

Tversky, Amos, and Daniel Kahneman, "Judgement Under Uncertainty: Heuristics and Biases," *Science*, New Series, Vol. 185, No. 4157. (Sep. 27, 1974), pp. 1124-1131.

### Useful Links in the Development of this Package:

The following were very useful links used in the development of this project.

* [Building R Packages in R Studio, John Muschelli](https://www.youtube.com/watch?v=OIirKRgIsdc) 
* [Putting your R Package on Github, Karl Broman](http://kbroman.org/pkg_primer/pages/github.html) 
* [RStudio & Github Integration, James Dayhuff](https://www.youtube.com/watch?v=E2d91v1Twcc&t=597s) 
* [Creating RStudio projects from GitHub Repositories, Nicholas Reich ](https://www.youtube.com/watch?v=YxZ8J2rqhEM) 
* [Developing R Packages | Part 7: Unit Testing, Colin Pistell](https://www.youtube.com/watch?v=u2KDSY_8Ay4) 
* [Travis CI Tutorial - How to Use Travis CI with Github for Continuous Integration, Full Stack Academy](https://www.youtube.com/watch?v=Uft5KBimzyk)
* [Create Awesome HTML Table with knitr::kable and kableExtra, Hao Zhu](https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_html)