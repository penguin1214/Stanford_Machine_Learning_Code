function [J, grad] = nnCostFunctionReg(nn_params, input_layer_size, hidden_layer_size,num_labels, X, y, lambda)
    m = size(X, 1); %5000
    J = 0;
    theta1 = reshape(nn_params(1:hidden_layer_size*(input_layer_size+1)),hidden_layer_size,(input_layer_size+1));
    theta2 = reshape(nn_params((1+hidden_layer_size*(input_layer_size+1)):end),num_labels,(hidden_layer_size+1));
    
    delta1 = zeros(size(theta1));
    delta2 = zeros(size(theta2));
    
    Y = zeros(m,num_labels);
    E = eye(num_labels);
    for i = 1:num_labels
        index = find(y == i);
        Y(index,:) = repmat(E(i,:), size(index,1), 1);
    end
    Y = Y';
    
    a1 = [ones(m,1) X];
    a2 = [ones(m,1)';sigmoid(theta1 * a1')];  %26*5000
    a3 = sigmoid(theta2*a2);   %10*5000
    
    for j = 1:m
        J = J + sum(-Y(:,j).*log(a3(:,j))-(ones(num_labels,1)-Y(:,j)).*log(ones(num_labels,1)-a3(:,j)));
    end
    J = J/m;
    
%     regularization
    reg = lambda/(2*m)*(sum(sum(theta1(:,2:end).^2))+sum(sum(theta2(:,2:end).^2)));
    J = J + reg;
    
%     backprop
    err3 = a3 - Y;
    err2 = (theta2'*err3) .* (sigmoidGradient([ones(1,m);z2]));
    
    delta1 = delta1 + err2(2:end,:) * a1;
    delta2 = delta2 + err3 * a2';
    
    theta1_grad = delta1 / m + lambda/m*theta1;
    theta2_grad = delta2 / m + lambda/m*theta2;
    
    grad = [theta1_grad(:); theta2_grad(:)];
end