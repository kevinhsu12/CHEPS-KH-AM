**************************************************
***     MEDICAL MARIJUANA REPLICATION      *******
**************************************************
***    Done by Kevin Hsu and Alicia Marquez    ***
***    under the supervision of Joseph Sabia   ***
*** within CHEPS at San Diego State University ***
**************************************************
capture cd "/Users/Kevin/Documents/MML/Data Files"
capture cd "F:\MML project\data" 
set more 1
*****************************************************
* Create Variables of Interest for the main dataset *
*****************************************************
capture use "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files/State15.dta", clear
capture use "state15.dta", clear


*** AGE VARIABLES ***
tab age
mdesc age
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
tab race4
mdesc race4
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
tab white
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
tab black
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
tab hispanic
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4
tab otherrace

*** SEX VARIABLES ***
tab sex
mdesc sex
*** Male
qui gen male = 0 if sex == 1
qui replace male = 1 if sex == 2
tab male
*** Female
qui gen female = 0 if sex == 2
qui replace female = 1 if sex == 1
tab female
*** GRADE/CLASSROOM ***
tab grade
mdesc grade
qui replace grade = 9 if grade == 1
qui replace grade = 10 if grade == 2
qui replace grade = 11 if grade == 3
qui replace grade = 12 if grade == 4
qui replace grade = 0 if grade == 5
tab grade

***don't know if this will work bc data is messed up, but should
***IF WORKS, need to do all of below for MML=1 AND MML=0
*gen MML=.
*replace MML=1 if year>=MML_date
*replace MML=0 if year<MML-date

*Marijuana Use in Past 30 Days
gen marijuana30=.
replace marijuana30=1 if inrange(q49,2,6) 
replace marijuana30=0 if q49==1 
sum marijuana30

*Frequent Marijuana use in Past 30 Days
gen mfreq=.
replace mfreq=1 if inrange(q49,4,6)
replace mfreq=0 if inrange(q49,1,3)
sum mfreq

*Marijuana Use At School in Past 30 Days
gen mschool = .
replace mschool = 1 if inrange(qmarijuanaschool,2,7)
replace mschool = 0 if qmarijuanaschool==1

*Offered, Sold, or Given Drug on School Property
tab q58
gen drugschool=.
replace drugschool=1 if q59==1 
replace drugschool=0 if q59==2
sum drugschool

save "MML_State15.dta", replace



*****************************************************
* Create Variables of Interest for the main dataset *
*****************************************************
capture use "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files/State17.dta", clear
capture use "state17.dta", clear

keep if year == 2017
tab year
count
tab fips year

*** AGE VARIABLES ***
tab age
mdesc age
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
tab race4
mdesc race4
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
tab white
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
tab black
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
tab hispanic
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4
tab otherrace

*** RACE VARIABLES 2 (hispanic without mixed) ***
qui gen race4_new = race4
label values race4_new race_names
tab race4_new
mdesc race4_new
*** White
qui gen white2 = 0 if inrange(race4, 2, 4)
qui replace white2 = 1 if race4 == 1
tab white2
*** Black
qui gen black2 = 0 if inlist(race4, 1, 3, 4)
qui replace black2 = 1 if race4 == 2
tab black2
*** Hispanic
qui gen hispanic2 = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic2 = 1 if race4 == 3
tab hispanic2
*** Other Race
qui gen otherrace2 = 0 if inrange(race4, 1,3)
qui replace otherrace2 = 1 if race4 == 4
tab otherrace2

** Compare the two race variables
tab race4
tab race4_new

*** SEX VARIABLES ***
tab sex
mdesc sex
*** Male
qui gen male = 0 if sex == 1
qui replace male = 1 if sex == 2
tab male
*** Female
qui gen female = 0 if sex == 2
qui replace female = 1 if sex == 1
tab female

*** GRADE/CLASSROOM ***
tab grade
mdesc grade
qui replace grade = 9 if grade == 1
qui replace grade = 10 if grade == 2
qui replace grade = 11 if grade == 3
qui replace grade = 12 if grade == 4
qui replace grade = 0 if grade == 5
tab grade

*Marijuana Use in Past 30 Days
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
gen mschool = .
replace mschool = 1 if inrange(qmarijuanaschool,2,7)
replace mschool = 0 if qmarijuanaschool==1

*Offered, Sold, or Given Drug on School Property
*Not asked in all states/NOTICE REPRESENTS DIFFERENT VARIABLE IN 1991 THAN IN OTHER YEARS
tab q58
gen drugschool=.
replace drugschool=1 if q58==1
replace drugschool=0 if q58==2
sum drugschool

save "MML_State17.dta", replace
tab fips
mdesc fips


******************************************************
* Create Variables of Interest for the Tam's dataset *
******************************************************
*Tam's dataset had missing states up to 2013.
capture use "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files/state_yrbs_tam.dta", clear
capture use "state_yrbs_tam.dta", clear


label define state_names 8 "Colorado" 13 "Georgia" 18 "Indiana" 22 "Louisiana" ///
25 "Massachusetts" 35 "New Mexico" 39 "Ohio" 48 "Texas" 50 "Vermont"
label values fips state_names
tab fips year
drop _merge hispanic

*** AGE VARIABLES ***
tab age
mdesc age
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inrange(age,15,18)
qui replace age14 = 1 if inrange(age,12,14)
tab age14
***Age 15
qui gen age15 = 0 if inlist(age,12,13,14,16,17,18)
qui replace age15 = 1 if age == 15
tab age15
***Age 16
qui gen age16 = 0 if inlist(age,12,13,14,15,17,18)
qui replace age16 = 1 if age == 16
tab age16
***Age 17
qui gen age17 = 0 if inlist(age,12,13,14,15,16,18)
qui replace age17 = 1 if age == 17
tab age17
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(age,12,13,14,15,16,17)
qui replace age18 = 1 if age == 18
tab age18
***Actual Age
qui gen age_new = age
tab age_new

*** RACE VARIABLES ***
tab race
mdesc race
tab race_new
mdesc race_new
**Tam's code suggestion:
*race
*white=6; black=3; hispanic=4,7; other=1,2,5,8
*race_new
*white=5; black=3; hispanic=6,7; other=1,2,4,8
qui gen race4 = 1 if (race==6 | race_new==5)
qui replace race4 = 2 if (race==3 | race_new==3)
qui replace race4 = 3 if (inlist(race,4,7) | inlist(race_new,6,7))
qui replace race4 = 4 if (inlist(race,1,2,5,8) | inlist(race_new,1,2,4,8))
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
tab race4
mdesc race4
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
tab white
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
tab black
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
tab hispanic
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4
tab otherrace

*** RACE VARIABLES 2 (hispanic without mixed) ***
qui gen race4_new = 1 if (race==6 | race_new==5)
qui replace race4_new = 2 if (race==3 | race_new==3)
qui replace race4_new = 3 if (race==4 | race_new==6)
qui replace race4_new = 4 if (inlist(race,1,2,5,7,8) | inlist(race_new,1,2,4,7,8))
label values race4_new race_names
tab race4_new
mdesc race4_new
*** White
qui gen white2 = 0 if inrange(race4_new, 2, 4)
qui replace white2 = 1 if race4_new == 1
tab white2
*** Black
qui gen black2 = 0 if inlist(race4_new, 1, 3, 4)
qui replace black2 = 1 if race4_new == 2
tab black2
*** Hispanic
qui gen hispanic2 = 0 if inlist(race4_new, 1, 2, 4)
qui replace hispanic2 = 1 if race4_new == 3
tab hispanic2
*** Other Race
qui gen otherrace2 = 0 if inrange(race4_new, 1,3)
qui replace otherrace2 = 1 if race4_new == 4
tab otherrace2

