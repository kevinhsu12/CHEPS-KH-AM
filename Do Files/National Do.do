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

**year isnt showing as a variable??? and some years don't have fips 

**********
***1993***
**********
capture use "NYRBS_1993.dta", clear

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

save "MML_National_93.dta", replace
tab fips
mdesc fips

**********
***1995***
**********
capture use "NYRBS_1995.dta", clear

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

save "MML_National_95.dta", replace
tab fips
mdesc fips

**********
***1997***
**********
capture use "NYRBS_1997.dta", clear

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

save "MML_National_97.dta", replace
tab fips
mdesc fips

**********
***1999***  ***NOT STRING***
**********
capture use "NYRBS_1999.dta", clear

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

save "MML_National_99.dta", replace
tab fips
mdesc fips

**********
***2001***
**********
capture use "NYRBS_2001.dta", clear

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


save "MML_National_01.dta", replace
tab fips
mdesc fips

**********
***2003***
**********
capture use "NYRBS_2003.dta", clear

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


save "MML_National_03.dta", replace
tab fips
mdesc fips

**********
***2005*** ***NOT STRING
**********
capture use "NYRBS_2005.dta", clear

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

save "MML_National_05.dta", replace
**tab fips
**mdesc fips

**********
***2007*** ***NOT STRING
**********
capture use "NYRBS_2007.dta", clear

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

save "MML_National_07.dta", replace
***tab fips
***mdesc fips

**********
***2009*** ***NOT STRING
**********
capture use "NYRBS_2009.dta", clear

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

save "MML_National_09.dta", replace
***tab fips
***mdesc fips

**********
***2011*** ***NOT STRING
**********
capture use "NYRBS_2011.dta", clear

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

save "MML_National_11.dta", replace
***tab fips
***mdesc fips

**********
***2013*** 
**********
capture use "NYRBS_2013.dta", clear

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


save "MML_National_13.dta", replace
***tab fips
***mdesc fips

**********
***2015***
**********
capture use "NYRBS_2015.dta", clear

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


save "MML_National_15.dta", replace
***tab fips
***mdesc fips

**********
***2017***
**********
capture use "NYRBS_2017.dta", clear

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


save "MML_National_17.dta", replace
***tab fips
***mdesc fips


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

*qui replace fips=1 if state=="Alabama"
*qui replace fips=2 if state=="Alaska"
*qui replace fips=4 if state=="Arizona"
*qui replace fips=5 if state=="Arkansas"
*qui replace fips=6 if state=="California"
*qui replace fips=8 if state=="Colorado"
*qui replace fips=9 if state=="Connecticut"
*qui replace fips=10 if state=="Delaware"
*qui replace fips=11 if state=="DistrictofColumbia"
*qui replace fips=12 if state=="Florida"
*qui replace fips=13 if state=="Georgia"
*qui replace fips=15 if state=="Hawaii"
*qui replace fips=16 if state=="Idaho"
*qui replace fips=17 if state=="Illinois"
*qui replace fips=18 if state=="Indiana"
*qui replace fips=19 if state=="Iowa"
*qui replace fips=20 if state=="Kansas"
*qui replace fips=21 if state=="Kentucky"
*qui replace fips=22 if state=="Louisiana"
*qui replace fips=23 if state=="Maine"
*qui replace fips=24 if state=="Maryland"
*qui replace fips=25 if state=="Massachusetts"
*qui replace fips=26 if state=="Michigan"
*qui replace fips=27 if state=="Minnesota"
*qui replace fips=28 if state=="Mississippi"
*qui replace fips=29 if state=="Missouri"
*qui replace fips=30 if state=="Montana"
*qui replace fips=31 if state=="Nebraska"
*qui replace fips=32 if state=="Nevada"
*qui replace fips=33 if state=="New Hampshire"
*qui replace fips=34 if state=="New Jersey"
*qui replace fips=35 if state=="New Mexico"
*qui replace fips=36 if state=="New York"
*qui replace fips=37 if state=="North Carolina"
*qui replace fips=38 if state=="North Dakota"
*qui replace fips=39 if state=="Ohio"
*qui replace fips=40 if state=="Oklahoma"
*qui replace fips=41 if state=="Oregon"
*qui replace fips=42 if state=="Pennsylvania"
*qui replace fips=44 if state=="Rhode Island"
*qui replace fips=45 if state=="South Carolina"
*qui replace fips=46 if state=="South Dakota"
*qui replace fips=47 if state=="Tennessee"
*qui replace fips=48 if state=="Texas"
*qui replace fips=49 if state=="Utah"
*qui replace fips=50 if state=="Vermont"
*qui replace fips=51 if state=="Virginia"
*qui replace fips=53 if state=="Washington"
*qui replace fips=54 if state=="West Virginia"
*qui replace fips=55 if state=="Wisconsin"
*qui replace fips=56 if state=="Wyoming"

*drop if inlist(year,1998,2000,2002,2004,2006,2008,2010,2012,2014,2016)

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


***rename age***
rename q1 age


*drop variables
keep fips year age race raceeth white black ///
hispanic otherrace male female ///
marijuana30 mfreq drugschool mschool grade grade9 grade10 grade11 grade12


merge m:1 fips year using "controls_unempl_2017.dta"
drop if _merge==2
drop _merge

merge m:1 fips using "mmlyears.dta"
drop if _merge==2
drop _merge

***creating mml variable
gen mml=.
replace mml=1 if year>= mml_year
replace mml=0 if mml_year>year
replace mml=0 if mml_year==.



capture save "F:\MML project\national data\MML_National.dta", replace
save "MML_National.dta", replace
