**********************************************************
***       2017 LOGISTIC REGRESSIONS(EVENTS)        *******
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

*** MML WAVES
log using mmlsharewaves.log, replace

foreach i in marijuana30  mfreq {
display "THESE ARE REGRESSIONS FOR `i'"
use "MMLAnalysis_17.dta", clear
display "Full Regression- All LEADS - ALL LAGS"
logistic `i' mmllead4p_sharewave mmllead3_sharewave mmllead2_sharewave dummy mmllaw_sharewave mmllag1_sharewave mmllag2_sharewave mmllag3p_sharewave  ///
rml_share age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year, cl(fips)  level(95)
keep if e(sample)

display "Only State and Year Controls"
logistic `i' mml_share ///
i.fips i.year, cl(fips) level(95)

display "All Individual Controls No State Controls"
logistic `i' mml_share ///
age male grade10 grade11 grade12 black otherrace ///
i.fips i.year, cl(fips)  level(95)

display "All Individual and State Individual Controls"
logistic `i' mml_share ///
age male grade10 grade11 grade12 black otherrace ///
rml_share MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year, cl(fips)  level(95)

display "Full Regression- All Individual Controls - All State Controls + LEADS ONLY"	
logistic `i'  mmllead4p_sharewave mmllead3_sharewave mmllead2_sharewave dummy mml_share ///
age male grade10 grade11 grade12 black otherrace ///
rml_share MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year, cl(fips)  level(95)


display "Full Regression- All Individual Controls - All State Controls + LEADS/LAGS"	
logistic `i'  mmllead4p_sharewave mmllead3_sharewave mmllead2_sharewave dummy mmllaw_sharewave mmllag1_sharewave mmllag2_sharewave mmllag3p_sharewave ///
age male grade10 grade11 grade12 black otherrace ///
rml_share MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year, cl(fips)  level(95)

}
log close

foreach i in marijuana30  mfreq {
use "MMLAnalysis_17.dta", clear
logistic `i'  mmllead4p_sharewave mmllead3_sharewave mmllead2_sharewave dummy mmllaw_sharewave mmllag1_sharewave mmllag2_sharewave mmllag3p_sharewave ///
age male grade10 grade11 grade12 black otherrace ///
rml_share MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year, cl(fips)  level(95)


}


*** MML OMIT LAST WAVE
log using mmlshares_lastwave_omit.log, replace

foreach i in marijuana30  mfreq {

use "MMLAnalysis_17.dta", clear
display "Full Regression- All Individual Controls - All State Controls + LEADS/LAGS"	
logistic `i' dummy  mmllead3_sharewave mmllead2_sharewave mmllead1_sharewave mmllaw_sharewave mmllag1_sharewave mmllag2_sharewave mmllag3p_sharewave ///
age male grade10 grade11 grade12 black otherrace ///
rml_share MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year, cl(fips)  level(95)
keep if e(sample)

display "No Controls"	
logistic `i' dummy  mmllead3_sharewave mmllead2_sharewave mmllead1_sharewave mmllaw_sharewave mmllag1_sharewave mmllag2_sharewave mmllag3p_sharewave ///
i.fips i.year, cl(fips)  level(95)

display "Individual Controls"
logistic `i' dummy  mmllead3_sharewave mmllead2_sharewave mmllead1_sharewave mmllaw_sharewave mmllag1_sharewave mmllag2_sharewave mmllag3p_sharewave ///
age male grade10 grade11 grade12 black otherrace ///
i.fips i.year, cl(fips)  level(95)

display "All Controls"
logistic `i' dummy  mmllead3_sharewave mmllead2_sharewave mmllead1_sharewave mmllaw_sharewave mmllag1_sharewave mmllag2_sharewave mmllag3p_sharewave ///
age male grade10 grade11 grade12 black otherrace ///
rml_share MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year, cl(fips)  level(95)

}

log close

log using mmlshare_years, replace
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
