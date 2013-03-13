function nn = saeunfoldrnn(sae)
%DBNUNFOLDTONN Unfolds a DBN to a (reconstruction) NN
% Bascially like Hinton's 2006 Science paper
% But we don't tie the weight in this case
    sizes = [size(sae.ae{1}.W{2}, 1)];
    for i = 1:length(sae.ae)
        sizes = [sizes size(sae.ae{i}.W{1}, 1)];
    end
    sizes = [sizes sizes(end-1:-1:1)];

    nn = nnsetup(sizes);

    for i = 1:length(sae.ae)
        nn.W{i} = sae.ae{i}.W{1};
        nn.W{2*length(sae.ae)+1-i} = sae.ae{i}.W{2};
    end
        
end