** Compare the two race variables
tab race4
tab race4_new

*** SEX VARIABLES ***
tab sex
mdesc sex
*** Male
qui gen male = 0 if sex == 1
qui replace male = 1 if sex == 2
tab male
*** Female
qui gen female = 0 if sex == 2
qui replace female = 1 if sex == 1
tab female

*** GRADE/CLASSROOM ***
tab grade
tab grade_new
mdesc grade
mdesc grade_new
qui replace grade = 9 if grade_new == 2
qui replace grade = 10 if grade_new == 3
qui replace grade = 11 if grade_new == 4
qui replace grade = 12 if grade_new == 5
qui replace grade = 0 if inlist(grade_new,1,6)
tab grade

*Marijuana Use in the Past 30 Days
gen marijuana30=.
replace marijuana30=1 if inrange(mj_30day_times,2,6) 
replace marijuana30=0 if mj_30day_times==1 
sum marijuana30

*Frequent Marijuana use in Past 30 Days
gen mfreq=.
replace mfreq=1 if inrange(mj_30day_times,4,6) 
replace mfreq=0 if inrange(mj_30day_times,2,3) 
sum mfreq

*Marijuana Use At School in Past 30 Days
gen mschool = .
replace mschool = 1 if inrange(mj_school_30day_times,2,6)
replace mschool = 0 if mj_school_30day_times==1

*Offered, Sold, or Given Drug on School Property //STATES "DRUG" VS "ILLEGAL DRUG"
* 1 = drugs at school, 2 = no drugs at school, 0 = Fips39 no drugs at school
gen drugschool = .
replace drugschool = 1 if drugs_at_school==1 
replace drugschool = 0 if drugs_at_school==2

*Fips 39 in 1993,1997 has a different answers - should confirm with Ohio codebook
replace drugschool = 1 if inlist(year,1993,1997) & fips==39 & drugs_at_school==1
replace drugschool = 0 if inlist(year,1993,1997) & fips==39 & drugs_at_school==0

save "MML_state_yrbs_tam_labeled.dta", replace
tab fips
mdesc fips
************************************************
* Create Variables of Interest for 2015 States *
************************************************
*****************
* Massachusetts *
*****************
/*
import delimited "MAHq.csv", clear
rename ïsite sitecode
qui gen fips=.
qui replace fips=25 if sitecode=="MA"
label define state_names 25 "Massachusetts"  
label values fips state_names
qui gen year=.
qui replace year=2015 if sitecode=="MA"
save "MAHq.dta", replace
*/
capture use "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files/MAHq.dta", clear
capture use "MAHq.dta", clear
mdesc weight
drop if weight==.
count
tab fips year

*** AGE VARIABLES ***
tab q1
mdesc q1
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inlist(q1, 4, 5, 6, 7)
qui replace age14 = 1 if inrange(q1,1,3)
tab age14
***Age 15
qui gen age15 = 0 if inlist(q1, 1, 2, 3, 5, 6, 7)
qui replace age15 = 1 if q1 == 4
tab age15
***Age 16
qui gen age16 = 0 if inlist(q1, 1, 2, 3, 4, 6, 7)
qui replace age16 = 1 if q1 == 5
tab age16
***Age 17
qui gen age17 = 0 if inlist(q1, 1, 2, 3, 4, 5, 7)
qui replace age17 = 1 if q1 == 6
tab age17
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(q1, 1, 2, 3, 4, 5, 6)
qui replace age18 = 1 if q1 == 7
tab age18
***Actual Age
qui gen age_new = q1 + 11
tab age_new

*** RACE VARIABLES ***
tab raceeth
mdesc raceeth
qui gen race4 = 1 if raceeth==5
qui replace race4 = 2 if raceeth==3
qui replace race4 = 3 if inlist(raceeth,6,7)
qui replace race4 = 4 if inlist(raceeth,1,2,4,8)
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
tab race4
mdesc race4
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
tab white
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
tab black
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
tab hispanic
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4
tab otherrace

*** RACE VARIABLES 2 (hispanic without mixed) ***
qui gen race4_new = 1 if raceeth==5
qui replace race4_new = 2 if raceeth==3
qui replace race4_new = 3 if raceeth==6
qui replace race4_new = 4 if inlist(raceeth,1,2,4,7,8)
label values race4_new race_names
tab race4_new
mdesc race4_new
*** White
qui gen white2 = 0 if inrange(race4_new, 2, 4)
qui replace white2 = 1 if race4_new == 1
tab white2
*** Black
qui gen black2 = 0 if inlist(race4_new, 1, 3, 4)
qui replace black2 = 1 if race4_new == 2
tab black2
*** Hispanic
qui gen hispanic2 = 0 if inlist(race4_new, 1, 2, 4)
qui replace hispanic2 = 1 if race4_new == 3
tab hispanic2
*** Other Race
qui gen otherrace2 = 0 if inrange(race4_new, 1,3)
qui replace otherrace2 = 1 if race4_new == 4
tab otherrace2

** Compare the two race variables
tab race4
tab race4_new

*** SEX VARIABLES ***
tab q2
mdesc q2
*** Male
qui gen male = 0 if q2 == 1
qui replace male = 1 if q2 == 2
tab male
*** Female
qui gen female = 0 if q2 == 2
qui replace female = 1 if q2 == 1
tab female

*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

*Marijuana Use in the Past 30 Days
gen marijuana30=.
replace marijuana30=1 if inrange(q49,2,6) 
replace marijuana30=0 if q49==1 
sum marijuana30

*Frequent Marijuana use in Past 30 Days
gen mfreq=.
replace mfreq=1 if inrange(q49,4,6) 
replace mfreq=0 if inrange(q49,2,3) 
sum mfreq

*Marijuana Use At School in Past 30 Days
**information not in survey

*Offered, Sold, or Given Drug on School Property
gen drugschool=.
replace drugschool=1 if q59==1
replace drugschool=0 if q59==2
sum drugschool

save "MML_MAH.dta", replace
tab fips
mdesc fips
use "MML_MAH.dta", clear

***********
* Vermont *
***********
/*
import delimited "VTAHq.csv", clear
qui rename ïsite sitecode
qui gen fips=.
qui replace fips=50 if sitecode=="VTA"
label define state_names 50 "Vermont" 
label values fips state_names
qui gen year=.
qui replace year=2015 if sitecode=="VTA"
save "VTAHq.dta", replace
*/
capture use "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files/VTAHq.dta", clear
capture use "VTAHq.dta", clear

mdesc weight
drop if weight==.
count
tab fips year

*** AGE VARIABLES ***
tab q1
mdesc q1
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inlist(q1, 4, 5, 6, 7)
qui replace age14 = 1 if inrange(q1,1,3)
tab age14
***Age 15
qui gen age15 = 0 if inlist(q1, 1, 2, 3, 5, 6, 7)
qui replace age15 = 1 if q1 == 4
tab age15
***Age 16
qui gen age16 = 0 if inlist(q1, 1, 2, 3, 4, 6, 7)
qui replace age16 = 1 if q1 == 5
tab age16
***Age 17
qui gen age17 = 0 if inlist(q1, 1, 2, 3, 4, 5, 7)
qui replace age17 = 1 if q1 == 6
tab age17
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(q1, 1, 2, 3, 4, 5, 6)
qui replace age18 = 1 if q1 == 7
tab age18
***Actual Age
qui gen age_new = q1 + 11
tab age_new

