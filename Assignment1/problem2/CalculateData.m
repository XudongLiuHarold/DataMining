function [X,Y]= CalculateData(ParDataPath,ThetaDataPath)
%PLOTIMG Summary of this function goes here
%   Detailed explanation goes here
load(ParDataPath);
load(ThetaDataPath);
[rlen,~] = size(a);
[~,thetaLength] = size(tempX);
testX = zeros(1,40);
testY = [];
disp(rlen);
disp(thetaLength);
for i = 1:rlen
    for x = 1:thetaLength
            p = ModelFunc(a(i),b(i),c(i),tempX(x));
            testY(i,x) = p;
    end
end
for i = 1:40
    testX(1,i) = tempX(i);
end
X = testX;
Y = testY;
end

