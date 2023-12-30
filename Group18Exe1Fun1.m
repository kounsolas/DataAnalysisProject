%Kounsolas Christos
%Plevridi Vasiliki Varvara

function Group18Exe1Fun1(table_bikes,season)
distributions=importdata("distributions.dat");

warning off all;

for i=1:length(distributions)
        try
            pd{i} = fitdist(table_bikes, distributions{i});
            %Eyresh timhs statistikou elegxoy X2 gia kathe katanomh
            [~, p(i)] = chi2gof(table_bikes, 'CDF',pd{i});
        catch
            pd{i}=[];
        end    
end
[maxValue,index]=max(p);
fprintf("%s:%s με p=%f\n",season,distributions{index},maxValue);

figure();
histfit(table_bikes,20,distributions{index});
title(sprintf("Histogram- %s- %s",distributions{index},season));
end