*** RACE VARIABLES ***
tab raceeth
mdesc raceeth
qui gen race4 = 1 if raceeth==5
qui replace race4 = 2 if raceeth==3
qui replace race4 = 3 if inlist(raceeth,6,7)
qui replace race4 = 4 if inlist(raceeth,1,2,4,8)
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
tab race4
mdesc race4
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
tab white
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
tab black
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
tab hispanic
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4
tab otherrace

*** RACE VARIABLES 2 (hispanic without mixed) ***
qui gen race4_new = 1 if raceeth==5
qui replace race4_new = 2 if raceeth==3
qui replace race4_new = 3 if raceeth==6
qui replace race4_new = 4 if inlist(raceeth,1,2,4,7,8)
label values race4_new race_names
tab race4_new
mdesc race4_new
*** White
qui gen white2 = 0 if inrange(race4_new, 2, 4)
qui replace white2 = 1 if race4_new == 1
tab white2
*** Black
qui gen black2 = 0 if inlist(race4_new, 1, 3, 4)
qui replace black2 = 1 if race4_new == 2
tab black2
*** Hispanic
qui gen hispanic2 = 0 if inlist(race4_new, 1, 2, 4)
qui replace hispanic2 = 1 if race4_new == 3
tab hispanic2
*** Other Race
qui gen otherrace2 = 0 if inrange(race4_new, 1,3)
qui replace otherrace2 = 1 if race4_new == 4
tab otherrace2

** Compare the two race variables
tab race4
tab race4_new

*** SEX VARIABLES ***
tab q2
mdesc q2
*** Male
qui gen male = 0 if q2 == 1
qui replace male = 1 if q2 == 2
tab male
*** Female
qui gen female = 0 if q2 == 2
qui replace female = 1 if q2 == 1
tab female

*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

*Marijuana Use in Past 30 Days
gen marijuana30=.
replace marijuana30=1 if inrange(q49,2,6) 
replace marijuana30=0 if q49==1 
sum marijuana30

*Frequent Marijuana use in Past 30 Days
gen mfreq=.
replace mfreq=1 if inrange(q49,4,6) 
replace mfreq=0 if inrange(q49,2,3) 
sum mfreq

*Marijuana Use At School in Past 30 Days
**information not in survey

*Offered, Sold, or Given Drug on School Property
gen drugschool=.
replace drugschool=1 if q59==1
replace drugschool=0 if q59==2
sum drugschool

save "MML_VTAH.dta", replace
tab fips
mdesc fips
use "MML_VTAH.dta", clear

***********
* Indiana *
***********
/*
import delimited "INHq.csv", clear
qui rename ïsite sitecode
qui gen fips=.
qui replace fips=18 if sitecode=="IN"
label define state_names 18 "Indiana" 
label values fips state_names
qui gen year=.
qui replace year=2015 if sitecode=="IN"
save "INHq.dta", replace
*/
capture use "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files/INHq.dta", clear
capture use "INHq.dta", clear
mdesc weight
drop if weight==.
count
tab fips year

*** AGE VARIABLES ***
tab q1
mdesc q1
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inlist(q1, 4, 5, 6, 7)
qui replace age14 = 1 if inrange(q1,1,3)
tab age14
***Age 15
qui gen age15 = 0 if inlist(q1, 1, 2, 3, 5, 6, 7)
qui replace age15 = 1 if q1 == 4
tab age15
***Age 16
qui gen age16 = 0 if inlist(q1, 1, 2, 3, 4, 6, 7)
qui replace age16 = 1 if q1 == 5
tab age16
***Age 17
qui gen age17 = 0 if inlist(q1, 1, 2, 3, 4, 5, 7)
qui replace age17 = 1 if q1 == 6
tab age17
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(q1, 1, 2, 3, 4, 5, 6)
qui replace age18 = 1 if q1 == 7
tab age18
***Actual Age
qui gen age_new = q1 + 11
tab age_new

*** RACE VARIABLES ***
tab raceeth
mdesc raceeth
qui gen race4 = 1 if raceeth==5
qui replace race4 = 2 if raceeth==3
qui replace race4 = 3 if inlist(raceeth,6,7)
qui replace race4 = 4 if inlist(raceeth,1,2,4,8)
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
tab race4
mdesc race4
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
tab white
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
tab black
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
tab hispanic
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4
tab otherrace

*** RACE VARIABLES 2 (hispanic without mixed) ***
qui gen race4_new = 1 if raceeth==5
qui replace race4_new = 2 if raceeth==3
qui replace race4_new = 3 if raceeth==6
qui replace race4_new = 4 if inlist(raceeth,1,2,4,7,8)
label values race4_new race_names
tab race4_new
mdesc race4_new
*** White
qui gen white2 = 0 if inrange(race4_new, 2, 4)
qui replace white2 = 1 if race4_new == 1
tab white2
*** Black
qui gen black2 = 0 if inlist(race4_new, 1, 3, 4)
qui replace black2 = 1 if race4_new == 2
tab black2
*** Hispanic
qui gen hispanic2 = 0 if inlist(race4_new, 1, 2, 4)
qui replace hispanic2 = 1 if race4_new == 3
tab hispanic2
*** Other Race
qui gen otherrace2 = 0 if inrange(race4_new, 1,3)
qui replace otherrace2 = 1 if race4_new == 4
tab otherrace2

** Compare the two race variables
tab race4
tab race4_new

*** SEX VARIABLES ***
tab q2
mdesc q2
*** Male
qui gen male = 0 if q2 == 1
qui replace male = 1 if q2 == 2
tab male
*** Female
qui gen female = 0 if q2 == 2
qui replace female = 1 if q2 == 1
tab female


*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

*Marijuana Use in Past 30 Days
gen marijuana30=.
replace marijuana30=1 if inrange(q49,2,6) 
replace marijuana30=0 if q49==1 
sum marijuana30

*Frequent Marijuana use in Past 30 Days
gen mfreq=.
replace mfreq=1 if inrange(q49,4,6) 
replace mfreq=0 if inrange(q49,2,3) 
sum mfreq

*Marijuana Use At School in Past 30 Days
**information not on survey

*Offered, Sold, or Given Drug on School Property
gen drugschool=.
replace drugschool=1 if q59==1
replace drugschool=0 if q59==2
sum drugschool

save "MML_INH.dta", replace
tab fips
mdesc fips
use "MML_INH.dta", clear

**************
* New Mexico *
**************
/*
import delimited "NMHq.csv", clear
qui rename ïsite sitecode
qui gen fips=.
qui replace fips=35 if sitecode=="NM"
label define state_names 35 "New Mexico" 
label values fips state_names
qui gen year=.
qui replace year=2015 if sitecode=="NM"
save "NMHq.dta", replace
*/
capture use "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files/NMHq.dta", clear
capture use "NMHq.dta", clear
mdesc weight
drop if weight==.
count
tab fips year

