**********************************************************
***       2017 LOGISTIC REGRESSIONS(OTHER )        *******
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
log using mml_othertypes.log, replace
use "MMLAnalysis_17.dta",clear 


*** MML WAVES
foreach i in marijuana30  mfreq {

use "MMLAnalysis_17.dta", clear
display "Full Regression- All Individual Controls - All State Controls"
logistic `i' mml_share mml_registry mml_collective mml_pain mml_dispensary ///
rml_share age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year, cl(fips)  level(95)
keep if e(sample)

display "Only State and Year Controls"
logistic `i' mml_share  mml_registry mml_collective mml_pain mml_dispensary  ///
i.fips i.year, cl(fips)  level(95)


display "All Individual Controls"
logistic `i' mml_share  mml_registry mml_collective mml_pain mml_dispensary  ///
age male grade10 grade11 grade12 black otherrace ///
i.fips i.year, cl(fips)  level(95)


display "Full Regression- All Individual Controls - All State Controls"	
logistic `i' mml_share  mml_registry mml_collective mml_pain mml_dispensary ///
age male grade10 grade11 grade12 black otherrace ///
rml_share MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year, cl(fips)  level(95)

}
log close

log using mml_othertypes_no_mml_share.log, replace
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
