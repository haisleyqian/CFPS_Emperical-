library(haven)
library(tidyverse)
cfps2012fam <- read_dta("cfps2012fam.dta")
cfps2012child <- read_dta("cfps2012child.dta")
cfps2012adult <- read_dta("cfps2012adult.dta")


kidedu<-cfps2012fam %>% select(pid, fid12, fid10, pid_c1,pid_c2,pid_c3,pid_c4,pid_c5,pid_c6,pid_c7,
                       pid_c8,pid_c9,pid_c10,tb6_a12_c1,tb6_a12_c2,tb6_a12_c3,tb6_a12_c4,
                       tb6_a12_c5,tb6_a12_c6,tb6_a12_c7,tb6_a12_c8,tb6_a12_c9,tb6_a12_c9,tb6_a12_c10,c1age:c10age,nch)


# get the full list of kids edu 
ch1<-cfps2012child %>%select(pid,wf3m,wf301m)

ch2<-cfps2012adult%>%select(pid,wc01,kr1)

ch1<-ch1 %>% rename(sch = wf3m)%>%rename(schstg = wf301m)
ch2<-ch2 %>% rename(sch = wc01)%>%rename(schstg = kr1)
bind_rows(ch1,ch2)->ch3

#merge 10 times 
ch3->c1
c1<-c1%>%rename(edu_c1 = schstg)%>%rename(sch_c1 = sch)
kidedu<-left_join(kidedu,c1,by = c("pid_c1"="pid"))

ch3->c2
c2<-c2%>%rename(edu_c2 = schstg)%>%rename(sch_c2 = sch)
kidedu<-left_join(kidedu,c2,by = c("pid_c2"="pid"))


ch3->c3
c3<-c3%>%rename(edu_c3 = schstg)%>%rename(sch_c3 = sch)
kidedu<-left_join(kidedu,c3,by = c("pid_c3"="pid"))

ch3->c4
c4<-c4%>%rename(edu_c4 = schstg)%>%rename(sch_c4 = sch)
kidedu<-left_join(kidedu,c4,by = c("pid_c4"="pid"))

ch3->c5
c5<-c5%>%rename(edu_c5 = schstg)%>%rename(sch_c5 = sch)
kidedu<-left_join(kidedu,c5,by = c("pid_c5"="pid"))

ch3->c6
c6<-c6%>%rename(edu_c6 = schstg)%>%rename(sch_c6 = sch)
kidedu<-left_join(kidedu,c6,by = c("pid_c6"="pid"))

ch3->c7
c7<-c7%>%rename(edu_c7 = schstg)%>%rename(sch_c7 = sch)
kidedu<-left_join(kidedu,c7,by = c("pid_c7"="pid"))

ch3->c8
c8<-c8%>%rename(edu_c8 = schstg)%>%rename(sch_c8 = sch)
kidedu<-left_join(kidedu,c8,by = c("pid_c8"="pid"))

ch3->c9
c9<-c9%>%rename(edu_c9 = schstg)%>%rename(sch_c9 = sch)
kidedu<-left_join(kidedu,c9,by = c("pid_c9"="pid"))

ch3->c10
c10<-c10%>%rename(edu_c10 = schstg)%>%rename(sch_c10 = sch)
kidedu<-left_join(kidedu,c10,by = c("pid_c10"="pid"))



table(kidedu$sch_c1)
table(kidedu$edu_c2)

table(ch3$sch)
summary(kidedu)

write_dta(kidedu,"kidedu.dta")
