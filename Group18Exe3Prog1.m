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

coloramps(winter_bikes,"Winter");
coloramps(spring_bikes,"Spring");
coloramps(summer_bikes,"Summer");
coloramps(autumn_bikes,"Autumn");

%spring-autumn sxedon idia
