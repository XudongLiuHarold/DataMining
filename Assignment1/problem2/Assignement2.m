% get data from the data path 
% ------------------------------------------------------
% Notice here:If you wanna load data from other places
% you can just add the data path to loadDataPath,
% and cancel the following comments ,
% then you will run the script perfectly. 
% ------------------------------------------------------
%loadDataPath = '**************';
%{
realChineseParData = strcat('','Chinese/C951C.PAR');
realEnglishParData = strcat(loadDataPath,'English/C951E.PAR');
realMathParData = strcat(loadDataPath,'Math/C951M.PAR');
realChinesePH3Data = strcat(loadDataPath,'Chinese/C951C.PH3');
realEnglishPH3Data = strcat(loadDataPath,'English/C951E.PH3');
realMathPH3Data = strcat(loadDataPath,'Math/C951M.PH3');
%}

% read .par data and change it to .mat
readPARData('Chinese/C951C.PAR','CS','ChinesePar.mat');
readPARData('English/C951E.PAR','ES','EnglishPar.mat');
readPARData('Math/C951M.PAR','MS','MathPar.mat');

% read .ph3 data and get the theta
readPH3Data('Chinese/C951C.PH3','ChineseTheta.mat');
readPH3Data('English/C951E.PH3','EnglishTheta.mat');
readPH3Data('Math/C951M.PH3','MathTheta.mat');

% calculate every param
[ChineseX,ChineseY] = CalculateData('ChinesePar.mat','ChineseTheta.mat');
[EnglishX,EnglishY] = CalculateData('EnglishPar.mat','EnglishTheta.mat');
[MathX,MathY] = CalculateData('MathPar.mat','MathTheta.mat');

% Plot 
hFig = figure('numbertitle','off','name','3PL Model for Chinese English Math','color','white');
set(hFig,'Position',[100,100,1600,1000]);

subplot(1,3,1);
plot(ChineseX,ChineseY);
PlotGood('Chinese 3PL Model');

subplot(1,3,2);
plot(EnglishX,EnglishY);
PlotGood('English 3PL Model');

subplot(1,3,3);
plot(MathX,MathY);
PlotGood('Math 3PL Model');

saveas(hFig, '3PLModelFigure', 'png'); 

%export to excel 
xlswrite('MathResultData.xls',MathY);
xlswrite('EnglishResultData.xls',EnglishY);
xlswrite('ChineseResultData.xls',ChineseY);