function [successes,stddev] = trial_inputs_on_motif_networks(type,fb,ff1,ff2,n)
if strcmp(type,'OR') || strcmp(type,'OR_1') || strcmp(type,'AND_NOT')
    if strcmp(type,'OR') || strcmp(type,'OR_1')
        [~,connections] = create_OR_network(2,1);
    else
        [~,connections] = create_AND_NOT_network(2);
    end
    inputs(1,:) = [ff1,0.0,0.0];
    inputs(2,:) = [ff2,0.0,0.0];
    inputs(3,:) = [0.0,0.0,fb];
    out = 3;
    iters = 6;
elseif strcmp(type,'AND')
    [~,connections] = create_AND_network(2);
    inputs(1,:) = [ff1,0.0,0.0];
    inputs(2,:) = [ff2,0.0,0.0];
    inputs(3,:) = [0.0,0.0,0.0,0.0];
    inputs(4,:) = [0.0,0.0,fb];
    out = 4;
    iters = 6;
else
    successes = [];
    stddev = [];
    return
end
trials = zeros(1,n);
for i = 1:n
    act = test_network_with_stochastic_externals(connections,inputs,iters);
    trials(1,i) = act(out,end)==2;
end
successes = sum(trials)/n;
stddev = std(trials);
