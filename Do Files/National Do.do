**************************************************
***     MEDICAL MARIJUANA REPLICATION      *******
**************************************************
***    Done by Kevin Hsu and Alicia Marquez    ***
***    under the supervision of Joseph Sabia   ***
*** within CHEPS at San Diego State University ***
**************************************************
capture cd "/Users/Kevin/Documents/MML/Data Files"
capture cd "F:\MML project\national data" 
set more 1


*******************
***NATIONAL YRBS***
*******************

**********
***1993***
**********
capture use "NYRBS_1993.dta", clear

capture rename stfips fips
gen year=1993

*MML
gen marijuana30=.
replace marijuana30=1 if inlist(q45,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace marijuana30=0 if q45=="0 times"
*1

gen mfreq=.
replace mfreq=1 if inlist(q45,"10 to 19 times", "20 to 39 times", "40 or more times")
*4,6
replace mfreq=0 if inlist(q45,"0 times", "1 or 2 times", "3 to 9 times")
*1,3

gen mschool=.
replace mschool=1 if inlist(q46,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace mschool=0 if q46=="0 times"
*1

gen drugschool=.
replace drugschool=1 if q54=="yes"
*1
replace drugschool=0 if q54=="no"
*2

*RACE
rename q4 race

gen white=.
replace white=1 if race=="White - not Hispanic"
*1
replace white=0 if inlist(race,"Asian or Pacific Islander", "Black - not Hispanic", "Hispanic", "Native American or Alaskan", "Other")
*2,3,4,5,6

gen black=.
replace black=1 if race=="Black - not Hispanic"
*2
replace black=0 if inlist(race,"Asian or Pacific Islander", "White - not Hispanic", "Hispanic", "Native American or Alaskan", "Other")
*1,3,4,5,6

gen hispanic=.
replace hispanic=1 if race=="Hispanic"
*3
replace hispanic=0 if inlist(race,"Asian or Pacific Islander", "Black - not Hispanic", "White - not Hispanic", "Native American or Alaskan", "Other")
*1,2,4,5,6

gen otherrace=.
replace otherrace=1 if inlist(race,"Asian or Pacific Islander", "Native American or Alaskan", "Other")
*4,5,6
replace otherrace=0 if inlist(race,"White - not Hispanic", "Black - not Hispanic", "Hispanic")
*1,2,3

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade=="9th grade"
replace grade9=0 if inlist(grade, "10th grade", "11th grade", "12th grade")

gen grade10=.
replace grade10=1 if grade=="10th grade"
replace grade10=0 if inlist(grade, "9th grade", "11th grade", "12th grade")

gen grade11=.
replace grade11=1 if grade=="11th grade"
replace grade11=0 if inlist(grade, "10th grade", "9th grade", "12th grade")

gen grade12=.
replace grade12=1 if grade=="12th grade"
replace grade12=0 if inlist(grade, "10th grade", "11th grade", "9th grade")

*SEX
rename q2 sex

gen male=.
replace male=1 if sex=="male"
replace male=0 if sex=="female"

gen female=.
replace female=1 if sex=="female"
replace female=0 if sex=="male"

*AGE
rename q1 age

gen age_new=.
replace age_new=12 if age=="12 years old or younger"
replace age_new=13 if age=="13 years old"
replace age_new=14 if age=="14 years old"
replace age_new=15 if age=="15 years old"
replace age_new=16 if age=="16 years old"
replace age_new=17 if age=="17 years old"
replace age_new=18 if age=="18 years old or older"

save "MML_National_93.dta", replace
tab fips
mdesc fips

**********
***1995***
**********
capture use "NYRBS_1995.dta", clear

capture rename stfips fips
gen year=1995

*MML
gen marijuana30=.
replace marijuana30=1 if inlist(q43,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace marijuana30=0 if q43=="0 times"
*1

gen mfreq=.
replace mfreq=1 if inlist(q43,"10 to 19 times", "20 to 39 times", "40 or more times")
*4,6
replace mfreq=0 if inlist(q43,"0 times", "1 or 2 times", "3 to 9 times")
*1,3

gen mschool=.
replace mschool=1 if inlist(q44,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace mschool=0 if q44=="0 times"
*1

gen drugschool=.
replace drugschool=1 if q53=="yes"
*1
replace drugschool=0 if q53=="no"
*2

*RACE
rename q4 race

gen white=.
replace white=1 if race=="White - not Hispanic"
*1
replace white=0 if inlist(race,"Asian or Pacific Islander", "Black - not Hispanic", "Hispanic", "Native American or Alaskan", "Other")
*2,3,4,5,6

gen black=.
replace black=1 if race=="Black - not Hispanic"
*2
replace black=0 if inlist(race,"Asian or Pacific Islander", "White - not Hispanic", "Hispanic", "Native American or Alaskan", "Other")
*1,3,4,5,6

gen hispanic=.
replace hispanic=1 if race=="Hispanic"
*3
replace hispanic=0 if inlist(race,"Asian or Pacific Islander", "Black - not Hispanic", "White - not Hispanic", "Native American or Alaskan", "Other")
*1,2,4,5,6

gen otherrace=.
replace otherrace=1 if inlist(race,"Asian or Pacific Islander", "Native American or Alaskan", "Other")
*4,5,6
replace otherrace=0 if inlist(race,"White - not Hispanic", "Black - not Hispanic", "Hispanic")
*1,2,3

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade=="9th grade"
replace grade9=0 if inlist(grade, "10th grade", "11th grade", "12th grade")

gen grade10=.
replace grade10=1 if grade=="10th grade"
replace grade10=0 if inlist(grade, "9th grade", "11th grade", "12th grade")

gen grade11=.
replace grade11=1 if grade=="11th grade"
replace grade11=0 if inlist(grade, "10th grade", "9th grade", "12th grade")

gen grade12=.
replace grade12=1 if grade=="12th grade"
replace grade12=0 if inlist(grade, "10th grade", "11th grade", "9th grade")

*SEX
rename q2 sex

gen male=.
replace male=1 if sex=="male"
replace male=0 if sex=="female"

gen female=.
replace female=1 if sex=="female"
replace female=0 if sex=="male"

*AGE
rename q1 age

gen age_new=.
replace age_new=12 if age=="12 years old or younger"
replace age_new=13 if age=="13 years old"
replace age_new=14 if age=="14 years old"
replace age_new=15 if age=="15 years old"
replace age_new=16 if age=="16 years old"
replace age_new=17 if age=="17 years old"
replace age_new=18 if age=="18 years old or older"

save "MML_National_95.dta", replace
tab fips
mdesc fips

**********
***1997***
**********
capture use "NYRBS_1997.dta", clear

capture rename stfips fips
gen year=1997

*MML, 43, 43, 44, 53

*MML
gen marijuana30=.
replace marijuana30=1 if inlist(q43,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace marijuana30=0 if q43=="0 times"
*1

gen mfreq=.
replace mfreq=1 if inlist(q43,"10 to 19 times", "20 to 39 times", "40 or more times")
*4,6
replace mfreq=0 if inlist(q43,"0 times", "1 or 2 times", "3 to 9 times")
*1,3

gen mschool=.
replace mschool=1 if inlist(q44,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace mschool=0 if q44=="0 times"
*1

gen drugschool=.
replace drugschool=1 if q53=="yes"
*1
replace drugschool=0 if q53=="no"
*2

*RACE
rename q4 race

gen white=.
replace white=1 if race=="White - not Hispanic"
*1
replace white=0 if inlist(race,"Asian or Pacific Islander", "Black - not Hispanic", "Hispanic", "Native American or Alaskan", "Other")
*2,3,4,5,6

gen black=.
replace black=1 if race=="Black - not Hispanic"
*2
replace black=0 if inlist(race,"Asian or Pacific Islander", "White - not Hispanic", "Hispanic", "Native American or Alaskan", "Other")
*1,3,4,5,6

gen hispanic=.
replace hispanic=1 if race=="Hispanic"
*3
replace hispanic=0 if inlist(race,"Asian or Pacific Islander", "Black - not Hispanic", "White - not Hispanic", "Native American or Alaskan", "Other")
*1,2,4,5,6

gen otherrace=.
replace otherrace=1 if inlist(race,"Asian or Pacific Islander", "Native American or Alaskan", "Other")
*4,5,6
replace otherrace=0 if inlist(race,"White - not Hispanic", "Black - not Hispanic", "Hispanic")
*1,2,3

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade=="9th grade"
replace grade9=0 if inlist(grade, "10th grade", "11th grade", "12th grade")

gen grade10=.
replace grade10=1 if grade=="10th grade"
replace grade10=0 if inlist(grade, "9th grade", "11th grade", "12th grade")

gen grade11=.
replace grade11=1 if grade=="11th grade"
replace grade11=0 if inlist(grade, "10th grade", "9th grade", "12th grade")

gen grade12=.
replace grade12=1 if grade=="12th grade"
replace grade12=0 if inlist(grade, "10th grade", "11th grade", "9th grade")

*SEX
rename q2 sex

gen male=.
replace male=1 if sex=="male"
replace male=0 if sex=="female"

gen female=.
replace female=1 if sex=="female"
replace female=0 if sex=="male"

*AGE
rename q1 age

gen age_new=.
replace age_new=12 if age=="12 years old or younger"
replace age_new=13 if age=="13 years old"
replace age_new=14 if age=="14 years old"
replace age_new=15 if age=="15 years old"
replace age_new=16 if age=="16 years old"
replace age_new=17 if age=="17 years old"
replace age_new=18 if age=="18 years old or older"

save "MML_National_97.dta", replace
tab fips
mdesc fips

**********
***1999***  ***NOT STRING***
**********
capture use "NYRBS_1999.dta", clear

capture rename stfips fips
gen year=1999

*MML, 46, 46, 47, 56
gen marijuana30=.
replace marijuana30=1 if inrange(q46,2,6)
replace marijuana30=0 if q46==1

gen mfreq=.
replace mfreq=1 if inrange(q46,4,6)
replace mfreq=0 if inrange(q46,1,3)

gen mschool=.
replace mschool=1 if inrange(q47,2,6)
replace mschool=0 if q47==1

gen drugschool=.
replace drugschool=1 if q56==1
replace drugschool=0 if q56==2

*RACE
**hispanic = hispanic/latino (4) + multiple-hispanic (7)
rename q4 race

gen white=.
replace white=1 if race==6
replace white=0 if inlist(race,1,2,3,4,5,7,8)

gen black=.
replace black=1 if race==3
replace black=0 if inlist(race,1,2,4,5,6,7,8)

gen hispanic=.
replace hispanic=1 if inlist(race,4,7)
replace hispanic=0 if inlist(race,1,2,3,5,6)

gen otherrace=.
replace otherrace=1 if inlist(race,1,2,5,8)
replace otherrace=0 if inlist(race,3,4,6,7)

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade==1
replace grade9=0 if inlist(grade,2,3,4)

gen grade10=.
replace grade10=1 if grade==2
replace grade10=0 if inlist(grade,1,3,4)

gen grade11=.
replace grade11=1 if grade==3
replace grade11=0 if inlist(grade,1,2,4)

gen grade12=.
replace grade12=1 if grade==4
replace grade12=0 if inlist(grade,1,2,3)

*SEX
rename q2 sex

gen male=.
replace male=1 if sex==2
replace male=0 if sex==1

gen female=.
replace female=1 if sex==1
replace female=0 if sex==2

<<<<<<< HEAD
<<<<<<< HEAD
*** SSM(VARIABLES)
*RACE(SSM)
generate race4 = 1 if race==6
generate race4 = 2 if race==3
generate race4 = 3 if inlist(race,4,7)
generate race4 = 4 if inlist(race,1,2,5,8)
*** AGE VARIABLES ***
rename q1 age
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

gen age_new = age+11

*** SUICIDE ATTEMPT VARIABLE *** Q25
qui gen suicideattempt = 0 if q25==1
qui replace suicideattempt = 1 if inrange(q25,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** Q22
qui gen depression = 0 if q22==2
qui replace depression = 1 if q22==1
tab depression

*** SUICIDE IDEATION *** Q23
qui gen suicideideation = 0 if q23==2
qui replace suicideideation = 1 if q23==1
tab suicideideation

*** SUICIDE PLAN *** Q24
qui gen suicideplan = 0 if q24 == 2
qui replace suicideplan = 1 if q24==1
tab suicideplan

*** SEX MINORITY *** 
*MISSING

*
*** JUICE CONSUMPTION *** Q72
qui gen juiceconsump=1 if inrange(q72,2,7)
qui replace juiceconsump=0 if q72==1
tab juiceconsump

*** CARROT CONSUMPTION *** Q76

qui gen carrotconsump=1 if inrange(q76,2,7)
qui replace carrotconsump=0 if q76==1
tab carrotconsump

*** SEATBELT USE *** Q9
qui gen nrseatbelt=1 if inrange(q9,1,2)
qui replace nrseatbelt=0 if inrange(q9,3,5)
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
=======
*AGE
rename q1 age

gen age_new=.
replace age_new=12 if age==1
replace age_new=13 if age==2
replace age_new=14 if age==3
replace age_new=15 if age==4
replace age_new=16 if age==5
replace age_new=17 if age==6
replace age_new=18 if age==7
>>>>>>> 11e80e93c0129e2724248023492fffc482b9695a

=======
>>>>>>> parent of 5edf19e... SSM
save "MML_National_99.dta", replace
tab fips
mdesc fips

**********
***2001***
**********
capture use "NYRBS_2001.dta", clear

capture rename stfips fips
gen year=2001

*MML, 47, 47, 48, 57
gen marijuana30=.
replace marijuana30=1 if inlist(q47,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace marijuana30=0 if q47=="0 times"
*1

gen mfreq=.
replace mfreq=1 if inlist(q47,"10 to 19 times", "20 to 39 times", "40 or more times")
*4,6
replace mfreq=0 if inlist(q47,"0 times", "1 or 2 times", "3 to 9 times")
*1,3

gen mschool=.
replace mschool=1 if inlist(q48,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace mschool=0 if q48=="0 times"
*1

gen drugschool=.
replace drugschool=1 if q57=="yes"
*1
replace drugschool=0 if q57=="no"
*2

*RACE
**hispanic = hispanic/latino (4) + multiple-hispanic (7)
rename q4 race

gen white=.
replace white=1 if race=="White"
*6
replace white=0 if inlist(race,"Am Indian / Alaska Native", "Asian", "Black or African American", "Hispanic or Latino", "Multiple - Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/other PI")
*1,2,3,4,5,7,8

gen black=.
replace black=1 if race=="Black or African American"
*3
replace black=0 if inlist(race,"White", "Am Indian / Alaska Native", "Asian", "Hispanic or Latino", "Multiple - Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/other PI")
*1,2,4,5,6,7,8

gen hispanic=.
replace hispanic=1 if inlist(race,"Hispanic or Latino", "Multiple - Hispanic")
*4,7
replace hispanic=0 if inlist(race,"White", "Am Indian / Alaska Native", "Asian", "Black or African American", "Multiple - Non-hispanic", "Native Hawaiian/other PI")
*1,2,3,5,6

gen otherrace=.
replace otherrace=1 if inlist(race,"Am Indian / Alaska Native", "Asian", "Multiple - Non-hispanic", "Native Hawaiian/other PI")
*1,2,5,8
replace otherrace=0 if inlist(race,"Black or African American", "Hispanic or Latino", "Multiple - Hispanic", "White")
*3,4,6,7

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade=="9th grade"
replace grade9=0 if inlist(grade, "10th grade", "11th grade", "12th grade")

gen grade10=.
replace grade10=1 if grade=="10th grade"
replace grade10=0 if inlist(grade, "9th grade", "11th grade", "12th grade")

gen grade11=.
replace grade11=1 if grade=="11th grade"
replace grade11=0 if inlist(grade, "10th grade", "9th grade", "12th grade")

gen grade12=.
replace grade12=1 if grade=="12th grade"
replace grade12=0 if inlist(grade, "10th grade", "11th grade", "9th grade")

*SEX
rename q2 sex

gen male=.
replace male=1 if sex=="male"
replace male=0 if sex=="female"

gen female=.
replace female=1 if sex=="female"
replace female=0 if sex=="male"

<<<<<<< HEAD
<<<<<<< HEAD
*** SSM(VARIABLES)
*RACE(SSM)
sort race
encode race, gen(raceeth)
generate race4 = 1 if raceeth==9
generate race4 = 2 if raceeth==3
generate race4 = 3 if inlist(raceeth,4,6)
generate race4 = 4 if inlist(raceeth,1,2,7,8)

/*
Am Indian / Alaska Native |        211        1.55        1.55
                    Asian |        409        3.01        4.56
Black or African American |      2,614       19.22       23.78
       Hispanic or Latino |      2,974       21.87       45.64
                  Missing |        200        1.47       47.11
      Multiple - Hispanic |        352        2.59       49.70
  Multiple - Non-hispanic |        378        2.78       52.48
 Native Hawaiian/other PI |        127        0.93       53.42
                    White |      6,336       46.58      100.00

*/
*** AGE VARIABLES ***
sort q1
encode q1, gen(age)
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

gen age_new = age+11

*** SUICIDE ATTEMPT VARIABLE *** Q26
sort q26
encode q26, gen(suicide)
qui gen suicideattempt = 0 if suicide==1
qui replace suicideattempt = 1 if inrange(suicide,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** Q23
qui gen depression = 0 if q23=="No"
qui replace depression = 1 if q23=="Yes"
tab depression

*** SUICIDE IDEATION *** Q24
qui gen suicideideation = 0 if q24=="No"
qui replace suicideideation = 1 if q24=="Yes"
tab suicideideation

*** SUICIDE PLAN *** Q25
qui gen suicideplan = 0 if q25 == "No"
qui replace suicideplan = 1 if q25== "Yes"
tab suicideplan

*** SEX MINORITY *** 
*MISSING

*
*** JUICE CONSUMPTION *** Q73
sort q73
encode q73, gen(juice)
qui gen juiceconsump=1 if inrange(juice,1,6)
qui replace juiceconsump=0 if q73==7
tab juiceconsump

*** CARROT CONSUMPTION *** Q77
sort q77
encode q77, gen(carrot)
qui gen carrotconsump=1 if inrange(carrot,1,6)
qui replace carrotconsump=0 if q76==7
tab carrotconsump

*** SEATBELT USE *** Q9
sort q10
encode q10, gen(seatbelt)
qui gen nrseatbelt=1 if inlist(seatbelt,4,5)
qui replace nrseatbelt=0 if inrange(seatbelt,1,3)
tab nrseatbelt

*** GRADE/CLASSROOM ***
sort grade
encode grade, gen(grade_)
qui replace grade = 9 if grade == 4
qui replace grade = 10 if grade == 1
qui replace grade = 11 if grade == 2
qui replace grade = 12 if grade == 3
qui replace grade = 0 if grade == 5
tab grade

=======
*AGE
rename q1 age

gen age_new=.
replace age_new=12 if age=="12 years old or younger"
replace age_new=13 if age=="13 years old"
replace age_new=14 if age=="14 years old"
replace age_new=15 if age=="15 years old"
replace age_new=16 if age=="16 years old"
replace age_new=17 if age=="17 years old"
replace age_new=18 if age=="18 years old or older"
>>>>>>> 11e80e93c0129e2724248023492fffc482b9695a
=======
>>>>>>> parent of 5edf19e... SSM

save "MML_National_01.dta", replace
tab fips
mdesc fips

**********
***2003***
**********
capture use "NYRBS_2003.dta", clear

capture rename stfips fips
gen year=2003

*MML, 46, 46, 47, 57
gen marijuana30=.
replace marijuana30=1 if inlist(q46,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace marijuana30=0 if q46=="0 times"
*1

gen mfreq=.
replace mfreq=1 if inlist(q46,"10 to 19 times", "20 to 39 times", "40 or more times")
*4,6
replace mfreq=0 if inlist(q46,"0 times", "1 or 2 times", "3 to 9 times")
*1,3

gen mschool=.
replace mschool=1 if inlist(q47,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace mschool=0 if q47=="0 times"
*1

gen drugschool=.
replace drugschool=1 if q57=="yes"
*1
replace drugschool=0 if q57=="no"
*2

*RACE
**hispanic = hispanic/latino (4) + multiple-hispanic (7)
rename q4 race

gen white=.
replace white=1 if race=="White"
*6
replace white=0 if inlist(race,"Am Indian / Alaska Native", "Asian", "Black or African American", "Hispanic or Latino", "Multiple - Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/other PI")
*1,2,3,4,5,7,8

gen black=.
replace black=1 if race=="Black or African American"
*3
replace black=0 if inlist(race,"White", "Am Indian / Alaska Native", "Asian", "Hispanic or Latino", "Multiple - Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/other PI")
*1,2,4,5,6,7,8

gen hispanic=.
replace hispanic=1 if inlist(race,"Hispanic or Latino", "Multiple - Hispanic")
*4,7
replace hispanic=0 if inlist(race,"White", "Am Indian / Alaska Native", "Asian", "Black or African American", "Multiple - Non-hispanic", "Native Hawaiian/other PI")
*1,2,3,5,6

gen otherrace=.
replace otherrace=1 if inlist(race,"Am Indian / Alaska Native", "Asian", "Multiple - Non-hispanic", "Native Hawaiian/other PI")
*1,2,5,8
replace otherrace=0 if inlist(race,"Black or African American", "Hispanic or Latino", "Multiple - Hispanic", "White")
*3,4,6,7

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade=="9th grade"
replace grade9=0 if inlist(grade, "10th grade", "11th grade", "12th grade")

gen grade10=.
replace grade10=1 if grade=="10th grade"
replace grade10=0 if inlist(grade, "9th grade", "11th grade", "12th grade")

gen grade11=.
replace grade11=1 if grade=="11th grade"
replace grade11=0 if inlist(grade, "10th grade", "9th grade", "12th grade")

gen grade12=.
replace grade12=1 if grade=="12th grade"
replace grade12=0 if inlist(grade, "10th grade", "11th grade", "9th grade")

*SEX
rename q2 sex

gen male=.
replace male=1 if sex=="male"
replace male=0 if sex=="female"

gen female=.
replace female=1 if sex=="female"
replace female=0 if sex=="male"

*AGE
rename q1 age

gen age_new=.
replace age_new=12 if age=="12 years old or younger"
replace age_new=13 if age=="13 years old"
replace age_new=14 if age=="14 years old"
replace age_new=15 if age=="15 years old"
replace age_new=16 if age=="16 years old"
replace age_new=17 if age=="17 years old"
replace age_new=18 if age=="18 years old or older"

save "MML_National_03.dta", replace
tab fips
mdesc fips

**********
***2005*** ***NOT STRING
**********
capture use "NYRBS_2005.dta", clear

capture rename stfips fips
gen year=2005

*MML, 46, 46, 47, 56
gen marijuana30=.
replace marijuana30=1 if inrange(q46,2,6)
replace marijuana30=0 if q46==1

gen mfreq=.
replace mfreq=1 if inrange(q46,4,6)
replace mfreq=0 if inrange(q46,1,3)

gen mschool=.
replace mschool=1 if inrange(q47,2,6)
replace mschool=0 if q47==1

gen drugschool=.
replace drugschool=1 if q56==1
replace drugschool=0 if q56==2

*RACE
**hispanic = hispanic/latino (4) + multiple-hispanic (7)
rename q4 race

gen white=.
replace white=1 if race==6
replace white=0 if inlist(race,1,2,3,4,5,7,8)

gen black=.
replace black=1 if race==3
replace black=0 if inlist(race,1,2,4,5,6,7,8)

gen hispanic=.
replace hispanic=1 if inlist(race,4,7)
replace hispanic=0 if inlist(race,1,2,3,5,6)

gen otherrace=.
replace otherrace=1 if inlist(race,1,2,5,8)
replace otherrace=0 if inlist(race,3,4,6,7)

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade==1
replace grade9=0 if inlist(grade,2,3,4)

gen grade10=.
replace grade10=1 if grade==2
replace grade10=0 if inlist(grade,1,3,4)

gen grade11=.
replace grade11=1 if grade==3
replace grade11=0 if inlist(grade,1,2,4)

gen grade12=.
replace grade12=1 if grade==4
replace grade12=0 if inlist(grade,1,2,3)

*SEX
rename q2 sex

gen male=.
replace male=1 if sex==2
replace male=0 if sex==1

gen female=.
replace female=1 if sex==1
replace female=0 if sex==2

*AGE
rename q1 age

gen age_new=.
replace age_new=12 if age==1
replace age_new=13 if age==2
replace age_new=14 if age==3
replace age_new=15 if age==4
replace age_new=16 if age==5
replace age_new=17 if age==6
replace age_new=18 if age==7

save "MML_National_05.dta", replace
tab fips
mdesc fips

**********
***2007*** ***NOT STRING
**********
capture use "NYRBS_2007.dta", clear

capture rename stfips fips
gen year=2007

*MML, 47, 47, 48, 57
gen marijuana30=.
replace marijuana30=1 if inrange(q47,2,6)
replace marijuana30=0 if q47==1

gen mfreq=.
replace mfreq=1 if inrange(q47,4,6)
replace mfreq=0 if inrange(q47,1,3)

gen mschool=.
replace mschool=1 if inrange(q48,2,6)
replace mschool=0 if q48==1

gen drugschool=.
replace drugschool=1 if q57==1
replace drugschool=0 if q57==2

*RACE
**hispanic = hispanic/latino (6) + multiple-hispanic (7)
gen white=.
replace white=1 if raceeth==5
replace white=0 if inlist(raceeth,1,2,3,4,6,7,8)

gen black=.
replace black=1 if raceeth==3
replace black=0 if inlist(raceeth,1,2,4,5,6,7,8)

gen hispanic=.
replace hispanic=1 if inlist(raceeth,6,7)
replace hispanic=0 if inlist(raceeth,1,2,3,4,5,8)

gen otherrace=.
replace otherrace=1 if inlist(raceeth,1,2,4,8)
replace otherrace=0 if inlist(raceeth,3,5,6,7)

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade==1
replace grade9=0 if inlist(grade,2,3,4)

gen grade10=.
replace grade10=1 if grade==2
replace grade10=0 if inlist(grade,1,3,4)

gen grade11=.
replace grade11=1 if grade==3
replace grade11=0 if inlist(grade,1,2,4)

gen grade12=.
replace grade12=1 if grade==4
replace grade12=0 if inlist(grade,1,2,3)

*SEX
rename q2 sex

gen male=.
replace male=1 if sex==2
replace male=0 if sex==1

gen female=.
replace female=1 if sex==1
replace female=0 if sex==2

*AGE
rename q1 age

gen age_new=.
replace age_new=12 if age==1
replace age_new=13 if age==2
replace age_new=14 if age==3
replace age_new=15 if age==4
replace age_new=16 if age==5
replace age_new=17 if age==6
replace age_new=18 if age==7

save "MML_National_07.dta", replace
tab fips
mdesc fips

**********
***2009*** ***NOT STRING
**********
capture use "NYRBS_2009.dta", clear

capture rename stfips fips
gen year=2009

*MML, 47, 47, 48, 57
gen marijuana30=.
replace marijuana30=1 if inrange(q47,2,6)
replace marijuana30=0 if q47==1

gen mfreq=.
replace mfreq=1 if inrange(q47,4,6)
replace mfreq=0 if inrange(q47,1,3)

gen mschool=.
replace mschool=1 if inrange(q48,2,6)
replace mschool=0 if q48==1

gen drugschool=.
replace drugschool=1 if q57==1
replace drugschool=0 if q57==2

*RACE
**hispanic = hispanic/latino (6) + multiple-hispanic (7)
gen white=.
replace white=1 if raceeth==5
replace white=0 if inlist(raceeth,1,2,3,4,6,7,8)

gen black=.
replace black=1 if raceeth==3
replace black=0 if inlist(raceeth,1,2,4,5,6,7,8)

gen hispanic=.
replace hispanic=1 if inlist(raceeth,6,7)
replace hispanic=0 if inlist(raceeth,1,2,3,4,5,8)

gen otherrace=.
replace otherrace=1 if inlist(raceeth,1,2,4,8)
replace otherrace=0 if inlist(raceeth,3,5,6,7)

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade==1
replace grade9=0 if inlist(grade,2,3,4)

gen grade10=.
replace grade10=1 if grade==2
replace grade10=0 if inlist(grade,1,3,4)

gen grade11=.
replace grade11=1 if grade==3
replace grade11=0 if inlist(grade,1,2,4)

gen grade12=.
replace grade12=1 if grade==4
replace grade12=0 if inlist(grade,1,2,3)

*SEX
rename q2 sex

gen male=.
replace male=1 if sex==2
replace male=0 if sex==1

gen female=.
replace female=1 if sex==1
replace female=0 if sex==2

*AGE
rename q1 age

gen age_new=.
replace age_new=12 if age==1
replace age_new=13 if age==2
replace age_new=14 if age==3
replace age_new=15 if age==4
replace age_new=16 if age==5
replace age_new=17 if age==6
replace age_new=18 if age==7

save "MML_National_09.dta", replace
tab fips
mdesc fips

**********
***2011*** ***NOT STRING
**********
capture use "NYRBS_2011.dta", clear

capture rename stfips fips
gen year=2011

*MML, 48, 48, 49, 59
gen marijuana30=.
replace marijuana30=1 if inrange(q48,2,6)
replace marijuana30=0 if q48==1

gen mfreq=.
replace mfreq=1 if inrange(q48,4,6)
replace mfreq=0 if inrange(q48,1,3)

gen mschool=.
replace mschool=1 if inrange(q49,2,6)
replace mschool=0 if q49==1

gen drugschool=.
replace drugschool=1 if q59==1
replace drugschool=0 if q59==2

*RACE
**hispanic = hispanic/latino (6) + multiple-hispanic (7)
gen white=.
replace white=1 if raceeth==5
replace white=0 if inlist(raceeth,1,2,3,4,6,7,8)

gen black=.
replace black=1 if raceeth==3
replace black=0 if inlist(raceeth,1,2,4,5,6,7,8)

gen hispanic=.
replace hispanic=1 if inlist(raceeth,6,7)
replace hispanic=0 if inlist(raceeth,1,2,3,4,5,8)

gen otherrace=.
replace otherrace=1 if inlist(raceeth,1,2,4,8)
replace otherrace=0 if inlist(raceeth,3,5,6,7)

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade==1
replace grade9=0 if inlist(grade,2,3,4)

gen grade10=.
replace grade10=1 if grade==2
replace grade10=0 if inlist(grade,1,3,4)

gen grade11=.
replace grade11=1 if grade==3
replace grade11=0 if inlist(grade,1,2,4)

gen grade12=.
replace grade12=1 if grade==4
replace grade12=0 if inlist(grade,1,2,3)

*SEX
rename q2 sex

gen male=.
replace male=1 if sex==2
replace male=0 if sex==1

gen female=.
replace female=1 if sex==1
replace female=0 if sex==2

*AGE
rename q1 age

gen age_new=.
replace age_new=12 if age==1
replace age_new=13 if age==2
replace age_new=14 if age==3
replace age_new=15 if age==4
replace age_new=16 if age==5
replace age_new=17 if age==6
replace age_new=18 if age==7

save "MML_National_11.dta", replace
tab fips
mdesc fips

**********
***2013*** 
**********
capture use "NYRBS_2013.dta", clear

capture rename stfips fips
gen year=2013

*MML, 49, 49, 58
gen marijuana30=.
replace marijuana30=1 if inlist(q49,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace marijuana30=0 if q49=="0 times"
*1

gen mfreq=.
replace mfreq=1 if inlist(q49,"10 to 19 times", "20 to 39 times", "40 or more times")
*4,6
replace mfreq=0 if inlist(q49,"0 times", "1 or 2 times", "3 to 9 times")
*1,3

*mschool not in survey

gen drugschool=.
replace drugschool=1 if q58=="yes"
*1
replace drugschool=0 if q58=="no"
*2

**"Am Indian/Alaska Native", "Asian", "Black or African American", "Hispanic/Latino", "Multiple-Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/Other PI", "White"

*RACE
**hispanic = hispanic/latino (6) + multiple-hispanic (7)
gen white=.
replace white=1 if raceeth=="White"
*5
replace white=0 if inlist(raceeth,"Am Indian / Alaska Native", "Asian", "Black or African American", "Hispanic/Latino", "Multiple-Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/Other PI")
*1,2,3,4,6,7,8

gen black=.
replace black=1 if raceeth=="Black or African American"
*3
replace black=0 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Hispanic/Latino", "Multiple-Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/Other PI", "White")
*1,2,4,5,6,7,8

gen hispanic=.
replace hispanic=1 if inlist(raceeth,"Hispanic/Latino", "Multiple-Hispanic")
*6,7
replace hispanic=0 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Black or African American", "Multiple - Non-hispanic", "Native Hawaiian/Other PI", "White")
*1,2,3,4,5,8

gen otherrace=.
replace otherrace=1 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Multiple - Non-hispanic", "Native Hawaiian/Other PI")
*1,2,4,8
replace otherrace=0 if inlist(raceeth, "Hispanic/Latino", "Multiple-Hispanic", "White", "Black or African American")
*3,5,6,7

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade=="9th grade"
replace grade9=0 if inlist(grade, "10th grade", "11th grade", "12th grade")

gen grade10=.
replace grade10=1 if grade=="10th grade"
replace grade10=0 if inlist(grade, "9th grade", "11th grade", "12th grade")

gen grade11=.
replace grade11=1 if grade=="11th grade"
replace grade11=0 if inlist(grade, "10th grade", "9th grade", "12th grade")

gen grade12=.
replace grade12=1 if grade=="12th grade"
replace grade12=0 if inlist(grade, "10th grade", "11th grade", "9th grade")

*SEX
rename q2 sex

gen male=.
replace male=1 if sex=="male"
replace male=0 if sex=="female"

gen female=.
replace female=1 if sex=="female"
replace female=0 if sex=="male"

*AGE
rename q1 age

gen age_new=.
replace age_new=12 if age=="12 years old or younger"
replace age_new=13 if age=="13 years old"
replace age_new=14 if age=="14 years old"
replace age_new=15 if age=="15 years old"
replace age_new=16 if age=="16 years old"
replace age_new=17 if age=="17 years old"
replace age_new=18 if age=="18 years old or older"

save "MML_National_13.dta", replace
tab fips
mdesc fips

**********
***2015***
**********
capture use "NYRBS_2015.dta", clear

capture rename stfips fips
gen year=2015

*MML, 49, 49, 59
gen marijuana30=.
replace marijuana30=1 if inlist(q49,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace marijuana30=0 if q49=="0 times"
*1

gen mfreq=.
replace mfreq=1 if inlist(q49,"10 to 19 times", "20 to 39 times", "40 or more times")
*4,6
replace mfreq=0 if inlist(q49,"0 times", "1 or 2 times", "3 to 9 times")
*1,3

*mschool not in survey

gen drugschool=.
replace drugschool=1 if q59=="yes"
*1
replace drugschool=0 if q59=="no"
*2

*RACE
**hispanic = hispanic/latino (6) + multiple-hispanic (7)
gen white=.
replace white=1 if raceeth=="White"
*5
replace white=0 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Black or African American", "Hispanic/Latino", "Multiple-Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/Other PI")
*1,2,3,4,6,7,8

gen black=.
replace black=1 if raceeth=="Black or African American"
*3
replace black=0 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Hispanic/Latino", "Multiple-Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/Other PI", "White")
*1,2,4,5,6,7,8

gen hispanic=.
replace hispanic=1 if inlist(raceeth,"Hispanic/Latino", "Multiple-Hispanic")
*6,7
replace hispanic=0 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Black or African American", "Multiple - Non-hispanic", "Native Hawaiian/Other PI", "White")
*1,2,3,4,5,8

gen otherrace=.
replace otherrace=1 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Multiple - Non-hispanic", "Native Hawaiian/Other PI")
*1,2,4,8
replace otherrace=0 if inlist(raceeth, "Hispanic/Latino", "Multiple-Hispanic", "White", "Black or African American")
*3,5,6,7

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade=="9th grade"
replace grade9=0 if inlist(grade, "10th grade", "11th grade", "12th grade")

gen grade10=.
replace grade10=1 if grade=="10th grade"
replace grade10=0 if inlist(grade, "9th grade", "11th grade", "12th grade")

gen grade11=.
replace grade11=1 if grade=="11th grade"
replace grade11=0 if inlist(grade, "10th grade", "9th grade", "12th grade")

gen grade12=.
replace grade12=1 if grade=="12th grade"
replace grade12=0 if inlist(grade, "10th grade", "11th grade", "9th grade")

*SEX
rename q2 sex

gen male=.
replace male=1 if sex=="male"
replace male=0 if sex=="female"

gen female=.
replace female=1 if sex=="female"
replace female=0 if sex=="male"

*AGE
rename q1 age

gen age_new=.
replace age_new=12 if age=="12 years old or younger"
replace age_new=13 if age=="13 years old"
replace age_new=14 if age=="14 years old"
replace age_new=15 if age=="15 years old"
replace age_new=16 if age=="16 years old"
replace age_new=17 if age=="17 years old"
replace age_new=18 if age=="18 years old or older"

save "MML_National_15.dta", replace
tab fips
mdesc fips

**********
***2017***
**********
capture use "NYRBS_2017.dta", clear

capture rename stfips fips
gen year=2017

*MML, 48, 48, 58
gen marijuana30=.
replace marijuana30=1 if inlist(q48,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace marijuana30=0 if q48=="0 times"
*1

gen mfreq=.
replace mfreq=1 if inlist(q48,"10 to 19 times", "20 to 39 times", "40 or more times")
*4,6
replace mfreq=0 if inlist(q48,"0 times", "1 or 2 times", "3 to 9 times")
*1,3

*mschool not in survey

gen drugschool=.
replace drugschool=1 if q58=="yes"
*1
replace drugschool=0 if q58=="no"
*2

*RACE
**hispanic = hispanic/latino (6) + multiple-hispanic (7)
gen white=.
replace white=1 if raceeth=="White"
*5
replace white=0 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Black or African American", "Hispanic/Latino", "Multiple-Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/Other PI")
*1,2,3,4,6,7,8

gen black=.
replace black=1 if raceeth=="Black or African American"
*3
replace black=0 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Hispanic/Latino", "Multiple-Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/Other PI", "White")
*1,2,4,5,6,7,8

gen hispanic=.
replace hispanic=1 if inlist(raceeth,"Hispanic/Latino", "Multiple-Hispanic")
*6,7
replace hispanic=0 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Black or African American", "Multiple - Non-hispanic", "Native Hawaiian/Other PI", "White")
*1,2,3,4,5,8

gen otherrace=.
replace otherrace=1 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Multiple - Non-hispanic", "Native Hawaiian/Other PI")
*1,2,4,8
replace otherrace=0 if inlist(raceeth, "Hispanic/Latino", "Multiple-Hispanic", "White", "Black or African American")
*3,5,6,7

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade=="9th grade"
replace grade9=0 if inlist(grade, "10th grade", "11th grade", "12th grade")

gen grade10=.
replace grade10=1 if grade=="10th grade"
replace grade10=0 if inlist(grade, "9th grade", "11th grade", "12th grade")

gen grade11=.
replace grade11=1 if grade=="11th grade"
replace grade11=0 if inlist(grade, "10th grade", "9th grade", "12th grade")

gen grade12=.
replace grade12=1 if grade=="12th grade"
replace grade12=0 if inlist(grade, "10th grade", "11th grade", "9th grade")

*SEX
rename q2 sex

gen male=.
replace male=1 if sex=="male"
replace male=0 if sex=="female"

gen female=.
replace female=1 if sex=="female"
replace female=0 if sex=="male"

*AGE
rename q1 age

gen age_new=.
replace age_new=12 if age=="12 years old or younger"
replace age_new=13 if age=="13 years old"
replace age_new=14 if age=="14 years old"
replace age_new=15 if age=="15 years old"
replace age_new=16 if age=="16 years old"
replace age_new=17 if age=="17 years old"
replace age_new=18 if age=="18 years old or older"

save "MML_National_17.dta", replace
tab fips
mdesc fips


**************************
* Combining the datasets *
**************************
use "MML_National_17.dta", clear
append using "MML_National_15.dta", force
append using "MML_National_13.dta", force
append using "MML_National_11.dta", force
append using "MML_National_09.dta", force
append using "MML_National_07.dta", force
append using "MML_National_05.dta", force
append using "MML_National_03.dta", force
append using "MML_National_01.dta", force
append using "MML_National_99.dta", force
append using "MML_National_97.dta", force
append using "MML_National_95.dta", force
append using "MML_National_93.dta", force


drop if inlist(year,1998,2000,2002,2004,2006,2008,2010,2012,2014,2016)

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


*drop variables
keep fips year age age_new race raceeth white black ///
hispanic otherrace male female ///
marijuana30 mfreq drugschool mschool grade grade9 grade10 grade11 grade12

*merge files
merge m:1 fips year using "controls_unempl_2017.dta"
drop if _merge==2
drop _merge

merge m:1 fips using "mmlyears.dta"
drop if _merge==2
drop _merge

***creating mml variable
gen mml=.
replace mml=1 if year>= MML_year
replace mml=0 if MML_year>year
replace mml=0 if MML_year==.



capture save "F:\MML project\national data\MML_National.dta", replace
save "MML_National.dta", replace

****************************
***NATIONAL YRBS ANALYSIS***
****************************

***state-year table***
table fips year

***table 1***
label variable white "White"
label variable black "Black"
label variable otherrace "Other Race"
label variable marijuana30 "Marijuana Use in Past 30 days"
label variable mfreq "Frequent Marijuana Use in Past 30 Days"
label variable drugschool "Offered, Sold, or Given Drug on School Property"
label variable mschool "Marijuana Use at School in Past 30 days"
label variable age_new "Age"


sum marijuana30 mfreq mschool drugschool age_new male grade9 grade10 grade11 grade12 ///
black white otherrace unemployment if mml==0 // Need BAC .08 Law, Real State Income, beertax


sum marijuana30 mfreq mschool drugschool age_new male grade9 grade10 grade11 grade12 ///
black white otherrace unemployment if mml==1 // Need BAC .08 Law and Real State Income, beertax