*** AGE VARIABLES ***
tab q1
mdesc q1
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inlist(q1, 4, 5, 6, 7)
qui replace age14 = 1 if inrange(q1,1,3)
tab age14
***Age 15
qui gen age15 = 0 if inlist(q1, 1, 2, 3, 5, 6, 7)
qui replace age15 = 1 if q1 == 4
tab age15
***Age 16
qui gen age16 = 0 if inlist(q1, 1, 2, 3, 4, 6, 7)
qui replace age16 = 1 if q1 == 5
tab age16
***Age 17
qui gen age17 = 0 if inlist(q1, 1, 2, 3, 4, 5, 7)
qui replace age17 = 1 if q1 == 6
tab age17
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(q1, 1, 2, 3, 4, 5, 6)
qui replace age18 = 1 if q1 == 7
tab age18
***Actual Age
qui gen age_new = q1 + 11
tab age_new

*** RACE VARIABLES ***
tab raceeth
mdesc raceeth
qui gen race4 = 1 if raceeth==5
qui replace race4 = 2 if raceeth==3
qui replace race4 = 3 if inlist(raceeth,6,7)
qui replace race4 = 4 if inlist(raceeth,1,2,4,8)
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
tab race4
mdesc race4
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
tab white
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
tab black
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
tab hispanic
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4
tab otherrace

*** RACE VARIABLES 2 (hispanic without mixed) ***
qui gen race4_new = 1 if raceeth==5
qui replace race4_new = 2 if raceeth==3
qui replace race4_new = 3 if raceeth==6
qui replace race4_new = 4 if inlist(raceeth,1,2,4,7,8)
label values race4_new race_names
tab race4_new
mdesc race4_new
*** White
qui gen white2 = 0 if inrange(race4_new, 2, 4)
qui replace white2 = 1 if race4_new == 1
tab white2
*** Black
qui gen black2 = 0 if inlist(race4_new, 1, 3, 4)
qui replace black2 = 1 if race4_new == 2
tab black2
*** Hispanic
qui gen hispanic2 = 0 if inlist(race4_new, 1, 2, 4)
qui replace hispanic2 = 1 if race4_new == 3
tab hispanic2
*** Other Race
qui gen otherrace2 = 0 if inrange(race4_new, 1,3)
qui replace otherrace2 = 1 if race4_new == 4
tab otherrace2

** Compare the two race variables
tab race4
tab race4_new

*** SEX VARIABLES ***
tab q2
mdesc q2
*** Male
qui gen male = 0 if q2 == 1
qui replace male = 1 if q2 == 2
tab male
*** Female
qui gen female = 0 if q2 == 2
qui replace female = 1 if q2 == 1
tab female

*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

*Marijuana Use in Past 30 Days
gen marijuana30=.
replace marijuana30=1 if inrange(q49,2,6) 
replace marijuana30=0 if q49==1 
sum marijuana30

*Frequent Marijuana use in Past 30 Days
gen mfreq=.
replace mfreq=1 if inrange(q49,4,6) 
replace mfreq=0 if inrange(q49,2,3) 
sum mfreq

*Marijuana Use At School in Past 30 Days
**information not in survey

*Offered, Sold, or Given Drug on School Property
gen drugschool=.
replace drugschool=1 if q59==1
replace drugschool=0 if q59==2
sum drugschool

save "MML_NMH.dta", replace
tab fips
mdesc fips
use "MML_NMH.dta", clear

*******************************************
* Create Variables of Interest for Hawaii *
*******************************************
* NOTE: Question numbers in data file and codebook are not matching
* Use "Requested Variables" excel file to match.
********
* 2005 *
********
/*
import delimited "H2005.csv", clear
qui gen fips=.
qui replace fips=15 if yrbs_geography_value=="Hawaii State"
label define state_names 15 "Hawaii"
label values fips state_names
qui gen year=.
qui replace year=2005 if survey_year==2005
rename yrbss_weight weight
save "H2005.dta", replace
*/
capture use "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files/H2005.dta", clear
capture use "H2005.dta", clear
mdesc weight
drop if weight==.
count
tab fips year

*** AGE VARIABLES ***
tab q1
mdesc q1
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inlist(q1, 4, 5, 6, 7)
qui replace age14 = 1 if inrange(q1,1,3)
tab age14
***Age 15
qui gen age15 = 0 if inlist(q1, 1, 2, 3, 5, 6, 7)
qui replace age15 = 1 if q1 == 4
tab age15
***Age 16
qui gen age16 = 0 if inlist(q1, 1, 2, 3, 4, 6, 7)
qui replace age16 = 1 if q1 == 5
tab age16
***Age 17
qui gen age17 = 0 if inlist(q1, 1, 2, 3, 4, 5, 7)
qui replace age17 = 1 if q1 == 6
tab age17
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(q1, 1, 2, 3, 4, 5, 6)
qui replace age18 = 1 if q1 == 7
tab age18
***Actual Age
qui gen age_new = q1 + 11
tab age_new

*** RACE VARIABLES ***
tab q4
tab q88
mdesc q4
mdesc q88
label define race_4 1 "AIAN" 2 "Asian" 3 "Black" 4 "Hispanic" 5 "Hawaiian" 6 "OPI" 7 "White" 8 "Multi, Hispanic" 9 "Multi, Non-hispanic"
label values q4 race_4
label define race_88 1 "Black" 2 "White" 3 "Chinese" 4 "Filipino" 5 "Japanese" 6 "Hawaiian" 7 "OPI" 8 "Other"
label values q88 race_88
* Using similar logic to CDC to create race4
qui gen race4 = 1 if (q4==7 | q88==2)
qui replace race4 = 2 if (q4==3 | q88==1)
qui replace race4 = 3 if inlist(q4,4,8)
qui replace race4 = 4 if (inlist(q4,1,2,5,6,9) | inlist(q88,3,4,5,6,7,8)) & race4==.
qui replace race4 = . if q4==.
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
tab race4
mdesc race4
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
tab white
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
tab black
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
tab hispanic
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4
tab otherrace

*** RACE VARIABLES 2 (hispanic without mixed) ***
qui gen race4_new = 1 if (q4==7 | q88==2)
qui replace race4_new = 2 if (q4==3 | q88==1)
qui replace race4_new = 3 if q4==4
qui replace race4_new = 4 if (inlist(q4,1,2,5,6,9) | inlist(q88,3,4,5,6,7,8)) & race4_new==.
qui replace race4_new = 4 if q4==8
qui replace race4_new = . if q4==.
label values race4_new race_names
tab race4_new
mdesc race4_new
*** White
qui gen white2 = 0 if inrange(race4_new, 2, 4)
qui replace white2 = 1 if race4_new == 1
tab white2
*** Black
qui gen black2 = 0 if inlist(race4_new, 1, 3, 4)
qui replace black2 = 1 if race4_new == 2
tab black2
*** Hispanic
qui gen hispanic2 = 0 if inlist(race4_new, 1, 2, 4)
qui replace hispanic2 = 1 if race4_new == 3
tab hispanic2
*** Other Race
qui gen otherrace2 = 0 if inrange(race4_new, 1,3)
qui replace otherrace2 = 1 if race4_new == 4
tab otherrace2

** Compare the two race variables
tab race4
tab race4_new

*** SEX VARIABLES ***
tab q2
mdesc q2
*** Male
qui gen male = 0 if q2 == 1
qui replace male = 1 if q2 == 2
tab male
*** Female
qui gen female = 0 if q2 == 2
qui replace female = 1 if q2 == 1
tab female

*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

