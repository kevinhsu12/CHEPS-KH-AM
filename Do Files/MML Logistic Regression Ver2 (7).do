**********************************************************
***       2017 LOGISTIC REGRESSIONS(NO RML)        *******
**********************************************************
***       Done by Kevin Hsu and Alicia Marquez         ***
***       under the supervision of Joseph Sabia        ***
***    within CHEPS at San Diego State University      ***
**********************************************************
capture log close
log using Logistic_VER2.log, replace
clear all
capture cd "/Users/Kevin/Documents/MML/Data Files"
capture cd "F:\MML project\data" 
set more 1

use "MMLAnalysis_17.dta"

foreach i in marijuana30  mfreq {

use "MMLAnalysis_17.dta", clear
display "Full Regression- All Individual Controls - All State Controls"
logistic `i' mml_share  age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year, cl(fips)  level(95)
keep if e(sample)

display "Only State and Year Controls"
logistic `i' mml_share  ///
i.fips i.year, cl(fips)  level(95)


display "All Individual Controls"
logistic `i' mml_share  age male grade10 grade11 grade12 black otherrace ///
i.fips i.year, cl(fips)  level(95)


display "Full Regression- All Individual Controls - All State Controls"	
logistic `i' mml_share  age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year, cl(fips)  level(95)


display "Full Regression- All Individual Controls - All State Controls + State Linear Time Trends"	
xi:logistic `i' mml_share  age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips*time i.year, cl(fips) level(95)


}

use "MMLAnalysis_17.dta", clear
**************************************
*** TABLE 1 Descriptive Statistics ***
**************************************
logistic marijuana30 mml_share  age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year, cl(fips)  level(95)
keep if e(sample)

capture estimates clear
estpost sum marijuana30 mfreq drugschool age male grade9 grade10 grade11 grade12 ///
black white otherrace mml_share  MJ_decrim BAC08 rbeertax lnrsi unemployment if mml_share>0, meanonly
eststo q1

estpost sum marijuana30 mfreq drugschool age male grade9 grade10 grade11 grade12 ///
black white otherrace mml_share  MJ_decrim BAC08 rbeertax lnrsi unemployment if mml_share==0, meanonly
eststo q2


esttab q1 q2 using summary_logistic.csv, replace cells("mean")   ///
title("Table 1. Descriptive Statistics: YRBS 1993-2017") 

log close

