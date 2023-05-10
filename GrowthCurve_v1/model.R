library(lavaan)
library(semPlot)
library(haven)
# 

widedf->widedf2

sch2012%>%select(pid, c1age)->age
widedf2<-left_join(widedf2,age, by = c("pid"="pid"))
widedf2%>%filter(c1age==20| c1age<20)->wided3

#model1 
model1 <- '
# intercept and slope with fixed coefficients
i =~ 1*cesd2012+1*cesd2016+1*cesd2018+1*cesd2020
s =~ 0*cesd2012+3*cesd2016+4*cesd2018+5*cesd2020

i ~ age2012+agesqr2012+gender2012+urban2012+edu2012
s ~ age2012+agesqr2012+gender2012+urban2012+edu2012

#time-varying covariates
cesd2012~lvwth12
cesd2016~lvwth16
cesd2018~lvwth18
cesd2020~lvwth20

'
gcm = growth(model, data = wided3)
summary(gcm, fit.measures = TRUE)
semPaths(gcm)




#model2 #--------------------------
model2 <- '
# intercept and slope with fixed coefficients
i =~ 1*cesd2012+1*cesd2016+1*cesd2018+1*cesd2020
s =~ 0*cesd2012+3*cesd2016+4*cesd2018+5*cesd2020

i ~ age2012+agesqr2012+gender2012+edu2012
s ~ age2012+agesqr2012+gender2012+edu2012

#time-varying covariates
cesd2012~zaixue12
cesd2016~zaixue16
cesd2018~zaixue18
cesd2020~zaixue20

'
gcm2 = growth(model2, data = wided3)
summary(gcm2,fit.measures = TRUE)
semPaths(gcm2)


#model3 #--------------------------
model7 <- '
# intercept and slope with fixed coefficients
i =~ 1*cesd2012+1*cesd2018+1*cesd2020
s =~ 0*cesd2012+4*cesd2018+5*cesd2020

i ~ age2012+agesqr2012+gender2012+edu2012
s ~ age2012+agesqr2012+gender2012+edu2012

#time-varying covariates
cesd2012~prmr12+mdl12+high12
cesd2018~prmr18+mdl18+high18
cesd2020~prmr20+mdl20+high20

'
gcm7 = growth(model7, data = wided3)
summary(gcm7,fit.measures = TRUE)
semPaths(gcm7)

#model4 #--------------------------
model4 <- '
# intercept and slope with fixed coefficients
i =~ 1*cesd2012+1*cesd2016+1*cesd2018+1*cesd2020
s =~ 0*cesd2012+3*cesd2016+4*cesd2018+5*cesd2020

i ~ age2012+agesqr2012+age2016+agesqr2016+age2018+agesqr2018+age2020+agesqr2020
s ~ age2012+agesqr2012+age2016+agesqr2016+age2018+agesqr2018+age2020+agesqr2020

#time-varying covariates
cesd2012~mdl12+
cesd2016~mdl16
cesd2018~mdl18
cesd2020~mdl20

'
gcm4 = growth(model4, data = wided3)
summary(gcm4,fit.measures = TRUE)
semPaths(gcm4)

#model5#-----------------------------
model5 <- '
# intercept and slope with fixed coefficients
i =~ 1*cesd2012+1*cesd2016+1*cesd2018+1*cesd2020
s =~ 0*cesd2012+3*cesd2016+4*cesd2018+5*cesd2020

i ~ age2012+agesqr2012+age2016+agesqr2016+age2018+agesqr2018+age2020+agesqr2020
s ~ age2012+agesqr2012+age2016+agesqr2016+age2018+agesqr2018+age2020+agesqr2020

#time-varying covariates
cesd2012~high12
cesd2016~high16
cesd2018~high18
cesd2020~high20

'
gcm5 = growth(model5, data = wided3)
summary(gcm5,fit.measures = TRUE)
semPaths(gcm5)

#model6#-----------------------------
model6 <- '
# intercept and slope with fixed coefficients
i =~ 1*cesd2012+1*cesd2016+1*cesd2018+1*cesd2020
s =~ 0*cesd2012+3*cesd2016+4*cesd2018+5*cesd2020

i ~ age2012+agesqr2012+age2016+agesqr2016+age2018+agesqr2018+age2020+agesqr2020
s ~ age2012+agesqr2012+age2016+agesqr2016+age2018+agesqr2018+age2020+agesqr2020

#time-varying covariates
cesd2012~udgt12
cesd2016~udgt16
cesd2018~udgt18
cesd2020~udgt20

'
gcm6 = growth(model6, data = wided3)
summary(gcm6,fit.measures = TRUE)
semPaths(gcm6)

#write_dta(wided3,"wided3.dta")
