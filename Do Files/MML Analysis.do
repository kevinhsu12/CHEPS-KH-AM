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
capture drop _merge




*****************************
*** COMPARE YEARS OF DATA ***
*****************************
rename age_new age
*keep if inrange(year,1993,2011) 


table state year 


**************************
*** SUMMARY STATISTICS ***
**************************
gen other_race = 1 if otherrace==1 | hispanic == 1
replace other_race = 0 if otherrace==0 & hispanic == 0
drop hispanic

replace otherrace = other_race

label variable white White
label variable black Black
label variable other_race "Other Race"
label variable marijuana30 "Marijuana Use in Past 30 days"
label variable mfreq "Frequent Marijuana Use in Past 30 Days"
label variable drugschool "Offered, Sold, or Given Drug on School Property"
label variable mschool "Marijuana Use at School in Past 30 days"
***************
*** TABLE 6 ***
***************
drop if race4==.
drop if age==.
drop if male==.


sum marijuana30 mfreq mschool drugschool age male grade9 grade10 grade11 grade12 ///
black white otherrace beertax unemployment if mml==0 // Need BAC .08 Law and Real State Income


sum marijuana30 mfreq mschool drugschool age male grade9 grade10 grade11 grade12 ///
black white otherrace beertax unemployment if mml==1 // Need BAC .08 Law and Real State Income

***merge in seer weight
gen seer_year=year
*capture merge m:1 fips seer_year age white black otherrace male female using "F:\MML project\data\seer_weights.dta"
merge m:1 fips seer_year age white black otherrace male female using "seer_weights_mml.dta"
drop if _merge==2
drop _merge

preserve
collapse (mean) marijuana30 mfreq mschool [aweight=seer_weight], by(seer_year)

twoway (line marijuana30 seer_year) (line mfreq seer_year, lpattern(longdash)) (line mschool seer_year, lpattern(vshortdash)), ///
ytitle(Marijuana Use) xtitle(Year) title("Figure 2: Past 30 Day Marijuana Use") ///
subtitle(State YRBS 1993-2011) xlabel(1993(2)2011) legend(on) ///
legend( label (1 "Any Use") label (2 "Frequent Use") label (3 "Any Use on School Property")) note("SEER Weighted Means")
restore

preserve 
collapse (mean) marijuana30 mfreq mschool, by(seer_year)

twoway (line marijuana30 seer_year) (line mfreq seer_year, lpattern(longdash)) (line mschool seer_year, lpattern(vshortdash)), ///
ytitle(Marijuana Use) xtitle(Year) title("Figure 2: Past 30 Day Marijuana Use") ///
subtitle(State YRBS 1993-2011) xlabel(1993(2)2011) legend(on) ///
legend( label (1 "Any Use") label (2 "Frequent Use") label (3 "Any Use on School Property")) note("Unweighted Means")

restore


*** REGRESSION TABLE 1
xi:reg marijuana30 mml age male grade10 grade11 grade12 black otherrace ///
i.fips i.year if inrange(year,1993,2011), cl(fips) level(95)

xi:reg marijuana30 mml age male grade10 grade11 grade12 black otherrace ///
 MJ_decrim BAC08 beertax lnpcinc unemployment ///
 i.fips i.year if inrange(year,1991,2011), cl(fips) level(95)

