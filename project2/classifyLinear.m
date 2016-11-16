function preds = classifyLinear(x,w,b);
% function preds=classifyLinear(x,w,b);
%
% Make predictions with a linear classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% w : weight vector (dx1)
% b : bias (scalar)
%
% Output:
% preds: predictions (1xn)
%

% if no bias is given, set it to zero
if nargin<3,
	b=0;
end;

%% fill in code here

[~, n] = size(x);
sums = zeros(1, n);
for i = 1:n
    sums(i) = sum((x(:, i) .* w) + b);
end
preds = sign(sums);
