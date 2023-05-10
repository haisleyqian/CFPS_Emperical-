library("haven")
library(tidyverse)

sch2012 <- read_dta("kidedu2012_schv3.dta")
sch2016 <- read_dta("kidedu2016_schv3.dta")
sch2018 <- read_dta("kidedu2018_schv3.dta")
sch2020 <- read_dta("kidedu2020_schv3.dta")
load("cvar.Rdata")

cesdpanel<-read_dta("cesd.dta")
cesd2012 <- read_dta("cesd2012.dta")

cesdpanel<-cesdpanel %>% select(pid, cesd8,year)

cesdpanel%>%filter(year == 2016)->cesd2016
cesdpanel%>%filter(year == 2018)->cesd2018
cesdpanel%>%filter(year == 2020)->cesd2020
cesd2012 %>%select(pid, cesd8t_equated)%>%rename(cesd2012 = cesd8t_equated)->cesd2012


cesd2016<-
  cesd2016%>%select(pid, cesd8)%>%rename(cesd2016 = cesd8)

cesd2018<-
  cesd2018%>%select(pid, cesd8)%>%rename(cesd2018 = cesd8)

cesd2020<-
  cesd2020%>%select(pid, cesd8)%>%rename(cesd2020 = cesd8)

##--#-----------

widedf<-left_join(widedf,cesd2012, by = c("pid"="pid"))
widedf<-left_join(widedf,cesd2016, by = c("pid"="pid"))
widedf<-left_join(widedf,cesd2018, by = c("pid"="pid"))
widedf<-left_join(widedf,cesd2020, by = c("pid"="pid"))



widedf<-left_join(data2012, data2016, by = c("pid"="pid"))
widedf<-left_join(widedf, data2018, by = c("pid"="pid"))
widedf<-left_join(widedf, data2020, by = c("pid"="pid"))


widedf<-left_join(widedf, cvar, by = c("pid"="pid"))

rm(widedf)


##--#-----------


data2012<-sch2012 %>% select(pid, nch, lvwth, zaixue, sumnursery, sumkdgrt, sumprmry,mdl, 
                   high, dazhuan, sumudgrdt, grdt)

data2016<-sch2016 %>% select(pid, nch, lvwth, zaixue, sumnursery, sumkdgrt,sumprmry, mdl, 
                             high, dazhuan, sumudgrdt, grdt)

data2018<-sch2018 %>% select(pid, nch, lvwth, zaixue, sumnursery, sumkdgrt, sumprmry,mdl, 
                             high, dazhuan, sumudgrdt, grdt)

data2020<-sch2020 %>% select(pid, nch, lvwth, zaixue, sumnursery, sumkdgrt,sumprmry, mdl, 
                             high, dazhuan, sumudgrdt, grdt)


#rename #-------------------

data2012<-data2012 %>% rename (nch12 = nch,
                                   lvwth12 = lvwth,
                                   zaixue12=zaixue,
                                   nursery12=sumnursery,
                                   kdgt12=sumkdgrt,
                                   prmr12=sumprmry,
                                   mdl12=mdl,
                                   high12=high,
                                   dazhuan12=dazhuan,
                                   udgt12=sumudgrdt,
                                    grdt12=grdt
)


data2016<-data2016 %>% rename (nch16 = nch,
                                   lvwth16 = lvwth,
                                   zaixue16=zaixue,
                                   nursery16=sumnursery,
                                   kdgt16=sumkdgrt,
                                   prmr16=sumprmry,
                                   mdl16=mdl,
                                   high16=high,
                                   dazhuan16=dazhuan,
                                   udgt16=sumudgrdt,
                                   grdt16=grdt)







data2018<-data2018 %>% rename (nch18 = nch,
                                   lvwth18 = lvwth,
                                   zaixue18=zaixue,
                                   nursery18=sumnursery,
                                   kdgt18=sumkdgrt,
                                   prmr18=sumprmry,
                                   mdl18=mdl,
                                   high18=high,
                                   dazhuan18=dazhuan,
                                   udgt18=sumudgrdt,
                                   grdt18=grdt)


data2020<-data2020 %>% rename (nch20 = nch,
                                   lvwth20 = lvwth,
                                   zaixue20=zaixue,
                                   nursery20=sumnursery,
                                   kdgt20=sumkdgrt,
                                   prmr20=sumprmry,
                                   mdl20=mdl,
                                   high20=high,
                                   dazhuan20=dazhuan,
                                   udgt20=sumudgrdt,
                                   grdt20=grdt)





