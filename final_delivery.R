install.packages("readxl")
library(readxl)
install.packages("ggplot2")
library(ggplot2)
deliver<-read_excel("C:/Users/��/Desktop/������/�������� ����̿�.xlsx")
View(deliver)
str(deliver)

deliver$measure<-as.factor(deliver$measure)

plot(deliver$measure,deliver$pct)
ggplot(data=deliver, 
       aes(x=factor(measure),y=pct,
           group=Num,shape=Num,color=Num))+
  geom_line()+geom_point()+
  labs(title="���� �� �� ��� �� �̿��",
       x="�������", y="��� �� �̿��")+
  scale_x_discrete(limits=c("���� �׷��� �ʴ�","�׷��� �ʴ�","�����̴�/���� �׷���","�׷����̴�","�ſ�׷���"))




################
install.packages("ggmap")
library(ggmap)
install.packages("readxl")
library(readxl)
install.packages("dplyr")
library(dplyr)
googleAPIkey="AIzaSyDLCxGhHtt4PCmMWtRblVTXA64iSv5czu8"
register_google(googleAPIkey)
gg_seoul<-get_googlemap(center="seoul",maptype="roadmap")  #��������
ggmap(gg_seoul)  #�����׸���

geo_code<-geocode("���۱�")
get_googlemap(center=as.numeric(geo_code),maptype="roadmap",zoom=13)%>%ggmap()+
  geom_point(data=geo_code,aes(x=lon,y=lat))
market_data<-read.csv("C:/Users/��/Desktop/������/����� ������� ��Ȳ.csv")
View(market_data)
market_data<-filter(market_data,��ġ����=="���۱�")%>%select(��������,�ּҸ�)
View(market_data)
market_data$�ּҸ�<-as.character(market_data$�ּҸ�)
market_code<-geocode(market_data$�ּҸ�)
market_code_final<-cbind(market_data,market_code)

station_data<-read_excel("C:/Users/��/Desktop/������/���ﱳ����� ���� �ּ� ��Ȳ_2018.xlsx")
station_data1<-filter(station_data,ȣ��==4)%>%select(����,���ּ�)
station_data2<-filter(station_data,ȣ��==7)%>%select(����,���ּ�)
station_data3<-filter(station_data,ȣ��==9)%>%select(����,���ּ�)
station_data<-rbind(station_data1,station_data2,station_data3)
View(station_data)
install.packages("ggmap")
library(ggmap)
station_code<-geocode(station_data$���ּ�)
station_code_final<-cbind(station_data,station_code)

dj_map<-get_googlemap("���Ǵ��б�",maptype="roadmap",zoom=13)
ggmap(dj_map)
ggmap(dj_map)+
  geom_point(data=market_code_final,aes(lon,lat),col="blue",size=2)+
  geom_text(data=market_code_final,aes(label=��������,vjust=1),col="blue",size=4)+
  geom_point(data=station_code_final,aes(lon,lat),col="red",size=2)+
  geom_text(data=station_code_final,aes(label=����,vjust=-1),size=5)


###########
metro<-read_excel("C:/Users/��/Desktop/������/Sangdo.xlsx")
View(metro)
sangdo<-filter(metro,����=="�뷮��",����=="����")
View(sangdo)
sangdo6<-sangdo[20]
sangdo7<-sangdo[21]
sangdo<-sangdo6+sangdo7
str(sangdo)
mean(sangdo[,1])

################
install.packages("fpp2")
library(fpp2)
library(readxl)
library(dplyr)
sangdo <- read_excel("C:/Users/��/Desktop/������/Sangdo.xlsx")

str(sangdo)
sangdo1<- filter(sangdo,����=="��",����=="����")
sangdo1
str(sangdo1)
sangdo_time<-ts(sangdo1$"�� ��",start=2020,frequency=365.25)
sangdo_time
autoplot(sangdo_time)

View(dongjak)

