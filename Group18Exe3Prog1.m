%kounsolas xristos
%vasiliki pleyridi

clc;
clear;
close all;

data=readtable("SeoulBike.xlsx",'VariableNamingRule','preserve');
for i=1:24
    winter_bikes(:,i)=table2array(data(data.Seasons==1 & data.Hour==i-1,"Rented Bike Count"));
    spring_bikes(:,i)=table2array(data(data.Seasons==2 & data.Hour==i-1,"Rented Bike Count"));
    summer_bikes(:,i)=table2array(data(data.Seasons==3 & data.Hour==i-1,"Rented Bike Count"));
    autumn_bikes(:,i)=table2array(data(data.Seasons==4 & data.Hour==i-1,"Rented Bike Count"));
end

Group18Exe3Fun1(winter_bikes,"Winter");
Group18Exe3Fun1(spring_bikes,"Spring");
Group18Exe3Fun1(summer_bikes,"Summer");
Group18Exe3Fun1(autumn_bikes,"Autumn");

%spring-autumn sxedon idia
