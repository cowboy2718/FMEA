# IRRCalc
Incident Rate Ratio Calculator
Tony Gojanovic


## Background

This simple calcultor computes the ratio of two incident rates (r1/r2) along with a 95% confidence interals.  Specifically, calculating the following quantities:

IRR = (cases_post_intervention/time_post_intervention) / (cases_pre_intervention/time_pre_intervention)

CI = exp(ln(IRR) +/- 1.96*sqrt(1/cases_pre_intervention + 1/cases_post_intervention))

So, IRR is Incident Rate Ratio and in the abouve, caes pre and post are measured in "person years" but other types of standardizing factors may be used as well.

## Create an Example Package in R 

Package: IRRCalc  
GitHub:  https://github.com/cowboy2718/IRRCalc

## Data Source

Data for this calculator is input by the user.

### Travis Badge

The following indicates the status of the most recent build with Travis:

[![Build Status](https://travis-ci.org/cowboy2718/IRRCalc.svg?branch=master)](https://travis-ci.org/cowboy2718/IRRCalc)

### References

Algoritms based on Algorithm based on "Comparing two incident rate ratios,” https://stats.stackexchange.com/questions/297994/comparing-two-incidence-rate-ratios

## Useful Links in the Development of this Package:

The following were very useful links used in the development of this project.

* [Building R Packages in R Studio, John Muschelli](https://www.youtube.com/watch?v=OIirKRgIsdc) 
* [Putting your R Package on Github, Karl Broman](http://kbroman.org/pkg_primer/pages/github.html) 
* [RStudio & Github Integration, James Dayhuff](https://www.youtube.com/watch?v=E2d91v1Twcc&t=597s) 
* [Creating RStudio projects from GitHub Repositories, Nicholas Reich ](https://www.youtube.com/watch?v=YxZ8J2rqhEM) 
* [Developing R Packages | Part 7: Unit Testing, Colin Pistell](https://www.youtube.com/watch?v=u2KDSY_8Ay4) 
* [Travis CI Tutorial - How to Use Travis CI with Github for Continuous Integration, Full Stack Academy](https://www.youtube.com/watch?v=Uft5KBimzyk)