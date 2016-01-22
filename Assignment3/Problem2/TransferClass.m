function [ name ] = TransferClass( num )
%TRANFERTOCLASSNAME Summary of this function goes here
%   Detailed explanation goes here
if num == 1 
    name = 'setosa';
else if num == 2 
    name = 'versicolor';
else if num == 3
    name = 'virginica';
    else
        name = '**unkown';
    end
    end

end

