function [R2,R2_stepwise,Y_predictions,Y_predictions_stepwise,Y_real]=Group18Exe9Fun1(bikes_original,season)
%katanomh ana wres gia na ta tairiaksw kai me ta ypoloipa montela
bikes=[];
for i=1:24
    bikes=[bikes;bikes_original(bikes_original.Hour==i-1,:)];
end  

Y=table2array(bikes(1:end-20*24,"Rented Bike Count"));
X=table2array(bikes(1:end-20*24,2:10)); %end-20*24 gt thelei ta teleytaies 20  meres gia problepseis
X_predictions=table2array(bikes(end-20*24+1:end,2:10));
Y_real=table2array(bikes(end-20*24+1:end,"Rented Bike Count"));

n=length(X);
n_predictions=length(X_predictions);

%gia periptwsh 1a
b=regress(Y,[ones(n,1) X]);
Y_predictions=[ones(n_predictions,1) X_predictions]*b;
error=Y_real-Y_predictions;
my=mean(Y_real);
R2 =1-(sum(error.^2))/(sum((Y_real-my).^2)); 

%gia periptwsh 1b
%Stepwise regression
[b_stepwise,~,~,final_model,stats_stepwise]=stepwisefit(X,Y,"display","off");
b0 = stats_stepwise.intercept;
b_final=b_stepwise.*(final_model)';
b_final=[b0;b_final];
Y_predictions_stepwise=[ones(n_predictions,1) X_predictions]*b_final;
error_stepwise=Y_real-Y_predictions_stepwise;
R2_stepwise =1-(sum(error_stepwise.^2))/(sum((Y_real-my).^2));


%diagnwstiko
se=sqrt(sum(error.^2)/(n_predictions-2)); %typos 5.12
e_typopohmeno(:,1)=error/se;
figure();
scatter(Y_real,e_typopohmeno,"LineWidth",1.5);
yline(1.96,"-r","LineWidth",1.5);
yline(-1.96,"-r","LineWidth",1.5);
yline(0,"black");
title(sprintf("Διαγνωστικό διάγραμμα-Μοντέλο με 10 Ανεξάρτητες μεταβλητές-Όλες οι ώρες-%s",season));

%diagnwstiko-stepwise regression
se_stepwise=sqrt(sum(error_stepwise.^2)/(n_predictions-2));
e_typopohmeno_stepwise(:,1)=error_stepwise/se_stepwise;
figure();
scatter(Y_real,e_typopohmeno_stepwise,"LineWidth",1.5);
yline(1.96,"-r","LineWidth",1.5);
yline(-1.96,"-r","LineWidth",1.5);
yline(0,"black");
title(sprintf("Διαγνωστικό διάγραμμα-Μοντέλο βηματικής Παλινδρόμισης-'Ολες οι ώρες-%s",season));
end