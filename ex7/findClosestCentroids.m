function idx = findClosestCentroids(X, centroids)
    m = length(X);
    idx = zeros(m, 1);
    for i = 1:m
        dis = (repmat(X(i,:), length(centroids), 1) - centroids) .^ 2;
        [~,p] = min(sum(dis,2));
        idx(i) = p;
    end
end