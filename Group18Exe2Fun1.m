function sd_rate=Group18Exe2Fun1(M,bikes1,bikes2)
    for i=1:M
        vectors1=randi([1,length(bikes1)],100,1);
        vectors2=randi([1,length(bikes2)],100,1);
        bikes1=bikes1(vectors1);
        bikes2=bikes2(vectors2);
        h(i)=chi2gof(bikes1,"Expected",bikes2);
    end
    sum_h=sum(h);%h=1 for rejection
    sd_rate=(M-sum_h)*100/M;
end