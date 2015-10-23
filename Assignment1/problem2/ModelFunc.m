function [ p ] = ModelFunc( a,b,c,theta)
%MODELFUNC Summary of this function goes here
%   Detailed explanation goes here
p = c + ((1-c) / (1 + (exp(1)^(-1.7*a*(theta-b)))));
end

