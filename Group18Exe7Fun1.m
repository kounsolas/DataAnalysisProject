function [maxadjR2,option_x,option_y]=Group18Exe7Fun1(bikes_temperature_hour)
    warning off all;
    %thelo na bro tin eksartisi ton podilaton apo tin thermmokrasia
    %ara thermokrasia = x
    % podilata = y
    
    x = bikes_temperature_hour(:,2); %temperature aneksartiti metabliti
    y = bikes_temperature_hour(:,1); %bikes eksartimeni
    n=length(x);
    k=1; %arithmos aneksartiton metabliton
    
    %Bazw oles tis epiloges gt den mporw na prozarmozw ta dedomena ana wra 
    % Isws afoy eblepa poy exei to mesgisto na epaiza meta me mirkoallages gia
    % beltiwsh
    
    %Transformations for x,y
    x_options=[x x.^2 x.^3 x.^4 cos(x) sin(x) log(abs(x))];
    y_options=[y y.^2 y.^3 y.^4 cos(y) sin(y) log(y)] ;%exp(y) exp(y+1)
    
    %kano olous toys dynatoys syndyasmous apo pano
    for j=1:size(x_options,2)
        xM = [ones(n,1) x_options(:,j)]; %to xreiazomai mono gia na to balo mesa stin regress()
        for i=1:size(y_options,2)  
            yV = y_options(:,i);
            [bV,~,~,~,stats]=regress(yV,xM);% se kathe sthlh ana dyo grammes gia kathe x option
            yhatV = xM*bV;
            eV = yV-yhatV;
            %se12 = (1/(n-2))*(sum(e1V.^2)); %5.27
            %se1 = sqrt(se12);
            my = mean(yV);
            %R2 = 1-(sum(eV.^2))/(sum((yV-my).^2));
            adjR2(j,i) =1-((n-1)/(n-2))*(sum(eV.^2))/(sum((yV-my).^2));
            
            vas_R2(j,i)=stats(1); % seira: y_option sthlh:x_option %as ypotheso oti einai sosto
            vas_adjR2(j,i)=1-((n-1)/(n-(k+1)))*(1-vas_R2(j,i)); %as ypotheso oti einai sosto
            %fprintf("Εξίσωση : y = %.3f + (%.3f )*x\n",b(2*j-1,i),b(2*j,i));
            %fprintf("ADJR2=%f\n\n",adjR2(j,i));
        end
    end
    
    x_names = ["x" "log(x)" "1./x" "x.^2" "sqrt(x)" "cos(x)" "sin(x)" "x.^3" "x.^4" "log(abs(x))" ]; %"exp(x)" "exp(x+1)"
    y_names = ["y" "log(y)" "1./y" "y.^2" "sqrt(y)" "cos(y)" "sin(y)" "y.^3" "y.^4" "log(abs(y))" ]; %"exp(y)" "exp(y+1)"
    
    %EPISTREPSIMES TIMES
    %thelo na pairno to max adjR2 apo kathe grammi
    [maxadjR2,index]=max(adjR2(:));
    [row_x, col_y] = ind2sub(size(adjR2), index);
    bV_max = regress(y_options(:,col_y),[ones(n,1) x_options(:,row_x)]);
    yhatmax = [ones(n,1) x_options(:,row_x)]*bV_max;

    option_x=x_names(row_x);
    option_y=y_names(col_y);
    %b_final=b(2*col_x-1:2*col_x,row_y);
    
    %paroysiash grafika
    figure();
    scatter(x_options(:,row_x),y_options(:,col_y));
    title("Scatter diagram")
    hold on;
    plot(x_options(:,row_x),yhatmax)%FIX THAT 
    hold off;
end