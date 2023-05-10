library(lavaan)
library(tidyverse)
library(semPlot)
library(stargazer)

cesd2012<-read_dta("cesd2012.dta")
panelcesd<-read_dta("unbalanced_panel_cesd.dta")
panelcesd%>%filter(year == 2016)->cesd2016
panelcesd%>%filter(year == 2018)->cesd2018
panelcesd%>%filter(year == 2020)->cesd2020




kidedu2012<-kidedu2012 %>% rename (nch12 = nch,
                       lvwth12 = lvwth,
                       zaixue12=zaixue,
                       nursery12=sumnursery,
                       kdgt12=sumkdgrt,
                       prmr12=sumprmry,
                       mdl12=mdl,
                       high12=high,
                       dazhuan12=dazhuan,
                       udgt12=sumudgrdt,
                       master12=master,
                       doctor12=doctor
                       )


kidedu2016<-kidedu2016 %>% rename (nch16 = nch,
                                   lvwth16 = lvwth,
                                   zaixue16=zaixue,
                                   nursery16=sumnursery,
                                   kdgt16=sumkdgrt,
                                   prmr16=sumprmry,
                                   mdl16=mdl,
                                   high16=high,
                                   dazhuan16=dazhuan,
                                   udgt16=sumudgrdt,
                                   master16=master,
                                   doctor16=doctor)



kidedu2018<-kidedu2018 %>% rename (nch18 = nch,
                                   lvwth18 = lvwth,
                                   zaixue18=zaixue,
                                   nursery18=sumnursery,
                                   kdgt18=sumkdgrt,
                                   prmr18=sumprmry,
                                   mdl18=mdl,
                                   high18=high,
                                   dazhuan18=dazhuan,
                                   udgt18=sumudgrdt,
                                   master18=master,
                                   doctor18=doctor)


kidedu2020<-kidedu2020 %>% rename (nch20 = nch,
                                   lvwth20 = lvwth,
                                   zaixue20=zaixue,
                                   nursery20=sumnursery,
                                   kdgt20=sumkdgrt,
                                   prmr20=sumprmry,
                                   mdl20=mdl,
                                   high20=high,
                                   dazhuan20=dazhuan,
                                   udgt20=sumudgrdt,
                                   master20=master,
                                   doctor20=doctor)

cesd2012<-cesd2012 %>% select(pid,cesd8t_equated)%>%rename(cesd2012=cesd8t_equated)
cesd2016<-cesd2016 %>% select(pid,cesd8)%>%rename(cesd2016=cesd8)
cesd2018<-cesd2018 %>% select(pid,cesd8)%>%rename(cesd2018=cesd8)
cesd2020<-cesd2020 %>% select(pid,cesd8)%>%rename(cesd2020=cesd8)



data2012<-left_join(kidedu2012,cesd2012, by = c("pid"="pid"))
data2016<-left_join(kidedu2016,cesd2016, by = c("pid"="pid"))
data2018<-left_join(kidedu2018,cesd2018, by = c("pid"="pid"))
data2020<-left_join(kidedu2020,cesd2020, by = c("pid"="pid"))

data<-left_join(data2012,data2016, by = c("pid"="pid"))
data<-left_join(data,data2018, by = c("pid"="pid"))
data<-left_join(data,data2020, by = c("pid"="pid"))



m2 = "
intercept and slope with fixed coefficients
i =~ 1*cesd2012+1*cesd2016+1*cesd2018+1*cesd2020
#随时间增长
s =~ 0*cesd2012+1*cesd2016+2*cesd2018+3*cesd2020

#time-varying covariates
cesd2012~lvwth12
cesd2016~lvwth16
cesd2018~lvwth18
cesd2020~lvwth20

"
gcm2 = growth(m2, data = data)
summary(gcm2)
semPaths(gcm2)

####model3--###--------
m3 = "
intercept and slope with fixed coefficients
i =~ 1*cesd2012+1*cesd2016+1*cesd2018+1*cesd2020
s =~ 0*cesd2012+1*cesd2016+2*cesd2018+3*cesd2020

#time-varying covariates
cesd2012~zaixue12
cesd2016~zaixue16
cesd2018~zaixue18
cesd2020~zaixue20

"
gcm3 = growth(m3, data = data)
summary(gcm3)
semPaths(gcm3)

###model3.2##-------
m3.2 = "
intercept and slope with fixed coefficients
i =~ 1*cesd2012+1*cesd2016+1*cesd2018+1*cesd2020
s =~ 0*cesd2012+1*cesd2016+2*cesd2018+3*cesd2020

#time-varying covariates
cesd2012~zaixue12+lvwth12
cesd2016~zaixue16+lvwth16
cesd2018~zaixue18+lvwth18
cesd2020~zaixue20+lvwth20

"
gcm3.2 = growth(m3.2, data = data)
summary(gcm3.2)
semPaths(gcm3.2)





##-model4.1#-----------

m4.1 = "
intercept and slope with fixed coefficients
i =~ 1*cesd2012+1*cesd2016+1*cesd2018+1*cesd2020
s =~ 0*cesd2012+1*cesd2016+2*cesd2018+3*cesd2020

#time-varying covariates
cesd2012~nursery12+kdgt12+prmr12+mdl12+high12+udgt12+master12+dazhuan12
cesd2016~nursery16+kdgt16+prmr16+mdl12+high16+udgt16+master16+dazhuan16+doctor16
cesd2018~nursery18+kdgt18+prmr18+mdl18+high18+udgt18+master18+dazhuan18+doctor18
cesd2020~nursery20+kdgt20+prmr20+mdl20+high20+udgt20+master20+dazhuan20+doctor20

"
gcm4.1 = growth(m4.1, data = data)
summary(gcm4.1)
semPaths(gcm4.1)





as.data.frame(data)->dataframe
stargazer(dataframe,type="html",out="describe.doc")
