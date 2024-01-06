%Kounsolas Xristos
%Plevridi Vasiliki Varvara

clc;
clear;
close all;

%with readtable the data type is a cell
data=readtable("SeoulBike.xlsx",'VariableNamingRule','preserve');

for i=1:24
    %ta dedomena briskontai ana sthles, kathe zeygari dyo sthlwn
    %antistoixei se diaforetikh wra
    winter_bikes(:,2*i-1:2*i)=table2array(data(data.Seasons==1 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
    spring_bikes(:,2*i-1:2*i)=table2array(data(data.Seasons==2 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
    summer_bikes(:,2*i-1:2*i)=table2array(data(data.Seasons==3 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
    autumn_bikes(:,2*i-1:2*i)=table2array(data(data.Seasons==4 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
end 

%MIC-GMIC
x=winter_bikes(:,1);
y=winter_bikes(:,2);
bins =  fix(sqrt(length(x)/5));
mutS=MutualInformationXY(x,y);
MIC=mutS/log(bins);
ro=corrcoef(x,y);
r=ro(1,2);
GMIC=-0.5*log(1-r^2);
GMIC=GMIC/log(bins);


L=100;
M=100;
n=length(x);
a=0.05;
for i=1:L
    deiktes=randperm(n);
    X_random(:,i)=x(deiktes);
    Y_random(:,i)=y(deiktes); 
end

X_random=[X_random,x];
Y_random=[Y_random,y];

for i=1:L+1
R=corrcoef(X_random(:,i),Y_random(:,i));
r=R(1,2);
t= r * sqrt((n-2)/(1-r^2));
end

t_low=prctile(t,a/2);
t_high=prctile(t,1-a/2);
if t(end)>t_low && t(end)<t_high
    h=1;% accept
else
    h=0;
end 

accept=sum(h);
precent=(100-accept)*100/M;
