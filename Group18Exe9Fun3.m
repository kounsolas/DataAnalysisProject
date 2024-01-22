function Group18Exe9Fun3(bikes,season)
[R2(1),R2(2),Y_2a,Y_2b,Y]=Group18Exe9Fun1(bikes,season);
[R2(3),R2(4),Y_1a,Y_1b]=Group18Exe9Fun2(bikes,season);
figure();
plot(Y);
hold on;
hold on;
plot(Y_1a);
hold on;
plot(Y_1b);
hold on
plot(Y_2a);
hold on;
plot(Y_2b);
legend("Y original","Y_1a:for every hour regression","Y_1b: for every hour stepwise regression", ...
    "Y_2a:for all hours together regression","Y_2b:for all hours together stepwise regression","Location","best");
title(sprintf("For season %s",season))

fprintf("For season: %s\n",season)
R2=array2table(R2);
R2.Properties.RowNames="R2";
R2.Properties.VariableNames =["1a","1b","2a","2b"];
disp(R2);
end