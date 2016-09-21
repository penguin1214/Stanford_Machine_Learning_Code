function [cost, gradient] =  costFunction(theta, X, y)
    m = length(y);
    cost = sum((-y.*log(sigmoid(X*theta))) - (ones(m,1)-y).*log(ones(m,1)-sigmoid(X*theta)))/m;
    gradient(1) = sum((sigmoid(X*theta)-y).*X(1))/m;
    gradient(2) = sum((sigmoid(X*theta)-y).*X(2))/m;
    gradient(3) = sum((sigmoid(X*theta)-y).*X(3))/m;
end