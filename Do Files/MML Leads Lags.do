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

collapse mml_year, by(year fips)
merge m:1 fips using mmldate.dta

sort fips year
drop mml_share
gen mml_share =  13/12 - (mml_month/12)
replace mml_share = 1 if year>mml_year
replace mml_share = 0 if mml_year>year | mml_year==.

save mmlyears.dta, replace
