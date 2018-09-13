**************************************
*** MML CONNECTICUT  2017 YRBS *******
**************************************
capture log close 
clear all
set more 1

cd "/Users/Kevin/Documents/MML/Data Files"
use "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files/CTH_2017.dta"

*** AGE VARIABLES ***
rename q1 age
destring age, replace
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inlist(age, 4, 5, 6, 7)
qui replace age14 = 1 if inrange(age,1,3)
tab age14
***Age 15
qui gen age15 = 0 if inlist(age, 1, 2, 3, 5, 6, 7)
qui replace age15 = 1 if age == 4
tab age15
***Age 16
qui gen age16 = 0 if inlist(age, 1, 2, 3, 4, 6, 7)
qui replace age16 = 1 if age == 5
tab age16
***Age 17
qui gen age17 = 0 if inlist(age, 1, 2, 3, 4, 5, 7)
qui replace age17 = 1 if age == 6
tab age17
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(age, 1, 2, 3, 4, 5, 6)
qui replace age18 = 1 if age == 7
tab age18
***Actual Age
qui gen age_new = age + 11
tab age_new

*** RACE VARIABLES ***
encode raceeth, gen(race) // DIFFERENT FROM CODEBOOK USE REFERENCE BELOW:
destring q4, replace
/* 
            |         59        2.43        2.43  Missing
          1 |         13        0.54        2.97  American Indian
          2 |        119        4.91        7.88  Asian
          3 |        242        9.98       17.86  Black
          4 |          7        0.29       18.14  Native Hawaiin/Pacific
          5 |      1,145       47.22       65.36  White
          6 |        213        8.78       74.14  Hispanic
          7 |        490       20.21       94.35  Hispanic Multiple
          8 |        137        5.65      100.00  Multiple Non Latino

*/

gen race4=.
replace race4=1 if inlist(race,5) & q4==2
replace race4=2 if inlist(race,3) & q4==2
replace race4=3 if inlist(race,6,7) & q4==1
replace race4=3 if race4==. & q4==1
replace race4=4 if inlist(race,1,2,4,8) & q4==2

*** White
gen white = 0 if inlist(race4,2,3,4)
replace white = 1 if race4==1
*** Black
gen black = 0 if inlist(race4,1,3,4)
replace black = 1 if race4==2

*** Hispanic
gen hispanic = 0 if inlist(race4,1,2,4)
replace hispanic = 1 if race4==3

*** Other Race
gen otherrace = 0 if inlist(race4,1,2,3) 
replace otherrace = 1 if race4==4


*** RACE VARIABLES 2(hispanic without mixed) *** 
*** White
gen race4_new=.
replace race4_new=1 if inlist(race,5) & q4==2
replace race4_new=2 if inlist(race,3) & q4==2
replace race4_new=3 if inlist(race,6) & q4==1
replace race4_new=3 if race4_new==. & q4==1
replace race4_new=4 if inlist(race,1,2,4,7,8) 

*** White
gen white2 = 0 if inlist(race4_new,2,3,4)
replace white2 = 1 if race4_new==1
*** Black
gen black2 = 0 if inlist(race4_new,1,3,4)
replace black2 = 1 if race4_new==2

*** Hispanic
gen hispanic2 = 0 if inlist(race4_new,1,2,4)
replace hispanic2 = 1 if race4_new==3

*** Other Race
gen otherrace2 = 0 if inlist(race4_new,1,2,3) 
replace otherrace2 = 1 if race4_new==4

*** SEX VARIABLES ***
rename q2 sex
destring sex, replace
*** Male
qui gen male = 0 if sex == 1
qui replace male = 1 if sex == 2
tab male
*** Female
qui gen female = 0 if sex == 2
qui replace female = 1 if sex == 1
tab female

*Marijuana Use in Past 30 Days
destring q48, replace
gen marijuana30=.
replace marijuana30=1 if inrange(q48,2,6) 
replace marijuana30=0 if q48==1 
sum marijuana30

*Frequent Marijuana use in Past 30 Days
gen mfreq=.
replace mfreq=1 if inrange(q48,4,6)
replace mfreq=0 if inrange(q48,1,3)
sum mfreq

*Marijuana Use At School in Past 30 Days
*NOT ASKED

*Offered, Sold, or Given Drug on School Property
tab q58
gen drugschool=.
replace drugschool=1 if q58=="1"
replace drugschool=0 if q58=="2"
sum drugschool

*** GRADE/CLASSROOM ***
destring q3, replace
rename q3 grade
mdesc grade
qui replace grade = 9 if grade == 1
qui replace grade = 10 if grade == 2
qui replace grade = 11 if grade == 3
qui replace grade = 12 if grade == 4
qui replace grade = 0 if grade == 5
tab grade

gen year = 2017

gen fips = 9
gen state = "Connecticut" 

save "MML_CT2017.dta", replace
