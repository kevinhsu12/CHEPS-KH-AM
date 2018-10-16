use "MMLAnalysis_17.dta", clear
*** REGRESSION TABLE 1 - 1993-2011
*** NATIONAL
foreach i in marijuana30 {
xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
i.fips i.year if inrange(year,1993,2011) & national==1, cl(fips) level(95)

est store `i'1

xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 beertax lnpcinc unemployment ///
i.fips i.year if inrange(year,1993,2011) & national==1, cl(fips) level(95)

est store `i'2
	

xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 beertax lnpcinc unemployment ///
i.fips*i.year if inrange(year,1993,2011) & national==1, cl(fips) level(95)

est store `i'3

	
*** STATE
xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
i.fips i.year if inrange(year,1993,2011) & national==0, cl(fips) level(95)

est store `i'4



xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 beertax lnpcinc unemployment ///
i.fips i.year if inrange(year,1993,2011) & national==0, cl(fips) level(95)

est store `i'5



xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 beertax lnpcinc unemployment ///
i.fips*i.year if inrange(year,1993,2011) & national==0, cl(fips) level(95)

est store `i'6


*** STATE AND NATIONAL
xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
i.fips i.year if inrange(year,1993,2011), cl(fips) level(95)

est store `i'7



xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 beertax lnpcinc unemployment ///
i.fips i.year if inrange(year,1993,2011), cl(fips) level(95)

est store `i'8



xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 beertax lnpcinc unemployment ///
i.fips*i.year if inrange(year,1993,2011), cl(fips) level(95)

est store `i'9

esttab basic educ_controls educ_npvis_controls using bwght_reg4, label ///
	scalars( "N Observations") ///
	sfmt( %10.0f %10.3f) se nodepvars ///
	keep (mml) rtf replace ///
	


	}
	

use "MMLAnalysis_17.dta", clear
*** REGRESSION TABLE 1 - 1993-2011
*** NATIONAL
foreach i in marijuana30 {
xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
i.fips i.year if inrange(year,1993,2011) & national==1, cl(fips) level(95)

est store `i'1

xi:reg `i' mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 beertax lnpcinc unemployment ///
i.fips i.year if inrange(year,1993,2011) & national==1, cl(fips) level(95)

est store `i'2
	

xi:reg marijuana30 mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 beertax lnpcinc unemployment ///
i.fips*i.year if inrange(year,1993,2011) & national==1, cl(fips) level(95)

est store `i'3

esttab marijuana301 marijuana302 marijuana303 using test, label ///
	title("Test") ///
	scalars( "N Observations") ///
	sfmt( %10.0f %10.3f) se nodepvars ///
	keep (mml) rtf replace 

	}
	
xi:reg marijuana30 mml age male grade10 grade11 grade12 black otherrace ///
MJ_decrim BAC08 beertax lnpcinc unemployment ///
i.fips*time i.year if inrange(year,1993,2011) & national==1, cl(fips) level(95)
