**************************************************
***       2017 LOGISTIC REGRESSIONS        *******
**************************************************
***    Done by Kevin Hsu and Alicia Marquez    ***
***    under the supervision of Joseph Sabia   ***
*** within CHEPS at San Diego State University ***
**************************************************
capture log close
clear all
capture cd "/Users/Kevin/Documents/MML/Data Files"
capture cd "F:\MML project\data" 
set more 1

use "MMLAnalysis_17.dta"

foreach i in marijuana30  mfreq drugschool  {

use "MMLAnalysis_17.dta", clear

logistic `i' mml_share rml_share ///
i.fips i.year, cl(fips) level(95)

outreg2 using `i'_logistic,  word wide replace ///
	addtext("Adjusted for individual-level covariates listed in Table 1", "No", "Adjusted for state-level covariates listed in Table 1", "No") ///
	keep (mml_share rml_share) nocons nor2 dec(4)


logistic `i' mml_share rml_share age male grade10 grade11 grade12 black otherrace ///
i.fips i.year, cl(fips) level(95)

outreg2 using `i'_logistic,  word wide append ///
	addtext("Adjusted for individual-level covariates listed in Table 1", "Yes", "Adjusted for state-level covariates listed in Table 1", "No") ///
	keep (mml_share rml_share) nocons nor2 dec(4)

logistic `i' mml_share rml_share age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year, cl(fips) level(95)


outreg2 using `i'_logistic,  word wide append ///
	addtext("Adjusted for individual-level covariates listed in Table 1", "Yes", "Adjusted for state-level covariates listed in Table 1", "Yes") ///
	keep (mml_share rml_share) nocons nor2 dec(4)

}

use "MMLAnalysis_17.dta", clear
xi:reg marijuana30 mml_share rml_share age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment  ///
i.fips i.year, cl(fips) level(95)
keep if e(sample)

**************************************
*** TABLE 1 Descriptive Statistics ***
**************************************
capture estimates clear
estpost sum marijuana30 mfreq drugschool age male grade9 grade10 grade11 grade12 ///
black white otherrace rml_share MJ_decrim BAC08 rbeertax lnrsi unemployment if mml_share>0, meanonly
eststo q1

estpost sum marijuana30 mfreq drugschool age male grade9 grade10 grade11 grade12 ///
black white otherrace rml_share MJ_decrim BAC08 rbeertax lnrsi unemployment if mml_share==0, meanonly
eststo q2


esttab q1 q2 using summary_logistic.csv, replace cells("mean")   ///
title("Table 1. Descriptive Statistics: YRBS 1993-2017") 

