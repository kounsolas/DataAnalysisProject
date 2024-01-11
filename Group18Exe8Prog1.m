%Kounsolas Xristos
%Plevridi Vasiliki Varvara
warning off all
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

for i=1:24
    %ta dedomena briskontai ana sthles, kathe zeygari dyo sthlwn
    %antistoixei se diaforetikh wra
    winter_bikes_temperature(:,2*i-1:2*i)=table2array(data(data.Seasons==1 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
    spring_bikes_temperature(:,2*i-1:2*i)=table2array(data(data.Seasons==2 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
    summer_bikes_temperature(:,2*i-1:2*i)=table2array(data(data.Seasons==3 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
    autumn_bikes_temperature(:,2*i-1:2*i)=table2array(data(data.Seasons==4 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
end 