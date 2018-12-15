capture cd "/Users/Kevin/Documents/MML/Data Files"
clear all
set more 1
capture log close


capture use "F:\MML project\data\MMLAnalysis_17.dta"
capture use MMLAnalysis_17.dta, clear

capture merge m:1 fips using "C:\Users\Alicia\Documents\mmltypetest.dta"
merge m:1 fips using mmltypetest.dta
drop if _merge==2
drop _merge

replace mml_collective = 0 if collectiveyear==.
replace mml_collective=0 if collectiveyear>year
replace mml_collective=1 if collectiveyear<year

replace mml_dispensary = 0 if dispensaryyear==.
replace mml_dispensary=1 if dispensaryyear<year
replace mml_dispensary=0 if dispensaryyear>year

replace mml_pain = 0 if painyear==.
replace mml_pain=0 if painyear>year
replace mml_pain=1 if painyear<year

replace mml_registry = 0 if registryyear==.
replace mml_registry=0 if registryyear>year
replace mml_registry=1 if registryyear<year


save mml_types.dta, replace
