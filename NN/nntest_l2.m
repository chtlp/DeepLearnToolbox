function [mean_err, err] = nntest_l2(nn, x, y)
    [m, n] = size(x);
    hy = nneval(nn, x);
    err = sum((hy - y) .^2, 2);
    mean_err = sum(err) / m;
end
