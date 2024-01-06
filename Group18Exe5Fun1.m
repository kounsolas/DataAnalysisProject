%Kounsolas Xristos
%Plevridi Vasiliki Varvara

function [r,relationship,direction]=Group18Exe5Fun1(bikes)
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

end