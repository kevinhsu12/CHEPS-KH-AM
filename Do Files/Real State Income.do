clear all
capture cd "/Users/Kevin/Documents/MML/Data Files"

capture use "F:\MML project\data\incomecontrol.dta"
capture use incomecontrol.dta


capture drop basecpi 
capture drop rsi 
capture drop lnrsi


capture merge m:1 year using "F:\MML project\data\cpiyear.dta"
capture merge m:1 year using "cpiyear.dta"

drop if _merge==2
drop _merge

gen basecpi=172.2
sum basecpi

gen rsi=(pcinc*basecpi)/cpi

gen lnrsi = ln(rsi)

save incomecontrol.dta, replace



