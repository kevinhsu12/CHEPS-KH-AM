**************************************************
***     MEDICAL MARIJUANA REPLICATION      *******
**************************************************
***    Done by Kevin Hsu and Alicia Marquez    ***
***    under the supervision of Joseph Sabia   ***
*** within CHEPS at San Diego State University ***
**************************************************
capture cd "/Users/Kevin/Documents/MML/Data Files"
capture cd //Insert Alicia Control Directory

cd "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files"
set more 1
*****************************************************
* Create Variables of Interest for the main dataset *
*****************************************************
use "State15.dta", clear
count
tab year
tab year
mdesc weight
drop if weight==.
count
* 796,825 as of 7/22
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

*smoked marijuana in the past 30 days
gen marijuana30=.
replace marijuana30=1 if inrange(qhowmarijuana,2,6) 
replace marijuana30=0 if qhowmarijuana==1 
sum marijuana30

*smoked marijuana freq in the past 30 days
gen mfreq=.
replace mfreq=1 if inrange(qhowmarijuana,4,6) 
replace mfreq=0 if inrange(qhowmarijuana,2,3) 
sum mfreq

*smoked marijuana at school in past 30 days
gen mschool=.
replace mschool=1 if inrange(qmarijuanaschool,2,6) 
replace mschool=0 if qmarijuanaschool==1
sum mschool

*offered, sold, or given drug on school property
tab q58
gen drugschool=.
replace drugschool=1 if q58==1 
replace drugschool=0 if q58==2 
sum drugschool

save "MML_State15.dta", replace



*****************************************************
* Create Variables of Interest for the main dataset *
*****************************************************
use "State17.dta", clear
count
tab year
drop if inrange(year, 1991, 1998)
tab year
mdesc weight
drop if weight==.
count
* 796,825 as of 7/22
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