*Marijuana Use in Past 30 Days
*question 40 in codebook, variable q46 in data
gen marijuana30=.
replace marijuana30=1 if inrange(q46,2,6) 
replace marijuana30=0 if q46==1 
sum marijuana30

*Frequent Marijuana use in Past 30 Days
*question 40 in codebook, variable q46 in data
gen mfreq=.
replace mfreq=1 if inrange(q46,4,6) 
replace mfreq=0 if inrange(q46,2,3) 
sum mfreq

*Marijuana Use At School in Past 30 Days
**question 41 in codebook, variable q47 in data
gen mschool=.
replace mschool=1 if inrange(q47,2,6) 
replace mschool=0 if q47==1
sum mschool

*Offered, Sold, or Given Drug on School Property
*question 51 in codebook, variable q56 in data
gen drugschool=.
replace drugschool=1 if q56==1 
replace drugschool=0 if q56==2 
sum drugschool


save "MML_H2005.dta", replace

********
* 2007 *
********
/*
import delimited "H2007.csv", clear
qui gen fips=.
qui replace fips=15 if yrbs_geography_value=="Hawaii State"
label define state_names 15 "Hawaii"
label values fips state_names
qui gen year=.
qui replace year=2007 if survey_year==2007
rename yrbss_weight weight
save "H2007.dta", replace
*/
capture use "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files/H2007.dta", clear
capture use "H2007.dta", clear
mdesc weight
drop if weight==.
count
tab fips year

*** AGE VARIABLES ***
tab q1
mdesc q1
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inlist(q1, 4, 5, 6, 7)
qui replace age14 = 1 if inrange(q1,1,3)
tab age14
***Age 15
qui gen age15 = 0 if inlist(q1, 1, 2, 3, 5, 6, 7)
qui replace age15 = 1 if q1 == 4
tab age15
***Age 16
qui gen age16 = 0 if inlist(q1, 1, 2, 3, 4, 6, 7)
qui replace age16 = 1 if q1 == 5
tab age16
***Age 17
qui gen age17 = 0 if inlist(q1, 1, 2, 3, 4, 5, 7)
qui replace age17 = 1 if q1 == 6
tab age17
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(q1, 1, 2, 3, 4, 5, 6)
qui replace age18 = 1 if q1 == 7
tab age18
***Actual Age
qui gen age_new = q1 + 11
tab age_new

*** RACE VARIABLES ***
tab q4
tab q5
mdesc q4
mdesc q5
* Using similar logic to CDC to create race4 and race4_new
qui gen race4 =.
qui replace race4 = 1 if q4==2 & strpos(q5,"H")>0
qui replace race4 = 4 if strlen(q5)>0 & race4==.
qui replace race4 = 4 if strlen(q5)>1
qui replace race4 = 2 if q4==2 & strpos(q5,"B")>0
qui replace race4 = 3 if q4==1
qui replace race4 = . if q4==.
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
tab race4
mdesc race4
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
tab white
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
tab black
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
tab hispanic
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4
tab otherrace

*** RACE VARIABLES 2 (hispanic without mixed) ***
qui gen race4_new =.
qui replace race4_new = 1 if q4==2 & strpos(q5,"H")>0
qui replace race4_new = 4 if strlen(q5)>0 & race4_new==.
qui replace race4_new = 4 if strlen(q5)>1
qui replace race4_new = 2 if q4==2 & strpos(q5,"B")>0
qui replace race4_new = 3 if q4==1 & race4_new==.
qui replace race4_new = . if q4==.
label values race4_new race_names
tab race4_new
mdesc race4_new
*** White
qui gen white2 = 0 if inrange(race4_new, 2, 4)
qui replace white2 = 1 if race4_new == 1
tab white2
*** Black
qui gen black2 = 0 if inlist(race4_new, 1, 3, 4)
qui replace black2 = 1 if race4_new == 2
tab black2
*** Hispanic
qui gen hispanic2 = 0 if inlist(race4_new, 1, 2, 4)
qui replace hispanic2 = 1 if race4_new == 3
tab hispanic2
*** Other Race
qui gen otherrace2 = 0 if inrange(race4_new, 1,3)
qui replace otherrace2 = 1 if race4_new == 4
tab otherrace2

** Compare the two race variables
tab race4
tab race4_new

*** SEX VARIABLES ***
tab q2
mdesc q2
*** Male
qui gen male = 0 if q2 == 1
qui replace male = 1 if q2 == 2
tab male
*** Female
qui gen female = 0 if q2 == 2
qui replace female = 1 if q2 == 1
tab female


*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

*Marijuana Use in Past 30 Days
*question 44 in codebook, variable q47 in data
gen marijuana30=.
replace marijuana30=1 if inrange(q47,2,6) 
replace marijuana30=0 if q47==1 
sum marijuana30

*Frequent Marijuana use in Past 30 Days
*question 44 in codebook, variable q47 in data
gen mfreq=.
replace mfreq=1 if inrange(q46,4,6) 
replace mfreq=0 if inrange(q46,2,3) 
sum mfreq

*Marijuana Use At School in Past 30 Days
**question 45 in codebook, variable q48 in data
gen mschool=.
replace mschool=1 if inrange(q48,2,6) 
replace mschool=0 if q48==1
sum mschool

*Offered, Sold, or Given Drug on School Property
*question 52 in codebook, variable q57 in data
gen drugschool=.
replace drugschool=1 if q57==1 
replace drugschool=0 if q57==2 
sum drugschool


save "MML_H2007.dta", replace
tab fips
mdesc fips
use "MML_H2007.dta", clear

********
* 2009 *
********
/*
import delimited "H2009.csv", clear
qui gen fips=.
qui replace fips=15 if yrbs_geography_value=="Hawaii State"
label define state_names 15 "Hawaii"
label values fips state_names
qui gen year=.
qui replace year=2009 if survey_year==2009
rename yrbss_weight weight
save "H2009.dta", replace
*/
capture use "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files/H2009.dta", clear
capture use "H2009.dta", clear
mdesc weight
drop if weight==.
count
tab fips year

*** AGE VARIABLES ***
tab q1
mdesc q1
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inlist(q1, 4, 5, 6, 7)
qui replace age14 = 1 if inrange(q1,1,3)
tab age14
***Age 15
qui gen age15 = 0 if inlist(q1, 1, 2, 3, 5, 6, 7)
qui replace age15 = 1 if q1 == 4
tab age15
***Age 16
qui gen age16 = 0 if inlist(q1, 1, 2, 3, 4, 6, 7)
qui replace age16 = 1 if q1 == 5
tab age16
***Age 17
qui gen age17 = 0 if inlist(q1, 1, 2, 3, 4, 5, 7)
qui replace age17 = 1 if q1 == 6
tab age17
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(q1, 1, 2, 3, 4, 5, 6)
qui replace age18 = 1 if q1 == 7
tab age18
***Actual Age
qui gen age_new = q1 + 11
tab age_new

*** RACE VARIABLES ***
tab q4
tab q5
mdesc q4
mdesc q5
* Using similar logic to CDC to create race4 and race4_new
qui gen race4 =.
qui replace race4 = 1 if q4==2 & strpos(q5,"H")>0
qui replace race4 = 4 if strlen(q5)>0 & race4==.
qui replace race4 = 4 if strlen(q5)>1
qui replace race4 = 2 if q4==2 & strpos(q5,"B")>0
qui replace race4 = 3 if q4==1
qui replace race4 = . if q4==.
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
tab race4
mdesc race4
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
tab white
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
tab black
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
tab hispanic
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4
tab otherrace

