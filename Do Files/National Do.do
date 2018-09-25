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

gen marijuana30=.
replace marijuana30=1 if inrange(q45,2,6)
replace marijuana30=0 if q45==1

gen mfreq=.
replace mfreq=1 if inrange(q45,4,6)
replace mfreq=0 if inrange(q45,1,3)

gen mschool=.
replace mschool=1 if inrange(q46,2,6)
replace mschool=0 if q46==1

gen drugschool=.
replace drugschool=1 if q54==1
replace drugschool=0 if q54==2

**********
***1995***
**********

gen marijuana30=.
replace marijuana30=1 if inrange(q43,2,6)
replace marijuana30=0 if q43==1

gen mfreq=.
replace mfreq=1 if inrange(q43,4,6)
replace mfreq=0 if inrange(q43,1,3)

gen mschool=.
replace mschool=1 if inrange(q44,2,6)
replace mschool=0 if q44==1

gen drugschool=.
replace drugschool=1 if q53==1
replace drugschool=0 if q53==2

**********
***1997***
**********

gen marijuana30=.
replace marijuana30=1 if inrange(q43,2,6)
replace marijuana30=0 if q43==1

gen mfreq=.
replace mfreq=1 if inrange(q43,4,6)
replace mfreq=0 if inrange(q43,1,3)

gen mschool=.
replace mschool=1 if inrange(q44,2,6)
replace mschool=0 if q44==1

gen drugschool=.
replace drugschool=1 if q53==1
replace drugschool=0 if q53==2

**********
***1999***
**********
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

**********
***2001***
**********

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

**********
***2003***
**********

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
replace drugschool=1 if q57==1
replace drugschool=0 if q57==2

**********
***2005***
**********

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

**********
***2007***
**********

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

**********
***2009***
**********

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

**********
***2011***
**********

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

**********
***2013***
**********

gen marijuana30=.
replace marijuana30=1 if inrange(q49,2,6)
replace marijuana30=0 if q49==1

gen mfreq=.
replace mfreq=1 if inrange(q49,4,6)
replace mfreq=0 if inrange(q49,1,3)

*mschool not in survey

gen drugschool=.
replace drugschool=1 if q58==1
replace drugschool=0 if q58==2

**********
***2015***
**********

gen marijuana30=.
replace marijuana30=1 if inrange(q49,2,6)
replace marijuana30=0 if q49==1

gen mfreq=.
replace mfreq=1 if inrange(q49,4,6)
replace mfreq=0 if inrange(q49,1,3)

*mschool not in survey

gen drugschool=.
replace drugschool=1 if q59==1
replace drugschool=0 if q59==2

**********
***2017***
**********

gen marijuana30=.
replace marijuana30=1 if inrange(q48,2,6)
replace marijuana30=0 if q48==1

gen mfreq=.
replace mfreq=1 if inrange(q48,4,6)
replace mfreq=0 if inrange(q48,1,3)

*mschool not in survey

gen drugschool=.
replace drugschool=1 if q58==1
replace drugschool=0 if q58==2
