function cen = kMeansInitCentroids(X, K)
    randidx = randperm(size(X,1));
    cen = X(randidx(1:K),:);
end