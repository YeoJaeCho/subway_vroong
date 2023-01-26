#####
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

######
deliver2<-read_excel("C:/Users/��/Desktop/������/���ɺ� ����̿�.xlsx")
View(deliver)
str(deliver)

deliver2$measure<-as.factor(deliver2$measure)

plot(deliver2$measure,deliver2$pct)
ggplot(data=deliver2, 
       aes(x=factor(measure),y=pct,
           group=age,shape=age,color=age))+
  geom_line()+geom_point()+
  labs(title="���ɺ� ��� �� �̿��",
       x="�������", y="��� �� �̿��")+
  scale_x_discrete(limits=c("���� �׷��� �ʴ�","�׷��� �ʴ�","�����̴�/���� �׷���","�׷����̴�","�ſ�׷���"))