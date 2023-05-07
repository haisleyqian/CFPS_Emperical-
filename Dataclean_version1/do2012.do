

*ssc install dataex




******计算同住孩子数量******
foreach x of var tb6_a12_c*{
local newname = subinstr("`x'","tb6_a12_","tongzhu_",.)
gen `newname' = `x'
replace `newname'=0 if `newname'<0
}

*有几个孩子同住
egen lvwth =rowtotal(tongzhu_c*)


*有几个孩子在上学
foreach x of var sch_c*{
local newname = subinstr("`x'","sch_","shangxue_",.)
gen `newname' = `x'
replace `newname'=0 if `newname'<0
}

egen zaixue =rowtotal(shangxue_c*)
*缺失值：不适用 或者 少儿库/成人库没有可以merge的数据
replace zaixue = . if sch_c1 == -8|sch_c1==.


*有几个孩子在上托儿所、初中、小学、初中、高中、大专、本科、硕士、博士
*上托儿所
foreach x of var edu_c*{
local newname = subinstr("`x'","edu_","nursery_",.)
gen `newname' = 0
replace `newname'=1 if `x' == 1
}

egen sumnursery =rowtotal(nursery_c*)



*小幼儿园
foreach x of var edu_c*{
local newname = subinstr("`x'","edu_","kdgrt_",.)
gen `newname' = 0
replace `newname'=1 if `x' == 2
}

egen sumkdgrt =rowtotal(kdgrt_c*)


*上小学
foreach x of var edu_c*{
local newname = subinstr("`x'","edu_","prmry_",.)
gen `newname' = 0
replace `newname'=1 if `x' == 3
}

egen sumprmry =rowtotal(prmry_c*)


*上初中
foreach x of var edu_c*{
local newname = subinstr("`x'","edu_","mdl_",.)
gen `newname' = 0
replace `newname'=1 if `x' == 4
}

egen mdl =rowtotal(mdl_c*)


*上高中
foreach x of var edu_c*{
local newname = subinstr("`x'","edu_","high_",.)
gen `newname' = 0
replace `newname'=1 if `x' == 5
}

egen high =rowtotal(high_c*)


*大专
foreach x of var edu_c*{
local newname = subinstr("`x'","edu_","dazhuan_",.)
gen `newname' = 0
replace `newname'=1 if `x' == 6
}

egen dazhuan =rowtotal(dazhuan_c*)


*本科
foreach x of var edu_c*{
local newname = subinstr("`x'","edu_","udgrdt_",.)
gen `newname' = 0
replace `newname'=1 if `x' == 7
}

egen sumudgrdt =rowtotal(udgrdt_c*)


*硕士
foreach x of var edu_c*{
local newname = subinstr("`x'","edu_","master_",.)
gen `newname' = 0
replace `newname'=1 if `x' == 8
}

egen master =rowtotal(master_c*)


*博士
foreach x of var edu_c*{
local newname = subinstr("`x'","edu_","dr_",.)
gen `newname' = 0
replace `newname'=1 if `x' == 9
}

egen doctor =rowtotal(dr_c*)




save "kidedu2012new.dta",replace
