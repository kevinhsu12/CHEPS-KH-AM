use "F:\MML project\data\incomecontrol.dta"
merge m:1 year using "F:\MML project\data\cpiyear.dta"

drop if _merge==2
drop _merge

gen basecpi=172.2
sum basecpi

gen rsi=(pcinc*basecpi)/cpi

