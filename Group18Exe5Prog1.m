%Kounsolas Xristos
%Plevridi Vasiliki Varvara

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

%Dhmioyrgia pinakwn me tis zhtoymenes times
[r(1,:),relationship(1,:),direction(1,:),h(1,:)]=Group18Exe5Fun1(winter_bikes_temperature);
[r(2,:),relationship(2,:),direction(2,:),h(2,:)]=Group18Exe5Fun1(spring_bikes_temperature);
[r(3,:),relationship(3,:),direction(3,:),h(3,:)]=Group18Exe5Fun1(summer_bikes_temperature);
[r(4,:),relationship(4,:),direction(4,:),h(4,:)]=Group18Exe5Fun1(autumn_bikes_temperature);

%Colormaps
Group18Exe5Fun2(r,relationship,direction,h);