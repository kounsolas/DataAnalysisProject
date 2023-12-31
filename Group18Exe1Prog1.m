%vasiliki pleyridi
%kounsolas xristos

clc;
clear;
close all;

%with readtable the data type is a cell
data=readtable("SeoulBike.xlsx",'VariableNamingRule','preserve');

%to have access in a column of a cell use : 
% name_of_cell(:,"name_of_column")

winter_bikes=table2array(data(data.Seasons==1,"Rented Bike Count"));
spring_bikes=table2array(data(data.Seasons==2,"Rented Bike Count"));
summer_bikes=table2array(data(data.Seasons==3,"Rented Bike Count"));
autumn_bikes=table2array(data(data.Seasons==4,"Rented Bike Count"));

Group18Exe1Fun1(winter_bikes,"Winter");
Group18Exe1Fun1(spring_bikes,"Spring");
Group18Exe1Fun1(summer_bikes,"Summer");
Group18Exe1Fun1(autumn_bikes,"Autumn");
