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

use mmldate.dta, clear
capture drop mml_share
gen mml_share = mml_month/12
save mmlyears.dta, replace


use "MMLAnalysis_17.dta"

collapse mml_year, by(year fips)
merge m:1 fips using mmlyears.dta

qui gen mmlenacted_wave=0 if (mml_year>year | mml_year==0)
qui replace mmlenacted_wave=1 if mml_year<=year & mml_year!=0
qui gen mmllead4p_wave = 0
qui replace mmllead4p_wave=1 if year <= mml_year-8 & mml_year!=0
qui gen mmllead3p_wave = 0
qui replace mmllead3p_wave=1 if year <= mml_year-6 & mml_year!=0
forvalues i = 3(-1)1 {
	qui gen mmllead`i'_wave = 0
	qui replace mmllead`i'_wave=1 if year==mml_year-(2*`i') & mml_year!=0
}
qui gen mml_lawwave =0
qui replace mml_lawwave=1 if year==mml_year & mml_year!=0
qui gen mmllag1_wave = 0
qui replace mmllag1_wave=1 if year==mml_year+2 & mml_year!=0
qui gen mmllag2p_wave = 0
qui replace mmllag2p_wave=1 if year >= mml_year+4 & mml_year!=0
