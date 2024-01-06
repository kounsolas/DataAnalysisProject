%Kounsolas Xristos
%Plevridi Vasiliki Varvara

function [r,relationship,direction,h]=Group18Exe5Fun1(bikes)
for i=1:24
        ro=corrcoef(bikes(:,2*i-1),bikes(:,2*i));
        r(i)=ro(1,2);

    %Direction
    if r(i)>=0
        direction(i)=1;
    else direction(i)=0;
    end

    %relationship
    % Absolute Value of r              Strength of Relationship
    % r < 0.3                          None or very weak - 1
    % 0.3 < r <0.5                     Weak - 2
    % 0.5 < r < 0.7                    Moderate -3
    % r > 0.7                          Strong - 4

    if abs(r(i))>0.7
        relationship(i)=4;
    elseif (0.5 < abs(r(i))) && (abs(r(i))< 0.7)  
        relationship(i)=3;
    elseif (0.3 < abs(r(i))) && (abs(r(i))<0.5)  
        relationship(i)=2;
    elseif abs(r(i)) < 0.3
        relationship(i)= 1;
    end    
end

a=0.05;
n=length(bikes);
z=0.5*log((1+r(i))/(1-r(i)));
t=norminv(1-a/2);

%διάστημα εμπιστοσύνης

low_z=z-t*sqrt(1/(n-3));
high_z=z+t*sqrt(1/(n-3));

low_r(i)=(exp(2*low_z)-1)/(exp(2*low_z)+1);
high_r(i)=(exp(2*high_z)-1)/(exp(2*high_z)+1);

t = r(i) * sqrt((n-2)/(1-r(i)^2));
tc = tinv(1-a/2, n-2);
h(i)=abs(t)<tc;

end