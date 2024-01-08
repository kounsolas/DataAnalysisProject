function[p_out_GMIC,p_out_MIC] = Group18Exe6Fun1(bikes_temperature)
    
    a =0.05;
    L=1000;
    %calculate MIC-GMIC for every hour
    MIC = NaN*ones(24,1);
    GMIC = NaN*ones(24,1);

    %initialize GMIC and MIC for randomize method
    MIC_r = NaN*ones(L,24);
    GMIC_r = NaN*ones(L,24);

    bikes = bikes_temperature(:,1:2:end);
    temperatures = bikes_temperature(:,2:2:end);

    for i=1:24
        x=bikes(:,i); %bikes
        y=temperatures(:,i); %temperature
        bins =  fix(sqrt(length(x)/5));
        mutI=MutualInformationXY(x,y);
        MIC(i)=mutI/log(bins);
        ro=corrcoef(x,y);
        r=ro(1,2);
        GMI=-0.5*log(1-r^2);
        GMIC(i)=GMI/log(bins);

        %methodos tyxaiopoiisis
        %ksana ypologizo to MIC kai GMIC
        %ebala se oti metabliti sxetizetai me tin methodo tyxaiopoiisis tin
        %kataliksi _r
        for j = 1:L
            index = randperm(length(x)); %x,y have the same length
            %anakatema ton x kai y
            x_r = x(index);
            y_r = y(index);
            %ypologismos ton GMIC kai MIC me ta tyxaia deigmata
            mutI_r = MutualInformationXY(x_r,y_r);
            MIC_r(j,i) = mutI_r/log(bins);
            ro_r = corrcoef(x_r,y_r);
            r_r = ro_r(1,2);
            GMI_r = -0.5*log(1-r_r^2);
            GMI_r(j,i) = GMI_r/log(bins);
        end
    end

    %ola ayta poy kaneis parakatw tha eprepe na ta kaneis gia kathe sthlh
    %wste na katalhkseis en telei me enan pinaka GMIC_r 24x1 poy tha exei
    %apotelesma gia kathe wra
    %proteinw na mpei sto loop i=1:24 gia na typwthoyn sto telos kai ta 24
    %zhtoymena diagrammata
    %dhladh na ginetai to regress opwz zhtaei ( den kserw an thelei kai
    %kati allo) kai txt poy tha exei tis dyo times gia kathe wra

    %exo ypologisei to GMIC kai to MIC
    %alla to GMIC_r kai to MIC_r poy prokyptei me tin methodo tyxaiopoisisi

    %prepei na sygkrino GMIC_r me GMIC
    %kai MIC_r me MIC

    %prota gia GMIC
    %brisko to a/2 kai 1-a/2 posistiaio simeio tis empeirikis katanomis poy
    %prokyptei apo tin methodo tyxaiopoiisis
    GMIC_r = sort(MIC_r); %mallon ennoeis GMIC_r
    lowlim = round((a/2)*L);
    uplim = round((1-a/2)*L);
    lV_GMIC_r = GMIC_r(lowlim,:);
    uV_GMIC_r = GMIC_r(uplim);
    %elenxo an to arxiko GMIC gia kathe ora einai ontos toy a/2 kai 1-a/2
    %ton GMIC_r
    n_out_GMIC = length(find(GMIC < lV_GMIC_r | GMIC > uV_GMIC_r));
    p_out_GMIC = n_out_GMIC/24;
    
    % nomizw epistrefeis lathos value
    %p_out_GMIC=n_out_GMIC/L
    
    %gia to MIC
    %brisko to a/2 kai 1-a/2 posistiaio simeio tis empeirikis katanomis poy
    %prokyptei apo tin methodo tyxaiopoiisis
    MIC_r = sort(MIC_r);
    lV_MIC_r = MIC_r(lowlim,:);
    uV_MIC_r = MIC_r(uplim);
    %elenxo an to arxiko MIC gia kathe ora einai ontos toy a/2 kai 1-a/2
    %ton MIC_r
    n_out_MIC = length(find(MIC < lV_MIC_r | MIC > uV_MIC_r));
    p_out_MIC = n_out_MIC/24;
    
end