#############
metro<- read.csv("C:/Users/��/Desktop/������/����� ����ö ȣ���� ���� �ð��뺰 ������ �ο� ����.csv")
library(dplyr)
View(metro)
heuksuk<-filter(metro,����ö��=="�漮(�߾Ӵ��Ա�)")
dongjak41<-filter(metro,ȣ����=="4ȣ��",����ö��=="����(�����)")
dongjak42<-filter(metro,ȣ����=="4ȣ��",����ö��=="����")
dongjak4<-rbind(dongjak41,dongjak42)
dongjak91<-filter(metro,ȣ����=="9ȣ��",����ö��=="����(�����)")
dongjak92<-filter(metro,ȣ����=="9ȣ��",����ö��=="����")
dongjak9<-rbind(dongjak91,dongjak92)
soongsil1<-filter(metro,����ö��=="���Ǵ��Ա�(������)")
soongsil2<-filter(metro,����ö��=="���Ǵ��Ա�")
soongsil<-rbind(soongsil1,soongsil2)
noryangin1<-filter(metro,ȣ����=="��μ�",����ö��=="�뷮��")
noryangin9<-filter(metro,ȣ����=="9ȣ��",����ö��=="�뷮��")
nodeul<-filter(metro,����ö��=="���")
sindaebang<-filter(metro,����ö��=="�Ŵ���Ÿ�")
jandseungbaegi<-filter(metro,����ö��=="��¹��")
sangdo<-filter(metro,����ö��=="��")
isu41<-filter(metro,ȣ����=="4ȣ��",����ö��=="�ѽŴ��Ա�(�̼�)")
isu42<-filter(metro,ȣ����=="4ȣ��",����ö��=="�̼�")
isu4<-rbind(isu41,isu42)
isu71<-filter(metro,ȣ����=="7ȣ��",����ö��=="�ѽŴ��Ա�(�̼�)")
isu72<-filter(metro,ȣ����=="7ȣ��",����ö��=="�̼�")
isu7<-rbind(isu71,isu72)
namsung<-filter(metro,����ö��=="����")
sadang2<-filter(metro,ȣ����=="2ȣ��",����ö��=="���")
sadang4<-filter(metro,ȣ����=="4ȣ��",����ö��=="���")
boramae<-filter(metro,����ö��=="�����")


heuksuk<-heuksuk[1:27,4:27]
dongjak4<-dongjak4[1:27,4:27] 
dongjak9<-dongjak9[1:27,4:27] 
soongsil<-soongsil[1:27,4:27]
noryangin1<-noryangin1[1:27,4:27] 
noryangin9<-noryangin9[1:27,4:27]
nodeul<-nodeul[1:27,4:27]
sindaebang<-sindaebang[1:27,4:27]
jandseungbaegi<-jandseungbaegi[1:27,4:27]
sangdo<-sangdo[1:27,4:27]
isu4<-isu4[1:27,4:27] 
isu7<-isu7[1:27,4:27]
namsung<-namsung[1:27,4:27]
sadang2<-sadang2[1:27,4:27] 
sadang4<-sadang4[1:27,4:27] 
boramae<-boramae[1:27,4:27]


str(sadang2)

total<-heuksuk+dongjak4+dongjak9+soongsil+nodeul+sindaebang+jandseungbaegi+sangdo+namsung+sadang2+sadang4+boramae+isu4+isu7+noryangin1+noryangin9

View(total)


x1<-total[1,]
View(x1)
x2<-total[2,]
View(x2)
x3<-total[3,]
View(x3)
x4<-total[4,]
View(x4)
x5<-total[5,]
View(x5)
x6<-total[6,]
View(x6)
x7<-total[7,]
View(x7)
x8<-total[8,]
View(x8)
x9<-total[9,]
View(x9)
x10<-total[10,]
View(x10)
total[11,]
View(total[11,])
x12<-total[12,]
View(x12)
x13<-total[13,]
View(x13)
x14<-total[14,]
View(x14)
x15<-total[15,]
View(x15)
x16<-total[16,]
View(x16)
x17<-total[17,]
View(x17)
x18<-total[18,]
View(x18)
x19<-total[19,]
View(x19)
x20<-total[20,]
View(x20)
x21<-total[21,]
View(x21)
x22<-total[22,]
View(x22)
x23<-total[23,]
View(x23)
x24<-total[24,]
View(x24)
x25<-total[25,]
View(x25)
x26<-total[26,]
View(x26)
x27<-total[27,]
View(x27)

vec<-cbind(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27)

a<-cbind(x1,x2,x3,x4,x5)
b<-cbind(x6,x7,x8,x9,x10)
c<-cbind(total[11,],x12,x13,x14,x15)
d<-cbind(x16,x17,x18,x19,x20)
e<-cbind(x21,x22,x23,x24,x25,x26,x27)


vec<-cbind(a,b,c,d,e)  
View(vec)

install.packages("fpp2")
library(fpp2)

vec<-t(vec)

kk<-ts(vec, start=2017, frequency=365)
autoplot(kk)

?ts

##############
install.packages("readxl")
library(readxl)
deliver<-read_excel("C:/Users/��/Desktop/������/��ü ��޾� �̿��.xlsx")
View(deliver)
str(deliver)
install.packages("ggplot2")
library(ggplot2)
deliver$measure<-as.factor(deliver$measure)

plot(deliver$measure,deliver$pct)
ggplot(deliver,aes(x=factor(measure),y=pct))+geom_line()

ggplot(deliver,aes(x=measure,y=pct,fill=measure))+geom_col()+scale_x_discrete(limits=c("���� �׷��� �ʴ�","�׷��� �ʴ�","�����̴�/���� �׷���","�׷����̴�","�ſ�׷���"))



