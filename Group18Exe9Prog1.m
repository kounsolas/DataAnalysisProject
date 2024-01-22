%Kounsolas Xristos
%Plevridi Vasiliki Varvara
warning off;
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

%delete th days that holiday =1
todelete=data.Holiday==1;
data(todelete,:)=[];

%paragwgh dedomenwn opws ta thelei h ekfwnhsh
winter_bikes=data(data.Seasons==1,2:11);
spring_bikes=data(data.Seasons==2,2:11);
summer_bikes=data(data.Seasons==3,2:11);
autumn_bikes=data(data.Seasons==4,2:11);


Group18Exe9Fun3(winter_bikes,"Winter");
Group18Exe9Fun3(spring_bikes,"Spring");
Group18Exe9Fun3(summer_bikes,"Summer");
Group18Exe9Fun3(autumn_bikes,"Autumn");

%Loipon genika prepei na einai swsto giati bgainoyn idia me ton allon sto
%disc. kati kanw lathos ston ypologismo toy r2 . ta thelei apo tis times
%problepshshs opote den kserw its weird.gia otidhpote allo rwta me




