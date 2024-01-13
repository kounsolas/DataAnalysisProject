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


%NOT SURE JUST A TRY 
%o feboyarios exei 28 meres. Ara gia na exoyn oloi oi antistoixoi mhnes  to idio tha prepei na
%sbhsw tis hmeromhnies 29,30, 31 (opoy yparxei) toy mhna may ayg kai nov
dateObjects = datetime(data.Date, 'InputFormat', 'dd-mmm-yyyy'); %format to matlab gia na exw metaprosbash sto date ksexwrista

%ayto isxyei gia olous tous mhnes
 % for j=1:31
 %     %gia mhnes 12 3 6 9
 %     if sum((day(dateObjects)==j & ismember(month(dateObjects),[12 3 6 9])))~=4*24
 %         todelete=day(dateObjects)==j & ismember(month(dateObjects),[12 3 6 9]);
 %         data(todelete,:)=[];
 %         dateObjects(todelete)=[];
 %     end    
 %     %gia mhnes 1 4 7 10    
 %     if sum((day(dateObjects)==j & ismember(month(dateObjects),[1 4 7 10])))~=4*24
 %         todelete=day(dateObjects)==j & ismember(month(dateObjects),[1 4 7 10]);
 %         data(todelete,:)=[];
 %         dateObjects(todelete)=[]; 
 %     end    
 %     %gia mhnes 2 5 8 11    
 %     if sum((day(dateObjects)==j & ismember(month(dateObjects),[2 5 8 11])))~=4*24
 %         todelete=day(dateObjects)==j & ismember(month(dateObjects),[2 5 8 11]);
 %         data(todelete,:)=[];
 %         dateObjects(todelete)=[];     
 %     end   
 %  end 

% to have access in a column of a cell use : 
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

%SXOLIA GIA TIS PITHANES ALLAGES
%Nomizw oti oso pio megalo to M toso pio accurate to apotelesma. Me thn
%allagh omws apo ta 100 sta 1000 blepw mia terastia diafora posostoy kai oso 
%aykasw to M teinei na plhsiasei to 100% ARA TI FASH????
%Sxetika me ta deigmata: dokimasa me kai xwris thn afairesh twn antistoixwn
%hmerwmhniwn poy leipoyn profanws to deigma einai toso megalo (apo to opoio
%epilegontai oi times) poy den ephreazei toso h yparksh toys h oxi
%(odhgoymaste se idia pososta)
% Pragmatika den odhgoyme se kapoio symperasma apo ta parapanw...POY EINAI
% TO LATHOS OEO? TOYLAXISTON BEBAIA TWRA DEN BGAZEI MONIMWS MHDENIKA!
%kai sxetika me ta vectors, emena moy bgazei logikh na pairneis apo to idio
%shmeio antistoixo ths katanomhs gia thn kathe peripwtsh alliws pws mporeis
%na ta sygkrineis? alla nomizw kai tyxaia na baleis gia to kathena apo thn
%stigmh poy xrhsimopoioyme pleon to histcounts den xreiazetai aparaithta
