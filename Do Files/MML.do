*************************************
*** MEDICAL MARIJUANA REPLICATION ***
*************************************
/*Done by Kevin Hsu and Alicia Marquez
under the supervision of Joseph Sabia 
within CHEPS at San Diego State University */



import delimited C:\Users\Alicia\Downloads\SADCQAM.txt
save "C:\Users\Alicia\Downloads\mmlaz.dta"

import delimited C:\Users\Alicia\Downloads\SADCQNZ.txt, clear 
append using "C:\Users\Alicia\Downloads\mmlaz.dta"

***to destring sitecode and make it numeric
encode sitecode, generate(state)

***don't know if this will work bc data is messed up, but should
***IF WORKS, need to do all of below for MML=1 AND MML=0
gen MML=.
replace MML=1 if year>=MML_date
replace MML=0 if year<MML-date

*smoked marijuana in the past 30 days
gen marijuana30=.
replace marijuana30=1 if inrange(qhowmarijuana,2,6) & inrange(year,1991,2011)
replace marijuana30=0 if qhowmarijuana==1 & inrange(year,1991,2011)
sum marijuana30

*smoked marijuana freq in the past 30 days
gen mfreq=.
replace mfreq=1 if inrange(qhowmarijuana,4,6) & inrange(year,1991,2011)
replace mfreq=0 if inrange(qhowmarijuana,2,3) & inrange(year,1991,2011)
sum mfreq

*smoked marijuana at school in past 30 days
gen mschool=.
replace mschool=1 if inrange(qmarijuanaschool,2,6) & inrange(year,1991,2011)
replace mschool=0 if qmarijuanaschool==1 & inrange(year,1991,2011)
sum mschool

*offered, sold, or given drug on school property
tab q58
gen drugschool=.
replace drugschool=1 if q58==1 & inrange(year,1991,2011)
replace drugschool=0 if q58==2 & inrange(year,1991,2011)
sum drugschool

*age
**replaced age category w numerical value of age
gen age1=.
replace age1=12 if age==1
replace age1=13 if age==2
replace age1=14 if age==3
replace age1=15 if age==4
replace age1=16 if age==5
replace age1=17 if age==6
replace age1=18 if age==7
sum age1

*grade in school
gen grade9=.
replace grade9=1 if grade==1 & inrange(year,1991,2011)
replace grade9=0 if inlist(grade,2,3,4) & inrange(year,1991,2011)

gen grade10=.
replace grade10=1 if grade==2 & inrange(year,1991,2011)
replace grade10=0 if inlist(grade,1,3,4) & inrange(year,1991,2011)

gen grade11=.
replace grade11=1 if grade==3 & inrange(year,1991,2011)
replace grade11=0 if inlist(grade,1,2,4) & inrange(year,1991,2011)

gen grade12=.
replace grade12=1 if grade==4 & inrange(year,1991,2011)
replace grade12=0 if inlist(grade,1,2,3) & inrange(year,1991,2011)

sum grade9 grade10 grade11 grade12

*races
**account for race4 and race7 variables
**check & and | for accuracy once data is good
gen white=.
replace white=1 if (race4==1 & race7==6) & inrange(year,1991,2011)
replace white=0 if (inlist(race4,2,3,4) & inlist(race7,1,2,3,4,5,7)) & inrange(year,1991,2011)
sum white

gen black=.
replace black=1 if (race4==2|race7==3) & inrange(year,1991,2011)
replace black=0 if (inlist(race4,1,3,4) & inlist(race7,1,2,4,5,6,7)) & inrange(year,1991,2011)
sum black

gen other_race=.
replace other_race=1 if (inlist(race4,3,4) | inlist(race7,1,2,4,5,7)) & inrange(year,1991,2011)
replace other_race=0 if (inlist(race4,1,2) & inlist(race7,3,6)) & inrange(year,1991,2011)
sum other_race

*other independent variables not in YRBS data set
