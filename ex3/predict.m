function pred =  predict(theta1, theta2, X)
    m = size(X,1);  %5000
    n = size(X,2);  %400
    pred = zeros(m,1);  %5000*1
    a1 = [ones(m,1) X];    %5000*401
    
    a2 = [ones(m,1)';sigmoid(theta1 * a1')];  %26*5000
    a3 = sigmoid(theta2*a2)';   %5000*10
    [aa,pred] = max(a3,[],2);
end