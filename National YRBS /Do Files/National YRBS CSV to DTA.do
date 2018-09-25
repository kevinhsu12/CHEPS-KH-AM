******************************
*** MASS IMPORT CSV TO DTA ***
***    YRBS NATIONAL DATA  ***
******************************
clear all
cd "/Users/Kevin/Documents/MML/National YRBS /Data Files"


forvalues i = 2017(-2)1991{
import delimited "/Users/Kevin/Documents/SASUniversityEdition/myfolders/National YRBS/csv/yrbs`i'a.csv", encoding(ISO-8859-1)
save "NYRBS_`i'.dta", replace
clear all
}
