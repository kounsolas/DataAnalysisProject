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

%Dhmioyrgia pinakwn me tis zhtoymenes times
[r(1,:),relationship(1,:),direction(1,:)]=Group18Exe5Fun1(winter_bikes);
[r(2,:),relationship(2,:),direction(2,:)]=Group18Exe5Fun1(spring_bikes);
[r(3,:),relationship(3,:),direction(3,:)]=Group18Exe5Fun1(summer_bikes);
[r(4,:),relationship(4,:),direction(4,:)]=Group18Exe5Fun1(autumn_bikes);

%Colormaps
Group18Exe5Fun2(r,relationship,direction);