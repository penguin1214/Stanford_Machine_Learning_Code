function theta = gradientDescent(X,y,theta,alpha,iterations)
    m = length(y);
    for i = 1:iterations
        theta(1) = theta(1) - alpha / m * sum(X*theta - y);
        theta(2) = theta(2) - alpha / m * sum((X*theta - y) .* X(:,2));
    end
end
    