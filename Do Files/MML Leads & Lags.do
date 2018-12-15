capture cd "/Users/Kevin/Documents/MML/Data Files"
**********************************
*** GENERATE LEADS AND LAGS ******
**********************************
clear all
capture log close
set more 1
use "/Users/Kevin/Documents/MML/Data Files/MMLAnalysis_17.dta", clear

*** COLLAPSE AND MERGE BY CONTROLS TO GET AN OBSERVATION FOR EVERY YEAR
collapse mml_share mml_year marijuana30, by(fips year)
merge 1:1 year fips using controls.dta
drop _merge

*** MERGE BACK IN MML CONTROLS
keep fips year marijuana30
merge m:1 fips using mmlyears.dta

*** KEEP NECESSARY VARIABLES
keep fips year mml_month mml_year marijuana30

*** REGENERATE MML_SHARE
sort fips year
generate share = 13/12- mml_month/12
generate mml_share = .
replace mml_share = share if mml_year==year
replace mml_share = 0 if year<mml_year & mml_share==.
replace mml_share =1 if year>mml_year & mml_share==.


gen odd = mod(mml_year,2) 
gen odd_year = mod(year,2)
keep if odd_year==1

gen eyear=mml_year
replace eyear = mml_year+1 if odd==0 
replace eyear = 0 if mml_year==.

*** LEADS AND LAGS BY YEAR
gen mmllead4p = 0
replace mmllead4p = 1 if year <= mml_year-4 & eyear!=0
replace mmllead4p = 1-share if year==mml_year-3 & eyear!=0
 
gen mmllead3 =0
replace mmllead3= share if year == mml_year-3 & eyear!=0
replace mmllead3=1-share if year==mml_year-2 & eyear!=0

gen mmllead2 = 0
replace mmllead2 = share if year==mml_year - 2 & eyear!=0
replace mmllead2 = 1-share if year==mml_year-1 & eyear!=0

gen mmllead1 = 0
replace mmllead1 = share if year==mml_year-1 & eyear!=0
replace mmllead1 = 1-share if year==mml_year & eyear!=0

gen mmllaw =0
replace mmllaw = share if year==mml_year & eyear!=0
replace mmllaw = 1-share if year==mml_year+1 & eyear!=0

gen mmllag1 = 0
replace mmllag1 = share if year==mml_year+1 & eyear!=0
replace mmllag1 = 1-share if year==mml_year+2 & eyear!=0

gen mmllag2 = 0
replace mmllag2 = share if year==mml_year+2 & eyear!=0
replace mmllag2=1-share if year == mml_year+3 & eyear!=0
 
gen mmllag3p = 0 
replace mmllag3p = share if year==mml_year+3
replace mmllag3p = 1 if year>=mml_year+4 & eyear!=0


*** GENERATE LEADS & LAGS BY WAVES
generate uses_share = mml_share>0 & mml_share<1 & year==mml_year
egen stateshare = sum(uses_share), by(fips)
replace share=1 if stateshare==0

*** FIX SHARES
 gen mmllead4p_sharewave = 0
 replace mmllead4p_sharewave = 1 if year <= eyear-8 & eyear!=0
 replace mmllead4p_sharewave = 1-share if year==eyear-6 & eyear!=0
 
 gen mmllead3_sharewave =0
 replace mmllead3_sharewave= share if year == eyear-6 & eyear!=0
 replace mmllead3_sharewave=1-share if year==eyear-4 & eyear!=0

 gen mmllead2_sharewave = 0
 replace mmllead2_sharewave = share if year==eyear - 4 & eyear!=0
 replace mmllead2_sharewave = 1-share if year==eyear-2 & eyear!=0

 gen mmllead1_sharewave = 0
 replace mmllead1_sharewave = share if year==eyear-2 & eyear!=0
replace mmllead1_sharewave = 1-share if year==eyear & eyear!=0

 gen mmllaw_sharewave =0
