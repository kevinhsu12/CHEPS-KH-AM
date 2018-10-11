import delimited /Users/Kevin/Downloads/spi/SA1_1998_2017.csv, clear 

replace geofips = "" in 181/184

destring geofips, replace
replace geofips = geofips/1000

keep if description == "Per capita personal income (dollars) 2/"

keep geofips v27

rename v27 pcinc
rename geofips fips
gen year=2017

save "incomecontrol2017.dta", replace

