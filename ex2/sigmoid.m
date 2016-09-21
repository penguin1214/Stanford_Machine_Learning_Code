function y = sigmoid(x)
    y = zeros(size(x));
    y = 1 ./ (1+exp(-x));
end