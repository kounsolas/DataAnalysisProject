%Kounsolas Christos
%Plevridi Vasiliki Varvara

clc;
clear;
close all;

data=readtable("SeoulBike.xlsx",'VariableNamingRule','preserve');

winter_bikes=table2array(data(data.Seasons==1,"Rented Bike Count"));
spring_bikes=table2array(data(data.Seasons==2,"Rented Bike Count"));
summer_bikes=table2array(data(data.Seasons==3,"Rented Bike Count"));
autumn_bikes=table2array(data(data.Seasons==4,"Rented Bike Count"));

Group18Exe1Fun1(winter_bikes,"Winter");
Group18Exe1Fun1(spring_bikes,"Spring");
Group18Exe1Fun1(summer_bikes,"Summer");
Group18Exe1Fun1(autumn_bikes,"Autumn");
