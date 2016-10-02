function [U,S] = pca(X_norm)
    m = length(X_norm);
    cov = (X_norm' * X_norm) / m;
    [U,S,V] = svd(cov);
end
    