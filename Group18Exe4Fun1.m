function h_b=Group18Exe4Fun1(bikes1,bikes2,season1,season2) 
    %Bootstrap
    N=1000;
    bootstrap_results_x=bootstrp(N,@median,bikes1);
    bootstrap_results_y=bootstrp(N,@median,bikes2);
    bootstrap_statistic=bootstrap_results_x-bootstrap_results_y;
    bootstrap_statistic = sort(bootstrap_statistic, 1);
    alpha=0.05;
    ci_vector_low=floor((N+1)*alpha/2); %floor: gia akeraio meros
    ci_vector_high=N+1-ci_vector_low; %theseis twn oriwn se pinaka me aykousa seira

    %figure();
    %legend('show');
    %title(sprintf("Bootstrap conficence interval\n%s - %s",season1,season2));
    %colours=colormap(lines(6));
    %sxhmata=["-","--",":","-."];
    k=1;
    l=1;
    for i = 1:24
        ci_b_low(i) = bootstrap_statistic(ci_vector_low, i);
        ci_b_high(i) = bootstrap_statistic(ci_vector_high, i);
    
        if (ci_b_low(i) <= 0 && ci_b_high(i) >= 0) % sthn periptwsh mas theloume to mhden na anhkei sto d.e.
            h_b(i)=0; %dekth
        else 
            h_b(i)=1; %απορριψη
        end

        if mod(i,6)==0 %gia na allazei to sxhma
            k=k+1;
        end  
        if mod(i,4)==0
            l=l+1;
        end    
        %xline(ci_b_low(i),sxhmata(k),"DisplayName",sprintf("Low limit for hour %d",i),"LineWidth",2,"Color",colours(l,:));
        %xline(ci_b_high(i),sxhmata(k),"DisplayName",sprintf("High limit for hour %d",i),"LineWidth",2,"Color",colours(l,:));
    end
    %legend('Location', 'northeastoutside');
    %xline(0,"Color","black",'LineWidth',4);
    % histogram(ci_b_low);
    % hold on;
    % histogram(ci_b_high);
    % xline(0,'r',"LineWidth",2);
    % legend("Histogram of Low limit","Histogram of High limit");
    % title(sprintf("Bootstrap conficence interval\n%s - %s",season1,season2));
    % fprintf("statistiko gia to an yparxei diafora: %.2f%%\n",pososto_bootstrat);
end

