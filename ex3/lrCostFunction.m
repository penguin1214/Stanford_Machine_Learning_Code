function [J, grad] = lrCostFunction(X, y, theta, lambda)
    m = length(y);
    grad = ones(m+1, 1);
    J = sum(-y.*log(sigmoid(X*theta)) - (ones(m,1) - y).*(log(ones(m,1)-sigmoid(X*theta))))/m + lambda/(2*m)*sum((theta.*theta)(2:end));
    grad(2:end) = X'*(sigmoid(X*theta)-y)./m + lambda/m*theta;
    grad(1) = X'*(sigmoid(X*theta)-y)/m;
end