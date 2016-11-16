function w=perceptron(x,y);
% function w=perceptron(x,y);
%
% Implementation of a Perceptron classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
%

[d, n] = size(x);
w = zeros(d, 1);

%% fill in code here

order = randperm(n);
for i = 1:100
    error = 0;
    for j = 1:n
        TotalSum = sum(x(:, order(j)) .* w);
        if (TotalSum * y(order(j)) <= 0)
            w = perceptronUpdate(x(:, order(j)), y(order(j)), w);
            error = error + 1;
        end
    end
    if (error == 0)
        break;
    end
end
