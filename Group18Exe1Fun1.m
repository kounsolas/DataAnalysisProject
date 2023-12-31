%vasiliki pleyridi
%kounsolas xristos

function Group18Exe1Fun1(table_bikes,season)
    %importdata() returns a cell type
    distributions=importdata("distributions.dat");
    warning off all;
   
    for i=1:length(distributions)
        %execute the 'try' part of the code if there is no error
            try
                %pd is a cell
                pd{i} = fitdist(table_bikes, distributions{i});
                %Eyresh timhs statistikou elegxoy X2 gia kathe katanomh
                [~, p(i)] = chi2gof(table_bikes, 'CDF',pd{i});
            catch
         %if error, continue with the next distribution
                fprintf("\n(Error with %s)",distributions{i})
                continue %EGRAPSA AYTO GIA NA EINAI PIO EYKOLODIABASTO
            end    
    end
    [maxValue,index]=max(p); 
    fprintf("\n--------------------------\n%s:%s με p=%f\n---------------------------\n",season,distributions{index},maxValue);
    
    figure();
    histfit(table_bikes,20,distributions{index});
    title(sprintf("Histogram- %s- %s",distributions{index},season));
end
