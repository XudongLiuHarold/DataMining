function [ Y ] = Predict(X)
%PREDICT Summary of this function goes here
%   Detailed explanation goes here
Y = [];

for i = 1:length(X)
if X(i,1) < 2.20
    Class = 0;
    Y = [Y Class];
else if X(i,3) < 2.45
        Class = 1;
         Y = [Y Class];
    else if X(i,4)<1.65
            if X(i,3) <5.25
                Class = 2;
                 Y = [Y Class];
            else
                Class = 3;
                Y = [Y  Class];
            end
        else if X(i,1)<5.95
                if X(i,1)<5.85
                    Class = 3;
                     Y = [Y  Class];
                else
                    Class = 2;
                     Y = [Y  Class];
                end
            else
                Class = 3;
                Y = [Y  Class];
            end
        end
    end
end
end
end

