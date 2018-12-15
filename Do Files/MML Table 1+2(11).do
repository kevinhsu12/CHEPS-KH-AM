**********************************************************
***       FINAL TABLE 1 AND TABLE 2               *******
**********************************************************
***       Done by Kevin Hsu and Alicia Marquez         ***
***       under the supervision of Joseph Sabia        ***
***    within CHEPS at San Diego State University      ***
**********************************************************
capture log close
clear all
capture cd "/Users/Kevin/Documents/MML/Data Files"
capture cd "F:\MML project\data" 
set more 1

**********************************
*** SUMMARY STATISTICS TABLE 1 ***
**********************************
logistic marijuana30 mml_share  age male grade10 grade11 grade12 black otherrace ///
rml_share MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year, cl(fips)  level(95)
keep if e(sample)

capture estimates clear
estpost sum marijuana30 mfreq drugschool age male grade9 grade10 grade11 grade12 ///
black white otherrace mml_share rml_share  MJ_decrim BAC08 rbeertax lnrsi unemployment if mml_share>0, meanonly
eststo q1

estpost sum marijuana30 mfreq drugschool age male grade9 grade10 grade11 grade12 ///
black white otherrace mml_share rml_share  MJ_decrim BAC08 rbeertax lnrsi unemployment if mml_share==0, meanonly
eststo q2

esttab q1 q2 using TABLE1.csv, replace cells("mean")   ///
title("Table 1. Descriptive Statistics: YRBS 1993-2017") 

capture log close
*********************************
***       TABLE 2 PANEL 1     ***
*********************************
log using TABLE3_PANEL1.log, replace

foreach i in marijuana30  mfreq {
use "MMLAnalysis_17.dta", clear

display "Full Regression- All Individual Controls - All State Controls"
logistic `i' mml_share  age male grade10 grade11 grade12 black otherrace ///
rml_share MJ_decrim BAC08 rbeertax lnrsi unemployment ///
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
rml_share MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year, cl(fips)  level(95)
}

log close
*********************************
***         TABLE 2 PANEL 2   ***
*********************************
log using TABLE2_PANEL2.log, replace

foreach i in marijuana30  mfreq {
use "MMLAnalysis_17.dta", clear

display "Full Regression- All Individual Controls - All State Controls"
logistic `i' mml_registry mml_collective mml_pain mml_dispensary ///
rml_share age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year, cl(fips)  level(95)
keep if e(sample)

display "Only State and Year Controls"
logistic `i'  mml_registry mml_collective mml_pain mml_dispensary  ///
i.fips i.year, cl(fips)  level(95)


display "All Individual Controls"
logistic `i'  mml_registry mml_collective mml_pain mml_dispensary  ///
age male grade10 grade11 grade12 black otherrace ///
i.fips i.year, cl(fips)  level(95)


display "Full Regression- All Individual Controls - All State Controls"	
logistic `i'  mml_registry mml_collective mml_pain mml_dispensary ///
age male grade10 grade11 grade12 black otherrace ///
rml_share MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year, cl(fips)  level(95)

}
log close
*********************************
***        TABLE 2 PANEL 3    ***
*********************************
log using TABLE2_PANEL3_years, replace

foreach i in marijuana30  mfreq {
use "MMLAnalysis_17.dta", clear

display "Full Regression- All Individual Controls - All State Controls + LEADS/LAGS"	
logistic `i' mmllead4p mmllead3 mmllead2 dummy mmllaw mmllag1 mmllag2 mmllag3p ///
age male grade10 grade11 grade12 black otherrace ///
rml_share MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year, cl(fips)  level(95)
keep if e(sample)

display "No Controls"
logistic `i' mmllead4p mmllead3 mmllead2 dummy mmllaw mmllag1 mmllag2 mmllag3p ///
i.fips i.year, cl(fips)  level(95)

display "Individual Controls"
logistic `i' mmllead4p mmllead3 mmllead2 dummy mmllaw mmllag1 mmllag2 mmllag3p ///
age male grade10 grade11 grade12 black otherrace ///
i.fips i.year, cl(fips)  level(95)

display "Full Regression- All Individual Controls - All State Controls + LEADS/LAGS"	
logistic `i' mmllead4p mmllead3 mmllead2 dummy mmllaw mmllag1 mmllag2 mmllag3p ///
age male grade10 grade11 grade12 black otherrace ///
rml_share MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year, cl(fips)  level(95)

}
log close

