function sd_rate=Group18Exe2Fun1(M,bikes1,bikes2)
    for i=1:M
        vectors1=randi([1,length(bikes1)],100,1);
        vectors2=randi([1,length(bikes2)],100,1);
        %vectors=randi([1,length(bikes2)],100,1);
        bikes1=bikes1(vectors1);
        bikes2=bikes2(vectors2);
        %bikes1 = datasample(bikes1, 100,'Replace',false);
        %bikes2 = datasample(bikes2, 100,'Replace',false);
        bikes=[bikes1, bikes2];
        [~,edges] = histcounts(bikes);
        bikes1_hist=histcounts(bikes1,edges);
        bikes2_hist=histcounts(bikes2,edges);
        h(i) = chi2gof(edges(1:end-1), 'freq', bikes1_hist, 'expected', bikes2_hist);
        %h(i)=chi2gof(bikes1_hist,"Edges",edges,"Expected",bikes2_hist,"Alpha",0.05);
    end
    sum_h=sum(h);%h=1 for rejection
    sd_rate=(M-sum_h)*100/M;
end