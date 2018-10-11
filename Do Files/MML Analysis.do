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

program define mml_regress 

foreach i in marijuana30  mfreq drugschool mschool  {

use "MMLAnalysis_17.dta", clear
*** REGRESSION TABLE 1 - 1993-2017
*** NATIONAL
keep if inrange(year,`1',`2')
xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
i.fips i.year if inrange(year,`1',`2') & national==1, cl(fips) level(95)

outreg2 using `i'_table_`1'_`2',  word wide replace ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "No", "State-specific trends", "No") ///
	keep (mml) ///
	nocons nor2 dec(4) ///

xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year if inrange(year,`1',`2') & national==1, cl(fips) level(95)

outreg2 using `i'_table_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "No") ///
	keep (mml) ///
	ctitle ("National YRBS") ///
	nocons nor2 dec(4) ///
	

xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips*time i.year if inrange(year,`1',`2') & national==1, cl(fips) level(95)

outreg2 using `i'_table_`1'_`2', word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "Yes") ///
	keep (mml) ///
	nocons nor2 dec(4) ///
	
*** STATE
xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
i.fips i.year if inrange(year,`1',`2') & national==0, cl(fips) level(95)

outreg2 using `i'_table_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "No", "State-specific trends", "No") ///
	keep (mml) ///
	nocons nor2 dec(4) ///


xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year if inrange(year,`1',`2') & national==0, cl(fips) level(95)

outreg2 using `i'_table_`1'_`2', word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "No") ///
	keep (mml) ///
	ctitle ("State YRBS") ///
	nocons nor2 dec(4) ///


xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips*time i.year if inrange(year,`1',`2') & national==0, cl(fips) level(95)

outreg2 using `i'_table_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "Yes") ///
	keep (mml) ///
	nocons nor2 dec(4) ///


*** STATE AND NATIONAL
xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
i.fips i.year if inrange(year,`1',`2'), cl(fips) level(95)

outreg2 using `i'_table_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "No", "State-specific trends", "No") ///
	keep (mml) ///
	nocons nor2 dec(4) ///


xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year if inrange(year,`1',`2'), cl(fips) level(95)

outreg2 using `i'_table_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "No") ///
	keep (mml) ///
	ctitle ("Combined YRBS") ///
	nocons nor2 dec(4) ///


xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips*time i.year if inrange(year,`1',`2'), cl(fips) level(95)

outreg2 using `i'_table_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "Yes") ///
	keep (mml) ///
	title ("Table2. Medical Marijuana Laws and Youth Consumption, `1'-`2'") ///
	nocons nor2 dec(4) ///
	addnote ("Each cell represents a separate OLS estimate based on data from the YRBS. Standard errors, corrected for clustering at the state level,are in parentheses")

	}
end 


program define mml_regress_other
foreach i in marijuana30  mfreq drugschool  {
use "MMLAnalysis_17.dta", clear
*** REGRESSION TABLE 1 - 
*** NATIONAL
keep if inrange(year,`1',`2')
xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
i.fips i.year if inrange(year,`1',`2') & national==1, cl(fips) level(95)

outreg2 using `i'_table_`1'_`2',  word wide replace ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "No", "State-specific trends", "No") ///
	keep (mml) ///
	nocons nor2 dec(4) ///

xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year if inrange(year,`1',`2') & national==1, cl(fips) level(95)

outreg2 using `i'_table_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "No") ///
	keep (mml) ///
	ctitle ("National YRBS") ///
	nocons nor2 dec(4) ///
	

xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips*time i.year if inrange(year,`1',`2') & national==1, cl(fips) level(95)

outreg2 using `i'_table_`1'_`2', word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "Yes") ///
	keep (mml) ///
	nocons nor2 dec(4) ///
	
*** STATE
xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
i.fips i.year if inrange(year,`1',`2') & national==0, cl(fips) level(95)

outreg2 using `i'_table_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "No", "State-specific trends", "No") ///
	keep (mml) ///
	nocons nor2 dec(4) ///


xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year if inrange(year,`1',`2') & national==0, cl(fips) level(95)

outreg2 using `i'_table_`1'_`2', word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "No") ///
	keep (mml) ///
	ctitle ("State YRBS") ///
	nocons nor2 dec(4) ///


xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips*time i.year if inrange(year,`1',`2') & national==0, cl(fips) level(95)

outreg2 using `i'_table_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "Yes") ///
	keep (mml) ///
	nocons nor2 dec(4) ///


*** STATE AND NATIONAL
xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
i.fips i.year if inrange(year,`1',`2'), cl(fips) level(95)

outreg2 using `i'_table_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "No", "State-specific trends", "No") ///
	keep (mml) ///
	nocons nor2 dec(4) ///


xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips i.year if inrange(year,`1',`2'), cl(fips) level(95)

outreg2 using `i'_table_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "No") ///
	keep (mml) ///
	ctitle ("Combined YRBS") ///
	nocons nor2 dec(4) ///


xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment ///
i.fips*time i.year if inrange(year,`1',`2'), cl(fips) level(95)

outreg2 using `i'_table_`1'_`2',  word wide append ///
	addtext("State FEs", "Yes", "Year FEs", "Yes", "Covariates", "Yes", "State-specific trends", "Yes") ///
	keep (mml) ///
	title ("Table2. Medical Marijuana Laws and Youth Consumption, `1'-`2'") ///
	nocons nor2 dec(4) ///
	addnote ("Each cell represents a separate OLS estimate based on data from the YRBS. Standard errors, corrected for clustering at the state level,are in parentheses")
}
end

