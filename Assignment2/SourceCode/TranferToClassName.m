function [ name ] = TranferToClassName( num )
%TRANFERTOCLASSNAME Summary of this function goes here
%   Detailed explanation goes here
if num == 1 
    name = 'Iris-setosa';
else if num == 2 
    name = 'Iris-versicolor';
else if num == 3
    name = 'Iris-virginica';
    else
        name = '**unkown';
    end
    end

end