*** RACE VARIABLES 2 (hispanic without mixed) ***
qui gen race4_new =.
qui replace race4_new = 1 if q4==2 & strpos(q5,"H")>0
qui replace race4_new = 4 if strlen(q5)>0 & race4_new==.
qui replace race4_new = 4 if strlen(q5)>1
qui replace race4_new = 2 if q4==2 & strpos(q5,"B")>0
qui replace race4_new = 3 if q4==1 & race4_new==.
qui replace race4_new = . if q4==.
label values race4_new race_names
tab race4_new
mdesc race4_new
*** White
qui gen white2 = 0 if inrange(race4_new, 2, 4)
qui replace white2 = 1 if race4_new == 1
tab white2
*** Black
qui gen black2 = 0 if inlist(race4_new, 1, 3, 4)
qui replace black2 = 1 if race4_new == 2
tab black2
*** Hispanic
qui gen hispanic2 = 0 if inlist(race4_new, 1, 2, 4)
qui replace hispanic2 = 1 if race4_new == 3
tab hispanic2
*** Other Race
qui gen otherrace2 = 0 if inrange(race4_new, 1,3)
qui replace otherrace2 = 1 if race4_new == 4
tab otherrace2

** Compare the two race variables
tab race4
tab race4_new

*** SEX VARIABLES ***
tab q2
mdesc q2
*** Male
qui gen male = 0 if q2 == 1
qui replace male = 1 if q2 == 2
tab male
*** Female
qui gen female = 0 if q2 == 2
qui replace female = 1 if q2 == 1
tab female


*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

*Marijuana Use in Past 30 Days
*question 45 in codebook, variable q47 in data
gen marijuana30=.
replace marijuana30=1 if inrange(q47,2,6) 
replace marijuana30=0 if q47==1 
sum marijuana30

*Frequent Marijuana use in Past 30 Days
*question 45 in codebook, variable q47 in data
gen mfreq=.
replace mfreq=1 if inrange(q47,4,6) 
replace mfreq=0 if inrange(q47,2,3) 
sum mfreq

*Marijuana Use At School in Past 30 Days
**question 46 in codebook, variable q48 in data
gen mschool=.
replace mschool=1 if inrange(q48,2,6) 
replace mschool=0 if q48==1
sum mschool

*Offered, Sold, or Given Drug on School Property
*question 52 in codebook, variable q57 in data
gen drugschool=.
replace drugschool=1 if q57==1 
replace drugschool=0 if q57==2 
sum drugschool


save "MML_H2009.dta", replace
tab fips
mdesc fips
use "MML_H2009.dta", clear

********
* 2011 *
********
/*
import delimited "H2011.csv", clear
qui gen fips=.
qui replace fips=15 if yrbs_geography_value=="Hawaii State"
label define state_names 15 "Hawaii"
label values fips state_names
qui gen year=.
qui replace year=2011 if survey_year==2011
rename yrbss_weight weight
save "H2011.dta", replace
*/
capture use "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files/H2011.dta", clear
capture use "H2011.dta", clear
mdesc weight
drop if weight==.
count
tab fips year

*** AGE VARIABLES ***
tab q1
mdesc q1
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inlist(q1, 4, 5, 6, 7)
qui replace age14 = 1 if inrange(q1,1,3)
tab age14
***Age 15
qui gen age15 = 0 if inlist(q1, 1, 2, 3, 5, 6, 7)
qui replace age15 = 1 if q1 == 4
tab age15
***Age 16
qui gen age16 = 0 if inlist(q1, 1, 2, 3, 4, 6, 7)
qui replace age16 = 1 if q1 == 5
tab age16
***Age 17
qui gen age17 = 0 if inlist(q1, 1, 2, 3, 4, 5, 7)
qui replace age17 = 1 if q1 == 6
tab age17
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(q1, 1, 2, 3, 4, 5, 6)
qui replace age18 = 1 if q1 == 7
tab age18
***Actual Age
qui gen age_new = q1 + 11
tab age_new

*** RACE VARIABLES ***
tab q4
tab q5
mdesc q4
mdesc q5
* q87 is another pre-calculated race variable, but has no data on hispanic population
label define race_87 1 "AIAN" 2 "Black" 3 "Filipino" 4 "Japanese" 5 "Hawaiian" 6 "Asian" 7 "OPI" 8 "White"
label values q87 race_87
tab q87

* Using similar logic to CDC to create race4 and race4_new
qui gen race4 =.
qui replace race4 = 1 if q4==2 & strpos(q5,"H")>0
qui replace race4 = 4 if strlen(q5)>0 & race4==.
qui replace race4 = 4 if strlen(q5)>1
qui replace race4 = 2 if q4==2 & strpos(q5,"B")>0
qui replace race4 = 3 if q4==1
qui replace race4 = . if q4==.
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
tab race4
mdesc race4
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
tab white
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
tab black
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
tab hispanic
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4
tab otherrace

*** RACE VARIABLES 2 (hispanic without mixed) ***
qui gen race4_new =.
qui replace race4_new = 1 if q4==2 & strpos(q5,"H")>0
qui replace race4_new = 4 if strlen(q5)>0 & race4_new==.
qui replace race4_new = 4 if strlen(q5)>1
qui replace race4_new = 2 if q4==2 & strpos(q5,"B")>0
qui replace race4_new = 3 if q4==1 & race4_new==.
qui replace race4_new = . if q4==.
label values race4_new race_names
tab race4_new
mdesc race4_new
*** White
qui gen white2 = 0 if inrange(race4_new, 2, 4)
qui replace white2 = 1 if race4_new == 1
tab white2
*** Black
qui gen black2 = 0 if inlist(race4_new, 1, 3, 4)
qui replace black2 = 1 if race4_new == 2
tab black2
*** Hispanic
qui gen hispanic2 = 0 if inlist(race4_new, 1, 2, 4)
qui replace hispanic2 = 1 if race4_new == 3
tab hispanic2
*** Other Race
qui gen otherrace2 = 0 if inrange(race4_new, 1,3)
qui replace otherrace2 = 1 if race4_new == 4
tab otherrace2

** Compare the two race variables
tab race4
tab race4_new

*** SEX VARIABLES ***
tab q2
mdesc q2
*** Male
qui gen male = 0 if q2 == 1
qui replace male = 1 if q2 == 2
tab male
*** Female
qui gen female = 0 if q2 == 2
qui replace female = 1 if q2 == 1
tab female

*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

*Marijuana Use in Past 30 Days
*question 46 in codebook, variable q48 in data
gen marijuana30=.
replace marijuana30=1 if inrange(q48,2,6) 
replace marijuana30=0 if q48==1 
sum marijuana30

*Frequent Marijuana use in Past 30 Days
*question 46 in codebook, variable q48 in data
gen mfreq=.
replace mfreq=1 if inrange(q48,4,6) 
replace mfreq=0 if inrange(q48,2,3) 
sum mfreq

*Marijuana Use At School in Past 30 Days
**question 47 in codebook, variable q49 in data
gen mschool=.
replace mschool=1 if inrange(q49,2,6) 
replace mschool=0 if q49==1
sum mschool

*Offered, Sold, or Given Drug on School Property
*question 53 in codebook, variable q59 in data
gen drugschool=.
replace drugschool=1 if q59==1 
replace drugschool=0 if q59==2 
sum drugschool


