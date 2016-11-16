function [posprob,negprob] = naivebayesPXY(x,y)
% function [posprob,negprob] = naivebayesPXY(x,y);
%
% Computation of P(X|Y)
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1) (1xn)
%
% Output:
% posprob: probability vector of p(x|y=1) (dx1)
% negprob: probability vector of p(x|y=-1) (dx1)
%

% add one all-ones positive and negative example
[d, ~] = size(x);
x = [x ones(d, 2)];
y = [y -1 1];

[d, n] = size(x);
%% fill in code here

sumX = sum(x);
posBase = sumX(y == 1);
negBase = sumX(y == -1);
posX = x * transpose(y == 1);
negX = x * transpose(y == -1);
posprob= posX./(sum(posBase));
negprob= negX./(sum(negBase));
