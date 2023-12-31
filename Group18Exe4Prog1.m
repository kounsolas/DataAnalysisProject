%kounsolas xristos
%vasiliki pleyridi

clc;
clear;
close all;

%with readtable the data type is a cell
data=readtable("SeoulBike.xlsx",'VariableNamingRule','preserve');

for i=1:24
    winter_bikes(:,i)=table2array(data(data.Seasons==1 & data.Hour==i-1,"Rented Bike Count"));
    spring_bikes(:,i)=table2array(data(data.Seasons==2 & data.Hour==i-1,"Rented Bike Count"));
    summer_bikes(:,i)=table2array(data(data.Seasons==3 & data.Hour==i-1,"Rented Bike Count"));
    autumn_bikes(:,i)=table2array(data(data.Seasons==4 & data.Hour==i-1,"Rented Bike Count"));
end

p(1)=Group18Exe4Fun1(winter_bikes,spring_bikes,"Winter","Spring");
p(2)=Group18Exe4Fun1(winter_bikes,summer_bikes,"Winter","Summer");
p(3)=Group18Exe4Fun1(winter_bikes,autumn_bikes,"Winter","Autumn");
p(4)=Group18Exe4Fun1(spring_bikes,summer_bikes,"Spring","Summer");
p(5)=Group18Exe4Fun1(spring_bikes,autumn_bikes,"Spring","Autumn");
p(6)=Group18Exe4Fun1(summer_bikes,autumn_bikes,"Summer","Autumn");