save "MML_H2011.dta", replace
tab fips
mdesc fips
use "MML_H2011.dta", clear

********
* 2013 *
********
/*
import delimited "H2013.csv", clear
qui gen fips=.
qui replace fips=15 if yrbs_geography_value=="Hawaii State"
label define state_names 15 "Hawaii"
label values fips state_names
qui gen year=.
qui replace year=2013 if survey_year==2013
rename yrbss_weight weight
save "H2013.dta", replace
*/
capture use "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files/H2013.dta", clear
capture use "H2013.dta", clear
mdesc weight
drop if weight==.
count
tab fips year

*** AGE VARIABLES ***
tab q1
mdesc q1
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inlist(q1, 4, 5, 6, 7)
qui replace age14 = 1 if inrange(q1,1,3)
tab age14
***Age 15
qui gen age15 = 0 if inlist(q1, 1, 2, 3, 5, 6, 7)
qui replace age15 = 1 if q1 == 4
tab age15
***Age 16
qui gen age16 = 0 if inlist(q1, 1, 2, 3, 4, 6, 7)
qui replace age16 = 1 if q1 == 5
tab age16
***Age 17
qui gen age17 = 0 if inlist(q1, 1, 2, 3, 4, 5, 7)
qui replace age17 = 1 if q1 == 6
tab age17
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(q1, 1, 2, 3, 4, 5, 6)
qui replace age18 = 1 if q1 == 7
tab age18
***Actual Age
qui gen age_new = q1 + 11
tab age_new

*** RACE VARIABLES ***
tab q4
tab q5
mdesc q4
mdesc q5
* q87 is another pre-calculated race variable, but has no data on black population
label define race_87 1 "Hispanic" 2 "Hawaiian" 3 "Filipino" 4 "Japanese" 5 "White" 6 "OPI" 7 "Other" 8 "Mixed"
label values q87 race_87
tab q87

* Using similar logic to CDC to create race4 and race4_new
qui gen race4 =.
qui replace race4 = 1 if q4==2 & strpos(q5,"H")>0
qui replace race4 = 4 if strlen(q5)>0 & race4==.
qui replace race4 = 4 if strlen(q5)>1
qui replace race4 = 2 if q4==2 & strpos(q5,"B")>0
qui replace race4 = 3 if q4==1
qui replace race4 = . if q4==.
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
tab race4
mdesc race4
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
tab white
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
tab black
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
tab hispanic
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4
tab otherrace

*** RACE VARIABLES 2 (hispanic without mixed) ***
qui gen race4_new =.
qui replace race4_new = 1 if q4==2 & strpos(q5,"H")>0
qui replace race4_new = 4 if strlen(q5)>0 & race4_new==.
qui replace race4_new = 4 if strlen(q5)>1
qui replace race4_new = 2 if q4==2 & strpos(q5,"B")>0
qui replace race4_new = 3 if q4==1 & race4_new==.
qui replace race4_new = . if q4==.
label values race4_new race_names
tab race4_new
mdesc race4_new
*** White
qui gen white2 = 0 if inrange(race4_new, 2, 4)
qui replace white2 = 1 if race4_new == 1
tab white2
*** Black
qui gen black2 = 0 if inlist(race4_new, 1, 3, 4)
qui replace black2 = 1 if race4_new == 2
tab black2
*** Hispanic
qui gen hispanic2 = 0 if inlist(race4_new, 1, 2, 4)
qui replace hispanic2 = 1 if race4_new == 3
tab hispanic2
*** Other Race
qui gen otherrace2 = 0 if inrange(race4_new, 1,3)
qui replace otherrace2 = 1 if race4_new == 4
tab otherrace2

** Compare the two race variables
tab race4
tab race4_new

*** SEX VARIABLES ***
tab q2
mdesc q2
*** Male
qui gen male = 0 if q2 == 1
qui replace male = 1 if q2 == 2
tab male
*** Female
qui gen female = 0 if q2 == 2
qui replace female = 1 if q2 == 1
tab female

*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

*Marijuana Use in Past 30 Days
*question 38 in codebook, variable q49 in data
gen marijuana30=.
replace marijuana30=1 if inrange(q49,2,6) 
replace marijuana30=0 if q49==1 
sum marijuana30

*Frequent Marijuana use in Past 30 Days
*question 38 in codebook, variable q49 in data
gen mfreq=.
replace mfreq=1 if inrange(q49,4,6) 
replace mfreq=0 if inrange(q49,2,3) 
sum mfreq

*Marijuana Use At School in Past 30 Days
*question 39 in codebook, variable q94 in data
gen mschool=.
replace mschool=1 if inrange(q94,2,6) 
replace mschool=0 if q94==1
sum mschool

*Offered, Sold, or Given Drug on School Property
*question 48 in codebook, variable q58 in data
gen drugschool=.
replace drugschool=1 if q58==1 
replace drugschool=0 if q58==2 
sum drugschool

save "MML_H2013.dta", replace
tab fips
mdesc fips
use "MML_H2013.dta", clear


********
* 2015 *
********
/*
import delimited "H2015.csv", clear
qui gen fips=.
qui replace fips=15 if yrbs_geography_value=="Hawaii State"
label define state_names 15 "Hawaii"
label values fips state_names
qui gen year=.
qui replace year=2015 if survey_year==2015
rename yrbss_weight weight
save "H2015.dta", replace
*/
capture use "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files/H2015.dta", clear
capture use "H2015.dta", clear
mdesc weight
drop if weight==.
count
tab fips year

*** AGE VARIABLES ***
tab q1
mdesc q1
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inlist(q1, 4, 5, 6, 7)
qui replace age14 = 1 if inrange(q1,1,3)
tab age14
***Age 15
qui gen age15 = 0 if inlist(q1, 1, 2, 3, 5, 6, 7)
qui replace age15 = 1 if q1 == 4
tab age15
***Age 16
qui gen age16 = 0 if inlist(q1, 1, 2, 3, 4, 6, 7)
qui replace age16 = 1 if q1 == 5
tab age16
***Age 17
qui gen age17 = 0 if inlist(q1, 1, 2, 3, 4, 5, 7)
qui replace age17 = 1 if q1 == 6
tab age17
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(q1, 1, 2, 3, 4, 5, 6)
qui replace age18 = 1 if q1 == 7
tab age18
***Actual Age
qui gen age_new = q1 + 11
tab age_new

*** RACE VARIABLES ***
tab q4
tab q5
mdesc q4
mdesc q5
* q90 is another pre-calculated race variable, but has no data on black population
label define race_90 1 "Hispanic" 2 "Hawaiian" 3 "Filipino" 4 "Japanese" 5 "White" 6 "OPI" 7 "Other" 8 "Mixed"
label values q90 race_90
tab q90

* Using similar logic to CDC to create race4 and race4_new
qui gen race4 =.
qui replace race4 = 1 if q4==2 & strpos(q5,"H")>0
qui replace race4 = 4 if strlen(q5)>0 & race4==.
qui replace race4 = 4 if strlen(q5)>1
qui replace race4 = 2 if q4==2 & strpos(q5,"B")>0
qui replace race4 = 3 if q4==1
qui replace race4 = . if q4==.
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
tab race4
mdesc race4
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
tab white
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
tab black
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
tab hispanic
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4
tab otherrace

