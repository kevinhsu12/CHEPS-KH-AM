***NOTE TO ALICIA
*IF THE REGRESSION OUTPUT LOOKS WEIRD OR EXTREMELY LARGE AT ANY POINT
*BREAK THE REGRESSION DOWN BY COMPONENTS LIKE WE ORIGINALLY TESTED AND SEE
*WHICH VARIABLE IS CAUSING THE HUGE JUMPS

**************************************************
***     MEDICAL MARIJUANA REPLICATION      *******
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

program define table_2

foreach i in marijuana30  mfreq  {

use "MMLAnalysis_17.dta", clear
*** REGRESSION TABLE 1 - 1993-2017
*** NATIONAL
keep if inrange(year,`1',`2')
xi:reg `i' mml_share age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year if inrange(year,`1',`2') & national==1 [pw=seer_weight], cl(fips) level(95)

outreg2 using `i'_table_weighted_`1'_`2',  word wide replace ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "No", "State-specific trends", "No") ///
	keep (mml_share) ///
	nocons nor2 dec(4) ///

xi:reg `i' mml_share age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year if inrange(year,`1',`2') & national==1 [pw=seer_weight], cl(fips) level(95)

outreg2 using `i'_table_weighted_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "No") ///
	keep (mml_share) ///
	ctitle ("National YRBS") ///
	nocons nor2 dec(4) ///
	

xi:reg `i' mml_share age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips*time i.year if inrange(year,`1',`2') & national==1 [pw=seer_weight], cl(fips) level(95)

outreg2 using `i'_table_weighted_`1'_`2', word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "Yes") ///
	keep (mml_share) ///
	nocons nor2 dec(4) ///
	
*** STATE
xi:reg `i' mml_share age male grade10 grade11 grade12 black otherrace ///
i.fips i.year if inrange(year,`1',`2') & national==0 [pw=seer_weight], cl(fips) level(95)

outreg2 using `i'_table_weighted_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "No", "State-specific trends", "No") ///
	keep (mml_share) ///
	nocons nor2 dec(4) ///


xi:reg `i' mml_share age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year if inrange(year,`1',`2') & national==0 [pw=seer_weight], cl(fips) level(95)

outreg2 using `i'_table_weighted_`1'_`2', word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "No") ///
	keep (mml_share) ///
	ctitle ("State YRBS") ///
	nocons nor2 dec(4) ///


xi:reg `i' mml_share age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips*time i.year if inrange(year,`1',`2') & national==0 [pw=seer_weight], cl(fips) level(95)

outreg2 using `i'_table_weighted_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "Yes") ///
	keep (mml_share) ///
	nocons nor2 dec(4) ///


*** STATE AND NATIONAL
xi:reg `i' mml_share age male grade10 grade11 grade12 black otherrace ///
i.fips i.year if inrange(year,`1',`2') [pw=seer_weight], cl(fips) level(95)

outreg2 using `i'_table_weighted_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "No", "State-specific trends", "No") ///
	keep (mml_share) ///
	nocons nor2 dec(4) ///


xi:reg `i' mml_share age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year if inrange(year,`1',`2') [pw=seer_weight], cl(fips) level(95)

outreg2 using `i'_table_weighted_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "No") ///
	keep (mml_share) ///
	ctitle ("Combined YRBS") ///
	nocons nor2 dec(4) ///


xi:reg `i' mml_share age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips*time i.year if inrange(year,`1',`2') [pw=seer_weight], cl(fips) level(95)

outreg2 using `i'_table_weighted_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "Yes") ///
	keep (mml_share) ///
	title ("Table2. Medical Marijuana Laws and Youth Consumption, `1'-`2'") ///
	nocons nor2 dec(4) ///
	addnote ("Each cell represents a separate OLS estimate based on data from the YRBS. Standard errors, corrected for clustering at the state level,are in parentheses")

	}
	
end 


program define table_5
foreach i in drugschool mschool  {
use "MMLAnalysis_17.dta", clear
*** REGRESSION TABLE 1 - 
*** NATIONAL
xi:reg `i' mml_share age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips*time i.year if inrange(year,`1',`2') & national==1 [pw=seer_weight], cl(fips) level(95)

outreg2 using `i'_table_weighted_`1'_`2', word wide replace ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "Yes") ///
	keep (mml_share) ctitle ("National YRBS") ///
	nocons nor2 dec(4) ///
	
*** STATE
xi:reg `i' mml_share age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips*time i.year if inrange(year,`1',`2') & national==0 [pw=seer_weight], cl(fips) level(95)

outreg2 using `i'_table_weighted_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "Yes") ///
	keep (mml_share) ctitle ("State YRBS") ///
	nocons nor2 dec(4) ///


*** STATE AND NATIONAL
xi:reg `i' mml_share age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips*time i.year if inrange(year,`1',`2') [pw=seer_weight], cl(fips) level(95)

outreg2 using `i'_table_weighted_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "Yes") ///
	keep (mml_share) ///
	title ("Table5. Medical Marijuana Laws and School Accessibility, `1'-`2'") ///
	nocons nor2 dec(4) ///
	addnote ("Each cell represents a separate OLS estimate based on data from the YRBS. Standard errors, corrected for clustering at the state level,are in parentheses")
}
end

*** T	
table_2 1993 2011
table_2 1993 2017
table-2 2011 2017

*** TABLE 5 REGRESSIONS
table_5 1993 2011
table_5 1993 2017
table_5 2011 2017

program define sum_stat
*** SUMMARY TABLES
use "MMLAnalysis_17.dta", clear
keep if inrange(year,`1',`2')
xi:reg marijuana30 mml_share age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment  ///
i.fips i.year if inrange(year, `1',`2'), cl(fips) level(95)
keep if e(sample)

**********************************
*** TABLE 6 SUMMARY TABLE \ ***
**********************************
capture estimates clear
*** NATIONAL
estpost sum marijuana30 mfreq mschool drugschool age male grade9 grade10 grade11 grade12 ///
black white otherrace MJ_decrim BAC08 rbeertax lnrsi unemployment if mml_share>0 & national==1 [aw=seer_weight] , meanonly
eststo q1

estpost sum marijuana30 mfreq mschool drugschool age male grade9 grade10 grade11 grade12 ///
black white otherrace MJ_decrim BAC08 rbeertax lnrsi unemployment if mml_share==0  & national==1 [aw=seer_weight] , meanonly
eststo q2

*** STATE 
estpost sum marijuana30 mfreq mschool drugschool age male grade9 grade10 grade11 grade12 ///
black white otherrace MJ_decrim BAC08 rbeertax lnrsi unemployment if mml_share>0 & national==0 [aw=seer_weight], meanonly
eststo  q3

estpost sum marijuana30 mfreq mschool drugschool age male grade9 grade10 grade11 grade12 ///
black white otherrace MJ_decrim BAC08 rbeertax lnrsi unemployment if mml_share==0  & national==0 [aw=seer_weight] , meanonly
eststo  q4

esttab q1 q2 q3 q4 using summary_`1'_`2'_weighted.csv, replace cells("mean")   ///
title("Summary Statistics Weighted `1'-`2'") 
end 
sum_stat 1993 2011
sum_stat 1993 2017
sum_stat 2011 2017
