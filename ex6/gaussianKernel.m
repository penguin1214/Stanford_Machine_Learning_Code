function K = gaussianKernel(x1, x2, sigma)
    K = exp(sum((x1-x2) .^ 2) / 2*sigma^2);
end