*** RACE VARIABLES 2 (hispanic without mixed) ***
qui gen race4_new =.
qui replace race4_new = 1 if q4==2 & strpos(q5,"H")>0
qui replace race4_new = 4 if strlen(q5)>0 & race4_new==.
qui replace race4_new = 4 if strlen(q5)>1
qui replace race4_new = 2 if q4==2 & strpos(q5,"B")>0
qui replace race4_new = 3 if q4==1 & race4_new==.
qui replace race4_new = . if q4==.
label values race4_new race_names
tab race4_new
mdesc race4_new
*** White
qui gen white2 = 0 if inrange(race4_new, 2, 4)
qui replace white2 = 1 if race4_new == 1
tab white2
*** Black
qui gen black2 = 0 if inlist(race4_new, 1, 3, 4)
qui replace black2 = 1 if race4_new == 2
tab black2
*** Hispanic
qui gen hispanic2 = 0 if inlist(race4_new, 1, 2, 4)
qui replace hispanic2 = 1 if race4_new == 3
tab hispanic2
*** Other Race
qui gen otherrace2 = 0 if inrange(race4_new, 1,3)
qui replace otherrace2 = 1 if race4_new == 4
tab otherrace2

** Compare the two race variables
tab race4
tab race4_new

*** SEX VARIABLES ***
tab q2
mdesc q2
*** Male
qui gen male = 0 if q2 == 1
qui replace male = 1 if q2 == 2
tab male
*** Female
qui gen female = 0 if q2 == 2
qui replace female = 1 if q2 == 1
tab female

*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

*Marijuana Use in Past 30 Days
*question 39 in codebook, variable q49 in data
gen marijuana30=.
replace marijuana30=1 if inrange(q49,2,6) 
replace marijuana30=0 if q49==1 
sum marijuana30

*Frequent Marijuana use in Past 30 Days
*question 39 in codebook, variable q49 in data
gen mfreq=.
replace mfreq=1 if inrange(q49,4,6) 
replace mfreq=0 if inrange(q49,2,3) 
sum mfreq

*Marijuana Use At School in Past 30 Days
*information not in survey

*Offered, Sold, or Given Drug on School Property
*question 50 in codebook, variable q59 in data
gen drugschool=.
replace drugschool=1 if q59==1 
replace drugschool=0 if q59==2 
sum drugschool


save "MML_H2015.dta", replace
tab fips
mdesc fips
use "MML_H2015.dta", clear

**************************
* Combining the datasets *
**************************
use "MML_state_yrbs_tam_labeled.dta", clear
append using "MML_MAH.dta", force
append using "MML_NMH.dta", force
append using "MML_VTAH.dta", force
append using "MML_INH.dta", force
append using "MML_H2005.dta", force
append using "MML_H2007.dta", force
append using "MML_H2009.dta", force
append using "MML_H2011.dta", force
append using "MML_H2013.dta", force
append using "MML_H2015.dta", force
append using "MML_TX2017.dta", force
append using "MML_VT2017.dta", force
append using "MML_NM2017.dta", force
append using "MML_MD2017.dta", force
append using "MML_CT2017.dta", force
append using "MML_MA2017.dta", force
append using "MML_State15.dta", force 
append using "MML_State17.dta", force

qui replace fips=1 if state=="Alabama"
qui replace fips=2 if state=="Alaska"
qui replace fips=4 if state=="Arizona"
qui replace fips=5 if state=="Arkansas"
qui replace fips=6 if state=="California"
qui replace fips=8 if state=="Colorado"
qui replace fips=9 if state=="Connecticut"
qui replace fips=10 if state=="Delaware"
*qui replace fips=11 if state=="DistrictofColumbia"
qui replace fips=12 if state=="Florida"
qui replace fips=13 if state=="Georgia"
qui replace fips=15 if state=="Hawaii"
qui replace fips=16 if state=="Idaho"
qui replace fips=17 if state=="Illinois"
qui replace fips=18 if state=="Indiana"
qui replace fips=19 if state=="Iowa"
qui replace fips=20 if state=="Kansas"
qui replace fips=21 if state=="Kentucky"
qui replace fips=22 if state=="Louisiana"
qui replace fips=23 if state=="Maine"
qui replace fips=24 if state=="Maryland"
qui replace fips=25 if state=="Massachusetts"
qui replace fips=26 if state=="Michigan"
*qui replace fips=27 if state=="Minnesota"
qui replace fips=28 if state=="Mississippi"
qui replace fips=29 if state=="Missouri"
qui replace fips=30 if state=="Montana"
qui replace fips=31 if state=="Nebraska"
qui replace fips=32 if state=="Nevada"
qui replace fips=33 if state=="New Hampshire"
qui replace fips=34 if state=="New Jersey"
qui replace fips=35 if state=="New Mexico"
qui replace fips=36 if state=="New York"
qui replace fips=37 if state=="North Carolina"
qui replace fips=38 if state=="North Dakota"
qui replace fips=39 if state=="Ohio"
qui replace fips=40 if state=="Oklahoma"
*qui replace fips=41 if state=="Oregon"
qui replace fips=42 if state=="Pennsylvania"
qui replace fips=44 if state=="Rhode Island"
qui replace fips=45 if state=="South Carolina"
qui replace fips=46 if state=="South Dakota"
qui replace fips=47 if state=="Tennessee"
qui replace fips=48 if state=="Texas"
qui replace fips=49 if state=="Utah"
qui replace fips=50 if state=="Vermont"
qui replace fips=51 if state=="Virginia"
*qui replace fips=53 if state=="Washington"
qui replace fips=54 if state=="West Virginia"
qui replace fips=55 if state=="Wisconsin"
qui replace fips=56 if state=="Wyoming"

drop if inlist(year,1998,2000,2002,2004,2006,2008,2010,2012,2014,2016)

drop if inlist(fips,11,27,41,53)

label define fips 1 "Alabama" 2 "Alaska" 4 "Arizona" 5 "Arkansas" 6 ///
"California" 8 "Colorado" 9 "Connecticut" 10 "Delaware" 11 "District of Columbia" ///
12 "Florida" 13 "Georgia" 15 "Hawaii" 16 "Idaho" 17 "Illinois" 18 "Indiana" ///
19 "Iowa" 20 "Kansas" 21 "Kentucky" 22 "Louisiana" 23 "Maine" 24 "Maryland" ///
25 "Massachusetts" 26 "Michigan" 27 "Minnesota" 28 "Mississippi" 29 ///
"Missouri" 30 "Montana" 31 "Nebraska" 32 "Nevada" 33 "New Hampshire" 34 ///
"New Jersey" 35 "New Mexico" 36 "New York" 37 "North Carolina" 38 ///
"North Dakota" 39 "Ohio" 40 "Oklahoma" 41 "Oregon" 42 "Pennsylvania" 44 ///
"Rhode Island" 45 "South Carolina" 46 "South Dakota" 47 "Tennessee" 48 ///
"Texas" 49 "Utah" 50 "Vermont" 51 "Virginia" 53 "Washington" 54 "West Virginia" ///
55 "Wisconsin" 56 "Wyoming"

keep fips year weight age14 age15 age16 age17 age18 age_new race4 white black ///
hispanic otherrace race4_new white2 black2 hispanic2 otherrace2 male female ///
marijuana30 mfreq drugschool mschool

merge m:1 fips year using "controls_unempl_2017.dta"
drop if _merge==2
drop _merge

capture save "F:\MML project\data\MMLAnalysis_17.dta", replace
save "MMLAnalysis_17.dta", replace
