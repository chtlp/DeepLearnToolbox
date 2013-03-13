function nn = dbnunfoldrnn(dbn)
%DBNUNFOLDTONN Unfolds a DBN to a (reconstruction) NN
% Bascially like Hinton's 2006 Science paper
% But we don't tie the weight in this case
    sizes = [dbn.sizes dbn.sizes(end-1:-1:1)];
    nn = nnsetup(sizes);

    % note that numel(dbn.rbm) = numel(dbn.sizes) - 1
    for i = 1 : numel(dbn.rbm)
        nn.W{i} = [dbn.rbm{i}.c dbn.rbm{i}.W];
    end
    
    for i = 1: numel(dbn.rbm)
        j = 2*numel(dbn.rbm)+1-i;
        nn.W{j} = [dbn.rbm{i}.b dbn.rbm{i}.W'];
    end
    
end