*** REGRESSION 1993-2017	
mml_regress 1993 2011
*** REGRESSION 1993-2017
mml_regress 1993 2017
*** REGRESSION 2013-2017
mml_regress_other 2013 2017


program define sum_stat
*** SUMMARY TABLES
use "MMLAnalysis_17.dta", clear
keep if inrange(year,`1',`2')
xi:reg marijuana30 mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 rbeertax lnrsi unemployment  ///
i.fips i.year if inrange(year, `1',`2'), cl(fips) level(95)
keep if e(sample)

**********************************
*** TABLE 6 SUMMARY TABLE 2011 ***
**********************************
capture estimates clear
*** NATIONAL
sum marijuana30 mfreq mschool drugschool age male grade9 grade10 grade11 grade12 ///
black white otherrace MJ_decrim BAC08 rbeertax lnrsi unemployment if mml==0 & national==1 
estpost store q1

sum marijuana30 mfreq mschool drugschool age male grade9 grade10 grade11 grade12 ///
black white otherrace MJ_decrim BAC08 rbeertax lnrsi unemployment if mml==1  & national==1 
estpost store q2

*** STATE 
sum marijuana30 mfreq mschool drugschool age male grade9 grade10 grade11 grade12 ///
black white otherrace MJ_decrim BAC08 rbeertax lnrsi unemployment if mml==0 & national==0
estpost store q3

sum marijuana30 mfreq mschool drugschool age male grade9 grade10 grade11 grade12 ///
black white otherrace MJ_decrim BAC08 rbeertax lnrsi unemployment if mml==1  & national==0
estpost store q4

esttab q1 q2 q3 q4 using summary_`1'_`2', label rtf replace 
end 
sum_stat 1993 2011
sum_stat 1993 2017
sum_stat 2013 2017

***********************
*** FIGURES 1-4 FOR ***
***********************
use "MMLAnalysis_17.dta", clear
*** FIGURE 1 - BASED ON WEIGHTED DATA FROM NATIONAL YRBS
preserve
keep if national==1
collapse (mean) marijuana30 mfreq mschool [aweight=weight], by(seer_year)

twoway (line marijuana30 seer_year) (line mfreq seer_year, lpattern(longdash)) (line mschool seer_year, lpattern(vshortdash)), ///
ytitle(Marijuana Use) xtitle(Year) title("Figure 2: Past 30 Day Marijuana Use") ///
subtitle(National YRBS 1993-2017) xlabel(1993(2)2017) legend(on) ///
legend( label (1 "Any Use") label (2 "Frequent Use") label (3 "Any Use on School Property")) note("SEER Weighted Means") ///
note("Based on weighted data from the National YRBS") 
graph export Figure_1_MML.png, replace
restore

*** FIGURE 2 - BASED ON UNWEIGHTED DATA FROM STATE YRBS
preserve 
keep if national==0 
collapse (mean) marijuana30 mfreq mschool, by(seer_year)

twoway (line marijuana30 seer_year) (line mfreq seer_year, lpattern(longdash)) (line mschool seer_year, lpattern(vshortdash)), ///
ytitle(Marijuana Use) xtitle(Year) title("Figure 2: Past 30 Day Marijuana Use") ///
subtitle(State YRBS 1993-2017) xlabel(1993(2)2017) legend(on) ///
legend( label (1 "Any Use") label (2 "Frequent Use") label (3 "Any Use on School Property")) note("Unweighted Means") ///
note("Based on unweighted data from the State YRBS") 
graph export Figure_2_MML.png, replace
restore
/*
*** GEN LAW CHANGE FOR FIGURES 3 & 4
gen fmml_year = mml_year
gen odd=mod(fmml_year,2)
replace fmml_year = fmml_year+1 if odd==0

gen law_change = 0 if fmml_year == seer_year
replace law_change = -1 if fmml_year == seer_year+1
replace law_change = -2 if fmml_year == seer_year+2
replace law_change = -3 if fmml_year == seer_year+3
replace law_change = 1 if fmml_year == seer_year-1
replace law_change = 2 if fmml_year == seer_year-2
replace law_change = 3 if fmml_year == seer_year-3
*** FIGURE 3 - BASED ON WEIGHTED DATA FROM THE NATIONAL YRBS
preserve
drop if law_change==. 
keep if national ==1
collapse (mean) marijuana30 mfreq mschool [aweight=weight], by(law_change)

twoway (line marijuana30 law_change) (line mfreq law_change, lpattern(longdash)) (line mschool law_change, lpattern(vshortdash)), ///
ytitle(Marijuana Use) xtitle(Year) title("Figure 3: Past 30 Day Marijuana Use") ///
subtitle(State YRBS 1993-2017) legend(on) ///
legend( label (1 "Any Use") label (2 "Frequent Use") label (3 "Any Use on School Property")) note("Unweighted Means") ///
note("Based on weighted data from the State YRBS") 
graph export Figure_3_MML.png, replace
restore

*** FIGURE 4 - BASED ON UNWEIGHTED DATA FROM THE STATE YRBS
preserve
drop if law_change==. 
keep if national ==0
collapse (mean) marijuana30 mfreq mschool, by(law_change)

twoway (line marijuana30 law_change) (line mfreq law_change, lpattern(longdash)) (line mschool law_change, lpattern(vshortdash)), ///
ytitle(Marijuana Use) xtitle(Year) title("Figure 2: Past 30 Day Marijuana Use") ///
subtitle(State YRBS 1993-2017) legend(on) ///
legend( label (1 "Any Use") label (2 "Frequent Use") label (3 "Any Use on School Property")) note("Unweighted Means")
note("Based on weighted data from the State YRBS") 
graph export Figure_4_MML.png, replace
restore

