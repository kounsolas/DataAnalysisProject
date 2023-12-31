%kounsolas xristos
%vasiliki pleyridi

function Group18Exe3Fun1(bikes_hour,season)
for i=1:24
    for j=1:24
        h_p(i,j)=ttest2(bikes_hour(:,i),bikes_hour(:,j));% h kathe grammh einai to iosto me ola(j)
        difference_mean(i,j)=abs(mean(bikes_hour(:,i))-mean(bikes_hour(:,j)));
    end
end 

figure();
imagesc(h_p);
colorbar;
title(sprintf("Colormap of  test decision - %s",season));
axis off;

figure();
imagesc(difference_mean);
colorbar;
title(sprintf("Colormap of difference of means - %s",season));
axis off;
end