%Kounsolas Xristos
%Plevridi Vasiliki Varvara

clc;
clear;
close all;

%with readtable the data type is a cell
data=readtable("SeoulBike.xlsx",'VariableNamingRule','preserve');
%POS GINETAI NA EXOUN TOSO YPSILI KAI TOSO XAMILI THERMOKRASIA ???????????
for i=1:24
    %ta dedomena briskontai ana sthles, kathe zeygari dyo sthlwn
    %antistoixei se diaforetikh wra
    winter_bikes_temperature(:,2*i-1:2*i)=table2array(data(data.Seasons==1 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
    spring_bikes_temperature(:,2*i-1:2*i)=table2array(data(data.Seasons==2 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
    summer_bikes_temperature(:,2*i-1:2*i)=table2array(data(data.Seasons==3 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
    %autumn_bikes_temperature(:,2*i-1:2*i)=table2array(data(data.Seasons==4 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
end 
% TI FASH TI GINETAI ME TO AUTUMN???
[p_out_GMIC, p_out_MIC] = Group18Exe6Fun1(spring_bikes_temperature);

%apo tin stigmi pou to p>>a simainei oti mporoume na poume oti yparxei
%simantiki statistiki diafora metaksi ton pragmatikon kai ton tyxaion timon
%ypostirizontas etsi tin simantikotita ton GMIC kai MIC



























%{
n=length(x);
a=0.05;
for i=1:L
    deiktes=randperm(n);
    X_random(:,i)=x(deiktes);
    Y_random(:,i)=y(deiktes); 
end

X_random=[X_random,x];
Y_random=[Y_random,y];

for i=1:L+1
R=corrcoef(X_random(:,i),Y_random(:,i));
r=R(1,2);
t= r * sqrt((n-2)/(1-r^2));
end

t_low=prctile(t,a/2);
t_high=prctile(t,1-a/2);
if t(end)>t_low && t(end)<t_high
    h=1;% accept
else
    h=0;
end 

accept=sum(h);
precent=(100-accept)*100/M;
%}

