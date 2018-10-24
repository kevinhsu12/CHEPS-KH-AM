cd "/Users/Kevin/Documents/MML/Data Files"
********************
*** SEER WEIGHTS ***
********************
clear all
set more 1 

import delimited "/Users/Kevin/Documents/GitHub/CHEPS/SEER/us.1990_2016.singleages.adjusted.txt", delimiter("") clear 

********************
*** DELIMIT DATA ***
********************

*** KEEP AGE RANGE FROM YRBS
gen age = substr(v1,17,2)
destring age, replace
keep if inrange(age,12,18)

***DELIMITED VARIABLES
gen year = substr(v1,1,4)
destring year, replace

gen postal = substr(v1,5,2)

gen fips = substr(v1,7,2)
destring fips, replace

gen cfips = substr(v1,9,3)

gen registry = substr(v1,12,2)

gen origin = substr(v1,15,1)

gen race = substr(v1,14,1)

gen sex = substr(v1,16,1)

gen population = substr(v1,19,8)
destring population, replace

*** RACE VARIABLE // Organized as 1= White, 2=Black, 3=Hispanic, 4=Other // No Missing Race
/*
origin => Hispanic=1, Non-Hispanic=0
Race   => White=1, Black=2, 3=American Indian/Alaskan Native, 4=Asian or Pacific Islander
*/
gen race4 = 3 if origin == "1" 
replace race4 = 1 if race == "1" & origin=="0"
replace race4 = 2 if race == "2" & origin=="0"
replace race4 = 3 if race == "3" & origin=="0" | race== "4" & origin=="0"

******************************************
*** COLLAPSE BY AGE RACE FIPS AND YEAR ***
******************************************
keep age race4 fips year sex population
collapse(sum) population, by(age race4 fips year sex)

rename population seer_weight
*************************************
*** GEN INDIVIDUAL RACE VARIABLES ***
*************************************
gen white = 1 if race4==1
replace white = 0 if inlist(race4,2,3,4)

gen black = 1 if race4==2
replace black = 0 if inlist(race4,1,3,4)

gen otherrace = 1 if race4==3
replace otherrace = 0 if inlist(race4,1,2,4)

*************************
*** GEN AGE VARIABLES ***
************************* // NO MISSING AGE 
gen age_new = age

******************************
*** GEN SEX VARIABLES ********
****************************** // NO MISSING SEX
gen male = sex == "1"
gen female = sex == "2"

*PLACEHOLDER USING 2016 WEIGHT IN PLACE OF 2017
gen seer_year = year
replace seer_year = 2017 if seer_year == 2016


sort fips year age_new race4 sex

save "seer_weights_mml.dta", replace
