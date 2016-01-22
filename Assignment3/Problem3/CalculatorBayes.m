function  CalculatorBayes(Path)
%% Load data
% get terms
disp('---start---');
[x,label,term] = LoadData(Path);
%% Calculator TF/IDF
disp('----count---');
%% Split to 5 
i =int32(length(label)/5);
Y =TFIDF(x');
Y = Y';
%% Bayces Model & 5 fold cross validation
disp('----model---');

fold = cell(1,5);
fold(1) = {Y(1:i,1:end)};
fold(2) = {Y(i+1:i*2,1:end)};
fold(3) = {Y(1+i*2:i*3,1:end)};
fold(4) = {Y(1+i*3:i*4,1:end)};
fold(5) = {Y(1+i*4:end,1:end)};

lfold = cell(1,5);
lfold(1) = {label(1:i,1:end)};
lfold(2) = {label(i+1:i*2,1:end)};
lfold(3) = {label(1+i*2:i*3,1:end)};
lfold(4) = {label(1+i*3:i*4,1:end)};
lfold(5) = {label(1+i*4:end,1:end)};

for m = 1:5
    trainingData = [fold{mod(m,5)+1};fold{mod(m+1,5)+1};fold{mod(m+2,5)+1};fold{mod(m+3,5)+1}]; 
    trainingLabel= [lfold{mod(m,5)+1};lfold{mod(m+1,5)+1};lfold{mod(m+2,5)+1};lfold{mod(m+3,5)+1}];    
    testingData =  fold{m};
    testingLabel = lfold{m};
    nb = myNaiveBayes();
    nb.train(trainingData,trainingLabel);
    p = nb.predict(testingData);
    
    TP = 0;
    for a=1:length(testingLabel)
    if(p(a)==1 && 1 == testingLabel(a))
        TP = TP+1;
    end
    end
    
    TN = 0;
    for b=1:length(testingLabel)
    if(p(b)==0 && 0 == testingLabel(b))
        TN = TN+1;
    end
    end
    
    FP = 0;
    for c=1:length(testingLabel)
    if(p(c)== 1 && 0 == testingLabel(c))
        FP = FP+1;
    end
    end
    
    FN = 0;
    for d=1:length(testingLabel)
    if(p(d)== 0 && 1 == testingLabel(d))
        FN = FN+1;
    end
    end
    
    acc = (TP+TN)/length(testingLabel);
    sensitivity = TP/(TP+FN);
    specificity = (TN/(TN+FP));
    precision = TP/(TP+FP);
    F_measure = 2*precision*sensitivity/(precision+sensitivity);
     disp('accuary');
    disp(acc);
    disp('sensitivity'); 
    disp(sensitivity);
    disp('specificity');
    disp(specificity);
    disp('precision');
    disp(precision);
    disp('F-measure');
    disp(F_measure);
    disp('=====end===');
    
    save('Result,mat','acc','precision','sensitivity','F_measure');
end



end

