function [L,U] = lu_mex(A)
%lu_mex - Description
%
% Syntax: [L,U] = lu_mex(A)
%
% Long description
    n = length(A);

    L = tril(A);
    U = triu(A);
    [L, U] =lu_iter_cpp(L,U,n);
end
