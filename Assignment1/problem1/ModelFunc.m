function [ p ] = ModelFunc( a,b,c,theta)

p = c + ((1-c) / (1 + (exp(1)^(-1.7*a*(theta-b)))));
end

