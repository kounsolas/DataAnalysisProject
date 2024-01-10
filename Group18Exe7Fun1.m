function [maxadjR2,option_x,option_y]=Group18Exe7Fun1(bikes_temperature_hour)
warning off all;
x=bikes_temperature_hour(:,1);
y=bikes_temperature_hour(:,2);
n=length(x);
k=1;
%scatter(x,y);
%Bazw oles tis epiloges gt den mporw na prozarmozw ta dedomena ana wra 
% Isws afoy eblepa poy exei to mesgisto na epaiza meta me mirkoallages gia
% beltiwsh
%Transformations for x,y
x_options=[ones(n,1), x, log(x),1./x, x.^2, sqrt(x) cos(x) sin(x) x.^3 x.^4 log(abs(x))];
y_options=[ y, log(y),1./y, y.^2, sqrt(y) cos(y) sin(y) y.^3 y.^4 log(abs(y))];

for j=1:size(x_options,2)-1
    for i=1:size(y_options,2)  
        [b(2*j-1:2*j,i),~,~,~,stats]=regress(y_options(:,i),x_options(:,[1,j+1]));  % se kathe sthlh ana dyo grammes gia kathe x option
        y0=x_options(:,[1,j+1])*b(2*j-1:2*j,i);
        R2(j,i)=stats(1); % seira: y_option sthlh:x_option 
        adjR2(j,i)=1-((n-1)/(n-(k+1)))*(1-R2(j,i));
        %fprintf("Εξίσωση : y = %.3f + (%.3f )*x\n",b(2*j-1,i),b(2*j,i));
        %fprintf("ADJR2=%f\n\n",adjR2(j,i));
    end
end

x_names = ["x" "log(x)" "1./x" "x.^2" "sqrt(x)" "cos(x)" "sin(x)" "x.^3" "x.^4" "log(abs(x))"];
y_names = ["y" "log(y)" "1./y" "y.^2" "sqrt(y)" "cos(y)" "sin(y)" "y.^3" "y.^4" "log(abs(y))"];

%EPISTREPSIMES TIMES
[maxadjR2,index]=max(adjR2(:));
[row, col] = ind2sub(size(adjR2), index);
option_x=x_names(col);
option_y=y_names(row);
end