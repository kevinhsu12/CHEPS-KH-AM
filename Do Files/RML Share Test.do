clear all

cd "/Users/Kevin/Documents/MML/Data Files"
use "/Users/Kevin/Downloads/rmldate.dta"

*COMBINE DATES
gen date = mdy(rml_month, rml_day, rml_year)

*SPLIT DATE INTO DAY OF THE YEAR
gen dateofyear= doy(date)

*PLAYING AROUND
gen rml_share1 = 1-(dateof/364)
gen rml_share2 = 1-(dateof/365)
gen rml_share3 = 1-(dateof-1)/365

*COMPARE WITH TAM'S
rename rml_year  year

keep year fips rml_share*

merge 1:1 fips year using controls.dta

keep if _merge==3