replace mmllaw_sharewave = share if year==eyear & eyear!=0
replace mmllaw_sharewave = 1-share if year==eyear+2 & eyear!=0

 gen mmllag1_sharewave = 0
replace mmllag1_sharewave = share if year==eyear+2 & eyear!=0
replace mmllag1_sharewave = 1-share if year==eyear+4 & eyear!=0

 gen mmllag2_sharewave = 0
 replace mmllag2_sharewave = share if year==eyear+4 & eyear!=0
 replace mmllag2_sharewave=1-share if year == eyear+6 & eyear!=0
 
 gen mmllag3p_sharewave = 0 
 replace mmllag3p_sharewave = share if year==eyear+6
 replace mmllag3p_sharewave = 1 if year>=eyear+8 & eyear!=0

rename mml_share mmlenacted_sharewave 
 

keep fips year mml_year marijuana30 mmlenacted_sharewave mmllead4p_sharewave mmllead3_sharewave mmllead2_sharewave mmllead1_sharewave mmllaw_sharewave mmllag1_sharewave mmllag2_sharewave mmllag3p_sharewave eyear ///
mmllead4p mmllead3 mmllead2 mmllead1 mmllaw mmllag1 mmllag2 mmllag3p
drop if marijuana30==.
drop if fips==.
gen dummy = 0 
save mml_leads_lags_sharewaves.dta, replace

use mml_leads_lags_sharewaves.dta, clear
log using mml_event_study_test.log, replace

*** ROWS SUM TO ONE
egen sum_to_one = rowtotal(mmllead4p_sharewave mmllead3_sharewave mmllead2_sharewave mmllead1_sharewave mmllaw_sharewave mmllag1_sharewave mmllag2_sharewave mmllag3p_sharewave)
tab sum_to_one

*** REGRESSION ON FULL SAMPLE
xi: reg marijuana30  mmllead4p_sharewave mmllead3_sharewave mmllead2_sharewave mmllead1_sharewave mmllaw_sharewave mmllag1_sharewave mmllag2_sharewave mmllag3p_sharewave i.fips i.year

*** REGRESSION ON JUST TREATMENT STATES
xi: reg marijuana30  mmllead4p_sharewave mmllead3_sharewave mmllead2_sharewave mmllead1_sharewave mmllaw_sharewave mmllag1_sharewave mmllag2_sharewave mmllag3p_sharewave if eyear!=0 

*** REGRESSION ON NON-TREATED STATES
xi: reg marijuana30  mmllead4p_sharewave mmllead3_sharewave mmllead2_sharewave mmllead1_sharewave mmllaw_sharewave mmllag1_sharewave mmllag2_sharewave mmllag3p_sharewave if eyear==0 

*** INTENDED REGRESSION TO USE - NO PLACEHOLDER
xi: reg marijuana30  mmllead4p_sharewave mmllead3_sharewave mmllead2_sharewave mmllaw_sharewave mmllag1_sharewave mmllag2_sharewave mmllag3p_sharewave i.fips i.year

*** WITH DUMMY PLACEHOLDER - RESULTS SHOULD BE SAME AS PREVIOUS 
xi: reg marijuana30  mmllead4p_sharewave mmllead3_sharewave mmllead2_sharewave dummy mmllaw_sharewave mmllag1_sharewave mmllag2_sharewave mmllag3p_sharewave i.fips i.year

*** JUST LEADS
xi: reg marijuana30 mmllead4p_sharewave mmllead3_sharewave mmllead2_sharewave mmllead1_sharewave mmlenacted_sharewave i.fips

*** MR FONE'S SUMMATION TEST
keep if eyear!=0
sum mmlenacted_sharewave mmllaw_sharewave mmllag1_sharewave mmllag2_sharewave mmllag3p_sharewave 
display  .0769436 +.0657614+.050852 + .1919595 

sum mmllaw_sharewave mmllead1_sharewave mmllead2_sharewave mmllead3_sharewave mmllead4p_sharewave mmlenacted_sharewave
display 1-.0843983-.0780085-.0772098 -.3748669
log close


