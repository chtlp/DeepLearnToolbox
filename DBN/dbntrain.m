function dbn = dbntrain(dbn, x, opts)
    n = numel(dbn.rbm);

    opts.gaussian = false;
    if isfield(opts, 'gaussian')
        opts.gaussian = opts.gaussian_input;
    end
    fprintf('training input signal\n');
    dbn.rbm{1} = rbmtrain(dbn.rbm{1}, x, opts);
    for i = 2 : n
        fprintf('training level %d\n', i);
        opts.gaussian = false;
        % propagate the input up, clever!
        x = rbmup(dbn.rbm{i - 1}, x);
        dbn.rbm{i} = rbmtrain(dbn.rbm{i}, x, opts);
    end

end