#################
library(readxl)
floation<-read_excel("C:/Users/��/Desktop/������/Floating_Population_2001.xlsx")
View(floation)


############
View(total[,15:16])
View(total[,15]+total[,16])


############
floation<-read_excel("C:/Users/��/Desktop/������/����м�.xlsx")
View(floation)
cor.test(floation$floation,floation$subway,method = "pearson")
plot(floation$floation,floation$subway)

floation<-floation[,2:3]
library(psych)
pairs.panels(floation) 

l<-lm(floation$floation~floation$subway)
summary(l)

############
View(heuksuk)
heuksuk_day<-heuksuk/31
View(heuksuk_day)
heuksuk_68<-heuksuk_day[,15:16]
heuksuk_sum<-heuksuk_68[,1]+heuksuk_68[,2]
mean(heuksuk_sum,2)*0.26

View(nodeul)
nodeul_day<-nodeul/31
View(nodeul_sum)
nodeul_68<-nodeul_day[,15:16]
nodeul_sum<-nodeul_68[,1]+nodeul_68[,2]
mean(nodeul_sum,2)*0.26

View(jandseungbaegi)
jandseungbaegi_day<-jandseungbaegi/31
View(jandseungbaegi_sum)
jandseungbaegi_68<-jandseungbaegi_day[,15:16]
jandseungbaegi_sum<-jandseungbaegi_68[,1]+jandseungbaegi_68[,2]
mean(jandseungbaegi_sum,2)*0.26

View(sangdo)
sangdo_day<-sangdo/31
View(sangdo_sum)
sangdo_68<-sangdo_day[,15:16]
sangdo_sum<-sangdo_68[,1]+sangdo_68[,2]
mean(sangdo_sum,2)*0.26

View(sindaebang)
sindaebang_day<-sindaebang/31
View(sindaebang_sum)
sindaebang_68<-sindaebang_day[,15:16]
sindaebang_sum<-sindaebang_68[,1]+sindaebang_68[,2]
mean(sindaebang_sum,2)*0.26

View(isu4)
isu4_day<-isu4/31
View(isu4_sum)
isu4_68<-isu4_day[,15:16]
isu4_sum<-isu4_68[,1]+isu4_68[,2]
mean(isu4_sum,2)*0.26

View(isu7)
isu7_day<-isu7/31
View(isu7_sum)
isu7_68<-isu7_day[,15:16]
isu7_sum<-isu7_68[,1]+isu7_68[,2]
mean(isu7_sum,2)*0.26

1365.218+904.0955

View(noryangin1)
noryangin1_day<-noryangin1/31
View(noryangin1_sum)
noryangin1_68<-noryangin1_day[,15:16]
noryangin1_sum<-noryangin1_68[,1]+noryangin1_68[,2]
mean(noryangin1_sum,2)*0.26

View(noryangin9)
noryangin9_day<-noryangin9/31
View(noryangin9_sum)
noryangin9_68<-noryangin9_day[,15:16]
noryangin9_sum<-noryangin9_68[,1]+noryangin9_68[,2]
mean(noryangin9_sum,2)*0.26

620.1587+1436.928



############
library(readxl)
demand<-read_excel("C:/Users/��/Desktop/������/�������.xlsx")
View(demand)
lm<-lm(supply~demand,data=demand)
plot(demand$demand,demand$supply,pch=16,xlab="����Һ���",ylab="��ǰ������",main="����Һ��� ���� ���� ��ǰ������ ����",cex=1,col="red")
abline(lm,col="blue")
text(x =demand$demand, y =demand$supply, labels =demand$station, pos = 3, cex = 0.5)
summary(lm)



###############
library(readxl)
deliver<-read_excel("C:/Users/��/Desktop/������/��ü ��޾� �̿��.xlsx")
View(deliver)
str(deliver)

deliver$measure<-as.factor(deliver$measure)

plot(deliver$measure,deliver$pct)
library(ggplot2)
ggplot(data=deliver, 
       aes(x=factor(measure),y=pct,
           group=total,shape=total,color="total"))+
  geom_line(col="blue")+geom_point(col="blue")+
  labs(title="��� �� �̿��",
       x="�������", y="��� �� �̿��")+
  scale_x_discrete(limits=c("���� �׷��� �ʴ�","�׷��� �ʴ�","�����̴�/���� �׷���","�׷����̴�","�ſ�׷���"))

ggplot(deliver,aes(x=measure,y=pct),title="��޾� �̿��")+geom_col()+scale_x_discrete(limits=c("���� �׷��� �ʴ�","�׷��� �ʴ�","�����̴�/���� �׷���","�׷����̴�","�ſ�׷���"))