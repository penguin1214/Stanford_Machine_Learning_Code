function Z = projectData(X_norm, U, K)
    U_reduced = U(:,1:K);
    Z = X_norm * U_reduced;
    