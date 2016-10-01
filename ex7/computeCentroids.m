function cen = computeCentroids(X, idx, K)
    cen = zeros(K,size(X,2));
    for i = 1:K
        points = X(find(idx == i),:);
        cen(i,:) = mean(points);
    end
end