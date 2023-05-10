
cd /Users/hz_qian/Documents/CFPS_Emperical/May_v1/教育数据_schv2
********used code *************

foreach x of var sch_c*{
local newname = subinstr("`x'","sch_","schna_",.)
gen `newname' = 1
replace `newname'=0 if `x' == 0
replace `newname'=-8 if `x' == -8
replace `newname'=-9 if `x' == .
}


* 

replace schna_c2 = -10 if c2age == . 
replace schna_c3 = -10 if c3age == . 
replace schna_c4 = -10 if c4age == . 
replace schna_c5 = -10 if c5age == . 
replace schna_c6 = -10 if c6age == . 
replace schna_c7 = -10 if c7age == . 
replace schna_c8 = -10 if c8age == . 
replace schna_c9 = -10 if c9age == . 
replace schna_c10 = -10 if c10age == . 


*************

*codebook
*  = 1 有数据（在上学）
*  = 0 有数据（不在上学)
*  = -8 不适用（保留在成人库当中=-8)
*  = -9 在成人库当中缺失 
*  = -10 孩子不存在


* save "kidedu20**_schv2.dta"


***dummy Var for age < 20 ********************

****
gen age20 = 1
replace age20 = 0 if c1age > 20 

save "kidedu2012_schv2.dta",replace

