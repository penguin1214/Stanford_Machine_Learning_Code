function J = computeCost(X,y,theta)
%     compute value of J(theta)
    J = 0;
    m = length(y);
    J = sum((y - X*theta).^2)/(2*m);
end