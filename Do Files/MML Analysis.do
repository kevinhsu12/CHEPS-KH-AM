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
keep if inrange(year,1993,2011) // I forget the years


table state year 


**************************
*** SUMMARY STATISTICS ***
**************************

merge 1:m fips using "mmlyears.dta"

***creating mml variable
gen mml=.
replace mml=1 if mml_year>=year
replace mml=0 if mml_year<year

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

***idk if i separated lines correctly
***will the mml==1 condition still apply to all?
sum marijuana30 mfreq mschool drugschool age male ///
grade9 grade10 grade11 grade 12 black white otherrace2 ///
beertax unemployement if mml==0

sum marijuana30 mfreq mschool drugschool age male ///
grade9 grade10 grade11 grade 12 black white otherrace2 ///
beertax unemployement if mml==1