*** SUICIDE ATTEMPT VARIABLE ***
tab q28
mdesc q28
qui gen suicideattempt = 0 if q28==1
qui replace suicideattempt = 1 if inrange(q28,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** 
tab q25
mdesc q25
qui gen depression = 0 if q25==2
qui replace depression = 1 if q25==1
tab depression

*** SUICIDE IDEATION ***
tab q26
mdesc q26
qui gen suicideideation = 0 if q26==2
qui replace suicideideation = 1 if q26==1
tab suicideideation

*** SUICIDE PLAN ***
tab q27
mdesc q27
qui gen suicideplan = 0 if q27 == 2
qui replace suicideplan = 1 if q27==1
tab suicideplan

*** SEX MINORITY VARIABLES ***
tab sexid
mdesc sexid
qui gen sexminority=1 if inrange(sexid,2,4)
qui replace sexminority=0 if sexid==1
tab sexminority
qui gen heterosexual=1 if sexid==1
qui replace heterosexual=0 if inrange(sexid,2,4)
tab heterosexual

*** JUICE CONSUMPTION ***
tab q70
mdesc q70
qui gen juiceconsump=1 if inrange(q70,2,7)
qui replace juiceconsump=0 if q70==1
tab juiceconsump

*** CARROT CONSUMPTION ***
tab q74
mdesc q74
qui gen carrotconsump=1 if inrange(q74,2,7)
qui replace carrotconsump=0 if q74==1
tab carrotconsump

*** SEATBELT USE ***
tab q8
mdesc q8
qui gen nrseatbelt=1 if inrange(q8,1,2)
qui replace nrseatbelt=0 if inrange(q8,3,5)
tab nrseatbelt

*** GRADE/CLASSROOM ***
tab grade
mdesc grade
qui replace grade = 9 if grade == 1
qui replace grade = 10 if grade == 2
qui replace grade = 11 if grade == 3
qui replace grade = 12 if grade == 4
qui replace grade = 0 if grade == 5
tab grade

drop if year!= 2017 

save "State17_labeled.dta", replace
tab fips
mdesc fips
* 796,825 as of 7/22


******************************************************
* Create Variables of Interest for the Tam's dataset *
******************************************************
*Tam's dataset had missing states up to 2013.
use "state_yrbs_tam.dta", clear
count
tab year
drop if inrange(year, 1991, 1997)
tab year
mdesc weight
drop if weight==.
count
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

*** SUICIDE ATTEMPT VARIABLE ***
tab suicide_attempt
mdesc suicide_attempt
qui gen suicideattempt = 0 if suicide_attempt==1
qui replace suicideattempt = 1 if inrange(suicide_attempt,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** 
tab depressed
mdesc depressed
qui gen depression = 0 if depressed==2
qui replace depression = 1 if depressed==1
tab depression

*** SUICIDE IDEATION ***
tab suicide_consider
mdesc suicide_consider
qui gen suicideideation = 0 if suicide_consider==2
qui replace suicideideation = 1 if suicide_consider==1
tab suicideideation

*** SUICIDE PLAN ***
tab suicide_plan
mdesc suicide_plan
qui gen suicideplan = 0 if suicide_plan == 2
qui replace suicideplan = 1 if suicide_plan==1
tab suicideplan

*** SEX MINORITY VARIABLES ***
tab sex_orient
mdesc sex_orient
qui gen sexminority=1 if inrange(sex_orient,2,4)
qui replace sexminority=0 if sex_orient==1
tab sexminority
qui gen heterosexual=1 if sex_orient==1
qui replace heterosexual=0 if inrange(sex_orient,2,4)
tab heterosexual

*** JUICE CONSUMPTION ***
tab juice_times
mdesc juice_times
qui gen juiceconsump=1 if inrange(juice_times,2,7)
qui replace juiceconsump=0 if juice_times==1
tab juiceconsump

*** CARROT CONSUMPTION ***
tab carrots_times
mdesc carrots_times
qui gen carrotconsump=1 if inrange(carrots_times,2,7)
qui replace carrotconsump=0 if carrots_times==1
tab carrotconsump

*** SEATBELT USE ***
tab seatbelt
mdesc seatbelt
qui gen nrseatbelt=1 if inrange(seatbelt,1,2)
qui replace nrseatbelt=0 if inrange(seatbelt,3,5)
tab nrseatbelt

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

save "state_yrbs_tam_labeled.dta", replace
tab fips
mdesc fips
* 158,574 as of 7/22
use  "state_yrbs_tam_labeled.dta", clear

************************************************
* Create Variables of Interest for 2015 States *
************************************************
*****************
* Massachusetts *
*****************

import delimited "MAHq.csv", clear
rename ïsite sitecode
qui gen fips=.
qui replace fips=25 if sitecode=="MA"
label define state_names 25 "Massachusetts"  
label values fips state_names
qui gen year=.
qui replace year=2015 if sitecode=="MA"
save "MAHq.dta", replace

use "MAHq.dta", clear
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

*** SUICIDE ATTEMPT VARIABLE ***
tab q29
mdesc q29
qui gen suicideattempt = 0 if q29==1
qui replace suicideattempt = 1 if inrange(q29,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** 
tab q26
mdesc q26
qui gen depression = 0 if q26==2
qui replace depression = 1 if q26==1
tab depression

*** SUICIDE IDEATION ***
tab q27
mdesc q27
qui gen suicideideation = 0 if q27==2
qui replace suicideideation = 1 if q27==1
tab suicideideation

*** SUICIDE PLAN ***
tab q28
mdesc q28
qui gen suicideplan = 0 if q28 == 2
qui replace suicideplan = 1 if q28==1
tab suicideplan

*** SEX MINORITY VARIABLES ***
tab q68
mdesc q68
qui gen sexminority=1 if inrange(q68,2,4)
qui replace sexminority=0 if q68==1
tab sexminority
qui gen heterosexual=1 if q68==1
qui replace heterosexual=0 if inrange(q68,2,4)
tab heterosexual

*** JUICE CONSUMPTION ***
tab q71
mdesc q71
qui gen juiceconsump=1 if inrange(q71,2,7)
qui replace juiceconsump=0 if q71==1
tab juiceconsump

*** CARROT CONSUMPTION ***
tab q75
mdesc q75
qui gen carrotconsump=1 if inrange(q75,2,7)
qui replace carrotconsump=0 if q75==1
tab carrotconsump

*** SEATBELT USE ***
/* Not asked
tab seatbelt
mdesc seatbelt
qui gen nrseatbelt=1 if inrange(seatbelt,1,2)
qui replace nrseatbelt=0 if inrange(seatbelt,3,5)
tab nrseatbelt
*/

*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

*smoked marijuana in the past 30 days
gen marijuana30=.
replace marijuana30=1 if inrange(q49,2,6) 
replace marijuana30=0 if q49==1 
sum marijuana30

*smoked marijuana freq in the past 30 days
gen mfreq=.
replace mfreq=1 if inrange(q49,4,6) 
replace mfreq=0 if inrange(q49,2,3) 
sum mfreq

*smoked marijuana at school in past 30 days
**information not in survey

*offered, sold, or given drug on school property
**information not in survey

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
use "VTAHq.dta", clear
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

*** SUICIDE ATTEMPT VARIABLE ***
tab q29
mdesc q29
qui gen suicideattempt = 0 if q29==1
qui replace suicideattempt = 1 if inrange(q29,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** 
tab q26
mdesc q26
qui gen depression = 0 if q26==2
qui replace depression = 1 if q26==1
tab depression

*** SUICIDE IDEATION ***
/* Not asked
tab q27
mdesc q27
qui gen suicideideation = 0 if q27==2
qui replace suicideideation = 1 if q27==1
tab suicideideation
*/

*** SUICIDE PLAN ***
tab q28
mdesc q28
qui gen suicideplan = 0 if q28 == 2
qui replace suicideplan = 1 if q28==1
tab suicideplan

*** SEX MINORITY VARIABLES ***
tab q68
mdesc q68
qui gen sexminority=1 if inrange(q68,2,4)
qui replace sexminority=0 if q68==1
tab sexminority
qui gen heterosexual=1 if q68==1
qui replace heterosexual=0 if inrange(q68,2,4)
tab heterosexual

*** JUICE CONSUMPTION ***
tab q71
mdesc q71
qui gen juiceconsump=1 if inrange(q71,2,7)
qui replace juiceconsump=0 if q71==1
tab juiceconsump

*** CARROT CONSUMPTION ***
tab q75
mdesc q75
qui gen carrotconsump=1 if inrange(q75,2,7)
qui replace carrotconsump=0 if q75==1
tab carrotconsump

*** SEATBELT USE ***
/* Not asked
tab seatbelt
mdesc seatbelt
qui gen nrseatbelt=1 if inrange(seatbelt,1,2)
qui replace nrseatbelt=0 if inrange(seatbelt,3,5)
tab nrseatbelt
*/

*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

*smoked marijuana in the past 30 days
gen marijuana30=.
replace marijuana30=1 if inrange(q49,2,6) 
replace marijuana30=0 if q49==1 
sum marijuana30

*smoked marijuana freq in the past 30 days
gen mfreq=.
replace mfreq=1 if inrange(q49,4,6) 
replace mfreq=0 if inrange(q49,2,3) 
sum mfreq

*smoked marijuana at school in past 30 days
**information not in survey

*offered, sold, or given drug on school property
**information not in survey

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
use "INHq.dta", clear
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

*** SUICIDE ATTEMPT VARIABLE ***
tab q29
mdesc q29
qui gen suicideattempt = 0 if q29==1
qui replace suicideattempt = 1 if inrange(q29,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** 
tab q26
mdesc q26
qui gen depression = 0 if q26==2
qui replace depression = 1 if q26==1
tab depression

*** SUICIDE IDEATION ***
tab q27
mdesc q27
qui gen suicideideation = 0 if q27==2
qui replace suicideideation = 1 if q27==1
tab suicideideation

*** SUICIDE PLAN ***
tab q28
mdesc q28
qui gen suicideplan = 0 if q28 == 2
qui replace suicideplan = 1 if q28==1
tab suicideplan

*** SEX MINORITY VARIABLES ***
tab q68
mdesc q68
qui gen sexminority=1 if inrange(q68,2,4)
qui replace sexminority=0 if q68==1
tab sexminority
qui gen heterosexual=1 if q68==1
qui replace heterosexual=0 if inrange(q68,2,4)
tab heterosexual

*** JUICE CONSUMPTION ***
tab q71
mdesc q71
qui gen juiceconsump=1 if inrange(q71,2,7)
qui replace juiceconsump=0 if q71==1
tab juiceconsump

*** CARROT CONSUMPTION ***
tab q75
mdesc q75
qui gen carrotconsump=1 if inrange(q75,2,7)
qui replace carrotconsump=0 if q75==1
tab carrotconsump

*** SEATBELT USE ***
tab q9
mdesc q9
qui gen nrseatbelt=1 if inrange(q9,1,2)
qui replace nrseatbelt=0 if inrange(q9,3,5)
tab nrseatbelt


*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

*smoked marijuana in the past 30 days
gen marijuana30=.
replace marijuana30=1 if inrange(q49,2,6) 
replace marijuana30=0 if q49==1 
sum marijuana30

*smoked marijuana freq in the past 30 days
gen mfreq=.
replace mfreq=1 if inrange(q49,4,6) 
replace mfreq=0 if inrange(q49,2,3) 
sum mfreq

*smoked marijuana at school in past 30 days
**information not on survey

*offered, sold, or given drug on school property
**information not on survey

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

use "NMHq.dta", clear
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

*** SUICIDE ATTEMPT VARIABLE ***
tab q29
mdesc q29
qui gen suicideattempt = 0 if q29==1
qui replace suicideattempt = 1 if inrange(q29,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** 
tab q26
mdesc q26
qui gen depression = 0 if q26==2
qui replace depression = 1 if q26==1
tab depression

*** SUICIDE IDEATION ***
tab q27
mdesc q27
qui gen suicideideation = 0 if q27==2
qui replace suicideideation = 1 if q27==1
tab suicideideation

*** SUICIDE PLAN ***
tab q28
mdesc q28
qui gen suicideplan = 0 if q28 == 2
qui replace suicideplan = 1 if q28==1
tab suicideplan

*** SEX MINORITY VARIABLES ***
tab q68
mdesc q68
qui gen sexminority=1 if inrange(q68,2,4)
qui replace sexminority=0 if q68==1
tab sexminority
qui gen heterosexual=1 if q68==1
qui replace heterosexual=0 if inrange(q68,2,4)
tab heterosexual

*** JUICE CONSUMPTION ***
tab q71
mdesc q71
qui gen juiceconsump=1 if inrange(q71,2,7)
qui replace juiceconsump=0 if q71==1
tab juiceconsump

*** CARROT CONSUMPTION ***
tab q75
mdesc q75
qui gen carrotconsump=1 if inrange(q75,2,7)
qui replace carrotconsump=0 if q75==1
tab carrotconsump

*** SEATBELT USE ***
tab q9
mdesc q9
qui gen nrseatbelt=1 if inrange(q9,1,2)
qui replace nrseatbelt=0 if inrange(q9,3,5)
tab nrseatbelt

*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

*smoked marijuana in the past 30 days
gen marijuana30=.
replace marijuana30=1 if inrange(q49,2,6) 
replace marijuana30=0 if q49==1 
sum marijuana30

*smoked marijuana freq in the past 30 days
gen mfreq=.
replace mfreq=1 if inrange(q49,4,6) 
replace mfreq=0 if inrange(q49,2,3) 
sum mfreq

*smoked marijuana at school in past 30 days
**information not in survey

*offered, sold, or given drug on school property
**information not in survey

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
use "H2005.dta", clear
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

*** SUICIDE ATTEMPT VARIABLE ***
tab q26
mdesc q26
qui gen suicideattempt = 0 if q26==1
qui replace suicideattempt = 1 if inrange(q26,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** 
tab q23
mdesc q23
qui gen depression = 0 if q23==2
qui replace depression = 1 if q23==1
tab depression

*** SUICIDE IDEATION ***
tab q24
mdesc q24
qui gen suicideideation = 0 if q24==2
qui replace suicideideation = 1 if q24==1
tab suicideideation

*** SUICIDE PLAN ***
tab q25
mdesc q25
qui gen suicideplan = 0 if q25 == 2
qui replace suicideplan = 1 if q25==1
tab suicideplan

*** SEX MINORITY VARIABLES ***
/* Not asked
tab q68
mdesc q68
qui gen sexminority=1 if inrange(q68,2,4)
qui replace sexminority=0 if q68==1
tab sexminority
qui gen heterosexual=1 if q68==1
qui replace heterosexual=0 if inrange(q68,2,4)
tab heterosexual
*/

*** JUICE CONSUMPTION ***
tab q71
mdesc q71
qui gen juiceconsump=1 if inrange(q71,2,7)
qui replace juiceconsump=0 if q71==1
tab juiceconsump

*** CARROT CONSUMPTION ***
tab q75
mdesc q75
qui gen carrotconsump=1 if inrange(q75,2,7)
qui replace carrotconsump=0 if q75==1
tab carrotconsump

*** SEATBELT USE ***
tab q9
mdesc q9
qui gen nrseatbelt=1 if inrange(q9,1,2)
qui replace nrseatbelt=0 if inrange(q9,3,5)
tab nrseatbelt


*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

save "H2005_labeled.dta", replace
tab fips
mdesc fips
use "H2005_labeled.dta", clear

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
use "H2007.dta", clear
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

*** SUICIDE ATTEMPT VARIABLE ***
tab q26
mdesc q26
qui gen suicideattempt = 0 if q26==1
qui replace suicideattempt = 1 if inrange(q26,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** 
tab q23
mdesc q23
qui gen depression = 0 if q23==2
qui replace depression = 1 if q23==1
tab depression

*** SUICIDE IDEATION ***
tab q24
mdesc q24
qui gen suicideideation = 0 if q24==2
qui replace suicideideation = 1 if q24==1
tab suicideideation

*** SUICIDE PLAN ***
tab q25
mdesc q25
qui gen suicideplan = 0 if q25 == 2
qui replace suicideplan = 1 if q25==1
tab suicideplan

*** SEX MINORITY VARIABLES ***
/* Not asked
tab q68
mdesc q68
qui gen sexminority=1 if inrange(q68,2,4)
qui replace sexminority=0 if q68==1
tab sexminority
qui gen heterosexual=1 if q68==1
qui replace heterosexual=0 if inrange(q68,2,4)
tab heterosexual
*/

*** JUICE CONSUMPTION ***
tab q72
mdesc q72
qui gen juiceconsump=1 if inrange(q72,2,7)
qui replace juiceconsump=0 if q72==1
tab juiceconsump

*** CARROT CONSUMPTION ***
tab q76
mdesc q76
qui gen carrotconsump=1 if inrange(q76,2,7)
qui replace carrotconsump=0 if q76==1
tab carrotconsump

*** SEATBELT USE ***
/* Not asked
tab q9
mdesc q9
qui gen nrseatbelt=1 if inrange(q9,1,2)
qui replace nrseatbelt=0 if inrange(q9,3,5)
tab nrseatbelt
*/

*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

save "H2007_labeled.dta", replace
tab fips
mdesc fips
use "H2007_labeled.dta", clear

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
use "H2009.dta", clear
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

*** SUICIDE ATTEMPT VARIABLE ***
tab q26
mdesc q26
qui gen suicideattempt = 0 if q26==1
qui replace suicideattempt = 1 if inrange(q26,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** 
tab q23
mdesc q23
qui gen depression = 0 if q23==2
qui replace depression = 1 if q23==1
tab depression

*** SUICIDE IDEATION ***
tab q24
mdesc q24
qui gen suicideideation = 0 if q24==2
qui replace suicideideation = 1 if q24==1
tab suicideideation

*** SUICIDE PLAN ***
tab q25
mdesc q25
qui gen suicideplan = 0 if q25 == 2
qui replace suicideplan = 1 if q25==1
tab suicideplan

*** SEX MINORITY VARIABLES ***
/* Not asked
tab q68
mdesc q68
qui gen sexminority=1 if inrange(q68,2,4)
qui replace sexminority=0 if q68==1
tab sexminority
qui gen heterosexual=1 if q68==1
qui replace heterosexual=0 if inrange(q68,2,4)
tab heterosexual
*/

*** JUICE CONSUMPTION ***
/* Asked, but no data mapped
tab q72
mdesc q72
qui gen juiceconsump=1 if inrange(q72,2,7)
qui replace juiceconsump=0 if q72==1
tab juiceconsump
*/

*** CARROT CONSUMPTION ***
tab q76
mdesc q76
qui gen carrotconsump=1 if inrange(q76,2,7)
qui replace carrotconsump=0 if q76==1
tab carrotconsump

*** SEATBELT USE ***
/* Not asked
tab q9
mdesc q9
qui gen nrseatbelt=1 if inrange(q9,1,2)
qui replace nrseatbelt=0 if inrange(q9,3,5)
tab nrseatbelt
*/

*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

save "H2009_labeled.dta", replace
tab fips
mdesc fips
use "H2009_labeled.dta", clear

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
use "H2011.dta", clear
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

*** SUICIDE ATTEMPT VARIABLE ***
tab q27
mdesc q27
qui gen suicideattempt = 0 if q27==1
qui replace suicideattempt = 1 if inrange(q27,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** 
tab q24
mdesc q24
qui gen depression = 0 if q24==2
qui replace depression = 1 if q24==1
tab depression

*** SUICIDE IDEATION ***
tab q25
mdesc q25
qui gen suicideideation = 0 if q25==2
qui replace suicideideation = 1 if q25==1
tab suicideideation

*** SUICIDE PLAN ***
tab q26
mdesc q26
qui gen suicideplan = 0 if q26 == 2
qui replace suicideplan = 1 if q26==1
tab suicideplan

*** SEX MINORITY VARIABLES ***
tab q103
mdesc q103
qui gen sexminority=1 if inrange(q103,2,4)
qui replace sexminority=0 if q103==1
tab sexminority
qui gen heterosexual=1 if q103==1
qui replace heterosexual=0 if inrange(q103,2,4)
tab heterosexual

*** JUICE CONSUMPTION ***
tab q72
mdesc q72
qui gen juiceconsump=1 if inrange(q72,2,7)
qui replace juiceconsump=0 if q72==1
tab juiceconsump

*** CARROT CONSUMPTION ***
tab q76
mdesc q76
qui gen carrotconsump=1 if inrange(q76,2,7)
qui replace carrotconsump=0 if q76==1
tab carrotconsump

*** SEATBELT USE ***
/* Not asked
tab q9
mdesc q9
qui gen nrseatbelt=1 if inrange(q9,1,2)
qui replace nrseatbelt=0 if inrange(q9,3,5)
tab nrseatbelt
*/

*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

save "H2011_labeled.dta", replace
tab fips
mdesc fips
use "H2011_labeled.dta", clear

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
use "H2013.dta", clear
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

*** SUICIDE ATTEMPT VARIABLE ***
tab q29
mdesc q29
qui gen suicideattempt = 0 if q29==1
qui replace suicideattempt = 1 if inrange(q29,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** 
tab q26
mdesc q26
qui gen depression = 0 if q26==2
qui replace depression = 1 if q26==1
tab depression

*** SUICIDE IDEATION ***
tab q27
mdesc q27
qui gen suicideideation = 0 if q27==2
qui replace suicideideation = 1 if q27==1
tab suicideideation

*** SUICIDE PLAN ***
tab q28
mdesc q28
qui gen suicideplan = 0 if q28 == 2
qui replace suicideplan = 1 if q28==1
tab suicideplan

*** SEX MINORITY VARIABLES ***
tab q106
mdesc q106
qui gen sexminority=1 if inrange(q106,2,4)
qui replace sexminority=0 if q106==1
tab sexminority
qui gen heterosexual=1 if q106==1
qui replace heterosexual=0 if inrange(q106,2,4)
tab heterosexual

*** JUICE CONSUMPTION ***
tab q71
mdesc q71
qui gen juiceconsump=1 if inrange(q71,2,7)
qui replace juiceconsump=0 if q71==1
tab juiceconsump

*** CARROT CONSUMPTION ***
/* Not asked, but q75 is similar: "orange-colored vegetables"
tab q76
mdesc q76
qui gen carrotconsump=1 if inrange(q76,2,7)
qui replace carrotconsump=0 if q76==1
tab carrotconsump
*/

*** SEATBELT USE ***
/* Not asked
tab q9
mdesc q9
qui gen nrseatbelt=1 if inrange(q9,1,2)
qui replace nrseatbelt=0 if inrange(q9,3,5)
tab nrseatbelt
*/

*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

save "H2013_labeled.dta", replace
tab fips
mdesc fips
use "H2013_labeled.dta", clear

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
use "H2015.dta", clear
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

*** SUICIDE ATTEMPT VARIABLE ***
tab q29
mdesc q29
qui gen suicideattempt = 0 if q29==1
qui replace suicideattempt = 1 if inrange(q29,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** 
tab q26
mdesc q26
qui gen depression = 0 if q26==2
qui replace depression = 1 if q26==1
tab depression

*** SUICIDE IDEATION ***
tab q27
mdesc q27
qui gen suicideideation = 0 if q27==2
qui replace suicideideation = 1 if q27==1
tab suicideideation

*** SUICIDE PLAN ***
tab q28
mdesc q28
qui gen suicideplan = 0 if q28 == 2
qui replace suicideplan = 1 if q28==1
tab suicideplan

*** SEX MINORITY VARIABLES ***
tab q68
mdesc q68
qui gen sexminority=1 if inrange(q68,2,4)
qui replace sexminority=0 if q68==1
tab sexminority
qui gen heterosexual=1 if q68==1
qui replace heterosexual=0 if inrange(q68,2,4)
tab heterosexual

*** JUICE CONSUMPTION ***
tab q71
mdesc q71
qui gen juiceconsump=1 if inrange(q71,2,7)
qui replace juiceconsump=0 if q71==1
tab juiceconsump

*** CARROT CONSUMPTION ***
/* Not asked, but q71 is similar: "orange-colored vegetables"
tab q76
mdesc q76
qui gen carrotconsump=1 if inrange(q76,2,7)
qui replace carrotconsump=0 if q76==1
tab carrotconsump
*/

*** SEATBELT USE ***
/* Not asked
tab q9
mdesc q9
qui gen nrseatbelt=1 if inrange(q9,1,2)
qui replace nrseatbelt=0 if inrange(q9,3,5)
tab nrseatbelt
*/

*** GRADE/CLASSROOM ***
tab q3
mdesc q3
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5
tab grade

save "H2015_labeled.dta", replace
tab fips
mdesc fips
use "H2015_labeled.dta", clear

**************************
* Combining the datasets *
**************************
**************************
* Combining the datasets *
**************************
use "state_yrbs_tam_labeled.dta", clear
append using "MAHq_labeled.dta", force
append using "NMHq_labeled.dta", force
append using "VTAHq_labeled.dta", force
append using "INHq_labeled.dta", force
append using "H2005_labeled.dta", force
append using "H2007_labeled.dta", force
append using "H2009_labeled.dta", force
append using "H2011_labeled.dta", force
append using "H2013_labeled.dta", force
append using "H2015_labeled.dta", force
append using "TX_labeled_2017.dta", force
append using "VT_labeled_2017.dta", force
append using "NM_labeled_2017.dta", force
append using "MD_labeled_2017.dta", force
append using "CT_labeled_2017.dta", force
append using "MA_labeled_2017.dta", force
append using "State17_labeled.dta", force 
save "State17_extra.dta", replace
count if suicideattempt!=.

use "State15_labeled.dta", clear
append using "State17_extra.dta"
count
* 1,009,161
count if suicideattempt!=.
* 777,358
save "Combined17.dta", replace

keep fips year weight age14 age15 age16 age17 age18 age_new race4 white black ///
hispanic otherrace race4_new white2 black2 hispanic2 otherrace2 male female ///
suicideattempt depression suicideideation suicideplan sexminority heterosexual ///
juiceconsump carrotconsump nrseatbelt grade 
save "Combined17_slim.dta", replace

tab fips
mdesc fips
mdesc weight
drop if weight==.
count
tab fips year



************************
* Add controls dataset *
************************
use "Combined17.dta", clear
merge m:1 fips year using "controls_unempl_2017.dta"
drop _merge
save "Combined17_unempl.dta", replace

use "Combined17_slim.dta", clear
merge m:1 fips year using "controls_unempl_2017.dta"
drop _merge
save "Combined17_unempl_slim.dta", replace

***************************************
* Create SSM Policy Variables Dataset *
***************************************
* SSM_policy year.csv" was compiled based on the "Anti-discrimination laws source"
* Compiled by Pam and created to match the original paper using supplement eTables 1 and 2
import delimited "SSM_policy year.csv", clear
save "SSM_policy year.dta", replace
use "SSM_policy year.dta", clear
qui gen fips =.
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
tab fips
mdesc fips
save "SSM_policy_fips.dta", replace

****************************
* Add SSM Policy Variables *
****************************
use "Combined17_unempl.dta", clear
merge m:1 fips using "SSM_policy_fips.dta"
drop _merge
save "Combined17_unempl_policy.dta", replace

use "Combined17_unempl_slim.dta", clear
merge m:1 fips using "SSM_policy_fips.dta"
drop _merge
save "Combined17_unempl_policy_slim.dta", replace

************************
* Finalize the Dataset *
************************
use "Combined17_unempl_policy.dta", clear
tab year
drop if inrange(year, 1991, 1998)
drop if inlist(year,1998,2000,2002,2004,2006,2008,2010,2012,2014,2016)
tab year
tab fips
drop if inlist(fips,11,27,41,53)
tab fips
mdesc fips
tab eyear
mdesc eyear
tab pyear
mdesc pyear
count
qui gen ssmstate=1 if inrange(eyear, 1999, 2015)
qui replace ssmstate=0 if eyear==0
tab ssmstate 
mdesc ssmstate
save "SSMFull_Prepared_2017.dta", replace

use "Combined17_unempl_policy_slim.dta", clear
tab year
drop if inrange(year, 1991, 1998)
drop if inlist(year,1998,2000,2002,2004,2006,2008,2010,2012,2014, 2016)
tab year
tab fips
tab fips
drop if inlist(fips,11,27,41,53)
tab fips
mdesc fips
tab eyear
mdesc eyear
tab pyear
mdesc pyear
count
qui gen ssmstate=1 if inrange(eyear, 1999, 2015)
qui replace ssmstate=0 if eyear==0
tab ssmstate 
mdesc ssmstate

drop if weight==.

save "SSMAnalysis_17.dta", replace

*merge 1:m using fips 


/* CDC Logic for calculating leveled race variables:
replace q5=subinstr(q5," ","",.)
gen racere =.
replace racere = 1 if q4==2 & strpos(q5,"A")>0
replace racere = 2 if q4==2 & strpos(q5,"B")>0
replace racere = 3 if q4==2 & strpos(q5,"C")>0
replace racere = 4 if q4==2 & strpos(q5,"D")>0
replace racere = 5 if q4==2 & strpos(q5,"E")>0
replace racere = 6 if q4==1 & q5==""
replace racere = 7 if q4==1 & q5!=""
replace racere = 8 if q4==2 & strlen(q5)>1
replace racere = . if q4==2 & q5==""
replace racere = . if q4==.
replace racere = . if (q4!=1 & q4!=2 & q4!=.)
replace racere = . if (strpos(q5,"F")>0 | strpos(q5,"G")>0 | strpos(q5,"H")>0)
tab racere
tab raceeth
*/
