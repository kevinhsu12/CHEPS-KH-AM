clear all
capture log close
log using housing.log, replace
 import excel "/Users/Kevin/Documents/stata project/Housing Data/Carlsbad/92008.xlsx",
gen zip = 92008
save house.dta, replace
import excel "/Users/Kevin/Documents/stata project/Housing Data/Carlsbad/92009.xlsx", clear
gen zip = 92009
append using house.dta
save house.dta, replace
import excel "/Users/Kevin/Documents/stata project/Housing Data/Carlsbad/92010.xlsx", clear
gen zip = 92010
append using house.dta
import excel "/Users/Kevin/Documents/stata project/Housing Data/Carlsbad/92011.xlsx", clear
gen zip = 92011
append using house.dta

program define getzip
import excel "/Users/Kevin/Documents/stata project/Housing Data/`1'/`2'.xlsx", clear
gen zip = `2'
append using house.dta
save house.dta, replace
end

getzip Carlsbad 92009
getzip Carlsbad 92010
getzip Carlsbad 92011

