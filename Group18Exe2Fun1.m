function sd_rate=Group18Exe2Fun1(M,bikes1,bikes2)
warning off all;
    for i=1:M
        vectors1=randi([1,length(bikes1)],100,1);
        vectors2=randi([1,length(bikes2)],100,1);
        %vectors=randi([1,length(bikes2)],100,1);
        bikes1=bikes1(vectors1);
        bikes2=bikes2(vectors2);
        [bikes1_hist,edges]=histcounts(bikes1);
        bikes2_hist=histcounts(bikes2,edges);
        h(i)=chi2gof(bikes1_hist,"Expected",bikes2_hist);
    end
    sum_h=sum(h);%h=1 for rejection
    sd_rate=(M-sum_h)*100/M;
end