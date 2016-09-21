function Theta = oneVsAll(X, y, num_labels, lambda)
%     num_labels is 1 to 10
    m = size(X, 1); % 5000
    n = size(X, 2); % 400
    Theta = zeros(num_labels, n+1);
    initial_theta = zeros(n+1, 1);
    X = [ones(m,1) X];
    
    options = optimset('GradObj', 'on', 'MaxIter', 100);
    for i = 1:num_labels
        Theta(i,:) = fmincg (@(t)(lrCostFunction(t, X, (y==c),lambda)), ... 
            initial_theta, options);
    end
end
    