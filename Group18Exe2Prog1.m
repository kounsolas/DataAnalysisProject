%vasiliki pleyridi
%kounsolas xristos

clc;
clear;
close all;

%with readtable the data type is a cell
data=readtable("SeoulBike.xlsx",'VariableNamingRule','preserve');

%kanw elegxo gia kathe mera an exei kai tis 24 wres
%an den tis exei, thn diagrafw
j=1;
while j<height(data)
    if table2array(data(j,"Hour"))~=0
        fprintf("Delete %s because doenst have data for 24 hours\n",data.Date(j));
        data(data.Date==data.Date(j),:)=[];
    else 
        j=j+24;
    end
   
end 

%to have access in a column of a cell use : 
% name_of_cell(:,"name_of_column")
winter_bikes=table2array(data(data.Seasons==1,"Rented Bike Count"));
spring_bikes=table2array(data(data.Seasons==2,"Rented Bike Count"));
summer_bikes=table2array(data(data.Seasons==3,"Rented Bike Count"));
autumn_bikes=table2array(data(data.Seasons==4,"Rented Bike Count"));

%winter = 1
%spring = 2
%summer = 3
%autumn = 4

result12=Group18Exe2Fun1(100,winter_bikes,spring_bikes);
result13=Group18Exe2Fun1(100,winter_bikes,summer_bikes);
result14=Group18Exe2Fun1(100,winter_bikes,autumn_bikes);
result23=Group18Exe2Fun1(100,spring_bikes,summer_bikes);
result24=Group18Exe2Fun1(100,spring_bikes,autumn_bikes);
result34=Group18Exe2Fun1(100,summer_bikes,autumn_bikes);

