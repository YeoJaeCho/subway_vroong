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
station_data<-rbind(station_data1,station_data2)
View(station_data)
install.packages("ggmap")
library(ggmap)
station_code<-geocode(station_data$���ּ�)
station_code_final<-cbind(station_data,station_code)

dj_map<-get_googlemap("���Ǵ��б�",maptype="roadmap",zoom=14)
ggmap(dj_map)
ggmap(dj_map)+
  geom_point(data=market_code_final,aes(lon,lat),col="red",size=2)+
  geom_text(data=market_code_final,aes(label=��������,vjust=-1),size=2.5)+
  geom_point(data=station_code_final,aes(lon,lat),col="blue",size=2)+
  geom_text(data=station_code_final,aes(label=����,vjust=-1),size=4)