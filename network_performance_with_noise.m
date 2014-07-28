function [performance,stddev] = network_performance_with_noise(network_type,noise_type,noise_target,noise,n)
performance = zeros(size(noise));
stddev = zeros(size(noise));
for i = 1:length(noise)
    disp(num2str(noise(i)));
    fb = [1.0,0.0];
    ff1 = [0.0,1.0];
    if strcmp(network_type,'AND_NOT') || strcmp(network_type,'OR_1')
        ff2 = [0.0,0.0];
    else
        ff2 = [0.0,1.0];
    end
    if strcmp(noise_type,'peak')        
        if ~strcmp(noise_target,'ff-only')
            fb = [1-noise(i),0.0];    
        end
        if ~strcmp(noise_target,'fb-only')
            ff1 = [0.0,1-noise(i)];
            if strcmp(network_type,'AND_NOT') || strcmp(network_type,'OR_1')
                ff2 = [0.0,0.0];
            else
                ff2 = [0.0,1-noise(i)];
            end
        end
    else
        if ~strcmp(noise_target,'ff-only')
            fb = [1-noise(i),noise(i)];
        end
        if ~strcmp(noise_target,'fb-only')
            ff1 = [noise(i),1-noise(i)];
            if strcmp(network_type,'AND_NOT') || strcmp(network_type,'OR_1')
                ff2 = [noise(i),noise(i)];
            else
                ff2 = [noise(i),1-noise(i)];
            end
        end
    end
    [performance(i),stddev(i)] = trial_inputs_on_motif_networks(network_type,fb,ff1,ff2,n);
end
