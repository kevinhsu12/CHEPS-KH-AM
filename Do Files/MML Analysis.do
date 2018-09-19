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


*****************************
*** COMPARE YEARS OF DATA ***
*****************************
keep if inrange(year,1993,2011) 


table state year 


**************************
*** SUMMARY STATISTICS ***
**************************

merge m:1 fips using "mmlyears.dta"
drop if _merge==2

***creating mml variable
gen mml=.
replace mml=1 if year>= mml_year
replace mml=0 if mml_year>year
replace mml=0 if mml_year==.

***separate grade
gen grade9=.
replace grade9=1 if grade==9
replace grade9=0 if inlist(grade,10,11,12)

gen grade10=.
replace grade10=1 if grade==10
replace grade10=0 if inlist(grade,9,11,12)

gen grade11=.
replace grade11=1 if grade==11
replace grade11=0 if inlist(grade,9,10,12)

gen grade12=.
replace grade12=1 if grade==12
replace grade12=0 if inlist(grade,9,10,11)



***************
*** TABLE 6 ***
***************
drop if race4==.
drop if age_new==.
drop if male==.
sum marijuana30 mfreq mschool drugschool age_new male ///
 grade9 grade10 grade11 grade12 ///
 black white otherrace2 if mml==0


sum marijuana30 mfreq mschool drugschool age_new male ///
 grade9 grade10 grade11 grade12 ///
 black white otherrace2 if mml==1
