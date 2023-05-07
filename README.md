# CFPS Emperical

### This file is to record the data clean procedure of CFPS 2012-2020. (without 2014, due to the absence of CES-D in that wave)

I aimed to find out every parent’s kids’ education circumstance, includes whether they are going to school and which stage they are in. 

Moreover, it is vital to indicate the reason of missing data. For example, some data was NA, because they have an ID in famconf but was not asked in personal dataset while others were basically missed during interview.
The primary data is a wide data frame in format of dta, which is prefered to be opened and treated in Stata. Though I think the data merge is more convenient in R and every year has almost 3 dataset to be merged together. Therefore, I have done the data merge in R and the data clean and missing indicator in data. The CFPS has recorded 10 kids in one family, so I wrote loops in Stata to deal with several variable which share the same name and distinct tail number at the same time.

The analysis is going to be conducted by Latent Growth Curve Model.
Firstly I am going to try the model in R Studio. Later it would be conducted in Mplus, which is more suitable for SEM.

To be finished......


Last Edited by Haisley
2023.05.07
