**********************************
*** MML MARYLAND 2017 YRBS *******
**********************************
cd "/Users/Kevin/Documents/MML/Data Files"
capture log close 
clear all
set more 1

import delimited "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Individual State Raws/CSV/MD_yrbs2016.csv"

egen age = group(q1)

***Age 14 (12yr = 480, 13yr = 276, 14yr = 9646)
*Category is described as 14 years or younger
gen age14 = 0 if inrange(age,4,7)
replace age14 = 1 if inrange(age,1,3)

***Age 15 (15yr = 598)
gen age15 = 0 if inlist(age,1,2,3,5,6,7)
replace age15 = 1 if inlist(age,4)

***Age 16 (16yr = 500)
gen age16 = 0 if inlist(age,1,2,3,4,6,7)
replace age16 = 1 if inlist(age,5)

***Age 17 (17yr = 480)
gen age17 = 0 if inlist(age,1,2,3,4,5,7)
replace age17 = 1 if inlist(age,6)

***Age 18 (18yr+ = 287)
*Category is described as 18 years or older
gen age18 = 0 if inrange(age,1,6)
replace age18 = 1 if inlist(age,7)

***Actual Age
qui gen age_new = age + 11 if inrange(age,1,7)
tab age_new


*** RACE VARIABLES *** 
encode raceeth, gen(race) // DIFFERENT FROM CODEBOOK USE REFERENCE BELOW:

/*
--------------------------+-----------------------------------
1:  Am Indian/Alaska Native |        540        1.06        1.06
2:                    Asian |      2,632        5.15        6.21
3:Black or African American |     11,311       22.14       28.35
4:          Hispanic/Latino |      2,146        4.20       32.55
5:                  Missing |      1,792        3.51       36.06
6:      Multiple - Hispanic |      4,104        8.03       44.09
7:  Multiple - Non-Hispanic |      3,550        6.95       51.04
8: Native Hawaiian/Other PI |        302        0.59       51.63
9:                    White |     24,710       48.37      100.00
*/
gen race4=.
replace race4=1 if race==9 & q4=="No"
replace race4=2 if race==3 & q4=="No"
replace race4=3 if inlist(race,4,6) & q4=="Yes"
replace race4=3 if race4==. & q4=="Yes"
replace race4=4 if inlist(race,1,2,7,8) & q4=="No"

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
replace race4_new=1 if race==9 & q4=="No"
replace race4_new=2 if race==3 & q4=="No"
replace race4_new=3 if inlist(race,4) & q4=="Yes"
replace race4_new=3 if race4_new==. & q4=="Yes"
replace race4_new=4 if inlist(race,1,2,6,7,8) 

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

*** Male
gen male = 0 if sex == "Female"
replace male = 1 if sex == "Male"

*** Female
gen female = 0 if sex == "Male" 
replace female = 1 if sex == "Female" 

*Marijuana Use in Past 30 Days
/*
1:         0 times |     39,059       76.46       76.46
2:    1 or 2 times |      3,377        6.61       83.07
3:  10 to 19 times |      1,086        2.13       85.19
4:  20 to 39 times |        749        1.47       86.66
5:    3 to 9 times |      2,307        4.52       91.17
6:40 or more times |      1,289        2.52       93.70
7:         Missing |      3,220        6.30      100.00
*/
encode q48, gen(smokedays)
gen marijuana30=.
replace marijuana30=1 if inrange(smokedays,2,6) 
replace marijuana30=0 if smokedays==1 
sum marijuana30

*Frequent Marijuana use in Past 30 Days
gen mfreq=.
replace mfreq=1 if inlist(smokedays,3,4,6)
replace mfreq=0 if inlist(smokedays,1,2,5)
sum mfreq

*Marijuana Use At School in Past 30 Days
*NOT ASKED

*Offered, Sold, or Given Illegal Drug on School Property
tab q58
gen drugschool=.
replace drugschool=1 if q58=="Yes"
replace drugschool=0 if q58=="No"
sum drugschool


*** GRADE/CLASSROOM *** (Q3)
gen grade = 9 if q3=="9th grade"
replace grade = 10 if q3=="10th grade"
replace grade = 11 if q3=="11th grade"
replace grade = 12 if q3=="12th grade"
replace grade = 0 if q3=="Ungraded or other grade"

*** 
gen year = 2017

drop if weight==.
gen state = "Maryland"
gen fips = 24

save "MML_MD2017.dta", replace


