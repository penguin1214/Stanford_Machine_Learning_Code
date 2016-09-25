function g = sigmoidGradient(z)
    sig = 1./(ones(size(z)) + exp(-z));
    g = sig .* (ones(size(sig)) - sig);
end